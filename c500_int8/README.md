# C500：MoE INT8 W8A8 grouped GEMM 适配原型

**状态（2026-10-15）：16 GB C500 实例上，contiguous 通过 69 项检查，masked 通过 53 项检查（含图捕获和动态长度重放）；两种布局各完成 15 个合成 shape/配置组合计时。实例计算配额为 25%，独享整卡性能待验证。**

这是借鉴 DeepGEMM 分组计算语义、新增的独立 MACA INT8 后端。本分支基于上游版本 `1fc9c66975ee322d628b3288534ca0e9ce12a64d`。上游提供 FP8/FP4/BF16 等接口，没有可直接迁移的公开 INT8 W8A8 grouped API；本实现不是其 FP8 API 的直接替换，也没有移植 NVIDIA PTX/TMA 指令。

## 实现范围

- 一个原生 grouped GEMM launch 处理多个专家，支持不同专家 token 数和空专家。
- 使用 MACA SDK 自带 mctlass 的 INT8 矩阵指令实现，INT32 累加、FP32 反量化输出。Python 不执行浮点 GEMM fallback。
- 提供 M tile 16、32、64、128；自动选择采用按平均专家行数的初始启发式，尚未调优。
- 支持当前 mcPyTorch stream 和预先准备的分组 metadata。
- 支持 masked 布局：每专家固定容量的输入缓冲区，加 GPU 上的有效行数数组；无需 CPU 打包 token。
- 暂未实现路由、量化、激活、Top-k 合并、通信和完整 fused MoE。

SDK 中原有 Python grouped 包装偏向 BF16 输出。本原型直接实例化原生模板，采用 FP32 输出，避免 BF16 输出舍入本身干扰逐元素 `1e-3` 的精度检查。

## 数学和布局契约

```text
A:       int8    [M, K]        按专家顺序紧密排列的 token
B:       int8    [G, N, K]     每个专家的权重，物理最后一维是 K
A_scale: float32 [M]           每 token 一个反量化 scale
B_scale: float32 [G, N]        每专家、每输出通道一个反量化 scale
D:       float32 [M, N]
counts:  CPU 整数序列，长度 G，总和 M

对属于专家 e 的行 m：
D[m,n] = float(sum_k int32(A[m,k]) * int32(B[e,n,k]))
         * A_scale[m] * B_scale[e,n]
```

量化为有符号对称 INT8，zero point 为 0。输入已经量化，本接口不负责从浮点计算量化值或 scale。scale 不按 K 分块。输入和输出都要求连续、在同一 GPU 上；调用者负责使输入在当前 stream 上就绪。

`counts=[2,0,3]` 表示前 2 行属于 E0、E1 没有行、后 3 行属于 E2。这里不需要把每个专家的行数补齐到 tile。**counts 既不是上游的逐行 `grouped_layout`，也不是 `use_psum_layout` 的对齐结束偏移，不能混用。**

第一版约束：`N > 0` 且是 128 的倍数，`K > 0` 且是 256 的倍数，`K <= 130816`；A/B/D 各自元素数不超过 `INT32_MAX`。这些约束分别来自所用 kernel 的 tile、INT32 最坏累加范围和 SDK 的索引类型。A/B/D 地址需要 16 字节对齐，scale 地址需要 4 字节对齐。输出不能与输入或 metadata 重叠。本版本仅用于推理，不提供 backward。

## 在服务器运行

需要 MACA SDK（包含 mxcc 和 mctlass 头文件）及 mcPyTorch。已验证环境为 Python 3.12.11、mcPyTorch `2.8.0+metax3.7.1.3`、MACA runtime `3.7.1.5`。默认 SDK 路径为 `/opt/maca`，可通过 `MACA_PATH` 配置；编译目标为 C500 的 `xcore1000`。当前后端独立构建，不依赖上游 NVIDIA 扩展或 CUTLASS/DeepJIT 子模块。

