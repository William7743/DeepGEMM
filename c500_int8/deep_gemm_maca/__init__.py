"""Experimental MACA C500 INT8 W8A8 grouped GEMM adapter.

This API uses explicit CPU expert ``counts``. It is not the upstream DeepGEMM
FP8 API and does not accept upstream ``grouped_layout`` tensors.
"""

from .api import (
    GroupedGemmPlan,
    m_grouped_int8_gemm_nt_contiguous,
    prepare_grouped,
)

__all__ = [
    "GroupedGemmPlan",
    "m_grouped_int8_gemm_nt_contiguous",
    "prepare_grouped",
]
