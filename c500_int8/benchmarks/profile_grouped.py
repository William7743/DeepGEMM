#!/usr/bin/env python3
"""Short, scoped mcProfiler/mcTracer workload using an upstream-shape case.

Initialization and sampled CPU INT64 checks are outside mcProfilerStart/Stop.
Run profiling separately from benchmarking. Inputs use fixed-seed random INT8
values and unit scales; this is an isolated kernel probe, not an MoE pipeline.
"""
import argparse
import ctypes
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import torch
from deep_gemm_maca import prepare_grouped, m_grouped_int8_gemm_nt_contiguous, m_grouped_int8_gemm_nt_masked


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--shape', type=int, required=True, help='zero-based upstream_shapes.json index')
    p.add_argument('--tile', type=int, default=128, choices=(16, 32, 64, 128))
    p.add_argument('--repeat', type=int, default=3)
    p.add_argument('--expected-m', type=int, help='override masked scheduling hint only')
    args = p.parse_args()
    shapes = json.loads(Path(__file__).with_name('upstream_shapes.json').read_text())
    s = shapes[args.shape]
    counts, n, k = s['counts'], s['n'], s['k']
    g, m = len(counts), sum(counts)
    masked = s['layout'] == 'masked'
    rows = (g, s['capacity']) if masked else (m,)
    torch.manual_seed(20261015)
    a = torch.randint(-127, 128, (*rows, k), dtype=torch.int8, device='cuda')
    b = torch.randint(-127, 128, (g, n, k), dtype=torch.int8, device='cuda')
    sa = torch.ones(rows, device='cuda')
    sb = torch.ones((g, n), device='cuda')
    out = torch.empty((*rows, n), device='cuda')
    if masked:
        lengths = torch.tensor(counts, dtype=torch.int32, device='cuda')
        hint = s['expected_m'] if args.expected_m is None else args.expected_m
        def launch():
            m_grouped_int8_gemm_nt_masked(a, b, sa, sb, lengths, out=out,
                                        tile_m=args.tile, expected_m=hint, validate_mask=False)
    else:
        plan = prepare_grouped(counts, n, k, tile_m=args.tile)
        def launch():
            m_grouped_int8_gemm_nt_contiguous(a, b, sa, sb, out=out, plan=plan)
    for _ in range(3):
        launch()
    torch.cuda.synchronize()
    runtime = ctypes.CDLL('libmcruntime.so')
    for name in ('mcProfilerStart', 'mcProfilerStop'):
        getattr(runtime, name).argtypes = []
        getattr(runtime, name).restype = ctypes.c_int
    status = runtime.mcProfilerStart()
    if status:
        raise RuntimeError(f'mcProfilerStart returned {status}')
    for _ in range(args.repeat):
        launch()
    torch.cuda.synchronize()
    status = runtime.mcProfilerStop()
    if status:
        raise RuntimeError(f'mcProfilerStop returned {status}')
    offset = 0
    for e, count in enumerate(counts):
        if count:
            for r in (0, count-1):
                value = out[e, r, n-1] if masked else out[offset+r, n-1]
                ar = a[e, r] if masked else a[offset+r]
                expected = (ar.to(device='cpu', dtype=torch.int64) @
                            b[e, n-1].to(device='cpu', dtype=torch.int64)).float().item()
                assert value.item() == expected, (e, r, value.item(), expected)
        offset += count
    print(json.dumps(dict(status='PASS', shape=s['name'], tile=args.tile,
                          repeats=args.repeat, counts=counts,
                          expected_m=hint if masked else None)), flush=True)


if __name__ == '__main__':
    main()