从本仓库根目录执行：

```bash
cd c500_int8
source env.sh
bash build.sh
python3 tools/diagnose.py --require-gpu --output reports/environment.json
python3 tests/test_grouped.py
python3 benchmarks/bench_grouped.py --output reports/benchmark.json
```

或执行一键检查 `bash run_checks.sh`。GPU 不可用时测试退出码为 77（SKIP），不能视为测试通过。

```python
import torch
from deep_gemm_maca import prepare_grouped, m_grouped_int8_gemm_nt_contiguous

counts = [17, 0, 33, 8]
g, m, n, k = len(counts), sum(counts), 128, 256
a = torch.randint(-127, 128, (m, k), device="cuda", dtype=torch.int8)
b = torch.randint(-127, 128, (g, n, k), device="cuda", dtype=torch.int8)
sa = torch.full((m,), 0.013, device="cuda", dtype=torch.float32)
sb = torch.full((g, n), 0.017, device="cuda", dtype=torch.float32)
plan = prepare_grouped(counts, n, k, a.device)
out = torch.empty((m, n), device="cuda", dtype=torch.float32)
m_grouped_int8_gemm_nt_contiguous(a, b, sa, sb, plan=plan, out=out)
torch.cuda.synchronize()
```

plan 可复用，内部 tensor 应视为只读。动态路由变化时需重新准备 plan；准备和传输的成本应在端到端 MoE 性能中另外计入。

## Masked 布局与动态路由

`m_grouped_int8_gemm_nt_masked` 接受以下连续的同设备张量：

```text
A:        INT8    [G, capacity, K]
B:        INT8    [G, N, K]
A_scale:  FP32   [G, capacity]
B_scale:  FP32   [G, N]
masked_m: INT32  [G]               GPU 上各专家的有效前缀行数
D:        FP32   [G, capacity, N]
```

对每个专家 e，仅写入 `D[e, :masked_m[e]]`，计算公式和反量化规则与 contiguous 一致。调用者提供的 `out` 的其余行保持原值；`out=None` 时输出先初始化为零，padding 行为零。N/K、指针对齐、INT32 索引和累加限制与 contiguous 一致。

```python
from deep_gemm_maca import m_grouped_int8_gemm_nt_masked

# a/b/sa/sb 已按上述三维/二维布局准备。
masked_m = torch.tensor([17, 0, 33, 8], dtype=torch.int32, device=a.device)
out = m_grouped_int8_gemm_nt_masked(a, b, sa, sb, masked_m, expected_m=8)
```

`expected_m` 只影响 tile 选择和每专家的行方向 block 数。实际有效行数更大时，同一个 block 循环处理后续 tile，不能把这个提示当成截断长度。此调度由本后端实现，复用 SDK 原生 INT8 MMA 和 FP32 epilogue，支持四种 M tile。

默认 `validate_mask=True` 会检查 `0 <= masked_m <= capacity`，为此向 CPU 同步一个布尔值。上游已保证长度合法时，可传 `validate_mask=False` 保持调用异步；GPU 上原地更新长度后，无需重建 CPU plan。此路径要求调用者保证数据和长度在当前 stream 上就绪。非法长度仍由原生边界保护跳过，输出不作正确性保证，不能把它当作合法路由。

已验证 `torch.cuda.CUDAGraph` 捕获/重放及重放时动态更新长度。捕获前先在图外调用一次以完成原生库加载，在图内使用 `validate_mask=False` 和预先分配的输出。图重放期间保持输入、输出、scale、`masked_m` 存活且地址不变，长度通过 GPU 张量原地更新。

计时用预先分配的输出、在计时区域外检查长度，再以 `validate_mask=False` 启动。输出分配/清零和长度检查不计入该原生 GEMM 计时。选择 masked 的命令为：

```bash
python3 tests/test_masked.py --json reports/masked_correctness.json
python3 benchmarks/bench_grouped.py --layout masked --output reports/masked_benchmark.json
```

