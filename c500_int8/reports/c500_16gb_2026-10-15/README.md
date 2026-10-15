# C500 16 GB 实测记录：2026-10-15

本目录保存原生 INT8 W8A8 grouped GEMM 后端的实测结果。设备为 C500 sGPU，显存配额 16000 MiB、计算配额 25%。这些数据用于记录功能验证与合成 shape 计时，不代表独享整卡、完整 MoE 或项目验收结果。

- `correctness.json`：69 项检查 PASS，包含 26 项 CPU metadata 检查；11 个数值场景的非近零最大逐元素相对误差约为 `1.11e-7`。oracle 使用相同 INT8 输入、CPU INT64 累加和 FP64 scale；容差为 `abs(error) <= 1e-6 + 1e-3*abs(reference)`。
- `benchmark.json`：3 个 synthetic shape × 5 个 tile 请求配置，共 15 个组合；每组合预热 3 次、计时 10 次。`tile=0` 表示自动选择，可能与某个显式 tile 重复。PASS 表示采样正确性和计时成功，不是性能门槛达标。
- `run_context.json`：分配配额、结果计数以及已编译的原生源码和二进制 SHA256。二进制依赖服务器 SDK，未提交到仓库。

复现（从仓库根目录）：

```bash
cd c500_int8
source env.sh
bash build.sh
python3 tests/test_grouped.py --json reports/correctness.json
python3 benchmarks/bench_grouped.py --tiles 0,16,32,64,128 \
    --warmup 3 --repeat 10 --output reports/benchmark.json
```
