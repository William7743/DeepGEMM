#!/usr/bin/env bash
# source env.sh before running mcPyTorch programs.
export MACA_PATH="${MACA_PATH:-/opt/maca}"
export MACA_CLANG_PATH="${MACA_CLANG_PATH:-$MACA_PATH/mxgpu_llvm/bin}"
export LD_LIBRARY_PATH="$MACA_PATH/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}"
export LIBRARY_PATH="/opt/mxdriver/lib:${LIBRARY_PATH:-}"
export PATH="/opt/conda/bin:$MACA_CLANG_PATH:$MACA_PATH/bin:$PATH"
