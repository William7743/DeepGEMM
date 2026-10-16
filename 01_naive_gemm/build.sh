#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "$0")"

export MACA_PATH="${MACA_PATH:-/opt/maca}"
export LIBRARY_PATH="/opt/mxdriver/lib:${LIBRARY_PATH:-}"
export LD_LIBRARY_PATH="$MACA_PATH/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}"

extra_flags=()
output=naive_gemm.out
if [[ "$#" == 1 && "$1" == --shared ]]; then
  extra_flags=(-fPIC -shared -DMOE_GEMM_LIBRARY)
  output=libmoe_int8.so
elif [[ "$#" != 0 ]]; then
  echo "Usage: bash build.sh [--shared]" >&2
  exit 1
fi

"$MACA_PATH/mxgpu_llvm/bin/mxcc" "${extra_flags[@]}" \
  -O2 -std=c++17 -x maca -offload-arch=xcore1000 \
  -I"$MACA_PATH/include" -I"$MACA_PATH/include/mcr" \
  naive_gemm.cpp -L"$MACA_PATH/lib" -lmcruntime \
  -Wl,-rpath,"$MACA_PATH/lib:/opt/mxdriver/lib" \
  -o "$output"

echo "Built: $PWD/$output"
