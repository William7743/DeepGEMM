"""GPU-length masked W8A8 GEMM using the native C500 INT8 MMA primitives."""
from __future__ import annotations

from .api import (
    _INT32_MAX, _MAX_K, _as_index, _check_tensor, _load_native,
    _overlaps, _require_torch, _select_tile_m,
)


def _masked_configuration(g, capacity, n, k, tile_m=0, expected_m=None):
    """Pure CPU shape checks; the length tensor itself stays on the GPU."""
    g, capacity, n, k = (_as_index(v, name) for v, name in
                          zip((g, capacity, n, k), ("G", "capacity", "N", "K")))
    if g <= 0 or capacity < 0:
        raise ValueError("masked GEMM requires G > 0 and capacity >= 0")
    if n <= 0 or n % 128 or k <= 0 or k % 256 or k > _MAX_K:
        raise ValueError("N must be positive/divisible by 128; K by 256 and <= 130816")
    if any(v > _INT32_MAX for v in (g*capacity*k, g*n*k, g*capacity*n)):
        raise ValueError("masked tensors must fit SDK signed INT32 element indexing")
    hint = capacity if expected_m is None else _as_index(expected_m, "expected_m")
    if hint < 0:
        raise ValueError("expected_m must be nonnegative")
    hint = min(hint, capacity)
    tile = _select_tile_m(hint*g, g, k, tile_m)
    rows = (capacity + tile - 1)//tile
    blocks = min(rows, max(1, (hint + tile - 1)//tile)) if capacity else 0
    return {"g": g, "capacity": capacity, "n": n, "k": k,
            "tile_m": tile, "row_blocks": blocks}


def m_grouped_int8_gemm_nt_masked(
    a, b, a_scale, b_scale, masked_m, *, out=None, expected_m=None,
    tile_m=0, validate_mask=True,
):
    """Compute each expert's valid prefix without CPU packing/count transfer.

    A=INT8[G,capacity,K], B=INT8[G,N,K], A_scale=FP32[G,capacity],
    B_scale=FP32[G,N], masked_m=INT32[G] on the same GPU. Output is
    FP32[G,capacity,N]. For each expert e, only rows < masked_m[e] are written.
    Caller-provided output padding is untouched; newly allocated output is zero.
    Scaling and zero point match the contiguous INT8 API.

    expected_m is a launch hint. It NEVER limits the valid length: a block loops
    over additional row tiles when necessary. A/B/out require 16-byte pointer
    alignment; scales and masked_m require 4 bytes. N/K/index/accumulation limits
    match the contiguous backend. This inference API has no backward.

    validate_mask=True (default) checks 0 <= masked_m <= capacity and synchronizes
    one Boolean to CPU. After validating lengths in the caller, use False to keep
    this call asynchronous, including graph capture. False requires valid GPU
    lengths; invalid experts are skipped by the native memory-safety guard and
    their output is unspecified. Inputs/length updates must be ready on the
    current stream. All tensors are recorded on the launch stream for lifetime.
    """
    torch = _require_torch()
    if not isinstance(a, torch.Tensor) or not isinstance(b, torch.Tensor):
        raise TypeError("a and b must be torch.Tensor objects")
    if a.ndim != 3 or b.ndim != 3:
        raise ValueError("masked a and b must both have rank 3")
    if a.device.type != "cuda":
        raise ValueError("a must be on a MACA/mcPyTorch GPU")
    g, capacity, k = a.shape
    bg, n, bk = b.shape
    if bg != g or bk != k:
        raise ValueError("a and b must have matching G and K dimensions")
    if not isinstance(validate_mask, bool):
        raise TypeError("validate_mask must be bool")
    config = _masked_configuration(g, capacity, n, k, tile_m, expected_m)
    tensors = ((a, "a", (g, capacity, k), torch.int8, 16),
               (b, "b", (g, n, k), torch.int8, 16),
               (a_scale, "a_scale", (g, capacity), torch.float32, 4),
               (b_scale, "b_scale", (g, n), torch.float32, 4),
               (masked_m, "masked_m", (g,), torch.int32, 4))
    for t, name, shape, dtype, alignment in tensors:
        _check_tensor(torch, t, name, shape, dtype, a.device, alignment)
    if out is not None:
        _check_tensor(torch, out, "out", (g, capacity, n), torch.float32, a.device, 16)
        if any(_overlaps(out, t) for t, *_ in tensors):
            raise ValueError("out must not overlap inputs, scales or masked_m")
    with torch.cuda.device(a.device):
        stream = torch.cuda.current_stream(a.device)
        if validate_mask:
            if torch.cuda.is_current_stream_capturing():
                raise ValueError("graph capture requires caller-validated lengths and validate_mask=False")
            if ((masked_m < 0) | (masked_m > capacity)).any().item():
                raise ValueError("masked_m entries must lie in [0, capacity]")
        if out is None:
            out = torch.zeros((g, capacity, n), device=a.device, dtype=torch.float32)
        if capacity == 0:
            return out
        library = _load_native()
        for t in (a, b, a_scale, b_scale, masked_m, out):
            t.record_stream(stream)
        status = library.dg_maca_masked_gemm(
            a.data_ptr(), b.data_ptr(), out.data_ptr(),
            a_scale.data_ptr(), b_scale.data_ptr(), masked_m.data_ptr(),
            g, capacity, n, k, config["tile_m"], config["row_blocks"], stream.cuda_stream,
        )
        if status:
            error = library.dg_maca_last_error()
            raise RuntimeError("MACA masked INT8 GEMM failed: " +
                               (error.decode(errors="replace") if error else str(status)))
    return out
