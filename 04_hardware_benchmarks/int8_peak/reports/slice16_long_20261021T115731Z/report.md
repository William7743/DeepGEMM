# C500 16GB slice long-duration INT8 MMA validation

Instance: 25% compute / 16000 MiB sGPU allocation on physical 64GB C500. This is not a physically 16GB C500. User explicitly confirmed other own GPU jobs and background sync were paused; nsa_coord.py exclusive GPU lock held. The physical card had other activity before measurement despite this slice being idle, so other slices/tenants are not controlled.

Configuration matches the historical full-card long run: 26624 blocks, 512 threads/block, 8 independent accumulators, 4096 iterations, unroll=1, 256 kernels/sample, three samples. Each kernel resets accumulators. At least 2 seconds warmup and checked preflight precede timing. Full final output of every sampled batch is checked; identical intermediate outputs are overwritten. No copies, allocations or CPU checks inside either timer.

| Sample | Event batch ms | CPU wall batch ms | Event TOPS | Wall TOPS | Correct |
|---|---|---|---|---|---|
|1|30739.103515625|30739.505672000|476.158935|476.152705|PASS|
|2|30738.654296875|30739.273890000|476.165894|476.156296|PASS|
|3|30735.175781250|30735.817176000|476.219785|476.209847|PASS|

Mean Event=30737.644531250 ms/batch; mean wall=30738.198912667 ms/batch. Throughput from mean durations: Event **476.181536 TOPS**, wall **476.172948 TOPS**. Event range/median=0.012778%. Three segments provide about 92.21 seconds of GPU Event time, with validation gaps between.

| Historical full 64GB reference | Current 16GB slice |
|---|---|
|477.047168 Event TOPS|476.181536 Event TOPS|
|477.039410 wall TOPS|476.172948 wall TOPS|

The slice and full-card results are close for this register-resident dense MMA benchmark. Wall timing independently agrees, so Event-only timing does not explain this new result. This does not establish how the platform enforces its advertised 25% compute allocation, guarantee the same behavior for other workloads/time windows, or justify multiplying the result by four. This is a historical comparison, not simultaneous paired testing of the same physical card.

No source or original executable on this server was overwritten. A new executable was compiled from source_snapshot.cpp; build command, source hash, raw logs/CSV and one-second clock/temperature/power snapshots are preserved. No profiler ran during timing. The physical clock telemetry describes the card, not exclusively this slice. Neither clocks nor power policy were modified. Native ISA was not disassembled.

Telemetry summary: {"samples": 99, "core_mhz_min": 1125.0, "core_mhz_max": 1125.0, "max_temperature_c": 63.25, "max_board_power_w": 283.483}

Reproduction requires a NEW slice16_long_ report directory with source_snapshot.cpp and a rebuilt build/int8_mma_peak_long_u1. runner.py selects the latest matching directory and refuses existing sample files. Follow server coordination and confirm quiet conditions again before running.
