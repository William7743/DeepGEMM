# C500 INT8 MMA iteration-slope auxiliary analysis

Existing kernel and binary were reused without source changes. Historical reports are unchanged.

Configuration: blocks=26624, threads=512, accumulators=8, batch=2 kernels/sample; 5 samples/point/round, 3 rounds, shuffled point order. Each invocation performs >=2 seconds warmup and validates every sampled batch final output. 75/75 samples passed. Raw batch times are divided by 2 for per-kernel analysis.

| Iterations | Mean Event ms/kernel | Full-kernel TOPS |
|---|---|---|
|1000|29.540599442|472.524051|
|2000|58.712652588|475.490140|
|4000|117.069336955|476.935945|
|6000|175.374394735|477.560378|
|8000|233.799824015|477.627176|

OLS model T(L)=alpha+beta*L, on five point means: alpha=0.356471119 ms, beta=0.029176878673 ms/iteration; R2=0.999999900854. Max point-mean residual=0.043348424 ms.

Slope-equivalent throughput: 478.414565 TOPS (Event), 478.410734 TOPS (wall). 4000/8000 difference: 478.320414 TOPS.

Per-round Event slope TOPS: 478.299490, 478.246315, 478.698144.

Adjacent-interval Event slope TOPS: 478.493702, 478.390569, 478.814163, 477.827682.

Interpretation: slope approximately removes iteration-independent overhead; it still includes per-iteration loop increment/compare/branch and scheduling effects. Alpha is an empirical intercept, not a direct measurement of loads or stores. Large R2 alone does not establish pure instruction timing. Neither control-only subtraction nor instruction-only timing was performed. Separate native-ISA verification and controlled unrolling would be needed to investigate loop-control impact.

Limitations: no continuous clock/thermal telemetry in this auxiliary run; pre/post mx-smi snapshots only. Variability and changing scheduling may affect differences. All intermediate kernels overwrite C; correctness checks cover final output of each batch. Full-kernel throughput remains primary; previous ~477 TOPS sustained report is not replaced.

Reproduction: run rerun.py on the same server with the benchmark binary installed at its recorded path, then analyze.py. These scripts generate new reports and do not overwrite this report.
