"""Experimental MACA C500 INT8 W8A8 grouped GEMM adapter.

The contiguous API uses explicit CPU expert ``counts``; the masked API takes
GPU prefix lengths. These are INT8 APIs, with a different scale contract from
upstream FP8, and do not accept upstream ``grouped_layout`` tensors.
"""

from .api import (
    GroupedGemmPlan,
    m_grouped_int8_gemm_nt_contiguous,
    prepare_grouped,
)
from .masked import m_grouped_int8_gemm_nt_masked

__all__ = [
    "GroupedGemmPlan",
    "m_grouped_int8_gemm_nt_contiguous",
    "m_grouped_int8_gemm_nt_masked",
    "prepare_grouped",
]
