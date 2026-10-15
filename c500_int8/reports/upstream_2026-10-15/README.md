# DeepGEMM 上游尺寸：C500 INT8 测试与性能分析

测试日期：2026-10-15（Asia/Shanghai）。原生实现对应分支提交 `82f697b`，本次新增 shape 清单、图计时和 profiling 工具，没有修改 kernel。

## 测试来源与覆盖

- 维度来自上游 `1fc9c66975ee322d628b3288534ca0e9ce12a64d` 的 `tests/generators.py:194-226`：8 组 contiguous、16 组 masked。它们是上游生成的测试尺寸，不是实际模型运行采集的路由分布。
- `(G, expected_M)`：contiguous 为 `(4,8192)`、`(8,4096)`；masked 为 `(32,192)`、`(6,1024)`、`(32,20)`、`(6,20)`。
- 每组搭配 `(N,K)` 为 `(6144,7168)`、`(7168,3072)`、`(4096,4096)`、`(4096,2048)`。
- 每专家有效行数遵循上游 `int(expected_M * uniform(0.7,1.3))` 规则，但使用独立固定种子 20261015；精确 counts 已保存到 `../../benchmarks/upstream_shapes.json`。contiguous 使用紧密排列的有效行，不复制上游 padding 布局。masked 保持上游每专家容量 4096 行。
- 每组测试 auto、16、32、64、128，共 120 个计时组合；auto 会与某个显式 tile 重复，不能算成第五种原生 kernel。
- 全部完成；计时前 CPU INT64 点积/FP64 scale 抽样检查共 15,840 次通过，非近零最大相对误差约 `1.05e-7`。同一 shape 的多个 tile 重复检查相同采样位置。这不是所有大矩阵元素的完整比较，也不是模型量化精度测试。

## 环境与计时口径

设备为 C500 sGPU，显存配额 16000 MiB；运行时和 PyTorch 版本见 `graph_benchmark.json`。实例登记计算配额 25%，但本次实际查询调度模式为 **best effort**、时间片 10 ms（见 `scheduler.txt`）。不能把它理解成只有四分之一计算单元，更不能把结果乘四外推整卡；也不能保证与独占整卡的结果相同。

预热 5 次，捕获每图 10 个相同缓冲区的 GEMM，再预热图重放 5 次，测量 20 次重放。GPU event 总时间除以 10，报告中位数。包含 INT8 GEMM、融合 FP32 缩放写回与图调度；不包含分配、量化、路由、传输、plan 准备和正确性检查。这是同缓冲区的热缓存稳态结果，不是完整 MoE 或冷缓存延迟。

`TOPS = 2 * sum(valid_counts) * N * K / seconds / 1e12`，不把 masked padding 算成有效工作量。与之前三组小 shape 的 eager 结果同时存在 shape 和计时方式差异，不能直接拿两者相除当成优化加速比。

复现（在 `c500_int8` 中）：

```bash
python3 benchmarks/upstream_shapes.py
python3 benchmarks/bench_grouped.py --shapes benchmarks/upstream_shapes.json \
  --max-mib 7000 --timing graph --graph-batch 10 --warmup 5 --repeat 20 \
  --json reports/upstream_graph.json
```

## 已证实的调参空间

连续大 M 的 8 组均以 tile 128 最快。masked 的最佳 tile 随 shape 改变：小 M=20 的 8 组均为 tile 32；中大 M 的多数情况为 tile 64。

例如 `masked_g6_m1024_n4096_k2048`，改用手动 tile 64 相比本轮 auto/tile 128 的中位耗时有约 **1.74 倍**加速。这是同一轮、同输入、同计时方式的配置比较，尚未修改默认选择策略，也未保证所有模型的路由分布都有相同收益。优先将 masked 和 contiguous 的 tile 选择分开调优，并用独立运行验证稳定性。

`summary.json` 的 `ideal_bytes` 只按有效 A、B、输出和 scale 各访问一次估算；`ideal_intensity_ops_byte` 和 `ideal_effective_gbps` 是分析用的理想模型。它们不含重复读取、缓存命中、事务放大，**不是实际 HBM 流量或带宽利用率**。因此本报告不宣布达到项目 90% 带宽指标，也没有 A100 同条件基线可判定 70% 性能目标。

## 性能工具的实测证据

服务器安装的 `mcProfiler 3.8.1.4`、`mcTracer 3.7.1.5` 均已实际运行成功。性能分析与上面的 benchmark 分开执行，避免同时争用 GPU。profile 使用相同 shape/counts/tile，固定种子的随机 INT8 输入和单位 scale，初始化与 CPU 抽样检查在 `mcProfilerStart/Stop` 区间外。

以下来自各目录的 **`1_period0.txt`**，即指定 profiling 区间。工具另有全进程统计，其中包含初始化和 CPU 等待，不能替代这里的区间数据。短 kernel 的单次区间容易受到采集边界和主机提交间隙影响，所以小 M 又采集了连续 20 次调用。

| 采集对象 | 区间内 GEMM 次数 | AP busy duty | MMA duty（相对 AP active） | L2C duty（相对 L2C active） |
|---|---:|---:|---:|---:|
| contiguous：G=4，预期 M=8192，N=6144，K=7168，tile=128 | 1 | 79.54% | 64.64% | 44.45% |
| masked：G=32，预期 M=20，N=6144，K=7168，tile=32 | 1 | 27.69% | 20.23% | 20.75% |
| 同一个 masked 用例，重复采集 | 20 | 86.95% | 20.01% | 33.61% |

