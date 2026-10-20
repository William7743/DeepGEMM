#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "$0")"
export MACA_PATH="${MACA_PATH:-/opt/maca}"
export LIBRARY_PATH="/opt/mxdriver/lib:${LIBRARY_PATH:-}"
export LD_LIBRARY_PATH="$MACA_PATH/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}"
if [[ "$#" != 0 ]]; then
    echo "Usage: bash build.sh" >&2
    exit 1
fi
mkdir -p build
"$MACA_PATH/mxgpu_llvm/bin/mxcc" \
    -O2 -std=c++17 -x maca -offload-arch=xcore1000 \
    -I"$MACA_PATH/include" -I"$MACA_PATH/include/mcr" \
    gemm.cpp -L"$MACA_PATH/lib" -lmcruntime \
    -Wl,-rpath,"$MACA_PATH/lib:/opt/mxdriver/lib" \
    -o build/gemm
echo "Built: $PWD/build/gemm"
