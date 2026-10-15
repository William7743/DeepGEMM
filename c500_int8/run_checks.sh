#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "$0")"
source ./env.sh
mkdir -p reports
bash build.sh
python3 tests/test_grouped.py --cpu-only --json reports/cpu_checks.json
python3 tests/test_masked.py --cpu-only --json reports/masked_cpu_checks.json
python3 tools/diagnose.py --output reports/environment.json
# A missing GPU is SKIP (exit 77), never a successful correctness run.
python3 tests/test_grouped.py --json reports/correctness.json
python3 tests/test_masked.py --json reports/masked_correctness.json
python3 benchmarks/bench_grouped.py --output reports/benchmark.json
python3 benchmarks/bench_grouped.py --layout masked --output reports/masked_benchmark.json
