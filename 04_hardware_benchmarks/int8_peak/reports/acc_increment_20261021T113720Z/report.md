# C500 INT8 MMA accumulator counts 16 through 32

Fixed configuration: 6656 blocks, 512 threads/block, 4096 iterations, two kernels/sample. Only accumulator count changes. Three rounds: ascending, descending, then seeded shuffle. Three measured samples per count per round (9/count, 153 total); each invocation performs >=2 seconds warmup and full preflight validation. Every measured batch final output passed exact validation. All operation counts independently checked. Allocation, input/output transfer and validation are outside timing.

Throughput = actual per-kernel OPS / mean per-kernel Event time, where OPS=6656*8*accumulators*4096*8192. Increasing count increases work; raw latency alone is not a speed comparison.

| Accumulators | Mean ms/kernel | Event TOPS | Wall TOPS | Registers | Local bytes | Max active blocks/AP | Sample range/median % |
|---|---|---|---|---|---|---|---|
|16|60.002489|476.435272|476.261732|100|0|2|0.046508|
|17|63.715527|476.712819|476.556222|106|0|2|0.050227|
|18|67.493091|476.503810|476.369332|112|0|2|0.007969|
|19|71.234817|476.556593|476.424374|118|0|2|0.016537|
|20|74.914461|476.999066|476.835952|124|0|2|0.023750|
|21|78.758571|476.403187|476.265626|130|0|1|0.022436|
|22|82.840903|474.494351|474.269760|136|0|1|0.013750|
|23|86.372223|475.780821|475.604044|142|0|1|0.015405|
|24|90.007395|476.415891|476.254924|148|0|1|0.010807|
|25|94.035696|475.007488|474.835825|154|0|1|0.027092|
|26|97.586503|476.032698|475.913389|160|0|1|0.022032|
|27|101.227619|476.560382|476.429035|166|0|1|0.020734|
|28|111.492508|448.709783|448.619713|172|0|1|0.013317|
|29|115.102621|450.159040|450.075460|178|0|1|0.008451|
|30|118.703942|451.553595|451.463089|184|0|1|0.003664|
|31|122.870301|450.783450|450.708328|190|0|1|0.009482|
|32|126.490396|452.007475|451.932195|196|0|1|0.010218|

Highest observed mean in this fixed-configuration range: 20 accumulators, 476.999066 Event TOPS, 0.118336% over 16. This is a small gain, not a global optimum or replacement for the earlier long-run peak report. Counts 16..27 are near the existing throughput plateau; 27 to 28 decreases by -5.844086%.

Registers increase from 100 to 196; local bytes remain zero throughout, so no local-memory spilling is reported. The SDK occupancy API returns a maximum of 2 blocks/AP for 16..20 and 1 for 21..32, at 512 threads/block. This is a modeled resource limit, not measured achieved occupancy. Throughput remains high at 21 despite the drop. The 28-count cliff has no further change in this occupancy limit; occupancy alone does not explain it. Instruction scheduling, register allocation/banks, or instruction-fetch effects are hypotheses requiring profiling/native ISA analysis; none is established by this test.

Optimized device LLVM IR retains exactly N MMA intrinsic calls for each N=16..32 instance. This is not native ISA disassembly. Compiler audit and full IR are included. Occupancy probe and IR compilation were run after timing, not concurrently. Runtime core clock was not continuously sampled; telemetry.jsonl contains one-second mx-smi board snapshots, not a guarantee of fixed execution frequency.

All historical reports are unchanged. The default scan ranges are unchanged; extended counts are available through single-configuration and --sustain calls. Example:

    ./build/int8_mma_peak --sustain 6656 512 20 4096 3 2 reports/new_a20.csv

The kernel arithmetic and timing interval are unchanged; validation/static_assert and host template dispatch were expanded, and a timing-external resource print was added. Source snapshot/hash, raw CSV/logs, fixed-seed order, summary, resource probe and scripts are included. Create a NEW report directory with prefix acc_increment_ before using rerun.py; it selects the most recent matching directory and must not overwrite this completed report. Existing CSV files are rejected. analyze.py and audit.py also select the latest matching directory.
