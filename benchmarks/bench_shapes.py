#!/usr/bin/env python3
"""Replay generated shape cases against the teaching C500 INT8 shared library.

The GPU receives already quantized random INT8 inputs. This benchmarks grouped
GEMM only, not quantization, dispatch, transfers, or an end-to-end MoE layer.
"""
import argparse
import ctypes
import datetime
import hashlib
import json
import math
from pathlib import Path
import subprocess
import sys
import tempfile

import numpy as np
import torch

ROOT = Path(__file__).resolve().parent
PROJECT_ROOT = ROOT.parent
NAIVE_ROOT = PROJECT_ROOT / "01_naive_gemm"
SENTINEL = -123456.75


def validate_case(case):
    def integer(x, low, high):
        return type(x) is int and low <= x <= high

    counts = case["counts"]
    if not isinstance(counts, list) or not 1 <= len(counts) <= 4096:
        raise ValueError("counts must contain 1..4096 expert lengths")
    if not all(integer(m, 0, 65536) for m in counts):
        raise ValueError("each M must be in [0,65536]")
    if not all(integer(case[x], 1, 32768) for x in ("n", "k")):
        raise ValueError("N/K must be in [1,32768]")
    if case["layout"] not in ("contiguous", "masked"):
        raise ValueError("unknown layout")
    if case["layout"] == "masked":
        cap = case["capacity"]
        if not integer(cap, 0, 65536) or max(counts) > cap:
            raise ValueError("invalid masked capacity")
    if not isinstance(case.get("name"), str) or not case["name"]:
        raise ValueError("case requires a name")


