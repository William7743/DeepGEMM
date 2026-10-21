# C500 INT8 MMA small loop-unroll experiment

Physical full 64GB C500, sGPU disabled. Fixed blocks=6656, threads=512, accumulators=16, iterations=4096, four kernels/sample. Only the outer-loop compile-time unroll hint changes (1,2,4,8,16). Every kernel still executes exactly 4096 rounds; total MMA work and output semantics are unchanged. The accumulator loop remains fully unrolled.

Five samples/config/round, three independently shuffled rounds, 75 samples total. Each invocation performs >=2 seconds warmup and validates full final output after every sampled batch. All passed. Timing excludes allocation, H2D/D2H copies and CPU validation; Event times are batch durations divided by four.

| Outer unroll | Mean ms/kernel | Event TOPS | Wall TOPS | Gain vs 1 % | Registers | Local bytes | Sample range/median % |
|---|---|---|---|---|---|---|---|
|1|59.995293681|476.492414|476.381805|0.000000|100|0|0.020697|
|2|59.924394989|477.056169|476.966560|0.118314|100|0|0.013566|
|4|59.921702067|477.077609|476.964865|0.122813|100|0|0.028088|
|8|59.929676310|477.014129|476.907996|0.109491|100|0|0.037703|
|16|59.923451487|477.063681|476.928427|0.119890|100|0|0.027132|

Conclusion: reducing loop-control frequency changes observed throughput by only about 0.1% here. Counts 2..16 are effectively on the same plateau; the small differences do not establish a universally optimal factor. Unroll=4 has the highest mean in this test, not a pure-instruction peak. Unrolling can also alter compiler scheduling and code layout, so this gain cannot be assigned exclusively to loop-counter/branch cost. There is no evidence that loop control is a major bottleneck at this configuration. Full unrolling thousands of rounds is not performed or implied.

Compiler verification: for the 16-accumulator kernel, optimized LLVM IR main-loop blocks contain respectively 16,32,64,128,256 MMA intrinsic calls. Compiler-generated tail handling remains. Runtime correctness smoke tests with iterations=1,17,4097 passed for every factor, including values not divisible by the factor. The extracted kernel IR and audit are preserved. Native ISA was not disassembled. All factors report registers=100, local bytes=0. No profiler or compiler ran concurrently with performance timing.

Build examples (default remains factor 1):

    bash build.sh
    MMA_PEAK_UNROLL=4 bash build.sh
    ./build/int8_mma_peak --sustain 6656 512 16 4096 5 4 reports/new_u4.csv

Each build writes build/int8_mma_peak. During this experiment, each executable was copied to build/int8_mma_peak_uN before building the next one; the ordinary executable is restored to u1 after testing. Startup logs print the compiled factor. Invalid factors are rejected; the parameter is a build-time choice, not a runtime CLI value.

Historical reports are unchanged. Raw data, protocol/order, source/build snapshots, hashes, telemetry, extracted LLVM IR, tail-test logs and reproducibility scripts are preserved. Use a NEW small_unroll_ report directory for reproductions; the scripts select the latest matching directory and sample files are opened exclusively. Compile all binaries and run audits before timing; never compile during a measurement window.
