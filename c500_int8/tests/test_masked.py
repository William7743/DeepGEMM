#!/usr/bin/env python3
"""Masked C500 INT8 correctness, dynamic-length and buffer-boundary checks.

Exit 77 means SKIP. --cpu-only does not validate GPU execution.
"""
from __future__ import annotations
import argparse
import gc
import json
from pathlib import Path
import sys
import traceback

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from deep_gemm_maca import m_grouped_int8_gemm_nt_masked as gemm
from deep_gemm_maca.masked import _masked_configuration


def cpu_checks(records):
    def equal(name, got, expected):
        assert got == expected, (name, got, expected)
        records.append({"name": name, "status": "PASS", "execution": "CPU metadata only"})
    for tile in (16, 32, 64, 128):
        config = _masked_configuration(4, 2*tile+3, 128, 256, tile, 1)
        equal(f"tile_{tile}_one_row_block_hint", config["row_blocks"], 1)
        equal(f"tile_{tile}_manual_selection", config["tile_m"], tile)
    equal("empty_capacity", _masked_configuration(3, 0, 128, 256)["row_blocks"], 0)
    equal("hint_above_capacity", _masked_configuration(3, 17, 128, 256, 16, 999)["row_blocks"], 2)
    equal("zero_hint_does_not_zero_grid", _masked_configuration(3, 17, 128, 256, 16, 0)["row_blocks"], 1)
    equal("large_weight_guard_valid_boundary", _masked_configuration(1, 1, 128, 130816)["k"], 130816)
    for name, args in (
        ("zero_experts", (0, 1, 128, 256)),
        ("negative_capacity", (1, -1, 128, 256)),
        ("n_tail", (1, 1, 129, 256)),
        ("k_tail", (1, 1, 128, 257)),
        ("accumulator_overflow", (1, 1, 128, 131072)),
        ("weight_index_overflow", (65536, 0, 128, 256)),
        ("activation_index_overflow", (1, 8388608, 128, 256)),
        ("bad_tile", (1, 1, 128, 256, 48)),
        ("negative_hint", (1, 1, 128, 256, 0, -1)),
        ("bool_hint", (1, 1, 128, 256, 0, True)),
    ):
        try:
            _masked_configuration(*args)
        except (TypeError, ValueError):
            records.append({"name": "reject_"+name, "status": "PASS", "execution": "CPU metadata only"})
        else:
            raise AssertionError("invalid configuration accepted: "+name)


