# C500 masked INT8 后端与 contiguous 回归

实测日期：2026-10-15。C500 sGPU 配额为 16000 MiB 显存、25% 计算配额。所有 shape 为 synthetic；报告不代表独享整卡性能或官方项目验收。

- `correctness.json`：contiguous 回归，69 项 PASS。
- `masked_correctness.json`：masked 53 项 PASS，包含 22 项纯 CPU 检查、15 个数值场景及非法输入检查。覆盖四种 M tile、空专家、未补齐的尾部、capacity 超过 640、提示小于实际长度、GPU 动态长度、非默认 stream、异步存储生命周期，以及图捕获和动态长度重放。非近零最大逐元素相对误差约为 `1.12e-7`。
- `benchmark.json`、`masked_benchmark.json`：两种布局分别运行 3 个合成 shape × 5 个 tile 请求配置，每组合预热 5 次、计时 20 次。自动配置可能与显式 tile 重复。计时为 GPU event 围住一次调用，可能包含主机提交间隙；masked 的布尔长度检查、分配/清零不计入计时。
- `masked_run_context.json`：当前源码和原生二进制 SHA256、配额、验证次序。`bash run_checks.sh` 通过时 masked 包含 51 项检查，随后新增的两项图测试连同完整 masked 套件再次执行，最终 53 项通过；原生实现未在两次验证间更改。

数值 oracle 使用相同的 INT8 输入、CPU INT64 点积与 FP64 scale；容差为 `abs(error) <= 1e-6 + 1e-3*abs(reference)`。masked 检查还逐项验证有效前缀之外的输出保持原值。benchmark 的 PASS 只表示采样正确性与计时成功，没有跨芯片性能基线或利用率门槛的含义。

复现（仓库根目录）：

```bash
cd c500_int8
bash run_checks.sh
```
