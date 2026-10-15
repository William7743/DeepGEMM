#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "$0")"
export MACA_PATH="${MACA_PATH:-/opt/maca}"
export MACA_CLANG_PATH="${MACA_CLANG_PATH:-$MACA_PATH/mxgpu_llvm/bin}"
export LD_LIBRARY_PATH="$MACA_PATH/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}"
export LIBRARY_PATH="/opt/mxdriver/lib:${LIBRARY_PATH:-}"
compiler="${MXCC:-$MACA_CLANG_PATH/mxcc}"
"$compiler" -O3 -std=c++17 -x maca -offload-arch=xcore1000 -fPIC -shared \
  -I"$MACA_PATH/include" -I"$MACA_PATH/include/mcr" \
  native/grouped_int8.cpp -L"$MACA_PATH/lib" -lmcruntime \
  -Wl,-rpath,"$MACA_PATH/lib" -o native/libdeep_gemm_maca.so
echo "Built native/libdeep_gemm_maca.so"
