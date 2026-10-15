#!/usr/bin/env python3
"""Native C500 W8A8 correctness/contract checks; no pytest dependency.

Run: python3 tests/test_grouped.py --device cuda:0 --json reports/correctness.json
Exit 77 means GPU tests were SKIPPED, never passed. The oracle uses the SAME
already-quantized INT8 inputs, INT64 accumulation, and FP64 scaling. This does
not measure quantization error against an original floating-point model.
"""
from __future__ import annotations

import argparse
import gc
import json
from pathlib import Path
import sys
import traceback

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from deep_gemm_maca import prepare_grouped, m_grouped_int8_gemm_nt_contiguous as gemm

RTOL, ATOL, NEAR_ZERO = 1e-3, 1e-6, 1e-6


def run_cpu(records):
    """Check public contract metadata without importing torch or NumPy."""
    from deep_gemm_maca.api import _plan_metadata, _select_tile_m

    def equal(name, actual, expected):
        if actual != expected:
            raise AssertionError(f"{name}: {actual!r} != {expected!r}")
        records.append({"name": name, "status": "PASS", "execution": "CPU metadata only"})

    metadata = _plan_metadata([0, 1, 16, 17, 0], 128, 256, 16)
    equal("cpu_segments_with_empty_experts", metadata["seg_indptr"], (0, 0, 1, 17, 34, 34))
    equal("cpu_per_expert_tiles_without_row_padding", metadata["m_num_tiles_indptr"], (0, 0, 1, 2, 4, 4))
    equal("cpu_expert_weight_order", metadata["weight_indices"], (0, 1, 2, 3, 4))
    equal("cpu_all_empty", _plan_metadata([0, 0], 128, 256)["m_num_tiles_indptr"], (0, 0, 0))
    equal("cpu_max_safe_aligned_k", _plan_metadata([1], 128, 130816)["k"], 130816)
    for m, g, k, expected in ((32, 2, 256, 16), (33, 2, 256, 32),
                               (64, 2, 256, 32), (65, 2, 256, 64),
                               (128, 2, 3840, 64), (129, 2, 256, 128),
                               (65, 2, 4096, 128)):
        equal(f"cpu_selector_m{m}_g{g}_k{k}", _select_tile_m(m, g, k), expected)
    for tile in (16, 32, 64, 128):
        equal(f"cpu_explicit_tile_{tile}", _plan_metadata([1], 128, 256, tile)["tile_m"], tile)
    for name, counts, n, k, tile in (
        ("negative_count", [1, -1], 128, 256, 0),
        ("float_count", [1.0], 128, 256, 0),
        ("bool_count", [True], 128, 256, 0),
        ("no_experts", [], 128, 256, 0),
        ("n_tail", [1], 129, 256, 0),
        ("k_tail", [1], 128, 257, 0),
        ("zero_n", [1], 0, 256, 0),
        ("accumulator_overflow", [1], 128, 131072, 0),
        ("index_overflow", [1], 8388608, 256, 0),
        ("invalid_tile", [1], 128, 256, 48),
    ):
        try:
            _plan_metadata(counts, n, k, tile)
        except (TypeError, ValueError):
            records.append({"name": "cpu_reject_" + name, "status": "PASS", "execution": "CPU metadata only"})
        else:
            raise AssertionError(f"cpu_reject_{name}: invalid contract accepted")


def emit(report, path):
    text = json.dumps(report, ensure_ascii=False, indent=2)
    print(text, flush=True)
    if path:
        destination = Path(path)
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_text(text + "\n", encoding="utf-8")


