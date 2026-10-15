"""Strict Python interface for the experimental C500 INT8 native backend.

For consecutive expert segments, compute::

    out[segment_e, n] = a_scale[segment_e] * b_scale[e, n] * (
        a[segment_e, :].int32() @ b[e, n, :].int32())

The inputs are already quantized signed INT8 with symmetric zero point 0.
Scales and output are FP32. This adapter neither quantizes inputs nor silently
falls back to a floating-point GEMM. It takes explicit CPU ``counts``, not the
upstream DeepGEMM FP8 ``grouped_layout`` argument. Masked GEMM is not supported.

``prepare_grouped`` prepares reusable GPU metadata without JIT compilation.
Keep routing/count preparation outside the timed GEMM region. Plan metadata
must not be modified by callers. User input tensors must be ready on the
current stream; the adapter handles the plan's preparation-stream dependency.
"""

from __future__ import annotations

import ctypes
from dataclasses import dataclass, field
import importlib
import operator
from pathlib import Path
from typing import Any, Iterable


_INT32_MAX = (1 << 31) - 1
_MAX_K = _INT32_MAX // (128 * 128)
_SUPPORTED_TILES = (16, 32, 64, 128)
_NATIVE_PATH = Path(__file__).resolve().parent.parent / "native" / "libdeep_gemm_maca.so"
_native_library = None


def _as_index(value: Any, name: str) -> int:
    """Accept integer values, including NumPy integers, without truncation."""
    if isinstance(value, bool):
        raise TypeError(f"{name} must be an integer, not bool")
    try:
        return operator.index(value)
    except TypeError as exc:
        raise TypeError(f"{name} must be an integer") from exc


def _normalize_counts(counts: Iterable[int]) -> tuple[int, ...]:
    """Pure CPU validation: allow empty experts, but require at least one."""
    if counts is None or isinstance(counts, (str, bytes)):
        raise TypeError("counts must be an explicit CPU sequence of integers")
    counts_device = getattr(counts, "device", None)
    if counts_device is not None:
        device_type = getattr(counts_device, "type", str(counts_device))
        if device_type != "cpu":
            raise ValueError("counts must be on CPU; no implicit GPU-to-CPU synchronization")
    if getattr(counts, "ndim", 1) != 1:
        raise ValueError("counts must be a one-dimensional CPU sequence")
    try:
        values = tuple(_as_index(value, f"counts[{i}]") for i, value in enumerate(counts))
    except TypeError as exc:
        raise TypeError("counts must be a CPU sequence of integers") from exc
    if not values:
        raise ValueError("counts must contain at least one expert (G > 0)")
    if len(values) > _INT32_MAX:
        raise ValueError("expert count G exceeds the signed INT32 native ABI")
    if any(value < 0 for value in values):
        raise ValueError("counts cannot contain negative expert lengths")
    if sum(values) > _INT32_MAX:
        raise ValueError("sum(counts) exceeds the signed INT32 native ABI")
    return values


def _select_tile_m(m: int, g: int, k: int, tile_m: int = 0) -> int:
    """Pure CPU selector. Multiplication avoids floating-point rounding."""
    m, g, k = _as_index(m, "m"), _as_index(g, "g"), _as_index(k, "k")
    tile_m = _as_index(tile_m, "tile_m")
    if m < 0 or g <= 0 or k <= 0:
        raise ValueError("selector requires M >= 0, G > 0 and K > 0")
    if tile_m:
        if tile_m not in _SUPPORTED_TILES:
            raise ValueError(f"tile_m must be 0 (automatic) or one of {_SUPPORTED_TILES}")
        return tile_m
    if m <= 16 * g:
        return 16
    if m <= 32 * g:
        return 32
    if m <= 64 * g and k < 4096:
        return 64
    return 128