这些百分比的分母不同，不能相互相减，也不能当作理论 TOPS 利用率或 HBM 带宽百分比。`Global Memory Read bytes` 等指标也不能未经定义核验就当作 HBM 总线流量；缓存层级和重复请求可能影响其含义。原始 counter JSON 和导出的区间数据均已保存。

`mcTracer` 的 masked 用例有 3 次预热和 3 次正式 kernel：正式 kernel 耗时为 955.648、950.784、956.416 微秒，中位数 **955.648 微秒**，与 benchmark 的 **954.509 微秒** 接近。它显示 grid=(1,48,32)、block=(256,1,1)、每线程 **198 个寄存器**、每 block **24 KiB 静态共享内存**、无 private memory。资源估算的寄存器 occupancy 为 38%、共享内存 occupancy 为 37%；这不是实测 achieved occupancy。原始 trace 在 `trace_small/`，摘要为 `trace_small_summary.json`。

### 对瓶颈的判断与下一步

1. **小 token 场景偏向访存与延迟隐藏问题，这是证据支持的倾向判断。** 8 组小 M 的理想算术强度仅约 33～39 ops/byte，权重读取占主要数据量；重复区间内 AP 很忙但 MMA duty 仅约 20%。优先检查权重访问、缓存行为、寄存器压力与流水线深度，验证能否提高并发、隐藏访存延迟。当前证据不足以宣布 HBM 饱和或达到 90% 带宽。
2. **大 M 场景更偏计算侧和流水线效率。** 连续布局的理想算术强度约 814～2393 ops/byte；代表用例的 MMA duty 明显高于小 M。可围绕 tile N/K、warp 形状、流水线级数、数据复用及访存计算重叠做定向实验。64.64% 的 duty 不等于还有固定 35.36% 的性能可提升。
3. **已确认可利用的收益是按 shape 选择 tile。** 本轮 masked 最多约 1.74 倍的配置差异已经实测，优先级高于凭推测改写整个 kernel。后续应独立重复计时，再决定是否更新默认策略。
4. 严格的 roofline 判断还需要本实例同状态下的可持续带宽/计算上限，以及适用的实际内存流量、cache hit、stall 等计数器；目前不把工具的 duty 或理想字节模型包装成完整 roofline 结论。

复现分析（不要和 benchmark 同时运行）：

```bash
bash benchmarks/run_profile.sh 0 128 "$PWD/reports/profile_large" 1
bash benchmarks/run_profile.sh 16 32 "$PWD/reports/profile_small" 1
bash benchmarks/run_profile.sh 16 32 "$PWD/reports/profile_small_batch20" 20
# 此版本 mcTracer 的 --odname 使用相对于当前目录的路径。
/opt/maca/bin/mcTracer --odname reports/trace_small --name int8_small \
  /opt/conda/bin/python3 benchmarks/profile_grouped.py --shape 16 --tile 32 --repeat 3
```

工具说明可参考[沐曦性能分析工具文档目录](https://developer.metax-tech.com/doc?category_ids=61)。本报告的数值来自实际保存的工具输出，未使用文档中的示例数据。

## 每个上游尺寸的最佳实测配置

| Layout | G | Expected M/expert | N | K | Tile M | Median us | INT8 TOPS |
|---|---:|---:|---:|---:|---:|---:|---:|
| contiguous | 4 | 8192 | 6144 | 7168 | 128 | 10749.44 | 285.14 |
| contiguous | 4 | 8192 | 7168 | 3072 | 128 | 5031.67 | 269.49 |
| contiguous | 4 | 8192 | 4096 | 4096 | 128 | 4350.71 | 277.72 |
| contiguous | 4 | 8192 | 4096 | 2048 | 128 | 2606.20 | 251.07 |
| contiguous | 8 | 4096 | 6144 | 7168 | 128 | 9993.60 | 276.55 |
| contiguous | 8 | 4096 | 7168 | 3072 | 128 | 5893.12 | 263.67 |
| contiguous | 8 | 4096 | 4096 | 4096 | 128 | 3791.72 | 286.37 |
| contiguous | 8 | 4096 | 4096 | 2048 | 128 | 2122.12 | 244.99 |
| masked | 32 | 192 | 6144 | 7168 | 128 | 3247.88 | 172.94 |
| masked | 32 | 192 | 7168 | 3072 | 64 | 1493.91 | 175.67 |
| masked | 32 | 192 | 4096 | 4096 | 64 | 1240.12 | 169.70 |
| masked | 32 | 192 | 4096 | 2048 | 64 | 616.84 | 153.05 |
| masked | 6 | 1024 | 6144 | 7168 | 64 | 3190.11 | 180.74 |
| masked | 6 | 1024 | 7168 | 3072 | 64 | 1588.04 | 173.30 |
| masked | 6 | 1024 | 4096 | 4096 | 64 | 1071.83 | 188.37 |
| masked | 6 | 1024 | 4096 | 2048 | 64 | 786.18 | 155.63 |
| masked | 32 | 20 | 6144 | 7168 | 32 | 954.51 | 57.86 |
| masked | 32 | 20 | 7168 | 3072 | 32 | 497.60 | 55.40 |
| masked | 32 | 20 | 4096 | 4096 | 32 | 366.55 | 56.39 |
| masked | 32 | 20 | 4096 | 2048 | 32 | 195.16 | 51.41 |
| masked | 6 | 20 | 6144 | 7168 | 32 | 189.25 | 50.27 |
| masked | 6 | 20 | 7168 | 3072 | 32 | 109.08 | 47.24 |
| masked | 6 | 20 | 4096 | 4096 | 32 | 76.08 | 51.16 |
| masked | 6 | 20 | 4096 | 2048 | 32 | 43.39 | 39.82 |
