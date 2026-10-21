#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "$0")"

if [[ "$#" != 0 ]]; then
    echo "Usage: bash build.sh" >&2
    exit 1
fi
if [[ ! -s int8_mma_peak.cpp ]]; then
    echo "int8_mma_peak.cpp is missing or empty; implement the benchmark before building." >&2
    exit 1
fi

export MACA_PATH="${MACA_PATH:-/opt/maca}"
export LIBRARY_PATH="/opt/mxdriver/lib:${LIBRARY_PATH:-}"
export LD_LIBRARY_PATH="$MACA_PATH/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}"
compiler="$MACA_PATH/mxgpu_llvm/bin/mxcc"
if [[ ! -x "$compiler" ]]; then
    echo "MACA compiler not found: $compiler; set MACA_PATH to the installed SDK." >&2
    exit 1
fi

mkdir -p build
unroll="${MMA_PEAK_UNROLL:-1}"
case "$unroll" in
    1|2|4|8|16|32|64|128|256) ;;
    *) echo "MMA_PEAK_UNROLL must be 1, 2, 4, 8, 16, 32, 64, 128, or 256" >&2; exit 1 ;;
esac
"$compiler" \
    -O3 -std=c++17 -x maca -offload-arch=xcore1000 \
    -DMMA_PEAK_UNROLL="$unroll" \
    -I"$MACA_PATH/include" -I"$MACA_PATH/include/mcr" \
    int8_mma_peak.cpp -L"$MACA_PATH/lib" -lmcruntime \
    -Wl,-rpath,"$MACA_PATH/lib:/opt/mxdriver/lib" \
    -o build/int8_mma_peak

echo "Built: $PWD/build/int8_mma_peak"
echo "MMA loop unroll factor: $unroll"
echo "Run: ./build/int8_mma_peak"