def _plan_metadata(
    counts: Iterable[int], n: int, k: int, tile_m: int = 0
) -> dict[str, Any]:
    """Validate the native contract and construct metadata using only Python."""
    counts = _normalize_counts(counts)
    n, k = _as_index(n, "n"), _as_index(k, "k")
    if n <= 0 or n % 128:
        raise ValueError("N must be positive and divisible by 128")
    if k <= 0 or k % 256:
        raise ValueError("K must be positive and divisible by 256")
    if k > _MAX_K:
        raise ValueError(
            f"K must be <= {_MAX_K} to avoid worst-case INT8-to-INT32 accumulation overflow "
            "(maximum supported aligned K is 130816)"
        )
    m, g = sum(counts), len(counts)
    for name, numel in (("A", m * k), ("B", g * n * k), ("D", m * n)):
        if numel > _INT32_MAX:
            raise ValueError(f"{name}.numel() must be <= INT32_MAX: native index arithmetic is INT32")
    selected_tile = _select_tile_m(m, g, k, tile_m)
    segments, tiles = [0], [0]
    for count in counts:
        segments.append(segments[-1] + count)
        tiles.append(tiles[-1] + (count + selected_tile - 1) // selected_tile)
    return {
        "counts": counts,
        "m": m,
        "g": g,
        "n": n,
        "k": k,
        "tile_m": selected_tile,
        "seg_indptr": tuple(segments),
        "weight_indices": tuple(range(g)),
        "m_num_tiles_indptr": tuple(tiles),
    }


@dataclass(frozen=True, eq=False)
class GroupedGemmPlan:
    """Reusable expert segmentation, constructed by :func:`prepare_grouped`.

    Tensor fields are GPU INT32 metadata and must be treated as read-only.
    ``counts`` includes empty experts; their corresponding weight still exists.
    No global plan cache is used.
    """

    counts: tuple[int, ...]
    n: int
    k: int
    tile_m: int
    device: Any
    seg_indptr: Any = field(repr=False)
    weight_indices: Any = field(repr=False)
    m_num_tiles_indptr: Any = field(repr=False)
    _ready_event: Any = field(repr=False)

    @property
    def m(self) -> int:
        return sum(self.counts)

    @property
    def g(self) -> int:
        return len(self.counts)


def _require_torch():
    try:
        return importlib.import_module("torch")
    except ImportError as exc:
        raise RuntimeError("Run this adapter in the C500 MACA/mcPyTorch Python environment") from exc


def prepare_grouped(
    counts: Iterable[int], n: int, k: int, device: Any = "cuda:0", tile_m: int = 0
) -> GroupedGemmPlan:
    """Prepare GPU metadata for contiguous experts using explicit CPU counts.

    ``sum(counts) == M`` and ``len(counts) == G``. Empty experts are allowed.
    N must be divisible by 128; K by 256 and at most 130816. A/B/output
    element counts must each fit signed INT32. ``tile_m=0`` selects a heuristic
    tile; manual choices are 16, 32, 64 and 128. This function performs no JIT.
    """
    metadata = _plan_metadata(counts, n, k, tile_m)
    torch = _require_torch()
    device = torch.device(device)
    if device.type != "cuda":
        raise ValueError("device must be a MACA/mcPyTorch cuda-compatible GPU device")
    if device.index is None:
        device = torch.device("cuda", torch.cuda.current_device())
    with torch.cuda.device(device):
        seg_indptr = torch.tensor(metadata["seg_indptr"], dtype=torch.int32, device=device)
        weight_indices = torch.tensor(metadata["weight_indices"], dtype=torch.int32, device=device)
        m_num_tiles_indptr = torch.tensor(
            metadata["m_num_tiles_indptr"], dtype=torch.int32, device=device
        )
        ready_event = torch.cuda.Event()
        ready_event.record(torch.cuda.current_stream(device))
    return GroupedGemmPlan(
        counts=metadata["counts"], n=metadata["n"], k=metadata["k"],
        tile_m=metadata["tile_m"], device=device, seg_indptr=seg_indptr,
        weight_indices=weight_indices, m_num_tiles_indptr=m_num_tiles_indptr,
        _ready_event=ready_event,
    )


def _load_native():
    global _native_library
    if _native_library is None:
        if not _NATIVE_PATH.is_file():
            raise RuntimeError(
                f"Native MACA library not found: {_NATIVE_PATH}. "
                "On the C500 server, run `bash build.sh` in the c500_int8 directory first. "
                "There is no floating-point fallback."
            )
        try:
            library = ctypes.CDLL(str(_NATIVE_PATH))
            # A, B, D, SA, SB, segments, weights, tiles; G, M, N, K, tile_m; stream.
            library.dg_maca_gemm.argtypes = [ctypes.c_void_p] * 8 + [ctypes.c_int32] * 5 + [ctypes.c_void_p]
            library.dg_maca_gemm.restype = ctypes.c_int32
            library.dg_maca_last_error.argtypes = []
            library.dg_maca_last_error.restype = ctypes.c_char_p
        except (OSError, AttributeError) as exc:
            raise RuntimeError(
                f"Cannot load MACA backend {_NATIVE_PATH}: {exc}. "
                "Check the MACA runtime library path and run `bash build.sh` in c500_int8."
            ) from exc
        _native_library = library
    return _native_library


def _check_tensor(torch, tensor, name, shape, dtype, device, alignment=4):
    if not isinstance(tensor, torch.Tensor):
        raise TypeError(f"{name} must be a torch.Tensor")
    if tensor.dtype != dtype:
        raise TypeError(f"{name} must have dtype {dtype}; implicit conversion is not supported")
    if tuple(tensor.shape) != tuple(shape):
        raise ValueError(f"{name} must have shape {tuple(shape)}, got {tuple(tensor.shape)}")
    if tensor.device != device:
        raise ValueError(f"{name} must be on {device}, got {tensor.device}")
    if tensor.layout != torch.strided or not tensor.is_contiguous():
        raise ValueError(f"{name} must be a contiguous strided tensor")
    if tensor.is_conj() or tensor.is_neg():
        raise ValueError(f"{name} must not contain an unresolved conjugate/negative view bit")
    if tensor.requires_grad:
        raise ValueError(f"{name}.requires_grad must be False; this inference adapter has no backward")
    if tensor.numel() and tensor.data_ptr() % alignment:
        raise ValueError(f"{name} data pointer must be aligned to {alignment} bytes")


def _overlaps(left, right) -> bool:
    if not left.numel() or not right.numel():
        return False
    left_start, right_start = left.data_ptr(), right.data_ptr()
    left_end = left_start + left.numel() * left.element_size()
    right_end = right_start + right.numel() * right.element_size()
    return left_start < right_end and right_start < left_end


def m_grouped_int8_gemm_nt_contiguous(
    a, b, a_scale, b_scale, counts=None, *, out=None,
    plan: GroupedGemmPlan | None = None, tile_m: int = 0,
):
    """Compute prequantized W8A8 grouped GEMM asynchronously on the current stream.

    Required contiguous shapes/dtypes: A=INT8[M,K], B=INT8[G,N,K],
    a_scale=FP32[M], b_scale=FP32[G,N], out=FP32[M,N]. A/B/out pointers
    require 16-byte alignment; scales require 4-byte alignment. This is
    zero-point-zero, per-row activation / per-output-channel weight scaling.

    Supply ``counts`` or a prepared ``plan``. If both are supplied they must
    match exactly; an explicit nonzero tile_m must also match a supplied plan.
    This function returns ``out``. M=0 is a no-op requiring no native library.
    User inputs must already be ready on the current stream. The adapter waits
    for plan preparation and records all tensor lifetimes on the launch stream.
    """
    torch = _require_torch()
    if not isinstance(a, torch.Tensor) or not isinstance(b, torch.Tensor):
        raise TypeError("a and b must be torch.Tensor objects")
    if a.dtype != torch.int8 or b.dtype != torch.int8:
        raise TypeError("a and b must be signed INT8 tensors; float inputs are not supported")
    if a.ndim != 2 or b.ndim != 3:
        raise ValueError("a must have shape [M,K] and b must have shape [G,N,K]")
    if a.device.type != "cuda":
        raise ValueError("a must be on a MACA/mcPyTorch cuda-compatible GPU device")
    m, k = a.shape
    g, n, weight_k = b.shape
    if weight_k != k:
        raise ValueError("a.shape[1] and b.shape[2] must have the same K")
    tile_m = _as_index(tile_m, "tile_m")

    if plan is not None:
        if not isinstance(plan, GroupedGemmPlan):
            raise TypeError("plan must be constructed by prepare_grouped")
        if counts is not None and _normalize_counts(counts) != plan.counts:
            raise ValueError("counts conflicts with the prepared plan")
        if tile_m and tile_m != plan.tile_m:
            raise ValueError("tile_m conflicts with the prepared plan")
        metadata = _plan_metadata(plan.counts, plan.n, plan.k, plan.tile_m)
        if (metadata["m"], metadata["g"], plan.n, plan.k) != (m, g, n, k):
            raise ValueError("plan M/G/N/K does not match input tensor shapes")
        if plan.device != a.device:
            raise ValueError("plan device does not match a.device")
    else:
        if counts is None:
            raise ValueError("supply explicit CPU counts or a prepared plan")
        metadata = _plan_metadata(counts, n, k, tile_m)
        if metadata["m"] != m or metadata["g"] != g:
            raise ValueError("sum(counts) must equal M and len(counts) must equal G")

    _check_tensor(torch, a, "a", (m, k), torch.int8, a.device, 16)
    _check_tensor(torch, b, "b", (g, n, k), torch.int8, a.device, 16)
    _check_tensor(torch, a_scale, "a_scale", (m,), torch.float32, a.device)
    _check_tensor(torch, b_scale, "b_scale", (g, n), torch.float32, a.device)
    if out is not None:
        _check_tensor(torch, out, "out", (m, n), torch.float32, a.device, 16)
        if any(_overlaps(out, source) for source in (a, b, a_scale, b_scale)):
            raise ValueError("out must not overlap any input or scale tensor")

    with torch.cuda.device(a.device):
        if out is None:
            out = torch.empty((m, n), dtype=torch.float32, device=a.device)
        if m == 0:
            return out
        library = _load_native()
        if plan is None:
            plan = prepare_grouped(metadata["counts"], n, k, a.device, metadata["tile_m"])
        plan_tensors = (plan.seg_indptr, plan.weight_indices, plan.m_num_tiles_indptr)
        for name, tensor, shape in zip(
            ("plan.seg_indptr", "plan.weight_indices", "plan.m_num_tiles_indptr"),
            plan_tensors, ((g + 1,), (g,), (g + 1,)),
        ):
            _check_tensor(torch, tensor, name, shape, torch.int32, a.device)
            if _overlaps(out, tensor):
                raise ValueError("out must not overlap plan metadata")
        stream = torch.cuda.current_stream(a.device)
        stream.wait_event(plan._ready_event)
        # record_stream protects even short-lived plans/tensors after this
        # asynchronous launch and does not insert a device-wide synchronization.
        for tensor in (a, b, out, a_scale, b_scale, *plan_tensors):
            tensor.record_stream(stream)
        status = library.dg_maca_gemm(
            a.data_ptr(), b.data_ptr(), out.data_ptr(),
            a_scale.data_ptr(), b_scale.data_ptr(),
            *(tensor.data_ptr() for tensor in plan_tensors),
            g, m, n, k, plan.tile_m, stream.cuda_stream,
        )
        if status:
            error = library.dg_maca_last_error()
            detail = error.decode("utf-8", errors="replace") if error else "no native error detail"
            raise RuntimeError(f"MACA INT8 grouped GEMM failed (status {status}): {detail}")
    return out
