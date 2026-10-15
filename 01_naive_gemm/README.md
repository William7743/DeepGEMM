# 朴素 INT8 GEMM：从浮点输入开始量化

本课打通单个 GEMM 的完整数据流：

```text
CPU 浮点 A[M,K]、B[K,N]
    ↓ 计算 scale，除以 scale、取整、截断
CPU INT8 A、B + FP32 A_scale[M]、B_scale[N]
    ↓ 拷贝到 GPU
GPU INT8 乘法、INT32 累加
    ↓ 乘 A_scale[row] 和 B_scale[col]
GPU FP32 C[M,N]
```

矩阵均按行存储，一个 GPU 线程计算一个输出元素，block 为 16×16。当前 B 是 [K,N] 布局；后续再学习 DeepGEMM NT 接口的 [N,K] 权重布局。本步尚未引入专家分组、共享内存分块或 MMA。

## 量化怎么做

采用零点为 0 的对称量化，整数范围为 [-127,127]。A 每行计算一个 scale，B 每列计算一个 scale，均沿 K 方向寻找最大绝对值：

```cpp
scale = max_abs == 0 ? 1.0f : max_abs / 127.0f;
q = static_cast<int8_t>(std::clamp(std::round(x / scale), -127.0f, 127.0f));
```

全零行或列使用 scale=1，量化结果仍全为 0，避免除零。`std::round` 遇到半整数时向远离零的方向取整，先截断范围再转换为 INT8。

例如 x=0.5、scale=0.01，量化得到 q=50，重建值为 50×0.01=0.5。一般情况下，取整会丢失一部分信息，重建值只能近似原始浮点值。

GPU kernel 的写回公式仍然是：

```cpp
c[row * n + col] = static_cast<float>(sum) * a_scale[row] * b_scale[col];
```

两个 scale 沿 K 不变，所以可以放在整数点积完成后相乘。量化在 CPU 上完成；此步骤用于理解流程，不包含 GPU 量化 kernel。

## 编译与执行

在 C500 服务器运行：

```bash
cd /root/MOE/C500_int8_02All/01_naive_gemm
bash build.sh
export LD_LIBRARY_PATH=/opt/maca/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}

./naive_gemm.out                       # 默认 M=3, N=4, K=5
./naive_gemm.out 17 19 23              # 非整块边界
./naive_gemm.out 64 96 128             # 多个 block
./naive_gemm.out 17 19 23 --zero-edges # A 最后一行、B 最后一列全零
./naive_gemm.out 1 1 1 --zero-edges    # 输入全部为零
```

维度限制在 1～1024。浮点输入确定性生成，包含不同的行/列幅度，以检查 scale 下标。量化后的最大累加绝对值不超过 127×127×1024=16,516,096，INT32 不会溢出。本教学量化函数针对生成的有限、适中浮点数；尚未处理 NaN、Inf 或极小 scale 等通用接口边界。

小矩阵会打印 A 第一行的“浮点 → INT8 → 重建浮点”、两组 scale 和 GPU 输出。

## 两类误差分开看

1. **算子计算误差**：GPU 输出对比同一组 INT8 输入的 CPU INT64 点积与 FP64 缩放。逐元素要求 `abs(gpu-reference) <= 1e-6 + 1e-5*abs(reference)`。`PASS` 只表示这项检查通过。非近零最大相对误差只统计参考值绝对值大于 1e-6 的元素。
2. **量化误差**：上述量化 CPU 参考结果，对比原始浮点输入的 CPU FP64 GEMM。这样隔离 GPU 舍入误差。报告最大绝对误差，以及 `relative_L2 = sqrt(sum((C_quant-C_float)^2) / sum(C_float^2))`。原始输出范数为 0 时报告 N/A；这些指标只作观察，不设置通过阈值。

这里的相对 L2 与逐元素相对误差不是同一种指标，不能据此宣称满足项目的 1e-3 精度要求。量化误差还与数据分布、量化粒度有关。本课不做性能计时。

## 建议阅读顺序

1. `main` 第 1 步：生成浮点输入，调用量化函数。
2. `quantize_a_rows`、`quantize_b_columns`：按行/列寻找 max_abs 并计算 scale。
3. `quantize_value`：除 scale、取整、截断、转 INT8。
4. `naive_int8_gemm`：整数点积和输出缩放。
5. `reference_gemm`、`reference_float_gemm` 和第 5 步：区分计算错误与量化损失。

上一阶段仅手动提供 INT8 输入和 scale，保存在提交 `1b726f4`；更早的未缩放 INT32 输出保存在 `acee04b`。

## C500 实测（2026-10-15）

MACA 编译成功，以下 7 组全部逐元素通过算子计算检查（mismatches=0）。表中的量化误差采用上文的独立 CPU 参考口径。

| M,N,K | 输入模式 | 算子最大绝对误差 | 量化最大绝对误差 | 量化相对 L2 |
|---|---|---:|---:|---:|
| 3,4,5 | 默认 | 1.20385e-7 | 0.0293058 | 0.00430544 |
| 1,1,1 | 默认 | 1.12033e-7 | 1.13249e-8 | 8.00684e-9 |
| 17,19,23 | 默认 | 5.42037e-6 | 0.646222 | 0.00462066 |
| 64,96,128 | 默认 | 1.41782e-4 | 9.19682 | 0.00409728 |
| 1,1,1024 | 默认 | 4.81541e-6 | 0.400149 | 0.00194985 |
| 17,19,23 | zero-edges | 4.7527e-6 | 0.646222 | 0.00462661 |
| 1,1,1 | zero-edges | 0 | 0 | N/A |

默认用例中，A 第一行的 -0.91 量化为 -111，再乘 scale 后约为 -0.908976；这就是取整带来的信息损失。原始输入全零时，两组 scale 都为 1，GPU 输出为 0。

另外通过了零维度、带非数字后缀、参数数量错误和未知选项的退出码检查。

在服务器另用 C++ 断言检查了量化函数：正负半整数取整、范围截断、已知行/列的量化值与 scale、全零行/列，全部通过。
