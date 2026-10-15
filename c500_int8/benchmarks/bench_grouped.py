#!/usr/bin/env python3
"""Small, bounded C500 native INT8 grouped GEMM GPU-event benchmark.

python3 benchmarks/bench_grouped.py --tiles 0,16,32,64,128 --json reports/bench.json
Optional --shapes JSON: [{"name":"example","counts":[16,0,31,7],"n":1024,"k":1024}]
User-provided shapes have unverified provenance unless their source is recorded.
Exit 77 means SKIP. No cross-chip performance target is inferred from this run.
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path
import platform
import statistics
import sys
import traceback

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from deep_gemm_maca import prepare_grouped, m_grouped_int8_gemm_nt_contiguous as gemm

DEFAULT_SHAPES = [
    {"name": "small_balanced", "counts": [32, 32, 32, 32], "n": 1024, "k": 1024, "source": "synthetic"},
    {"name": "small_skewed", "counts": [0, 1, 7, 128, 3, 64, 0, 17], "n": 1024, "k": 2048, "source": "synthetic"},
    {"name": "medium_balanced", "counts": [64, 64, 64, 64], "n": 2048, "k": 1024, "source": "synthetic"},
]


def emit(report, path):
    text = json.dumps(report, ensure_ascii=False, indent=2)
    print(text, flush=True)
    if path:
        destination = Path(path)
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_text(text + "\n", encoding="utf-8")


def measure(torch, np, device, shape, tile, args, rng):
    counts, n, k = shape["counts"], shape["n"], shape["k"]
    # Public preparation validates counts/dimensions before tensor allocations.
    plan = prepare_grouped(counts, n, k, device=device, tile_m=tile)
    m, g = sum(counts), len(counts)
    if not m:
        raise ValueError("benchmark requires M > 0; zero-token correctness is covered by tests")
    tensor_bytes = m * k + g * n * k + 4 * (m + g * n + m * n)
    if tensor_bytes > args.max_mib * 1024 * 1024:
        raise ValueError(f"case requires {tensor_bytes} tensor bytes, exceeds --max-mib {args.max_mib}")
    a_cpu = rng.integers(-127, 128, size=(m, k), dtype=np.int8)
    b_cpu = rng.integers(-127, 128, size=(g, n, k), dtype=np.int8)
    sa_cpu = rng.uniform(0.003, 0.07, m).astype(np.float32)
    sb_cpu = rng.uniform(0.005, 0.09, (g, n)).astype(np.float32)
    a, b, sa, sb = [torch.from_numpy(x).to(device) for x in (a_cpu, b_cpu, sa_cpu, sb_cpu)]
    out = torch.empty((m, n), dtype=torch.float32, device=device)
    gemm(a, b, sa, sb, plan=plan, out=out)

    # Check boundary/middle samples for every nonempty expert before timing.
    # Full numerical coverage belongs to tests/test_grouped.py, not this timer.
    actual = out.cpu().numpy()
    sampled, max_abs, max_rel = 0, 0.0, 0.0
    offset = 0
    for expert, count in enumerate(counts):
        if count:
            for local_row in sorted({0, count // 2, count - 1}):
                row = offset + local_row
                for column in sorted({0, n // 2, n - 1}):
                    acc = int(a_cpu[row].astype(np.int64) @ b_cpu[expert, column].astype(np.int64))
                    ref = acc * float(sa_cpu[row]) * float(sb_cpu[expert, column])
                    got = float(actual[row, column])
                    error = abs(got - ref)
                    if not np.isfinite(got) or error > 1e-6 + 1e-3 * abs(ref):
                        raise AssertionError(f"sample mismatch expert={expert}, row={row}, col={column}: {got} vs {ref}")
                    sampled += 1
                    max_abs = max(max_abs, error)
                    if abs(ref) > 1e-6:
                        max_rel = max(max_rel, error / abs(ref))
        offset += count
    for _ in range(args.warmup):
        gemm(a, b, sa, sb, plan=plan, out=out)
    torch.cuda.synchronize(device)
    events = [(torch.cuda.Event(enable_timing=True), torch.cuda.Event(enable_timing=True)) for _ in range(args.repeat)]
    for start, end in events:
        start.record()
        gemm(a, b, sa, sb, plan=plan, out=out)
        end.record()
    torch.cuda.synchronize(device)
    milliseconds = [start.elapsed_time(end) for start, end in events]
    if any(not np.isfinite(ms) or ms <= 0 for ms in milliseconds):
        raise RuntimeError(f"GPU event timing produced invalid durations: {milliseconds}")
    median = statistics.median(milliseconds)
    operations = 2 * m * n * k
    return {
        "name": shape.get("name", "unnamed"),
        "shape_source": shape.get("source", "user_provided_unverified"),
        "counts": list(counts), "m": m, "g": g, "n": n, "k": k,
        "requested_tile_m": tile, "selected_tile_m": plan.tile_m,
        "tensor_bytes": tensor_bytes, "warmup": args.warmup, "repeat": args.repeat,
        "latency_ms": {"median": median, "min": min(milliseconds), "max": max(milliseconds),
                       "p90": float(np.percentile(milliseconds, 90)), "samples": milliseconds},
        "int8_tops_from_median": operations / (median * 1e9),
        "operation_count": operations,
        "pre_timing_validation": {"scope": "sampled same-INT8 INT64/FP64 CPU oracle",
                                  "samples": sampled, "max_abs_error": max_abs,
                                  "max_relative_error_away_from_zero": max_rel},
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--device", default="cuda:0")
    parser.add_argument("--tiles", default="0,16,32,64,128", help="comma-separated 0,16,32,64,128; 0 selects the heuristic")
    parser.add_argument("--warmup", type=int, default=5)
    parser.add_argument("--repeat", type=int, default=20)
    parser.add_argument("--max-mib", type=int, default=256, help="maximum input/output tensor bytes per case, in MiB")
    parser.add_argument("--shapes", type=Path)
    parser.add_argument("--json", "--output", dest="json", type=Path)
    args = parser.parse_args()
    if not (1 <= args.warmup <= 100 and 1 <= args.repeat <= 1000 and args.max_mib > 0):
        parser.error("warmup must be 1..100, repeat 1..1000, max-mib > 0")
    try:
        tiles = list(dict.fromkeys(int(x) for x in args.tiles.split(",")))
        if not tiles or any(tile not in (0, 16, 32, 64, 128) for tile in tiles):
            raise ValueError()
    except ValueError:
        parser.error("--tiles accepts comma-separated 0,16,32,64,128")
    report = {
        "status": "RUNNING", "results": [],
        "timing": "GPU events around one native INT8 grouped GEMM including FP32 scaling epilogue; may include host launch gaps",
        "excluded_from_timing": ["input generation", "host/device transfer", "plan preparation", "output allocation", "correctness checks"],
        "interpretation": "synthetic or explicitly supplied shapes; no A100/H200 baseline, utilization target, or project acceptance claim",
    }
    try:
        import numpy as np
        import torch
    except ImportError as error:
        report.update(status="SKIP", reason=f"required Python package unavailable: {error}")
        emit(report, args.json)
        return 77
    try:
        if not torch.cuda.is_available():
            report.update(status="SKIP", reason="no usable MACA/mcPyTorch GPU")
            emit(report, args.json)
            return 77
        device = torch.device(args.device)
        if device.type != "cuda":
            raise ValueError("--device must identify a cuda-compatible C500 GPU")
        torch.cuda.set_device(device)
        props = torch.cuda.get_device_properties(device)
        report["environment"] = {
            "python": platform.python_version(), "platform": platform.platform(),
            "torch": torch.__version__, "device": str(device), "device_name": props.name,
            "device_total_memory_bytes": props.total_memory,
            "torch_cuda_compat_version": getattr(torch.version, "cuda", None),
            "torch_maca_version": getattr(torch.version, "maca", None),
        }
        shapes = json.loads(args.shapes.read_text(encoding="utf-8")) if args.shapes else DEFAULT_SHAPES
        if not isinstance(shapes, list) or not shapes or len(shapes) > 100:
            raise ValueError("shape file must contain a nonempty JSON array of at most 100 cases")
        for index, shape in enumerate(shapes):
            if not isinstance(shape, dict) or any(key not in shape for key in ("counts", "n", "k")):
                raise ValueError("each shape requires counts, n, and k")
            for tile in tiles:
                print(f"Benchmark {shape.get('name', 'unnamed')} tile={tile}", file=sys.stderr, flush=True)
                # Every tile sees identical quantized data for a given shape.
                seed = 20261015 + index
                result = measure(torch, np, device, shape, tile, args, np.random.default_rng(seed))
                result["input_seed"] = seed
                report["results"].append(result)
    except Exception as error:
        report.update(status="FAIL", error=f"{type(error).__name__}: {error}")
        traceback.print_exc()
        emit(report, args.json)
        return 1
    report["status"] = "PASS"
    emit(report, args.json)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