def sample_coordinates(m, n, limit, rng):
    """Include first/last rows, columns and tile boundaries, then random points."""
    if m * n <= limit:
        return np.arange(m * n, dtype=np.int64)
    rows = {0, m - 1, m // 2, min(15, m - 1), min(16, m - 1)}
    cols = {0, n - 1, n // 2, min(15, n - 1), min(16, n - 1)}
    points = {r * n + c for r in rows for c in cols}
    while len(points) < limit:
        points.add(int(rng.integers(m * n)))
    return np.array(sorted(points), dtype=np.int64)


def run_case(case, fn, args):
    counts, n, k = case["counts"], case["n"], case["k"]
    g, total = len(counts), sum(counts)
    masked = case["layout"] == "masked"
    rows = case["capacity"] if masked else total
    physical_rows = g * rows if masked else rows
    offsets = np.cumsum([0] + counts, dtype=np.int32)
    # INT8 A/B, FP32 scales/output, INT32 metadata. Scratch needs extra memory.
    allocation_bytes = physical_rows * (k + 4 * n + 4) + g * n * (k + 4)
    allocation_bytes += 4 * (g if masked else g + 1)
    free, _ = torch.cuda.mem_get_info()
    if allocation_bytes > free * 0.8:
        raise RuntimeError(f"case needs {allocation_bytes} bytes plus scratch; free={free}")
    seed = args.seed + int(hashlib.sha256(case["name"].encode()).hexdigest()[:8], 16)
    torch.manual_seed(seed)
    rng = np.random.default_rng(seed)
    stream = torch.cuda.Stream()
    with torch.cuda.stream(stream):
        a = torch.randint(-128, 128, (physical_rows, k), device="cuda", dtype=torch.int8)
        b = torch.randint(-128, 128, (g, n, k), device="cuda", dtype=torch.int8)
        sa = torch.rand(physical_rows, device="cuda") * 0.03 + 0.005
        sb = torch.rand((g, n), device="cuda") * 0.03 + 0.005
        c = torch.full((physical_rows, n), SENTINEL, device="cuda")
        metadata = torch.tensor(counts if masked else offsets.tolist(),
                                dtype=torch.int32, device="cuda")
        for expert, m in enumerate(counts):
            start = expert * rows if masked else int(offsets[expert])
            c[start:start + m].fill_(float("nan"))
        times = (ctypes.c_float * args.rounds)()
        status = fn(*(x.data_ptr() for x in (a, b, sa, sb, metadata, c)),
                    g, rows, n, k, stream.cuda_stream, int(masked),
                    args.warmup, args.iterations, args.rounds, times)
        if status:
            raise RuntimeError(f"MACA benchmark returned error {status}")

        checked = mismatches = nonfinite = padding_errors = padding_checked = 0
        max_abs_error = 0.0
        full_reference = True
        for expert, m in enumerate(counts):
            start = expert * rows if masked else int(offsets[expert])
            # This scans all valid outputs, but is NOT a full numerical reference.
            nonfinite += int((~torch.isfinite(c[start:start + m])).sum().item())
            if masked:
                padding = c[start + m:start + rows]
                padding_checked += padding.numel()
                padding_errors += int((padding != SENTINEL).sum().item())
            if m == 0:
                continue
            points = sample_coordinates(m, n, args.check_samples, rng)
            full_reference &= len(points) == m * n
            rr, cc = points // n, points % n
            ri = torch.tensor(rr + start, device="cuda")
            ci = torch.tensor(cc, device="cuda")
            # Independent CPU INT64 dot + FP64 scaling for selected outputs.
            aa = a[ri].cpu().numpy().astype(np.int64)
            bb = b[expert, ci].cpu().numpy().astype(np.int64)
            dot = np.sum(aa * bb, axis=1, dtype=np.int64)
            expected = dot.astype(np.float64) * sa[ri].cpu().numpy().astype(np.float64)
            expected *= sb[expert, ci].cpu().numpy().astype(np.float64)
            actual = c[ri, ci].cpu().numpy().astype(np.float64)
            errors = np.abs(actual - expected)
            checked += len(points)
            mismatches += int(np.count_nonzero(~np.isfinite(actual) |
                                               (errors > 1e-6 + 1e-5 * np.abs(expected))))
            max_abs_error = max(max_abs_error, float(np.max(errors)))
    stream.synchronize()
    ms = [float(x) for x in times]
    if any(not math.isfinite(x) or x <= 0 for x in ms):
        raise RuntimeError(f"invalid event timings: {ms}")
    median = float(np.median(ms))
    row_bound = rows if masked else min(total, 65536)
    launched_blocks = math.ceil(n / 16) * math.ceil(row_bound / 16) * g
    useful_blocks = math.ceil(n / 16) * sum(math.ceil(m / 16) for m in counts)
    ok = mismatches == nonfinite == padding_errors == 0
    return dict(case=case, input_seed=seed, status="PASS" if ok else "FAIL",
                reference_mode="full" if full_reference else "sampled",
                checked_elements=checked, valid_elements=total * n,
                mismatches=mismatches, nonfinite=nonfinite, max_abs_error=max_abs_error,
                padding_checked=padding_checked, padding_errors=padding_errors,
                median_ms=median, min_ms=min(ms), max_ms=max(ms), samples_ms=ms,
                useful_int8_tops=(2 * total * n * k) / (median * 1e9),
                allocated_bytes=allocation_bytes, kernel_launches_per_call=math.ceil(g / 64) if rows else 0,
                launched_blocks=launched_blocks,
                useful_blocks=useful_blocks,
                useful_block_fraction=useful_blocks / launched_blocks if launched_blocks else 0)


def command_output(command):
    try:
        return subprocess.check_output(command, cwd=PROJECT_ROOT, stderr=subprocess.STDOUT,
                                       text=True, timeout=15).strip()
    except (OSError, subprocess.SubprocessError) as exc:
        return f"unavailable: {exc}"


def run_isolated(cases, args, signature):
    """Release runtime/host allocator caches by exiting after each case.

    The parent never creates a GPU context. Completed results are checkpointed;
    a killed worker cannot erase previous cases. Resume checks the measured
    source, library, dataset and measurement parameters, not just the case name.
    """
    settings = {k: str(v) if isinstance(v, Path) else v for k, v in vars(args).items()}
    report = dict(signature, settings=settings, results=[], runs=[])
    if args.resume and args.output.exists():
        report = json.loads(args.output.read_text())
        if report.get("controller_sha256") != hashlib.sha256(Path(__file__).read_bytes()).hexdigest():
            raise ValueError("cannot resume: benchmark harness differs")
        for key, value in signature.items():
            if report.get(key) != value:
                raise ValueError(f"cannot resume: {key} differs")
        for key in ("seed", "warmup", "iterations", "rounds", "check_samples"):
            if report["settings"][key] != settings[key]:
                raise ValueError(f"cannot resume: {key} differs")
        if "runs" not in report:
            report["runs"] = [{k: v for k, v in report.items() if k != "results"}]
            for result in report["results"]:
                result["run_index"] = 0
    report["isolation"] = "one fresh process per case; GPU events exclude process startup"
    report["controller_sha256"] = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    completed = {r["case"]["name"] for r in report["results"] if r["status"] == "PASS"}
    with tempfile.TemporaryDirectory(prefix="moe_bench_") as directory:
        for i, case in enumerate(cases):
            if case["name"] in completed:
                print(f"[{i + 1}/{len(cases)}] retained PASS {case['name']}", flush=True)
                continue
            child_output = Path(directory) / f"case_{i}.json"
            command = [sys.executable, str(Path(__file__).resolve()), "--single-process",
                       "--shapes", str(args.shapes.resolve()), "--match", case["name"],
                       "--output", str(child_output),
                       "--library", str(args.library), "--source", str(args.source)]
            for option in ("seed", "warmup", "iterations", "rounds", "check_samples"):
                command += ["--" + option.replace("_", "-"), str(getattr(args, option))]
            print(f"[{i + 1}/{len(cases)}] worker {case['name']}", flush=True)
            worker = subprocess.run(command)
            if child_output.exists():
                child = json.loads(child_output.read_text())
                result = child["results"][0]
                environment = {k: v for k, v in child.items() if k != "results"}
            else:
                result = dict(case=case, status="ERROR", error=f"worker exit {worker.returncode}, no report")
                environment = {}
            if worker.returncode and result["status"] == "PASS":
                result["status"] = "ERROR"
                result["error"] = f"worker terminated after measurement: {worker.returncode}"
            environment["worker_returncode"] = worker.returncode
            result["run_index"] = len(report["runs"])
            report["runs"].append(environment)
            report["results"] = [r for r in report["results"] if r["case"]["name"] != case["name"]]
            report["results"].append(result)
            args.output.write_text(json.dumps(report, indent=2, allow_nan=False) + "\n", encoding="utf-8")
    print(f"Saved {args.output}", flush=True)
    return 0 if all(r["status"] == "PASS" for r in report["results"]) else 1


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--shapes", type=Path, default=ROOT / "shapes.json")
    p.add_argument("--output", type=Path, default=NAIVE_ROOT / "benchmark_results.json")
    p.add_argument("--library", type=Path, default=NAIVE_ROOT / "libmoe_int8.so",
                   help="library exporting the teaching moe_int8_benchmark ABI")
    p.add_argument("--source", type=Path, default=NAIVE_ROOT / "naive_gemm.cpp",
                   help="compute source to hash and record for this library")
    p.add_argument("--match", default="", help="only case names containing this substring")
    p.add_argument("--warmup", type=int, default=1)
    p.add_argument("--iterations", type=int, default=1, help="native calls per timed batch")
    p.add_argument("--rounds", type=int, default=5, help="number of timed batches")
    p.add_argument("--check-samples", type=int, default=128, help="CPU reference points per expert")
    p.add_argument("--seed", type=int, default=20261016)
    p.add_argument("--resume", action="store_true", help="retain compatible completed PASS cases")
    p.add_argument("--single-process", action="store_true", help=argparse.SUPPRESS)
    args = p.parse_args()
    args.library = args.library.resolve()
    args.source = args.source.resolve()
    if not (0 <= args.warmup <= 100 and 1 <= args.iterations <= 1000 and
            1 <= args.rounds <= 100 and 25 <= args.check_samples <= 65536):
        p.error("invalid counts: warmup 0..100, iterations 1..1000, rounds 1..100, checks 25..65536")
    raw = args.shapes.read_bytes()
    cases = json.loads(raw)
    if not isinstance(cases, list):
        p.error("shape file must contain a JSON list")
    for case in cases:
        validate_case(case)
    if len({c["name"] for c in cases}) != len(cases):
        p.error("case names must be unique")
    cases = [c for c in cases if (c["name"] == args.match if args.single_process else args.match in c["name"])]
    if not cases:
        p.error("no cases matched")
    library = args.library
    signature = dict(source_sha256=hashlib.sha256(args.source.read_bytes()).hexdigest(),
                     library_sha256=hashlib.sha256(library.read_bytes()).hexdigest(),
                     shapes_sha256=hashlib.sha256(raw.replace(b"\r\n", b"\n")).hexdigest(),
                     shapes_hash_scheme="SHA256 after CRLF-to-LF normalization")
    if not args.single_process:
        return run_isolated(cases, args, signature)
    lib = ctypes.CDLL(str(library))
    fn = lib.moe_int8_benchmark
    fn.argtypes = ([ctypes.c_void_p] * 6 + [ctypes.c_int] * 4 + [ctypes.c_void_p] +
                   [ctypes.c_int] * 4 + [ctypes.POINTER(ctypes.c_float)])
    fn.restype = ctypes.c_int
    torch.cuda.set_device(0)
    report = dict(
        timestamp_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),
        torch_version=torch.__version__, device=torch.cuda.get_device_name(0),
        visible_memory_bytes=torch.cuda.get_device_properties(0).total_memory,
        mx_smi=command_output(["mx-smi"]), git_head=command_output(["git", "rev-parse", "HEAD"]),
        git_status=command_output(["git", "status", "--short"]),
        source_sha256=signature["source_sha256"],
        harness_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        library_sha256=hashlib.sha256(library.read_bytes()).hexdigest(),
        shapes_sha256=signature["shapes_sha256"],
        shapes_raw_sha256=hashlib.sha256(raw).hexdigest(),
        shapes_hash_scheme=signature["shapes_hash_scheme"],
        settings={k: str(v) if isinstance(v, Path) else v for k, v in vars(args).items()},
        timing="MACA events around repeated native grouped calls, same buffers, warmed; excludes input preparation, transfers, CPU reference; includes native launch gaps",
        precision="quantized INT8 CPU INT64 dot + FP64 scale, atol=1e-6 rtol=1e-5; not quantization-quality acceptance",
        results=[])
    for i, case in enumerate(cases):
        print(f"[{i + 1}/{len(cases)}] {case['name']}", flush=True)
        try:
            result = run_case(case, fn, args)
        except Exception as exc:
            result = dict(case=case, status="ERROR", error=str(exc))
        report["results"].append(result)
        args.output.write_text(json.dumps(report, indent=2, allow_nan=False) + "\n", encoding="utf-8")
        if result["status"] == "ERROR":
            print("ERROR:", result["error"], flush=True)
        else:
            print(f"  {result['status']} {result['reference_mode']} checks={result['checked_elements']} "
                  f"median={result['median_ms']:.4f} ms TOPS={result['useful_int8_tops']:.4f}", flush=True)
        torch.cuda.empty_cache()
    report["mx_smi_after"] = command_output(["mx-smi"])
    args.output.write_text(json.dumps(report, indent=2, allow_nan=False) + "\n", encoding="utf-8")
    print(f"Saved {args.output}", flush=True)
    return 0 if all(r["status"] == "PASS" for r in report["results"]) else 1


if __name__ == "__main__":
    sys.exit(main())
