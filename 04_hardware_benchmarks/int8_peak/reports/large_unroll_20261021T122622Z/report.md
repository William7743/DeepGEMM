# C500 INT8 MMA larger outer-loop unrolling

Full 64GB C500, sGPU disabled. Existing historical results are untouched. Factors 1 and 16 were remeasured as explicitly requested same-round controls for 32,64,128,256; these new samples do not replace any fixed historical baseline.

Fixed blocks=6656, threads/block=512, independent accumulators=16, total iterations=4096. Four kernels/sample; three shuffled rounds, five samples/factor/round. Total 90 measured samples, all exact output checks passed. Every invocation has >=2 seconds warmup and preflight checking; each sample checks the last kernel full output outside timing. Identical intermediate kernel outputs are overwritten. OPS/kernel=6656*8*16*4096*8192 for every factor. Event times below are raw batch times divided by four; throughput is OPS divided by mean per-kernel time.

| Unroll | Outer groups | Mean ms/kernel | Event TOPS | Wall TOPS | Gain vs 16 % | Registers | Local bytes | Sample range/median % |
|---|---|---|---|---|---|---|---|---|
|1|4096|59.990254974|476.532436|476.449565|-0.116827|100|0|0.023897|
|16|256|59.920170339|477.089804|477.000197|+0.000000|100|0|0.028306|
|32|128|59.928323873|477.024894|476.941090|-0.013605|100|0|0.022852|
|64|64|60.019899495|476.297071|476.213598|-0.166160|100|0|0.028042|
|128|32|60.336857605|473.795014|473.715992|-0.690602|100|0|1.115848|
|256|16|60.765759532|470.450835|470.367109|-1.391555|100|0|1.443681|

No throughput benefit appeared above factor 16 in this configuration. Factors 128 and 256 were slower in every round mean; factor 256 was about 1.39% below factor 16. Large-factor sample variation is also higher, so raw samples and per-round values are preserved rather than relying only on a winner. This is a fixed-configuration experiment, not an exhaustive global optimum proof.

All versions report registers=100 and local bytes=0. Thus this experiment does not show local-memory spilling as the cause. Larger code and different instruction scheduling may affect performance, but no native ISA disassembly or hardware instruction-cache/stall profiling was performed, so the slowdown is not attributed to a proven mechanism. Full unrolling of all 4096 rounds was not performed.

| Unroll | Main-loop MMA intrinsic calls for accumulator count 16 | Extracted kernel IR text bytes | Complete executable bytes | Build seconds |
|---|---|---|---|---|
|1|16|33913|803120|12.344|
|16|256|72192|1003824|12.906|
|32|512|101344|1188144|13.416|
|64|1024|160016|1573168|14.619|
|128|2048|278680|2359600|17.543|
|256|4096|515992|3936560|25.578|

IR text size is not native machine-code size. Complete executable size includes host code and all compiled accumulator variants, not just the selected kernel. The optimized LLVM IR confirms the requested main-loop unroll counts; main/tail blocks have no loads or stores. Tail smoke tests at iterations=17,257,4097 passed for every factor, including non-divisible lengths.

All builds, IR audits and smoke tests completed before performance timing. No compiler or profiler ran during timing. One-second clock/temperature/power telemetry is included. Source and build snapshots, binary hashes, build durations, audit extracts, raw CSV/logs and scripts are preserved. The default build and ordinary executable are restored to factor 1; the new larger factors are optional.

Reproduce each factor before timing:

    MMA_PEAK_UNROLL=64 bash build.sh
    cp build/int8_mma_peak build/int8_mma_peak_large_u64

Build all requested factors first, run audit.py, then runner.py. These scripts select the latest large_unroll_ directory, so create a NEW directory and its build metadata/snapshots before rerunning; do not overwrite this completed report. Sample files are opened exclusively.
