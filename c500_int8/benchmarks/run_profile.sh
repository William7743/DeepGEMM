#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "$0")/.."
export LD_LIBRARY_PATH="/opt/maca/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}"
export MACA_PATH="${MACA_PATH:-/opt/maca}"
profiler="${MCPROFILER:-/opt/mcProfiler-ubuntu18.04/mcProfiler}"
shape="${1:-0}"
tile="${2:-128}"
destination="${3:-$PWD/reports/profile_shape${shape}_tile${tile}}"
repeats="${4:-1}"
# --custom scopes collection to mcProfilerStart/Stop in profile_grouped.py.
# Leaf metric names are taken from this installed profiler's show_metrics.
timeout 180s "$profiler" perf_exec \
  --cmdline "env LD_PRELOAD=/opt/maca/lib/libmcToolsExt.so /opt/conda/bin/python3 benchmarks/profile_grouped.py --shape $shape --tile $tile --repeat $repeats" \
  --cwd "$PWD" --casename "int8_shape${shape}_tile${tile}" \
  --custom --counts 1 \
  --metrics 'AP MMA Duty ratio' 'L2C Duty ratio' 'Global Memory Read bytes' \
            'Global Memory Write bytes' 'Achieved waves' 'Total Cycles' 'AP busy Duty' \
  --output "$destination"
