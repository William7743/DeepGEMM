# mcTracer observation of the INT8 MMA benchmark

Captured on the 16GB /25% sGPU instance using installed mcTracer 3.7.1.5. The full-card image did not have this tracer available. Coordination profile lock held; standalone trace run, not concurrent with peak timing. Command and original output preserved. This is diagnostic sampling, not a new peak report. The target performs one warmup then three measured kernels and checks outputs; all output validation passed.

Configuration: blocks=6656, threads=512, accumulators=16, iterations=4096, outer unroll=1. Four matching kernel events captured: first warmup, remaining three measured. Trace durations use nanoseconds (verified against timestamp scale and approximately 60ms Event measurements).

| Measured sample | Trace kernel ms | Event interval ms under tracer |
|---|---|---|
|1|60.168704000|60.265983582|
|2|60.075008000|73.078781128|
|3|60.145664000|60.244735718|

Mean trace kernel duration=60.129792000 ms. Logical wave-level MMA calls per kernel=3489660928. Rate derived from this known count=58.035473 billion logical MMA/s. Each 16x16x16 operation performs 4096 MAC=8192 OPS, so the equivalent kernel-wide dense INT8 rate is **475.426596 TOPS**. Do not multiply by 64 lanes again.

mcTracer provides kernel duration/timeline and launch/resource metadata here; it does not report the number of executed MMA instructions, their individual duration, or native instruction issue throughput. The count used above comes from source plus prior compiler IR/correctness checks. A builtin is not automatically equivalent to exactly one native ISA instruction; native disassembly has not been performed. The result includes operand loading, loop control and output stores.

Logical MMA/s and INT8 OPS/s are different units convertible for a fixed MMA shape. General INT8 throughput is broader: scalar/vector INT8 operations, other matrix shapes, and end-to-end GEMM/MoE throughput are not interchangeable. mcProfiler hardware counters (if supported) are appropriate for MMA activity/stalls; their exact counting semantics must be checked before converting into instruction rates.

One Event interval is much longer than its corresponding kernel trace event. These intervals have different scope; the extra interval must not be interpreted as MMA instruction cost. Tracer overhead/submission gaps are possible contributors but were not causally isolated. Do not replace prior uninstrumented sustained timing with this diagnostic result. The resource occupancy field in the raw trace is an estimate, not measured achieved occupancy.

The original multi-megabyte trace JSON is stored in raw_records.zip to avoid duplicating it as repository text. mma_events.json contains the four relevant events. summary.json records original trace hash and binary hash.