def gpu_checks(torch, np, device, records):
    rng = np.random.default_rng(20261015)
    sentinel = 171.125

    def make(capacity, lengths, n=128, k=256, extreme=False):
        g = len(lengths)
        a = rng.integers(-128, 128, (g, capacity, k), dtype=np.int8)
        b = rng.integers(-128, 128, (g, n, k), dtype=np.int8)
        if extreme:
            a.fill(-128)
            b.fill(-128)
            b[:, 1::2] = 127
        elif capacity:
            a[:, 0] = 0
            b[:, 0] = 0
        sa = rng.uniform(0.003, 0.19, (g, capacity)).astype(np.float32)
        sb = rng.uniform(0.007, 0.23, (g, n)).astype(np.float32)
        cpu = (a, b, sa, sb)
        gpu = tuple(torch.from_numpy(t).to(device) for t in cpu)
        mask = torch.tensor(lengths, dtype=torch.int32, device=device)
        return cpu, gpu, mask

    def check(name, out, cpu, lengths, padding=sentinel, **details):
        a, b, sa, sb = cpu
        actual = out.cpu().numpy().astype(np.float64)
        max_abs = max_rel = 0.0
        for e, length in enumerate(lengths):
            acc = a[e, :length].astype(np.int64) @ b[e].astype(np.int64).T
            reference = acc.astype(np.float64) * sa[e, :length, None].astype(np.float64) * sb[e].astype(np.float64)
            got = actual[e, :length]
            error = np.abs(got-reference)
            if not np.isfinite(got).all() or not (error <= 1e-6 + 1e-3*np.abs(reference)).all():
                raise AssertionError(f"{name}: expert {e} valid prefix mismatch")
            max_abs = max(max_abs, float(error.max(initial=0)))
            regular = np.abs(reference) > 1e-6
            max_rel = max(max_rel, float((error[regular]/np.abs(reference[regular])).max(initial=0)))
            if not (actual[e, length:] == padding).all():
                raise AssertionError(f"{name}: expert {e} padding modified")
        records.append({"name": name, "status": "PASS", "masked_m": list(lengths),
                        "max_abs_error": max_abs, "max_relative_error_away_from_zero": max_rel,
                        "padding_unchanged": True, **details})

    for tile in (16, 32, 64, 128):
        capacity = 2*tile+3
        lengths = [0, 1, tile-1, tile+1, capacity]
        cpu, gpu, mask = make(capacity, lengths)
        out = torch.full((5, capacity, 128), sentinel, device=device)
        result = gemm(*gpu, mask, out=out, expected_m=1, tile_m=tile)
        assert result is out
        check(f"tile_{tile}_ragged_and_undersized_hint", out, cpu, lengths, tile_m=tile, expected_m=1)
    for name, cap, lengths, n, k, extreme in (
        ("multiple_nk_tiles", 19, [1, 0, 19], 256, 512, False),
        ("capacity_above_640", 643, [0, 641, 643], 128, 256, False),
        ("signed_extremes", 3, [1, 3], 128, 4096, True),
        ("all_empty", 17, [0, 0, 0], 128, 256, False),
        ("zero_capacity", 0, [0, 0], 128, 256, False),
    ):
        cpu, gpu, mask = make(cap, lengths, n, k, extreme)
        out = torch.full((len(lengths), cap, n), sentinel, device=device)
        gemm(*gpu, mask, out=out, expected_m=0)
        check(name, out, cpu, lengths, capacity=cap, n=n, k=k)
    cpu, gpu, mask = make(17, [0, 1, 7])
    result = gemm(*gpu, mask)
    check("new_output_zero_padding", result, cpu, [0, 1, 7], padding=0.0)
    out = torch.full_like(result, sentinel)
    mask.copy_(torch.tensor([17, 2, 0], dtype=torch.int32, device=device))
    gemm(*gpu, mask, out=out, expected_m=1, validate_mask=False)
    check("dynamic_gpu_lengths", out, cpu, [17, 2, 0])
    stream = torch.cuda.Stream(device=device)
    stream.wait_stream(torch.cuda.current_stream(device))
    with torch.cuda.stream(stream):
        out = torch.full_like(result, sentinel)
        gemm(*gpu, mask, out=out, expected_m=1, validate_mask=False)
    stream.synchronize()
    check("nondefault_stream", out, cpu, [17, 2, 0])
    with torch.cuda.stream(stream):
        temp_mask = mask.clone()
        out = torch.full_like(result, sentinel)
        gemm(*gpu, temp_mask, out=out, validate_mask=False)
    del temp_mask
    gc.collect()
    scratch = [torch.zeros(3, dtype=torch.int32, device=device) for _ in range(32)]
    stream.synchronize()
    check("asynchronous_length_lifetime", out, cpu, [17, 2, 0])
    del scratch

    # Capture only the asynchronous native path; replay must read the current
    # GPU lengths, rather than lengths cached on CPU during graph creation.
    out = torch.full_like(result, sentinel)
    graph = torch.cuda.CUDAGraph()
    torch.cuda.synchronize(device)
    with torch.cuda.graph(graph):
        gemm(*gpu, mask, out=out, expected_m=1, validate_mask=False)
    graph.replay()
    torch.cuda.synchronize(device)
    check("graph_capture_replay", out, cpu, [17, 2, 0])
    mask.copy_(torch.tensor([1, 0, 17], dtype=torch.int32, device=device))
    out.fill_(sentinel)
    graph.replay()
    torch.cuda.synchronize(device)
    check("graph_replay_dynamic_gpu_lengths", out, cpu, [1, 0, 17])

    a, b, sa, sb = gpu
    def call(**changes):
        params = dict(a=a, b=b, a_scale=sa, b_scale=sb, masked_m=mask)
        params.update(changes)
        return gemm(**params)
    def reject(name, **changes):
        try:
            call(**changes)
        except (TypeError, ValueError):
            records.append({"name": name, "status": "PASS", "execution": "input rejection"})
        else:
            raise AssertionError(name+": invalid argument accepted")
    for name, changes in (
        ("reject_a_dtype", {"a": a.float()}),
        ("reject_b_dtype", {"b": b.float()}),
        ("reject_scale_dtype", {"a_scale": sa.half()}),
        ("reject_mask_dtype", {"masked_m": mask.to(torch.int64)}),
        ("reject_mask_shape", {"masked_m": mask[:, None]}),
        ("reject_cpu_mask", {"masked_m": mask.cpu()}),
        ("reject_negative_length", {"masked_m": torch.tensor([-1, 2, 0], dtype=torch.int32, device=device)}),
        ("reject_excessive_length", {"masked_m": torch.tensor([18, 2, 0], dtype=torch.int32, device=device)}),
        ("reject_a_rank", {"a": a[0]}),
        ("reject_out_shape", {"out": torch.empty((3, 17, 127), device=device)}),
        ("reject_noncontiguous_a", {"a": torch.empty((3, 17, 512), dtype=torch.int8, device=device)[:, :, ::2]}),
        ("reject_noncontiguous_mask", {"masked_m": torch.empty(6, dtype=torch.int32, device=device)[::2]}),
        ("reject_grad_scale", {"a_scale": sa.clone().requires_grad_()}),
        ("reject_validate_mask_nonbool", {"validate_mask": 1}),
    ):
        reject(name, **changes)
    storage = torch.empty(3*17*128, device=device)
    reject("reject_output_scale_alias", out=storage.view(3, 17, 128), a_scale=storage[:3*17].view(3, 17))
    reject("reject_output_length_alias", out=storage.view(3, 17, 128), masked_m=storage.view(torch.int32)[:3])
    torch.cuda.synchronize(device)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cpu-only", action="store_true")
    parser.add_argument("--device", default="cuda:0")
    parser.add_argument("--json", type=Path)
    args = parser.parse_args()
    report = {"status": "RUNNING", "gpu_status": "NOT_RUN", "cases": [],
              "oracle": "same INT8 inputs; CPU INT64 dot and FP64 scales",
              "tolerance": {"rtol": 1e-3, "atol": 1e-6, "near_zero_threshold": 1e-6},
              "scope": "synthetic masked operator checks, not project acceptance"}
    code = 0
    try:
        cpu_checks(report["cases"])
        report["cpu_metadata_passed_cases"] = len(report["cases"])
        if args.cpu_only:
            report["status"] = "PASS_CPU_ONLY"
        else:
            try:
                import torch
                import numpy as np
            except ImportError as exc:
                report.update(status="SKIP", gpu_status="SKIP", reason=str(exc))
                code = 77
            else:
                if not torch.cuda.is_available():
                    report.update(status="SKIP", gpu_status="SKIP", reason="no usable MACA GPU")
                    code = 77
                else:
                    device = torch.device(args.device)
                    torch.cuda.set_device(device)
                    report["environment"] = {"torch": torch.__version__, "device": str(device),
                                             "device_name": torch.cuda.get_device_name(device)}
                    gpu_checks(torch, np, device, report["cases"])
                    report.update(status="PASS", gpu_status="PASS", passed_cases=len(report["cases"]))
    except Exception as exc:
        traceback.print_exc()
        report.update(status="FAIL", error=f"{type(exc).__name__}: {exc}")
        code = 1
    text = json.dumps(report, ensure_ascii=False, indent=2)
    print(text)
    if args.json:
        args.json.parent.mkdir(parents=True, exist_ok=True)
        args.json.write_text(text+"\n", encoding="utf-8")
    return code


if __name__ == "__main__":
    raise SystemExit(main())
