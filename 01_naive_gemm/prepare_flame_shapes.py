#!/usr/bin/env python3
"""Convert a small, pinned FLAME routing slice into teaching GEMM shapes.

Dependencies: pyarrow>=18 and huggingface_hub. No model weights are downloaded.
Only expert counts come from the trace; bench_shapes.py generates INT8 A/B/scales.
"""
import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path
import struct


DATASET = "CMU-FLAME/FLAME-MoE-Traces"
REVISION = "394919b1ce3b166ce364d6749ba35d3a04ea358e"
TRACE = "flame-moe-290m/actives/iter_5473/layer_02.parquet"
TRACE_SHA256 = "d80cf3702a92bc439b7e8a5ad70ddbbe777180baaf3b993880ed7f98874ebe75"
MODEL_REVISION = "e9b2fe2df3f1abb8dbb9ec0eabde8cdfb65e5c78"
MODEL_BASE = f"https://github.com/cmu-flame/FLAME-MoE/blob/{MODEL_REVISION}/"
EXPERTS, TOP_K, HIDDEN, INTERMEDIATE = 64, 6, 1024, 704


def read_routing(start, count):
    """Range-read the indices column; stop after the requested token window."""
    import pyarrow.parquet as pq
    from huggingface_hub import HfFileSystem

    fs = HfFileSystem()
    path = f"datasets/{DATASET}@{REVISION}/{TRACE}"
    rows = []
    with fs.open(path, "rb", block_size=256 * 1024) as stream:
        parquet = pq.ParquetFile(stream)
        if start + count > parquet.metadata.num_rows:
            raise ValueError("requested window exceeds trace length")
        group_start = 0
        for group in range(parquet.num_row_groups):
            group_end = group_start + parquet.metadata.row_group(group).num_rows
            if group_end <= start:
                group_start = group_end
                continue
            batch_start = group_start
            for batch in parquet.iter_batches(batch_size=4096, row_groups=[group],
                                              columns=["indices"]):
                batch_end = batch_start + batch.num_rows
                lo, hi = max(start, batch_start), min(start + count, batch_end)
                if lo < hi:
                    rows.extend(batch.column(0).slice(lo - batch_start, hi - lo).to_pylist())
                batch_start = batch_end
                if batch_end >= start + count:
                    break
            if len(rows) == count:
                break
            group_start = group_end
    if len(rows) != count:
        raise ValueError(f"short read: expected {count}, got {len(rows)}")
    return rows


def routing_counts(rows):
    """One Top-6 token contributes one row to each of six different experts."""
    if not rows:
        raise ValueError("empty token window")
    counts = Counter()
    for row in rows:
        if not isinstance(row, list) or len(row) != TOP_K:
            raise ValueError("each token must contain six expert IDs")
        if any(type(e) is not int or not 0 <= e < EXPERTS for e in row):
            raise ValueError("expert ID outside [0,63]")
        if len(set(row)) != TOP_K:
            raise ValueError("duplicate expert within one token")
        counts.update(row)
    result = [counts[e] for e in range(EXPERTS)]
    if sum(result) != len(rows) * TOP_K:
        raise ValueError("routing assignment count mismatch")
    return result


def make_cases(rows, token_sizes, start):
    cases = []
    for tokens in token_sizes:
        selected = rows[:tokens]
        if len(selected) != tokens:
            raise ValueError("insufficient routing rows")
        counts = routing_counts(selected)
        # Preserve token order and Top-k order for a reproducible slice checksum.
        digest = hashlib.sha256(b"".join(struct.pack("<6h", *r) for r in selected)).hexdigest()
        provenance = dict(
            dataset=DATASET, revision=REVISION, file=TRACE,
            file_sha256_from_lfs_metadata=TRACE_SHA256,
            slice_sha256_int16_le=digest, row_start=start, token_count=tokens,
            top_k=TOP_K, routed_experts=EXPERTS,
            model_revision=MODEL_REVISION,
            dimension_sources=[MODEL_BASE + "scripts/release/flame-moe-290m.sh",
                               MODEL_BASE + "configs/model/flame-moe.sh"],
            hidden_size=HIDDEN, expert_intermediate_size=INTERMEDIATE,
            replay_tp=1, replay_ep=1,
            scope="single-device routed-expert shape replay; selected token windows are not original training batches; excludes shared experts, routing, activation and communication",
            values="synthetic INT8 inputs/weights and FP32 quantization scales; router scores are NOT quantization scales")
        # SwiGLU FC1 concatenates gate/up projections; FC2 follows the activation.
        for stage, n, k in (("fc1", 2 * INTERMEDIATE, HIDDEN),
                            ("fc2", HIDDEN, INTERMEDIATE)):
            for layout in ("contiguous", "masked"):
                case = dict(
                    name=f"flame290m_i5473_l02_r{start}_t{tokens}_{stage}_{layout}",
                    layout=layout, counts=counts, n=n, k=k,
                    source=f"FLAME_trace_counts:{REVISION}:{TRACE};INT8_shape_replay",
                    provenance=provenance, stage=stage)
                if layout == "masked":
                    # Teaching capacity rule, not a capacity observed in FLAME.
                    case["capacity"] = ((max(counts) + 15) // 16) * 16
                    case["capacity_rule"] = "ceil(max(counts)/16)*16; no token drops"
                cases.append(case)
    return cases


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--tokens", default="16,128,1024,4096",
                        help="nested prefix lengths within the selected routing window")
    parser.add_argument("--row-start", type=int, default=0)
    parser.add_argument("--output", type=Path,
                        default=Path(__file__).with_name("shapes_flame.json"))
    args = parser.parse_args()
    try:
        sizes = [int(x) for x in args.tokens.split(",")]
        if not sizes or len(set(sizes)) != len(sizes) or not all(1 <= n <= 65536 for n in sizes):
            raise ValueError("token sizes must be distinct integers in [1,65536]")
        if args.row_start < 0:
            raise ValueError("row-start must be nonnegative")
    except ValueError as exc:
        parser.error(str(exc))
    rows = read_routing(args.row_start, max(sizes))
    cases = make_cases(rows, sizes, args.row_start)
    args.output.write_text(json.dumps(cases, indent=2, allow_nan=False) + "\n", encoding="utf-8")
    for tokens in sizes:
        counts = routing_counts(rows[:tokens])
        print(f"tokens={tokens} assignments={sum(counts)} M_min={min(counts)} "
              f"M_max={max(counts)} empty_experts={counts.count(0)}")
    print(f"Saved {len(cases)} cases to {args.output}")


if __name__ == "__main__":
    main()