def run(torch, np, device, records):
    rng = np.random.default_rng(20261015)

    def inputs(counts, n=128, k=256, extreme=False):
        m, g = sum(counts), len(counts)
        a = rng.integers(-128, 128, size=(m, k), dtype=np.int8)
        b = rng.integers(-128, 128, size=(g, n, k), dtype=np.int8)
        if extreme:
            a.fill(-128)
            b.fill(-128)
            b[:, 1::2, :] = 127
        elif m:
            a[0] = 0  # Exact zero output exercises the explicit near-zero rule.
            b[:, 0, :] = 0
        sa = rng.uniform(0.003, 0.19, m).astype(np.float32)
        sb = rng.uniform(0.007, 0.23, (g, n)).astype(np.float32)
        cpu = (a, b, sa, sb)
        return cpu, tuple(torch.from_numpy(x).to(device) for x in cpu)

    def oracle(cpu, counts):
        a, b, sa, sb = cpu
        result = np.empty((sum(counts), b.shape[1]), dtype=np.float64)
        offset = 0
        for e, count in enumerate(counts):
            end = offset + count
            if count:
                acc = a[offset:end].astype(np.int64) @ b[e].astype(np.int64).T
                result[offset:end] = acc.astype(np.float64) * sa[offset:end, None].astype(np.float64) * sb[e].astype(np.float64)
            offset = end
        return result

    def check(name, actual, reference, **details):
        got = actual.detach().cpu().numpy().astype(np.float64)
        if got.shape != reference.shape:
            raise AssertionError(f"{name}: output shape {got.shape} != {reference.shape}")
        if not np.isfinite(got).all():
            raise AssertionError(f"{name}: nonfinite output")
        error = np.abs(got - reference)
        abs_ref = np.abs(reference)
        regular = abs_ref > NEAR_ZERO
        near = ~regular
        record = {
            "name": name, "status": "PASS", **details,
            "max_abs_error": float(error.max(initial=0)),
            "max_relative_error_away_from_zero": float((error[regular] / abs_ref[regular]).max(initial=0)),
            "near_zero_elements": int(near.sum()),
            "max_abs_error_near_zero": float(error[near].max(initial=0)),
        }
        valid = error <= ATOL + RTOL * abs_ref
        if not valid.all():
            index = tuple(int(i) for i in np.argwhere(~valid)[0])
            record.update(status="FAIL", first_bad_index=index,
                          actual=float(got[index]), reference=float(reference[index]))
            records.append(record)
            raise AssertionError(f"{name}: numerical mismatch: {record}")
        records.append(record)

    # Expert boundaries deliberately do not coincide with GEMM M tiles.
    for tile in (16, 32, 64, 128):
        counts = [0, 1, tile - 1, tile, tile + 1, 0]
        cpu, tensors = inputs(counts)
        plan = prepare_grouped(counts, 128, 256, device=device, tile_m=tile)
        out = torch.full((sum(counts), 128), float("nan"), device=device)
        returned = gemm(*tensors, out=out, plan=plan)
        if returned is not out:
            raise AssertionError("caller-provided out must be returned")
        check(f"tile_{tile}_ragged_empty_experts", out, oracle(cpu, counts), counts=counts, tile_m=tile)

    for name, counts, n, k, extreme in (
        ("automatic_skew", [0, 1, 0, 129, 2], 128, 256, False),
        ("multiple_nk_tiles", [1, 0, 3, 2], 256, 512, False),
        ("signed_extremes", [1, 2], 128, 4096, True),
        ("all_experts_empty", [0, 0, 0], 128, 256, False),
        ("single_token", [1], 128, 256, True),
    ):
        cpu, tensors = inputs(counts, n, k, extreme)
        result = gemm(*tensors, counts=counts)
        check(name, result, oracle(cpu, counts), counts=counts, n=n, k=k)

    counts = [1, 2, 0]
    cpu, tensors = inputs(counts)
    expected = oracle(cpu, counts)
    producer, consumer = torch.cuda.Stream(device=device), torch.cuda.Stream(device=device)
    producer.wait_stream(torch.cuda.current_stream(device))
    with torch.cuda.stream(producer):
        plan = prepare_grouped(counts, 128, 256, device=device)
    # Inputs were produced on the default stream; their dependency is caller-owned.
    consumer.wait_stream(torch.cuda.current_stream(device))
    with torch.cuda.stream(consumer):
        result = gemm(*tensors, plan=plan)
    consumer.synchronize()
    check("nondefault_stream_plan_dependency", result, expected)

    # Drop a plan while kernels can still be queued on another stream, then
    # reuse small default-stream allocations. This is a bounded lifetime stress
    # case, not a proof that every allocator interleaving is covered.
    plan = prepare_grouped(counts, 128, 256, device=device)
    consumer.wait_stream(torch.cuda.current_stream(device))
    with torch.cuda.stream(consumer):
        result = gemm(*tensors, plan=plan)
    del plan
    gc.collect()
    scratch = [torch.full((4,), 1007, dtype=torch.int32, device=device) for _ in range(64)]
    consumer.synchronize()
    check("asynchronous_plan_release", result, expected)
    del scratch

    a, b, sa, sb = tensors
    plan = prepare_grouped(counts, 128, 256, device=device)

    def reject(name, operation):
        try:
            operation()
        except (TypeError, ValueError) as error:
            records.append({"name": name, "status": "PASS", "rejected_with": type(error).__name__})
        else:
            raise AssertionError(f"{name}: invalid input was accepted")

    def call(**changes):
        arguments = dict(a=a, b=b, a_scale=sa, b_scale=sb, plan=plan)
        arguments.update(changes)
        return gemm(**arguments)

    for name, changes in (
        ("reject_a_dtype", {"a": a.float()}),
        ("reject_b_dtype", {"b": b.float()}),
        ("reject_scale_dtype", {"a_scale": sa.half()}),
        ("reject_a_rank", {"a": a.flatten()}),
        ("reject_b_rank", {"b": b[0]}),
        ("reject_scale_shape", {"a_scale": sa[:, None]}),
        ("reject_cpu_input", {"a": a.cpu()}),
        ("reject_noncontiguous_a", {"a": torch.empty((3, 512), dtype=torch.int8, device=device)[:, ::2]}),
        ("reject_noncontiguous_b", {"b": torch.empty((3, 128, 512), dtype=torch.int8, device=device)[:, :, ::2]}),
        ("reject_noncontiguous_scale", {"a_scale": torch.empty(6, device=device)[::2]}),
        ("reject_out_dtype", {"out": torch.empty((3, 128), dtype=torch.float16, device=device)}),
        ("reject_out_shape", {"out": torch.empty((3, 127), device=device)}),
        ("reject_noncontiguous_out", {"out": torch.empty((3, 256), device=device)[:, ::2]}),
        ("reject_plan_counts_conflict", {"counts": [2, 1, 0]}),
        ("reject_plan_tile_conflict", {"tile_m": 32}),
        ("reject_autograd_scale", {"a_scale": sa.clone().requires_grad_()}),
    ):
        reject(name, lambda changes=changes: call(**changes))

    storage = torch.empty(3 * 128, device=device)
    alias_out = storage.view(3, 128)
    reject("reject_output_alias_scale", lambda: call(a_scale=storage[:3], out=alias_out))
    alias_a = storage.view(torch.int8)[:3 * 256].view(3, 256)
    reject("reject_output_alias_input", lambda: call(a=alias_a, out=alias_out))
    misaligned_a = torch.empty(a.numel() + 1, dtype=torch.int8, device=device)[1:].view_as(a)
    reject("reject_misaligned_a", lambda: call(a=misaligned_a))
    misaligned_out = torch.empty(3 * 128 + 1, device=device)[1:].view(3, 128)
    reject("reject_misaligned_out", lambda: call(out=misaligned_out))
    for bad_counts in ([1, -1, 3], [1.0, 2, 0], [True, 2, 0], [], [1, 1, 0], [3]):
        reject(f"reject_counts_{bad_counts}", lambda value=bad_counts: gemm(*tensors, counts=value))
    reject("reject_gpu_counts", lambda: gemm(*tensors, counts=torch.tensor(counts, device=device)))
    for name, values in (
        ("reject_n_alignment", dict(counts=[1], n=129, k=256)),
        ("reject_k_alignment", dict(counts=[1], n=128, k=257)),
        ("reject_int32_accumulator_overflow", dict(counts=[1], n=128, k=131072)),
        ("reject_int32_index_overflow", dict(counts=[1], n=8388608, k=256)),
        ("reject_invalid_tile", dict(counts=[1], n=128, k=256, tile_m=48)),
    ):
        reject(name, lambda values=values: prepare_grouped(device=device, **values))
    torch.cuda.synchronize(device)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--device", default="cuda:0")
    parser.add_argument("--cpu-only", action="store_true", help="run metadata checks only; does not validate any GPU kernel")
    parser.add_argument("--json", type=Path)
    args = parser.parse_args()
    report = {
        "status": "RUNNING", "gpu_status": "NOT_RUN", "cases": [],
        "oracle": "same quantized INT8 inputs; NumPy INT64 dot then FP64 scaling",
        "tolerance": {"rule": "abs(actual-reference) <= atol + rtol*abs(reference)",
                      "rtol": RTOL, "atol": ATOL, "near_zero_threshold": NEAR_ZERO},
        "scope": "synthetic operator correctness, not model quantization accuracy or project acceptance",
    }
    try:
        run_cpu(report["cases"])
    except Exception as error:
        report.update(status="FAIL", error=f"{type(error).__name__}: {error}")
        traceback.print_exc()
        emit(report, args.json)
        return 1
    report["cpu_metadata_passed_cases"] = len(report["cases"])
    if args.cpu_only:
        report.update(status="PASS_CPU_ONLY", gpu_status="NOT_RUN")
        emit(report, args.json)
        return 0
    try:
        import numpy as np
        import torch
    except ImportError as error:
        report.update(status="SKIP", gpu_status="SKIP", reason=f"required Python package unavailable: {error}")
        emit(report, args.json)
        return 77
    try:
        if not torch.cuda.is_available():
            report.update(status="SKIP", gpu_status="SKIP", reason="no usable MACA/mcPyTorch GPU")
            emit(report, args.json)
            return 77
        device = torch.device(args.device)
        if device.type != "cuda":
            raise ValueError("--device must identify a cuda-compatible C500 GPU")
        torch.cuda.set_device(device)
        report["environment"] = {"torch": torch.__version__, "device": str(device),
                                 "device_name": torch.cuda.get_device_name(device)}
        report["gpu_status"] = "RUNNING"
        run(torch, np, device, report["cases"])
    except Exception as error:
        report.update(status="FAIL", gpu_status="FAIL", error=f"{type(error).__name__}: {error}")
        traceback.print_exc()
        emit(report, args.json)
        return 1
    report.update(status="PASS", gpu_status="PASS", passed_cases=len(report["cases"]))
    emit(report, args.json)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