shape JSON 可额外指定 `layout`、`capacity` 和 `expected_m`；默认 capacity 为该 shape 中最大的专家行数，默认提示为 `ceil(sum(counts)/G)`。TOPS 使用有效行数计算，padding 不计入有效操作量。

## 验证和性能口径

正确性 oracle 使用相同 INT8 输入进行 CPU INT64 点积，并用 FP64 计算 scale。这测量算子实现误差；与量化前浮点网络的误差是另一个问题。测试输出会明确相对误差分母和零值处理方式。项目文档只给出 `1e-3`，最终仍需要项目方确认参考实现及误差聚合定义；上游 DeepGEMM 的 `calc_diff` 也不能直接等同于逐元素相对误差。

性能脚本使用 GPU event、预热后计时，预先创建 plan 和输出，包含原生 INT8 GEMM 及融合 scale 写回。Python 调用与排队开销可能影响很小的 case。分配、数据传输、metadata 准备、路由和量化不计入这段时间。当前 shape 是 synthetic，不能冒充 DeepSeek/GLM/Kimi/Qwen/MiniMax 的实测集合；TOPS 按 `2*M*N*K` 计算，不能当成硬件利用率。尚无匹配的 A100/H200 实测基线，因此不报告跨芯片达标比例。

## 实卡验证记录

16 GB 实例已验证 `mcGetDeviceCount=1`，PyTorch 的 GPU 分配与求和成功。运行 `python3 tests/test_grouped.py`，69 项检查通过，包括 26 项 CPU metadata 检查，以及数值、stream、生命周期和非法参数检查。11 个数值场景中，非近零参考值的最大逐元素相对误差约为 `1.11e-7`；这仅证明报告中这些合成场景的算子结果正确，不构成官方 shape 集合或模型精度验收。

实测报告保存在 [reports/c500_16gb_2026-10-15/](reports/c500_16gb_2026-10-15/)。性能数据对应 25% 计算配额，不能外推整卡，也不能用于宣布 C500/A100 比例达标。GPU 不可见时可运行 `tools/diagnose.py` 检查运行时设备计数及 sGPU 分配，只有实际 GPU 分配/求和成功后才能开始实卡测试。

新增 masked 支持后的回归报告位于 [reports/c500_16gb_masked_2026-10-15/](reports/c500_16gb_masked_2026-10-15/)。该版本 contiguous 69 项、masked 53 项检查通过，两种布局各 15 个配置组合计时成功。masked 的 15 个数值场景中，非近零最大逐元素相对误差约为 `1.12e-7`。报告附当前原生/接口/测试源码 SHA256；早期报告仍对应其原始版本，不能混用源码哈希。

## 代码入口

- `native/grouped_int8.cpp`：C ABI、四种模板实例化、原生 launch 和边界检查。
- `deep_gemm_maca/api.py`：输入校验、counts plan、stream 和 tensor 生命周期。
- `tests/test_grouped.py`：独立 CPU oracle、边界和 stream 测试。
- `tests/test_masked.py`：masked 数值、尾部保留、GPU 动态行数及 stream 测试。
- `benchmarks/bench_grouped.py`：合成 shape 性能采集。
- `tools/diagnose.py`：只读诊断。

参考：[DeepGEMM README](https://github.com/deepseek-ai/DeepGEMM/blob/1fc9c66975ee322d628b3288534ca0e9ce12a64d/README.md)、[分组接口](https://github.com/deepseek-ai/DeepGEMM/blob/1fc9c66975ee322d628b3288534ca0e9ce12a64d/csrc/apis/gemm.hpp)、[布局生成](https://github.com/deepseek-ai/DeepGEMM/blob/1fc9c66975ee322d628b3288534ca0e9ce12a64d/tests/generators.py)。mctlass kernel 实现来自服务器已安装 SDK，本目录没有复制其源码。
