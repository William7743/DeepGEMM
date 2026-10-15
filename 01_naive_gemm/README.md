# 第一步：朴素 INT8 GEMM

本课只完成单个矩阵乘法的编译、执行与正确性检查：

```text
A: INT8  [M, K]
B: INT8  [K, N]
C: INT32 [M, N]
C[row,col] = sum(A[row,p] * B[p,col]), p = 0..K-1
```

三个矩阵均按行存储。一个 GPU 线程计算一个 C 元素；每个 block 有 16×16 个线程。grid 的 x 方向覆盖输出列，y 方向覆盖输出行。边界判断允许 M、N 不整除 16。

这是普通的 B[K,N] 布局；后续适配 DeepGEMM 的 NT 接口时，再引入权重 B[N,K] 的存储布局。本课还没有专家分组、scale、量化过程、共享内存分块或 MMA 优化。输入本来就是 INT8，因此也不测量浮点模型的量化误差。

## 编译与执行

在 C500 服务器运行：

```bash
cd /root/MOE/C500_int8_02All/01_naive_gemm
bash build.sh
export LD_LIBRARY_PATH=/opt/maca/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}

./naive_gemm.out              # M=3, N=4, K=5，打印输出矩阵
./naive_gemm.out 17 19 23     # 检查不整除 block 大小的边界
./naive_gemm.out 64 96 128    # 覆盖多个完整 block
```

参数顺序为 `M N K`，为控制本课规模，每个维度限制在 1～1024。测试输入确定性生成，范围为 -8～8，包含正数、负数和零。最大累加绝对值不超过 65536，INT32 不会溢出。

程序使用 CPU INT64 计算参考值，逐元素检查全部 GPU 输出。成功应显示 `mismatches=0`、`max_abs_error=0` 和 `PASS`。这一步不做性能评测。

## 本次 C500 实测（2026-10-15）

MACA 编译成功，下列用例全部逐元素一致，最大绝对误差均为 0：

| M | N | K | 检查的输出元素数 | 结果 |
|---:|---:|---:|---:|---|
| 3 | 4 | 5 | 12 | PASS |
| 1 | 1 | 1 | 1 | PASS |
| 17 | 19 | 23 | 323 | PASS |
| 64 | 96 | 128 | 6144 | PASS |

另外确认：零维度、带非数字后缀的维度、参数数量不正确时，程序返回非零退出码。

## 建议阅读顺序

1. `naive_int8_gemm`：线程的 row/col 怎么算，为什么需要边界判断。
2. `main` 第 1～2 步：CPU 数据、GPU 内存分配、输入拷贝。
3. 第 3～4 步：grid/block、kernel 启动、同步和结果拷回。
4. 第 5 步与 `reference_gemm`：如何知道结果正确。

重点先解释三个下标：`a[row*k+p]`、`b[p*n+col]`、`c[row*n+col]`。编译和运行成功后，先弄懂这一步，再增加后续功能。
