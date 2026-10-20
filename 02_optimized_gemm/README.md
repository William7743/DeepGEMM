# INT8 grouped GEMM：共享内存分块与向量加载

本课为两种布局提供独立的 C 调用入口。当前入口支持 1～4096 个专家，内部每次 kernel 启动最多处理 64 个。本目录在朴素版基础上加入共享内存分块复用和对齐 INT8 向量加载，仍使用标量 INT8 乘法、INT32 累加和 FP32 缩放输出，尚未使用硬件矩阵指令。

## 目录

- [公共测试目录（2026-10-20）](#公共测试目录2026-10-20)
- [目录命名与优化阶段](#目录命名与优化阶段)
- [共享内存优化相对朴素版的变化](#共享内存优化相对朴素版的变化)
- [两种布局](#两种布局)
- [可供外部调用的入口](#可供外部调用的入口)
- [编译、运行及共享库](#编译运行及共享库)
- [mcPyTorch 通过共享库调用的最小例子](#mcpytorch-通过共享库调用的最小例子)
- [演示验证与阅读顺序](#演示验证与阅读顺序)
- [大尺寸教学阶段（2026-10-16）](#大尺寸教学阶段2026-10-16)
- [shape 批量测试与性能基线（2026-10-16）](#shape-批量测试与性能基线2026-10-16)
  - [24 组实测结果](#24-组实测结果)
- [FLAME-MoE 路由片段接入（2026-10-16）](#flame-moe-路由片段接入2026-10-16)
  - [输入到 shape 的过程](#输入到-shape-的过程)
  - [范围与来源记录](#范围与来源记录)
  - [复现](#复现)
  - [C500 实测结果](#c500-实测结果)
- [调用层自动拆批（2026-10-16）](#调用层自动拆批2026-10-16)
  - [快速正确性验证](#快速正确性验证)
- [优化前固定性能基线（2026-10-16）](#优化前固定性能基线2026-10-16)
  - [固定的 7 个 case](#固定的-7-个-case)
  - [计时与复现](#计时与复现)
  - [实测结果](#实测结果)
- [共享内存版新增记录（2026-10-20）](#共享内存版新增记录2026-10-20)
  - [如何查看朴素版到共享内存版的修改](#如何查看朴素版到共享内存版的修改)
  - [固定性能对照](#固定性能对照)
  - [正确性检查与复现](#正确性检查与复现)
  - [本轮正确性结果](#本轮正确性结果)
  - [2026-10-20 性能对比](#2026-10-20-性能对比)
- [目录与报告归档后的调用检查（2026-10-20）](#目录与报告归档后的调用检查2026-10-20)
- [INT8 向量加载（2026-10-20）](#int8-向量加载2026-10-20)
  - [加载映射与尾部](#加载映射与尾部)
  - [向量阶段验证](#向量阶段验证)
  - [向量阶段性能对照](#向量阶段性能对照)
  - [向量阶段复现](#向量阶段复现)

历史实测记录（以下为朴素版的学习历史与基线记录，2026-10-15～2026-10-16）：

- [历史单专家 C500 实测](#历史单专家-c500-实测2026-10-15提交-9ef6455)
- [历史同尺寸双专家 C500 实测](#历史同尺寸双专家-c500-实测2026-10-15提交-d590ef7)
- [上一步两次启动、不同 token 数 C500 实测](#上一步两次启动不同-token-数-c500-实测2026-10-15提交-0dcdb76)
- [历史双专家 grouped 单次启动 C500 实测](#历史双专家-grouped-单次启动-c500-实测2026-10-15提交-ea38f82)
- [历史独立缓冲区与空专家实测](#历史独立缓冲区与空专家实测2026-10-15提交-87ce61e)
- [历史 contiguous NT 实测](#历史-contiguous-nt-实测2026-10-15提交-dc641e0)
- [当前 masked 与调用入口实测](#当前-masked-与调用入口实测2026-10-16)

## 公共测试目录（2026-10-20）

两份测试脚本和三份 shape 配置现统一放在 `../benchmarks/`；各版本的结果报告仍保留在各自实现目录。
`bench_shapes.py` 默认使用第一课的源码、共享库及报告路径，`--library` 和 `--source` 可选择共享内存版。
下方测试命令和配置链接已更新；历史报告原文、输入配置和 kernel 均未修改。
路径调整改变了测试脚本哈希，旧报告保持归档，不能与新脚本混合 `--resume`；复测请指定新输出文件。
迁移后本实现通过 contiguous/masked 两个 G=129 尾部 case；记录见
[公共测试入口迁移检查](reports/benchmarks_migration_2026-10-20.json)。本轮仅验证调用链，不作为新的性能基线。

## 目录命名与优化阶段

本目录统一命名为 `02_optimized_gemm`，源码为 `optimized_gemm.cpp`，后续优化继续修改同一文件。
当前阶段为共享内存分块加对齐 INT8 向量加载，函数名 `shared_int8_gemm` 和库名 `libmoe_int8_shared.so` 暂时保留。
优化含义由 commit、阶段说明和报告名记录；改名不改变 kernel、接口或数值规则。

| 阶段 | 源码提交 | 性能证据 |
|---|---|---|
| 共享内存分块 | 当前历史中的 `23528c1`；下方保留整理前的历史引用 | [共享内存阶段报告](reports/shared_results_2026-10-20.json) |
| 对齐 INT8 向量加载 | 在 `23528c1` 上的下一次功能提交 | [向量阶段对照](reports/vector_comparison_2026-10-20.json) |

查看跨改名的源码历史：

```bash
git log --follow --oneline -- 02_optimized_gemm/optimized_gemm.cpp
```

下方比较历史提交 `1d01af3` 与 `e96d5ea` 的命令仍使用当时的旧路径，确保能看到原始优化 diff。
所有 JSON 报告移入 `reports/`，报告内部的旧路径和提交号保留为历史证据，不改写内容。

## 共享内存优化相对朴素版的变化

`BLOCK_M=16, BLOCK_N=16, BLOCK_K=32`，线程块为 `dim3(16,16)`，共 256 个线程。
一个线程块负责输出的 16×16 区域，沿 K 方向逐段累加。
每段合作加载 A 的 16×32 个 INT8 元素和 B 的 16×32 个 INT8 元素。
加载线程沿全局内存中连续的 K 方向取数；B 从全局 `[G,N,K]` 转置为共享内存中的 `[K,N]` 小块。
共享 B 多留一列改变 bank 映射，不改变全局内存布局或接口。
共享内存数据共 `16*32 + 32*17 = 1056` 字节（编译器分配可能有额外对齐）。

```text
合作加载 A、B；无效 M/N/K 位置在共享内存中补零
                       ↓
                   第一次同步
                       ↓
每线程用共享数据累加自己负责的 C[row,col]
                       ↓
                   第二次同步
                       ↓
下一段 K 复用同一块共享内存
                       ↓
只对有效行列执行 scale 缩放和写回
```

第一次同步防止读到未完成的加载，第二次同步防止下一段加载覆盖仍在使用的数据。
整个 block 都无效时可以统一退出；只有部分线程的输出越界时，这些线程仍需参与加载和同步，
不能像第一课一样直接逐线程 return。masked padding 保持原值。

以完整的 16×16×32 计算片段为例，朴素算法逐输出需要 16384 次标量输入元素读取；
本课合作加载 1024 个输入元素，并在共享内存中复用。
这是算法层面的读取次数对比，不等于 HBM 流量或性能必然改善 16 倍，缓存和共享内存开销也会影响结果。

## 两种布局

令 G 为专家数，T 为总有效 token 数，capacity 为每个专家的固定容量。所有数组按行紧密存储，权重 B 的最后一维 K 连续。

| 数据 | contiguous | masked | 类型 |
|---|---|---|---|
| A | [T,K] | [G,capacity,K] | INT8 |
| B | [G,N,K] | [G,N,K] | INT8 |
| A_scale | [T] | [G,capacity] | FP32 |
| B_scale | [G,N] | [G,N] | FP32 |
| C | [T,N] | [G,capacity,N] | FP32 |
| GPU 分组信息 | offsets[G+1] | masked_m[G] | INT32 |

contiguous：专家 g 的输入输出区间为 `[offsets[g], offsets[g+1])`。offsets 从 0 开始、单调不减、最后一项为 T。相等的相邻偏移表示空专家。CPU 演示用 counts 的前缀和生成它。

masked：每个专家始终占 capacity 行，只有前 `masked_m[g]` 行有效，要求 `0 <= masked_m[g] <= capacity`。有效行的物理行号为 `g*capacity+row`；其余输出行保持调用前的值。这个 mask 是有效前缀长度，不是逐元素布尔掩码。GPU 每次调用重新读取长度，容量与指针不变时可更新长度后再次调用。

例如 counts=[3,0,5]，capacity=8：contiguous 的 offsets=[0,3,3,8]，A/C 共 8 行；masked 的 A/C 共 24 个物理行槽，分别位于 [0,8)、[8,16)、[16,24)，其中仅 3、0、5 行有效。

数学约定相同：零点为 0，`C[row,col] = float(sum_k A[row,k]*B[g,col,k]) * A_scale[row] * B_scale[g,col]`。scale 沿 K 不变。单个矩阵布局和 dtype 对齐本仓库的 C500 INT8 扩展约定；它不是 DeepGEMM 原始 FP8/FP4 接口的直接替代。

## 可供外部调用的入口

源码在演示 main 之外导出两个 C 符号，参数顺序一致，只有分组信息和第二个尺寸的含义不同：

```cpp
extern "C" mcError_t moe_int8_contiguous(
    const int8_t* a, const int8_t* b,
    const float* a_scale, const float* b_scale,
    const int32_t* offsets, float* c,
    int groups, int total_m, int n, int k, mcStream_t stream);

extern "C" mcError_t moe_int8_masked(
    const int8_t* a, const int8_t* b,
    const float* a_scale, const float* b_scale,
    const int32_t* masked_m, float* c,
    int groups, int capacity, int n, int k, mcStream_t stream);
```

两个入口接收已量化的数据和调用者提供的输出。它们不生成输入、不量化、不分配或释放内存、不复制数据、不切换设备，也不等待 GPU 完成。`stream=nullptr` 表示默认 stream，非默认 stream 也受支持。调用者负责使输入及元数据在该 stream 上就绪，并保持所有缓冲区存活到计算完成；必要时使用事件协调不同 stream。

返回 `mcSuccess` 仅表示主机参数校验与启动成功，计算执行错误须在调用者同步 stream 或其他后续同步点检查。CPU 参数非法返回 `mcErrorInvalidValue`，不退出进程。

接口约束：

- G 为 1～4096，N/K 为 1～32768，每专家 M 为 0～65536；masked capacity 为 0～65536；contiguous T 为 0～G*65536。尺寸在范围内仍须有足够的主机内存和显存，不保证所有上限的组合都能在当前设备上分配。
- 所有指针指向当前 GPU 上足够大的缓冲区。INT8 地址无额外对齐要求，FP32 和 INT32 地址至少 4 字节对齐。
- 输出 C 不得与输入、scale 或分组信息重叠；入口检查给定地址范围的重叠、空指针、对齐和主机尺寸。裸指针接口无法确认真实分配大小或张量所属设备，这由调用者保证。
- 调用者必须保证 GPU 分组信息合法、scale 为有限值。入口不为读取 GPU 元数据而隐式同步。kernel 对越界长度/偏移有保护，但非法 GPU 元数据不保证结果正确，也不会同步返回一个校验错误。
- T=0 或 capacity=0 时不启动 kernel，允许数据指针为空。capacity>0 且所有 masked_m=0 时仍启动 ceil(G/64) 次 kernel，由 GPU 判断无有效行；整个输出保持不变。这允许 CPU 不读取动态长度。
- 每批在同一调用者 stream 上提交，批间不做同步。若某次启动失败，立即返回错误，之前的批可能已提交；调用者仍需等这些工作结束再释放缓冲区。

只有计算调用异步。演示程序的打包、上传、同步、拷回和 CPU 对照都放在入口之外。

## 编译、运行及共享库

```bash
cd /root/MOE/C500_int8_02All/02_optimized_gemm
bash build.sh                               # 生成 libmoe_int8_shared.so
export LD_LIBRARY_PATH=/opt/maca/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}
```

共享库由 `optimized_gemm.cpp` 编译，定义 `MOE_GEMM_LIBRARY` 排除 main。
本目录保留朴素版的 CPU 演示、量化与参考代码，但当前 build.sh 只构建共享库，
不接受第一课的 `--shared` 参数，也不生成 naive_gemm.out。
C++ 调用者可使用上面的声明链接共享库，Python 可通过 ctypes 传递 GPU 地址；
这不是自动注册的 PyTorch 算子，也尚未验证 graph capture 或 autograd。

调用示意（所有参数都已经准备好）：

```cpp
mcError_t status = moe_int8_masked(d_a, d_b, d_sa, d_sb, d_lengths, d_c,
                                  groups, capacity, n, k, stream);
// 检查 status；可继续提交同一 stream 上的其他工作。
// 需要 CPU 读取输出或释放数据之前，由调用者同步。
```

## mcPyTorch 通过共享库调用的最小例子

在本目录先执行 `bash build.sh`，在已配置 mcPyTorch 的服务器 Python 环境运行下面的代码。这里演示调用者自己分配输入、输出，填入已量化 INT8 数据；不是把 Python 浮点 GEMM 当作后端。

```python
import ctypes
from pathlib import Path
import torch

lib = ctypes.CDLL(str(Path("libmoe_int8_shared.so").resolve()))
fn = lib.moe_int8_masked
fn.argtypes = [ctypes.c_void_p] * 6 + [ctypes.c_int] * 4 + [ctypes.c_void_p]
fn.restype = ctypes.c_int
G, capacity, N, K = 3, 8, 4, 5
stream = torch.cuda.Stream()
with torch.cuda.stream(stream):
    a = torch.ones((G, capacity, K), dtype=torch.int8, device="cuda")
    b = torch.ones((G, N, K), dtype=torch.int8, device="cuda")
    sa = torch.ones((G, capacity), dtype=torch.float32, device="cuda")
    sb = torch.ones((G, N), dtype=torch.float32, device="cuda")
    lengths = torch.tensor([3, 0, 5], dtype=torch.int32, device="cuda")
    out = torch.full((G, capacity, N), -99.0, device="cuda", dtype=torch.float32)
    status = fn(*(t.data_ptr() for t in (a, b, sa, sb, lengths, out)),
                G, capacity, N, K, stream.cuda_stream)
    if status != 0:
        raise RuntimeError(f"MACA launch error: {status}")
stream.synchronize()
# 有效行应为 K=5，其余行保持 -99。
print(out.cpu())
```

必须保留张量引用直到 stream 完成；若在其他 stream 产生数据，调用者还需要正确的 stream/event 依赖。修改 lengths 后可再次调用同一个入口，要求输入在新增有效行上也已经准备好。

## 演示验证与阅读顺序

CPU 生成浮点 A/B，按 A 行和 B 输出通道计算 max_abs/127，取整并截断到 [-127,127]。全零行/列 scale=1。保留原始每专家 B[K,N] 作为 CPU 参考，打包时转换成 B[G,N,K]。

非空有效输出初始化为 NaN，漏写会检查失败。masked 无效输出初始化为有限哨兵 -123456.75，逐元素确认调用后仍相同；无效输入 A/scale 也设置为无用值，kernel 必须在读取前判断有效长度。空专家没有有效结果，不用一行零替代。

CPU 使用 INT64 点积和 FP64 缩放，要求每个有效元素满足 `abs(gpu-reference) <= 1e-6 + 1e-5*abs(reference)`。另报告相对原始浮点 GEMM 的量化误差，不将其等同于算子实现误差或项目验收精度。

先看两个 `extern "C"` 入口和 `launch_grouped`，再看 `shared_int8_gemm<Masked>` 如何为两种布局计算行号。
接着看 A/B 共享 tile 的合作加载、两次 `__syncthreads()` 和 K 方向分块累加。然后看 `pack_masked`、main 中的非默认 stream 调用，以及 padding 检查。新 contiguous 调度使用 `min(T,65536)` 作为行数上界，避免入口依赖 CPU 的 max(counts)；它保证覆盖合法元数据，但可能产生更多空转 block，尚未调优。

## 以下为朴素版的学习历史与基线记录

以下各阶段及其“当前”“本次”等表述沿用第一课的历史记录，直到文末“共享内存版新增记录”为止。
它们描述相应历史提交的朴素实现，不代表当前共享内存版重新运行过这些测试。
历史命令、naive_gemm.out、build.sh --shared 及数据准备脚本均在
`/root/MOE/C500_int8_02All/01_naive_gemm` 下执行；原始文件链接已指向该目录。
共享版当前构建及调用方式见上文，最新验证与性能记录见文末。

## 历史单专家 C500 实测（2026-10-15，提交 9ef6455）

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

## 历史同尺寸双专家 C500 实测（2026-10-15，提交 d590ef7）

MACA 编译成功，7 组用例 × 2 个专家全部通过，两个专家的 mismatches 均为 0：

| M,N,K | 输入模式 | 专家 0 最大绝对计算误差 | 专家 1 最大绝对计算误差 |
|---|---|---:|---:|
| 3,4,5 | 默认 | 1.20385e-7 | 2.681e-6 |
| 1,1,1 | 默认 | 1.12033e-7 | 6.10501e-9 |
| 17,19,23 | 默认 | 5.42037e-6 | 9.55924e-6 |
| 64,96,128 | 默认 | 1.41782e-4 | 2.04754e-4 |
| 1,1,1024 | 默认 | 4.81541e-6 | 1.62355e-5 |
| 17,19,23 | zero-edges | 4.7527e-6 | 9.55924e-6 |
| 1,1,1 | zero-edges | 0 | 0 |

默认用例中，两个专家输出的首元素分别约为 1.04968 和 0.449668；确认两组输出不同，且各自匹配对应的 CPU 参考值。四类非法参数检查仍通过。这一步没有性能计时，也不包含不同 token 数或 grouped 调度。

## 上一步两次启动、不同 token 数 C500 实测（2026-10-15，提交 0dcdb76）

编译成功，8 次运行（含默认参数与显式默认参数）× 2 个专家，全部通过 CPU 参考检查。另断言检查了每个专家打印的 shape、grid 和检查元素数均匹配各自的 M。

| M0,M1,N,K | 模式 | 专家 0 检查元素数 | 专家 1 检查元素数 | 结果 |
|---|---|---:|---:|---|
| 3,5,4,5 | 默认及显式参数 | 12 | 20 | PASS |
| 1,33,19,23 | 默认输入 | 19 | 627 | PASS |
| 33,1,19,23 | 默认输入 | 627 | 19 | PASS |
| 64,97,96,128 | 默认输入 | 6144 | 9312 | PASS |
| 1,2,1,1024 | 默认输入 | 1 | 2 | PASS |
| 3,5,4,5 | zero-edges | 12 | 20 | PASS |
| 1,1,1,1 | zero-edges | 1 | 1 | PASS |

M0=1、M1=33、N=19 时，两个专家的 grid 分别为 (2,1)、(2,3)，交换 M 后 grid 也随之交换。全部运行 mismatches=0。旧的三维参数格式、任一专家 M=0、M1 超上限、非法数字和未知选项，共 6 类非法参数检查均返回非零退出码。本步尚不支持空专家，也未做统一调度或性能计时。

## 历史双专家 grouped 单次启动 C500 实测（2026-10-15，提交 ea38f82）

MACA 编译成功，10 次运行（含默认参数与显式默认参数）× 2 个专家全部通过逐元素 CPU 参考检查。与上一提交 `0dcdb76` 的两次启动可执行文件，在相同输入下逐项比较打印的计算误差、量化误差及小矩阵输出，结果一致。

| M0,M1,N,K | 模式 | grouped grid (x,y,z) | 结果 |
|---|---|---|---|
| 3,5,4,5 | 默认及显式参数 | (1,1,2) | PASS |
| 1,33,19,23 | 默认输入 | (2,3,2) | PASS |
| 33,1,19,23 | 默认输入 | (2,3,2) | PASS |
| 64,97,96,128 | 默认输入 | (6,7,2) | PASS |
| 1,2,1,1024 | 默认输入 | (1,1,2) | PASS |
| 3,5,4,5 | zero-edges | (1,1,2) | PASS |
| 1,1,1,1 | zero-edges | (1,1,2) | PASS |
| 1,1024,17,7 | 默认输入 | (2,64,2) | PASS |
| 1024,1,17,7 | 默认输入 | (2,64,2) | PASS |

所有专家 mismatches=0；检查了每个专家的 shape、输出元素数以及统一 grid 的尺寸。源码中唯一的 GEMM 启动位于专家检查循环之前。6 类非法参数检查通过。以上结果不表示性能提升，也不表示已完成 DeepGEMM 接口适配。

## 历史独立缓冲区与空专家实测（2026-10-15，提交 87ce61e）

在 C500 服务器编译并验证 26 组新接口用例，共 201 个专家条目：96 个非空专家逐元素通过 CPU INT64/FP64 参考检查，105 个空专家通过空输出约定检查。所有非空任务启动一次 GEMM kernel，全空任务启动零次。全部 mismatches=0。

覆盖范围：

- 1 个、多个、64 个专家，以及 64 个专家全部为空。
- 空专家位于开头、中间、结尾，及零值输入与空专家混合。
- M=15/16/17、31/33 的整块与尾部边界，N=1/15/16/17/19，K=1/7/16/23/1024。
- M=1 与 M=1024 同组的强不均衡输入。
- 14 组指定场景加 12 组确定性随机组合（种子 20261015）。

18 组非法参数检查全部被拒绝，覆盖空列表、空项、前后逗号、负数、小数、非数字、超范围、整数溢出、65 个专家、N/K=0、未知选项和缺失参数。

另外将默认、显式默认、1/33 token、zero-edges 共 4 组旧接口用例与上一提交 `ea38f82` 的可执行文件比较，打印的计算误差、量化误差和小矩阵输出一致。

可用下面的命令快速复查关键边界（已先按上文编译并设置库路径）：

```bash
set -e
./naive_gemm.out --tokens 3,0,5,17 19 23
./naive_gemm.out --tokens 0,0,0 4 5
./naive_gemm.out --tokens 0,15,16,17,0 17 23 --zero-edges
./naive_gemm.out --tokens 1,1024,0,33 17 7
./naive_gemm.out --tokens 1,2,0 1 1024
./naive_gemm.out --tokens 17 19 23
if ./naive_gemm.out --tokens 3,,5 4 5; then
    echo 'FAIL: malformed token list accepted'
    exit 1
fi
```

这些是功能验证，不包含性能目标验收或 contiguous/masked 适配验收。

## 历史 contiguous NT 实测（2026-10-15，提交 dc641e0）

在 C500 上编译并运行 26 组用例，覆盖 1～64 个专家、空专家位于首/中/尾、全空、尾部尺寸和强不均衡 M。所有非空专家逐元素通过 CPU INT64/FP64 对照，空专家输出检查通过。

每组额外与上一提交 `87ce61e` 的独立缓冲区可执行文件比较：打印的计算误差、量化误差及小矩阵输出均一致。测试对 offsets 的每个值、A/B/C 总形状做了独立前缀和断言；18 组非法参数和 2 组旧调用格式也通过。

例如 `--tokens 3,0,5,17 19 23` 输出：

```text
Contiguous NT: A[25,23], B[4,19,23], C[25,19]
offsets: 0 3 3 8 25
Grouped launch: block=(16,16), grid=(2,2,4)
```

使用 N=19、K=23 等非方形权重检查转置索引；前缀和不对齐 16 的用例检查拼接区间，空专家槽位检查权重编号是否被错误压缩。数据规模和随机种子沿用上一课测试记录。这一步尚未计时，不据此声称性能提升。

## 当前 masked 与调用入口实测（2026-10-16）

C500 上分别构建演示可执行文件和共享库成功。验证结果如下：

- 20 组成对场景，共 40 次运行：相同有效数据分别使用 contiguous 和 masked，逐专家计算误差、量化误差及打印的小矩阵结果一致，全部通过 CPU 参考检查。
- masked 对每个无效输出元素检查哨兵保持不变；覆盖空专家、全部有效行数为 0 但 capacity>0、capacity=0、1～64 个专家、M/N 尾部、K=1024、M=1/1024 的不均衡场景。10 组指定场景加 10 组随机组合，随机种子 20261016。
- 12 组非法命令行参数被拒绝，包括有效行数超过 capacity；4 组原 contiguous 用例与提交 `dc641e0` 的可执行文件比较，误差指标一致。
- 通过 ctypes 从 mcPyTorch 的真实 GPU 张量直接调用共享库，在非默认 stream 上验证两个 C 符号。没有经过演示 main 或 CPU 打包函数。
- 同一 masked 缓冲区依次使用长度 [3,0,7]、[0,5,1]、[7,7,7]、[0,0,0]，各次有效输出均匹配 NumPy INT64/FP64 参考，无效输出与本次调用前的 GPU 实际值逐位一致。
- 同一 contiguous 缓冲区依次使用偏移 [0,3,3,7]、[0,0,5,7]、[0,7,7,7]，均与独立 CPU 参考匹配。两类外部调用使用 [-128,127] 范围的随机 INT8 数据。
- 两个 C 接口均验证了零尺寸允许空指针的无操作路径，以及非零尺寸空指针、非法 G/N 的拒绝；另外验证 masked 的未对齐 scale、输出与输入重叠、capacity 超限被拒绝。

动态 padding 验证比较调用前后 GPU 输出的实际位模式；计算正确性才使用带容差的 CPU 参考，避免把正常浮点舍入差异混入“是否被改写”的检查。

当前接口有明确的教学尺寸上限，仍是朴素计算实现。没有声明 PyTorch 自动注册、autograd、图捕获、性能提升或项目精度验收已完成。


## 大尺寸教学阶段（2026-10-16）

目标调整为运行大尺寸 INT8 grouped GEMM，并继续以朴素实现作为正确性基线。

- 同时扩大 CLI、C 接口、kernel 元数据检查和 launch 行数覆盖范围。
- 数组索引和元素数量使用 64 位 `size_t`。必须先转换再相乘，例如 `size_t(group) * n * k`；仅把已经溢出的 INT32 结果赋给 64 位变量无效。
- offsets 和 masked_m 仍为 INT32，该阶段最多 64*65536 行，足够表示；后续自动拆批阶段扩至 4096*65536 行，仍在 INT32 范围内。
- K 上限为 32768；即使输入包含 -128，点积绝对值也不超过 `32768*128*128=536870912`，不会溢出 INT32。
- 保留 16x16 block、一线程一个输出元素、全量 INT64/FP64 CPU 对照。扩大范围不意味着已经达到高性能；大 M/N/K 同时出现时，GPU 朴素点积和 CPU 全量参考都可能耗时很长。

逐步运行：

```bash
bash build.sh
# 先扩大 M，保留空专家和不整齐尾部
./naive_gemm.out --tokens 1025,0,2049 17 23
./naive_gemm.out --masked 2051 --tokens 1025,0,2049 17 23
# 再扩大 N/K
./naive_gemm.out --tokens 16,0,23 4096 2048 --zero-edges
# 本地上游生成集合中的一条完整 masked case
./naive_gemm.out --masked 4096 --tokens 15,15,23,15,25,15 6144 7168
```

最后一条来自正式适配仓库 `c500_int8/benchmarks/upstream_shapes.json` 的 `masked_g6_m20_n6144_k7168`，固定 count_seed=20261015，尺寸来源为上游提交 `1fc9c66975ee322d628b3288534ca0e9ce12a64d` 的测试生成器。它是生成测试，不是模型实测路由。截至上述大尺寸扩展阶段，尚未添加 JSON 批量测试入口；后续批量测试见下节。


大尺寸验证记录（C500 16 GB 分片，MACA 3.7.1.5）：可执行文件与共享库均编译成功。

- 15 个运行场景通过：旧小尺寸、两种布局的 M=1025/2049、M=65536、独立 N=32768/K=32768、N=4096/K=2048、全空输入，以及下面两条大尺寸 case。全部有效元素逐个对照 CPU；masked padding 全量检查。
- 5 个非法参数被拒绝：M/capacity=65537、N/K=32769、有效 M 超过 capacity。
- `--masked 4096 --tokens 15,15,23,15,25,15 6144 7168`：663552 个有效输出，mismatches=0；150331392 个 padding 元素，padding_errors=0。
- `--tokens 2049,0,2051 2049 1025`：8400900 个有效输出，mismatches=0，包含空专家及 M/N/K 尾部。

额外通过 mcPyTorch + ctypes 调用两个 C 接口，G=3、N=K=32768，只有最后一个专家接收 1 行。B 共 3 GiB，最后一个专家起始偏移为 2147483648 字节；A 和该专家 B 全为 -128，scale=1，32768 个有效输出全部精确等于 536870912。masked capacity=1、lengths=[0,0,1]，前两个专家输出保留 -99；contiguous offsets=[0,0,0,1]。两次调用使用非默认 stream，验证 64 位权重偏移和 INT32 累加上限。

本次验证是正确性检查，包含 CPU 输入生成、量化、内存传输和 CPU 参考；运行总耗时不能作为 kernel 性能数据。


## shape 批量测试与性能基线（2026-10-16）

`shapes.json` 保存 24 组固定的上游生成尺寸：8 组 contiguous、16 组 masked。它完整复制正式适配仓库的 `c500_int8/benchmarks/upstream_shapes.json`，保留每组 counts、source、count_seed 和 capacity。不是甲方要求的真实模型 TP/EP 实测集合。

`bench_shapes.py` 通过 mcPyTorch 创建 GPU 张量，用 ctypes 调用本课共享库。Python 不参与 GEMM 计算。这里直接生成完整 [-128,127] 范围的随机 INT8 输入，A 行、B 通道 scale 为随机正数；测试不包含浮点输入量化过程。输入种子由总 seed 和 case 名称确定，与筛选或执行顺序无关。

```bash
cd /root/MOE/C500_int8_02All/01_naive_gemm
bash build.sh --shared
python ../benchmarks/bench_shapes.py --output reports/benchmark_rerun.json
# 中断后恢复；源码、共享库、shape 和计时参数须与已保存结果一致
python ../benchmarks/bench_shapes.py --output reports/benchmark_rerun.json --resume
# 只运行匹配的 case，另外保存结果
python ../benchmarks/bench_shapes.py --match masked_g6_m20 --output reports/selected_results.json
# 可指定预热次数、每批重复次数、计时批数、每专家校验数量
python ../benchmarks/bench_shapes.py --output reports/benchmark_rerun.json --warmup 1 --iterations 1 --rounds 5 --check-samples 128
```

计时与指标：

- C++ `moe_int8_benchmark` 是专门的同步测量入口；原来的两个计算入口保持异步。先预热并同步，然后用同一 stream 的 MACA Event 包围连续 iterations 次原生 grouped 调用，批耗时除以 iterations，重复 rounds 批。
- 默认预热 1 次、每批 1 次、测量 5 批，报告中位数、最小值、最大值及所有原始样本。输入和输出缓冲区复用，缓存处于预热后的状态；不是冷缓存测试。
- 不包含张量分配、输入生成、数据传输、CPU 校验和 MoE 路由；包含原生 launch 间隔，不能等同于 profiler 单个 kernel 的纯执行时间。
- 有效 INT8 TOPS = `2 * sum(counts) * N * K / (median_ms * 1e9)`，仅计算有效矩阵乘加。scale 乘法、padding 和空转 block 不计入有效操作数。
- `useful_block_fraction` 是按当前 16x16 网格推算的“至少含一个有效输出的 block 占比”，不是 GPU occupancy 或带宽利用率。无效 block 很快返回，因此不能把这个占比直接换算成可获得的加速倍数。
- JSON 保存设备、可见显存、测试前后 mx-smi、版本、源码/共享库/shape/脚本 SHA256、原始配置、输入种子、每轮耗时和校验结果。即使某个 case 失败，也保留已完成记录并最终返回非零退出码。

正确性检查与性能测量分开：每个专家选取最多约 128 个点，包括首尾、16x16 分块边界及固定随机点，与 CPU INT64 点积及 FP64 缩放对比，容差仍是 `1e-6 + 1e-5*abs(reference)`。小到不超过采样数量的专家检查全部输出。此外全量检查有效输出是否有限、masked padding 是否保持哨兵。报告中的 sampled PASS 表示抽样数值校验通过，不表示全量参考验证，也不表示通过项目的量化精度验收。

当前测试环境为 C500 16 GB、25% 算力配额的分片。该基线只能用于同一配额下的后续优化对比，不能直接代表整卡性能或换算 A100 达标比例。


解读结果时，case 名称中的 m 是生成规则的目标值，实际每专家 M 以 counts 为准，实际总行数为 T=sum(counts)。不同 case 的 counts 不同，因此不能仅凭两个布局的耗时比较布局优劣。测试集不包含路由极端倾斜的系统性扫描；空专家与边界由此前小规模验证覆盖。

本批测量建立同一朴素 kernel 的基线。单凭耗时与 TOPS 不能判断 memory-bound/compute-bound；后续需要 profiler 的实际访存流量、缓存命中和计算管线指标。尤其不能用逻辑输入输出字节数除以耗时，冒充实际显存带宽利用率。


批测工具自身验证：contiguous 和 masked 各运行 counts=[3,0,5]、N=19、K=23 的小例子，共 152 个有效输出全部对照 CPU；masked capacity=8 的填充检查通过。随后故意将首个输出写成 NaN，两种布局均被脚本识别为 FAIL（nonfinite 和 mismatches 均非零）。因此 PASS 来自实际校验，而非仅检查进程返回码。


为控制内存，批测默认每个 shape 启动独立 Python 子进程，进程启动不进入 GPU Event 计时。父进程不创建 GPU context，逐组写入结果；子进程异常退出会记录 ERROR。`--resume` 仅跳过已通过且源码、共享库、shape 哈希和计时/随机参数兼容的记录；失败项会重试。每条结果通过 run_index 指向实际采集环境和脚本版本，保留断点恢复前后的来源。

此项隔离源自实际故障：首次在同一进程连续运行时，前三组完成，第 4 组进程被系统 Killed；容器内存历史峰值达到 32 GiB，OOM kill 计数为 2。未取得内核日志权限，因此未将具体分配或运行时缓存认定为已证实的根因。独立进程用于限制跨 case 的资源累积。


### 24 组实测结果

原始数据见 [benchmark_results.json](../01_naive_gemm/reports/benchmark_results.json)。24/24 均为 sampled PASS：共 45056 个数值参考点通过，所有有效输出的有限值检查通过，所有 masked 填充区保持不变。此前小例子全量对照不替代这次大 shape 的抽样口径。

前 3 组保留首轮中断前的同参数结果；其余 21 组在独立进程中完成，来源可由 run_index 查到。测量使用同一个共享库、同一份 C++ 源码、相同数据生成规则及 warmup=1、iterations=1、rounds=5。所有 case 的五次样本相对极差 `(max-min)/median` 最大约为 1.35%。

T 是所有专家实际有效 M 的总和；每专家具体 counts 见 JSON。耗时为每次 grouped 调用的 GPU Event 中位数。

| 布局 | G | T | N×K | 中位耗时/ms | 有效 INT8 TOPS |
|---|---:|---:|---|---:|---:|
| contiguous | 4 | 34799 | 6144×7168 | 27955.5820 | 0.10964 |
| contiguous | 4 | 30790 | 7168×3072 | 12315.9404 | 0.11010 |
| contiguous | 4 | 36009 | 4096×4096 | 10978.1025 | 0.11006 |
| contiguous | 4 | 39001 | 4096×2048 | 5943.7803 | 0.11009 |
| contiguous | 8 | 31377 | 6144×7168 | 25130.1309 | 0.10998 |
| contiguous | 8 | 35282 | 7168×3072 | 14116.3750 | 0.11007 |
| contiguous | 8 | 32360 | 4096×4096 | 9862.9648 | 0.11009 |
| contiguous | 8 | 30988 | 4096×2048 | 4723.0054 | 0.11008 |
| masked | 32 | 6377 | 6144×7168 | 5110.8291 | 0.10990 |
| masked | 32 | 5959 | 7168×3072 | 2385.5005 | 0.11001 |
| masked | 32 | 6272 | 4096×4096 | 1914.2848 | 0.10994 |
| masked | 32 | 5627 | 4096×2048 | 859.2399 | 0.10987 |
| masked | 6 | 6546 | 6144×7168 | 5249.2559 | 0.10984 |
| masked | 6 | 6249 | 7168×3072 | 2500.8682 | 0.11004 |
| masked | 6 | 6017 | 4096×4096 | 1836.3008 | 0.10995 |
| masked | 6 | 7293 | 4096×2048 | 1112.1656 | 0.11002 |
| masked | 32 | 627 | 6144×7168 | 506.4090 | 0.10905 |
| masked | 32 | 626 | 7168×3072 | 252.7173 | 0.10909 |
| masked | 32 | 616 | 4096×4096 | 191.9055 | 0.10771 |
| masked | 32 | 598 | 4096×2048 | 93.7879 | 0.10697 |
| masked | 6 | 108 | 6144×7168 | 89.7357 | 0.10601 |
| masked | 6 | 117 | 7168×3072 | 48.2563 | 0.10678 |
| masked | 6 | 116 | 4096×4096 | 36.7977 | 0.10578 |
| masked | 6 | 103 | 4096×2048 | 17.3834 | 0.09941 |

解读：

- 8 组 contiguous 的吞吐量为约 0.1096～0.1101 TOPS，耗时差异主要对应有效计算量的差异。32/6 专家的中等 M masked 配置也约为 0.11 TOPS。
- 每专家约 20 个 token 时，吞吐量降至约 0.0994～0.1091 TOPS；最小 case 为 G=6、T=103、N=4096、K=2048，中位 17.3834 ms。这比约 0.11 TOPS 的大 M 基线低约一成，并非耗时短就一定效率高。
- 当前源码仍是一线程一个输出、普通 INT32 点积，没有显式使用硬件矩阵指令。这些数字是朴素实现的基线，不是 C500 的最佳 INT8 能力。
- 小 M 下并行度、尾部线程和无效 block 调度都可能影响效率，当前测试没有隔离这些因素的贡献；不得仅凭该表判定访存/计算瓶颈。
- 后续可以先做分块与数据复用，再以相同 shape、输入规则和计时范围复测；硬件矩阵指令作为下一阶段。保持本 JSON 作为基线，复测可用 `--output reports/benchmark_repeat.json` 保存另一份结果。

独立进程完成剩余 21 组后，容器 OOM kill 计数仍为 2，本次恢复阶段未出现新的 OOM kill。

断点恢复验证：相同参数恢复时跳过全部 24 个已通过 case；将 seed 改为 1 时拒绝恢复并返回非零，已有结果文件 SHA256 保持不变。普通可执行文件也重新编译，并通过 counts=[3,0,5] 的 masked 全量回归检查。

shape 哈希统一以 CRLF 转 LF 后的字节计算，避免 Git 换行转换误拒绝恢复；原始实测文件的字节哈希另存为 shapes_raw_sha256。本基线只补记了换行归一化元数据，配置、计时样本和校验结果均未修改。

## FLAME-MoE 路由片段接入（2026-10-16）

这一小步复用现有 kernel 和 `bench_shapes.py`，用真实路由记录生成每个专家的 M。
原来的 `shapes.json` 和 `benchmark_results.json` 保留独立基线。

### 输入到 shape 的过程

1. 从 [FLAME-MoE Routing Traces](https://huggingface.co/datasets/CMU-FLAME/FLAME-MoE-Traces)
   固定版本 `394919b1ce3b166ce364d6749ba35d3a04ea358e` 的
   `flame-moe-290m/actives/iter_5473/layer_02.parquet` 读取 `indices` 列。
2. 默认取从第 0 行开始的 16、128、1024、4096 个 token，四个窗口是嵌套前缀。
   每行含 6 个不同的专家编号；统计 64 个编号各自出现次数，就是 `counts[expert]`。
   因此 `sum(counts) = token_count * 6`，不是原始 token 数。
3. 官方模型配置为 hidden size=1024、专家 intermediate size=704、SwiGLU。
   本次采用 TP=1 的完整专家尺寸：FC1 将 gate/up 拼接，`N=1408,K=1024`；
   FC2 为 `N=1024,K=704`。FC1 和 FC2 是分别独立测试，未串联激活函数。
4. 两个 GEMM 均生成 contiguous 和 masked 配置，共 `4×2×2=16` 组。
   contiguous 用有效行紧密拼接；masked 的容量取 `ceil(max(counts)/16)*16`，
   这是本练习的容量规则，不是数据集中实测的容量，不丢弃 token。

模型尺寸依据固定提交
[`scripts/release/flame-moe-290m.sh`](https://github.com/cmu-flame/FLAME-MoE/blob/e9b2fe2df3f1abb8dbb9ec0eabde8cdfb65e5c78/scripts/release/flame-moe-290m.sh)
及 [`configs/model/flame-moe.sh`](https://github.com/cmu-flame/FLAME-MoE/blob/e9b2fe2df3f1abb8dbb9ec0eabde8cdfb65e5c78/configs/model/flame-moe.sh)。

| 原始 token 数 | 路由分配总数（sum M） | 最小 M | 最大 M | 空专家数 | masked 容量 |
|---:|---:|---:|---:|---:|---:|
| 16 | 96 | 0 | 14 | 44 | 16 |
| 128 | 768 | 0 | 66 | 7 | 80 |
| 1024 | 6144 | 37 | 221 | 0 | 224 |
| 4096 | 24576 | 247 | 592 | 0 | 592 |

### 范围与来源记录

- 这是单设备、64 个 routed experts 的尺寸重放（EP=1、TP=1），不重现原训练的批次和并行部署。
  官方发布脚本的 EP=8 不意味着本次测试进行了八卡通信。
- 真实数据只提供路由 `counts`。A、B 和 FP32 量化 scale 仍按现有脚本规则随机生成；
  路由文件的 `scores` 是门控概率，**不是量化 scale**。
- 不加载模型权重，不测试模型量化质量；不包含共享专家、dispatch/combine、激活或通信。
  四个窗口来自同一层、同一 checkpoint 的开头，不能代表整个数据集或甲方验收集合。
- 每个 case 保存 dataset revision、文件路径、token 行范围、片段 SHA256 和模型配置来源。
  片段 SHA256 对 token 顺序下的六个专家 ID 按 little-endian INT16 编码后计算。
  `file_sha256_from_lfs_metadata` 是上游 LFS 提供的整文件摘要；按需读取没有重新校验整个文件摘要。
- 提取程序通过 HTTP range 读取 Parquet 元数据和需要的列块；解码需要的 row group/列块可能比
  4096 行大，但不下载整套数据。HF/Arrow 需要可用网络；生成的 JSON 可离线用于 GPU 测试。

### 复现

在 Linux 的独立环境中生成 shape，避免改变 mcPyTorch 环境的依赖：

```bash
cd /root/MOE/C500_int8_02All/01_naive_gemm
python -m venv .venv
.venv/bin/python -m pip install 'pyarrow>=18' huggingface_hub
.venv/bin/python ../benchmarks/prepare_flame_shapes.py
```

这只需在重新提取路由时运行；仓库中已有生成好的 `shapes_flame.json`。
然后使用配置好 mcPyTorch 的 Python 运行 GPU 批测：

```bash
bash build.sh --shared
export LD_LIBRARY_PATH=/opt/maca/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}
python ../benchmarks/bench_shapes.py --shapes ../benchmarks/shapes_flame.json --output reports/benchmark_flame_rerun.json \
  --warmup 1 --iterations 1 --rounds 5
# 中断后按相同参数续跑
python ../benchmarks/bench_shapes.py --shapes ../benchmarks/shapes_flame.json --output reports/benchmark_flame_rerun.json --resume
```

正确性与计时沿用上一节的口径：每专家最多 128 个参考点（含边界），
全部有效输出检查有限值，masked 全部填充区检查未被写入；GPU Event 计时不含准备、路由提取和 CPU 校验。
不同 case 名称会派生不同随机输入种子，因此两种布局使用相同 counts 和尺寸，但不是逐元素相同的 A/B。

提取验证已覆盖手算 Top-6 计数、非法/重复专家编号、总分配数、16 组配置的实际批测 schema、
固定版本的重复生成一致性、非零起点跨 batch 的切片及越界拒绝。

### C500 实测结果

原始记录：[benchmark_flame_results.json](../01_naive_gemm/reports/benchmark_flame_results.json)。
本次使用原先的 C500 16 GB sGPU 实例，mx-smi 登记计算配额 25%，
mcPyTorch `2.8.0+metax3.7.1.3`；源码、共享库和批测脚本与上一轮保持一致。
配额不等于物理固定四分之一计算单元，结果不能乘四推算整卡性能。
每组独立进程运行，预热 1 次，测 5 次，取中位数；进程启动不计入 GPU Event。

16/16 组均为 sampled PASS，共 104,960 个 CPU INT64/FP64 参考点，
数值不匹配、非有限有效输出和 padding 错写均为 0。
masked 共检查 65,138,688 个填充元素。最大采样绝对误差约 `5.25e-5`，
全部满足前述 `atol=1e-6, rtol=1e-5` 的混合容差；这不是原始浮点模型的量化精度验收。

以下吞吐使用 **GOPS**（1 TOPS=1000 GOPS），按 `2*sum(M)*N*K` 计算有效工作量。

| 原始 token 数 | 阶段 | 布局 | 中位耗时 ms | GOPS |
|---:|---|---|---:|---:|
| 16 | fc1 | contiguous | 2.8849 | 95.96 |
| 16 | fc1 | masked | 2.9312 | 94.44 |
| 16 | fc2 | contiguous | 1.0982 | 126.03 |
| 16 | fc2 | masked | 1.0770 | 128.52 |
| 128 | fc1 | contiguous | 20.8276 | 106.33 |
| 128 | fc1 | masked | 20.6310 | 107.34 |
| 128 | fc2 | contiguous | 6.6537 | 166.42 |
| 128 | fc2 | masked | 6.6266 | 167.10 |
| 1024 | fc1 | contiguous | 161.6230 | 109.62 |
| 1024 | fc1 | masked | 161.5081 | 109.70 |
| 1024 | fc2 | contiguous | 46.8216 | 189.19 |
| 1024 | fc2 | masked | 46.8188 | 189.21 |
| 4096 | fc1 | contiguous | 644.5547 | 109.95 |
| 4096 | fc1 | masked | 644.2414 | 110.00 |
| 4096 | fc2 | contiguous | 184.1982 | 192.37 |
| 4096 | fc2 | masked | 184.7127 | 191.83 |

在这一组窗口中，同一 GEMM 阶段的吞吐随 token 数增加而提高，但 N/K 不同的 FC1、FC2
有不同水平；不能把所有 shape 概括成统一的 110 GOPS。
两种布局本轮的耗时接近；各组 `(最大耗时-最小耗时)/中位耗时` 最大约 6.28%，
不据此宣布某一种布局稳定领先。实际瓶颈及缓存/调度贡献仍需性能分析验证。

结果文件下载后已核对 SHA256；16 组配置与 shape 文件逐项一致，所有运行的
kernel 源码、共享库、批测脚本和 shape 摘要一致，吞吐公式和进程退出状态检查通过。

## 调用层自动拆批（2026-10-16）

两个公开 C 接口的签名、张量布局、scale 规则不变。`launch_grouped()` 先校验整个调用，
随后以 64 为步长遍历专家，在同一 stream 上提交各批。每批的 `grid.z` 为
`min(64, groups-group_base)`，两个 kernel 用 `group_base + blockIdx.z` 得到全局专家编号。

以 G=129 为例，三批分别为专家 `[0,64)`、`[64,128)`、`[128,129)`。
所有指针保持原值：contiguous 读取全局 `offsets[group]`，masked 读取
`masked_m[group]`，权重和 B_scale 也按全局 group 定位。因此不需要 CPU 读取 GPU offsets，
也不需要切片、拷贝或重新打包数据。全体专家数据仍需驻留显存；拆批本身不会降低权重显存占用。

当前 G=4096 是教学接口的安全边界，不是硬件限制。代码用静态断言保证
`4096*65536` 可由 INT32 offsets 表示。Python 配置检查和命令行解析同步支持此范围。
`bench_shapes.py` 的一次计时调用现在包含全部批次，并记录 `kernel_launches_per_call`。
旧性能报告继续保留原提交的实测意义；本次没有重新跑大 shape 性能，旧报告也不能用新源码直接 `--resume`。

### 快速正确性验证

C500 上重新编译普通程序和共享库，原始记录在
[batching_correctness_results.json](../01_naive_gemm/reports/batching_correctness_results.json)。

- 26 组普通程序用例全部通过全量 CPU INT64/FP64 参考和 masked 填充检查。
  覆盖 G=1/63/64/65/128/129/384、4096 专家的稀疏输入、首/中/末整批为空、
  全空零容量、全空正容量及旧的双专家命令行。M 包含 17，N=19、K=23，验证尾部边界。
- 18 项 C 接口检查确认合法 G 的零工作调用成功，G=-1/0/4097/INT_MAX 被拒绝。
  CLI 拒绝 4097 个专家；Python schema 接受 64/65/384/4096，拒绝 0/4097。
- 两种布局分别通过 G=129 的共享库计时入口测试，包含跨批的专家 63/64、127/128，
  均为全量数值参考。这里的单轮计时只验证入口可用，不作为性能结论。
- 合计全量核对 168,350 个有效输出和 441,276 个 masked 填充元素，错误数均为 0。
  启动数按调度循环/程序摘要核对：G=65 为 2 次、129 为 3 次、384 为 6 次，
  非零容量的 G=4096 为 64 次；本轮未使用 profiler 统计启动次数。

在服务器复现普通程序的 26 组小尺寸用例：

```bash
cd /root/MOE/C500_int8_02All/01_naive_gemm
bash build.sh
bash build.sh --shared
export LD_LIBRARY_PATH=/opt/maca/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}
python - <<'PY'
import json, re, subprocess
cases = json.load(open('reports/batching_correctness_results.json'))['results']
for case in cases:
    command = ['./naive_gemm.out']
    if case['layout'] == 'masked':
        command += ['--masked', str(case['capacity'])]
    if case['name'] == 'legacy_two_expert_cli':
        command += ['3', '5']
    else:
        command += ['--tokens', ','.join(map(str, case['counts']))]
    command += [str(case['n']), str(case['k']), '--zero-edges']
    out = subprocess.check_output(command, text=True)
    assert 'Grouped result: PASS' in out and 'FAIL' not in out
    assert sum(map(int, re.findall(r'checked_elements=(\d+)', out))) == case['checked_elements']
    assert f"GEMM kernel launches={case['kernel_launches']}\n" in out
    if case['layout'] == 'masked':
        assert f"padding_checked={case['padding_checked']}, padding_errors=0" in out
    print(case['name'], case['layout'], 'PASS')
PY
```


## 优化前固定性能基线（2026-10-16）

测量版本为 `bb0f39b`：已支持每次最多 64 组的自动拆批，计算仍是朴素 INT8 点积。
本次不修改 `naive_gemm.cpp`、`bench_shapes.py` 或构建参数，保留原始实现供后续优化对照。
配置见 [baseline_shapes_2026-10-16.json](../benchmarks/baseline_shapes_2026-10-16.json)，
原始测量见 [baseline_results_2026-10-16.json](../01_naive_gemm/reports/baseline_results_2026-10-16.json)。

### 固定的 7 个 case

- 从 `shapes_flame.json` 原样选取 T=16、T=4096 的 FC1，两种布局，共 4 个。
  T 是路由前 token 数；Top-6 后总专家输入行数分别为 96 和 24576。
  专家数为 64，N=1408、K=1024；保留原路由来源、模型尺寸和版本信息。
- 从 `shapes.json` 原样选取 `contiguous_g4_m8192_n4096_k2048`，
  4 个专家的有效 M 为 8944～10625，总行数 39001。这是上游生成测试，不是实测模型分片。
- 两个合成拆批 case：G=129、N=257、K=259，分别使用 contiguous/masked。
  counts 为 `[0,1,3,17,2]` 重复后取前 129 项，再将下标 63、64、127、128 改为 17；
  总行数 625，masked capacity=19。它们覆盖空专家、三次 kernel 启动和 M/N/K 尾部，
  不宣称来自实际模型。配置中的 counts 已完整保存。

### 计时与复现

实际设备为 C500 16 GB 切分实例（sGPU Compute=25%），不能将测量值当作完整 C500 的峰值性能。
每个 case 使用独立进程释放运行时资源；进程启动和数据准备不计时。
在同一 stream、相同缓冲区上预热 3 次，每轮调用 2 次，测量 7 轮；
MACA event 得到每轮总时间后除以 2，报告 7 个单次调用均值的中位数。
计时包含 INT8 GEMM、FP32 缩放写回、自动拆批以及计时区间内的原生提交间隙；
不包含量化、路由、输入生成、传输、CPU 参考或完整 MoE。
129 专家的单次接口调用包含 3 次 kernel 启动，整次调用一起计时。

```bash
cd /root/MOE/C500_int8_02All/01_naive_gemm
bash build.sh --shared
export LD_LIBRARY_PATH=/opt/maca/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}
python ../benchmarks/bench_shapes.py \
  --shapes ../benchmarks/baseline_shapes_2026-10-16.json \
  --output reports/baseline_rerun.json \
  --warmup 3 --iterations 2 --rounds 7 --check-samples 256 --seed 20261016
```

基线报告保留不覆盖；复测使用另一个输出文件。
随机输入由 seed 和完整 case 名共同决定，后续优化必须保留配置、名称和 seed，
并核对生成输入的环境。不同布局的 case 名不同，随机矩阵也不同；本表不用于严格证明布局优劣。
吞吐量按有效工作量 `2 * sum(counts) * N * K` 计算，不把 padding 或空块算成有用运算。

每个非空专家抽查最多 256 个输出，使用 CPU INT64 点积和 FP64 缩放参考，
容差为 `atol=1e-6, rtol=1e-5`；另全量检查有效输出是否有限，以及 masked padding 是否保持原值。
这是量化后算术正确性检查，不是原浮点模型的量化误差验收。
报告同时保留源码、共享库、计时程序和配置哈希、原始耗时、设备信息及输入 seed。
后续若更改计时方法或运行环境，应重新测量朴素版和优化版后再比较。

### 实测结果

7/7 case 均通过；CPU 抽样核对 96,768 个输出，全部有效输出共 229,545,698 个做有限值检查，
masked padding 共 20,519,202 个元素全量检查，错误数均为 0。最大抽样绝对误差为
`4.3852377302755485e-05`，所有点均满足上述绝对加相对容差。

| Case | 专家数 | 每专家有效 M 范围 | N×K | 中位耗时 ms | 有效 GOPS | 轮间极差/中位数 |
|---|---:|---:|---:|---:|---:|---:|
| FLAME T=16 / contiguous | 64 | 0～14 | 1408×1024 | 2.9111 | 95.09 | 4.947% |
| FLAME T=16 / masked | 64 | 0～14 | 1408×1024 | 2.9015 | 95.41 | 4.919% |
| FLAME T=4096 / contiguous | 64 | 247～592 | 1408×1024 | 644.6367 | 109.93 | 0.038% |
| FLAME T=4096 / masked | 64 | 247～592 | 1408×1024 | 644.2812 | 109.99 | 0.011% |
| 上游大 M / contiguous | 4 | 8944～10625 | 4096×2048 | 5943.8340 | 110.09 | 0.001% |
| 合成 G=129 / contiguous | 129 | 0～17 | 257×259 | 0.9162 | 90.81 | 9.695% |
| 合成 G=129 / masked | 129 | 0～17 | 257×259 | 0.8086 | 102.90 | 6.475% |

轮间极差不是置信区间。小 case 的波动最高约 9.7%，接近这个范围的性能差异需要追加测量；
本轮只建立基线，不宣称某种布局稳定更快，也未测带宽利用率或确定 memory/compute bound。
报告中的 useful_block_fraction 来自启动网格与有效行数，是几何计数，不是 GPU 利用率。

后续第一项优化为共享内存分块复用，先保持接口、两种布局、缩放和边界规则不变，
再用这 7 个配置逐项对照。原始性能报告保留本轮 7 组各 7 个耗时样本，测量时源码提交为
`bb0f39be7c6a609f23c3ab70661039ed84ada569`。本次归档提交仅增加配置、报告和文档。


## 共享内存版新增记录（2026-10-20）

## 如何查看朴素版到共享内存版的修改

为便于逐行学习，追加一个教学起点提交 `1d01af3`：`shared_gemm.cpp` 与朴素源码完全相同。
随后在同一文件加入共享内存优化，保留 CPU 演示、量化、公共 C 接口和 event 计时代码。
主要 diff 仅涉及 tile 常量、两个朴素 kernel 合并为模板共享 kernel、启动配置和 kernel 调用。

在 GitHub 查看紧随 `1d01af3` 的优化提交，并选择 `02_shared_gemm/shared_gemm.cpp`；
本地也可运行（源码优化提交为 `e96d5ea`）：

```bash
git diff 1d01af3 e96d5ea -- 02_shared_gemm/shared_gemm.cpp
```

这是追加教学历史，没有改写原有提交。后续优化继续修改同一份源码。
README 也从原样复制的朴素文档提交 `57fa4e3` 开始增量修改，保留布局、接口、数值规则和历史记录。
可用 `git diff --find-renames 57fa4e3 HEAD -- 02_shared_gemm/README.md 02_optimized_gemm/README.md` 查看文档修改。
本次文档整理未改动计算代码；上文 ctypes 最小例子已在 C500 上验证有效输出为 5、padding 保持 -99。

本次两份源码均在 C500 上重新构建，分别通过 45 组全量参考、20 项 API 检查及 8 组原始输入检查：

- `naive_copy_correctness_2026-10-20.json`：原样复制的朴素实现。
- `shared_incremental_correctness_2026-10-20.json`：在朴素源码上增量修改的共享内存实现。

本次整理没有重跑 7 个大尺寸性能 case。下方性能表及原有 `shared_results`、`shared_correctness`
报告仍对应历史实现 `5500e78` 的源码与二进制哈希；不代表本次整理后的二进制重新测量值。
当前计算 kernel 与该历史共享版相同，新增保留的主要是 CPU 演示及其头文件；最新正确性以新增报告为准。

## 固定性能对照

先编译两份库。使用完全相同的 7 个 case、case 名、随机种子和计时参数，分别写入不同报告：

```bash
cd /root/MOE/C500_int8_02All
bash 01_naive_gemm/build.sh --shared
bash 02_optimized_gemm/build.sh
export LD_LIBRARY_PATH=/opt/maca/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}
python benchmarks/bench_shapes.py \
  --shapes benchmarks/baseline_shapes_2026-10-16.json \
  --output 01_naive_gemm/reports/naive_rerun.json \
  --warmup 3 --iterations 2 --rounds 7 --check-samples 256 --seed 20261016
python benchmarks/bench_shapes.py \
  --shapes benchmarks/baseline_shapes_2026-10-16.json \
  --library 02_optimized_gemm/libmoe_int8_shared.so \
  --source 02_optimized_gemm/optimized_gemm.cpp \
  --output 02_optimized_gemm/reports/shared_rerun.json \
  --warmup 3 --iterations 2 --rounds 7 --check-samples 256 --seed 20261016
```

每个 case 独立进程，计时为预热 3 次后，7 轮中每轮 2 次调用的单次平均耗时，再取中位数。
GPU event 区间包含 GEMM、缩放、拆批及原生提交间隙，不含数据生成、量化、路由、拷贝或 CPU 验证。
对照只能说明当前切分实例上的这一改动，不是完整 fused MoE 或甲方验收结果。
不同布局使用不同 case 名，随机输入不同，不能据此严格证明布局优劣。

`bench_shapes.py` 新增 `--library` 和 `--source`；默认仍使用第一课的库和源码。
子进程继承所选路径；报告记录选中的源码和库哈希。resume 还检查计时脚本哈希，
拒绝混合不同版本的测试程序。朴素源码及 2026-10-16 原始基线报告不变。
当前两种实现的 M/N tile 都为 16，脚本中按 16 统计的网格块数仍适用；将来改变 tile 时需要同步更新统计。


## 正确性检查与复现

本次完整脚本见下方，包含 45 组全量 CPU INT64/FP64 参考、20 项接口边界检查，
以及 8 组原始全范围/零输入和 GPU 元数据复用检查。未使用上述性能采样来替代小尺寸全量检查。
M/N 覆盖 1、15、16、17、31、32、33，K 覆盖 1、31、32、33、63、64、65、259、32768。
专家数覆盖 65/129/384，包含整批为空、全空且容量非零、跨批边界及 masked padding。
API 检查另包含 G=4096 的零工作调用和非法 G；本轮没有新增 G=4096 的非零工作全量测试。

<details>
<summary>展开：完整正确性脚本（在 C500 上执行，复测另存报告）</summary>

```bash
export LD_LIBRARY_PATH=/opt/maca/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}
python - <<'PY'
import argparse,ctypes,datetime,hashlib,importlib.util,json,sys
from pathlib import Path
import torch
root=Path('/root/MOE/C500_int8_02All')
out=root/'02_optimized_gemm/reports/shared_correctness_rerun.json'
spec=importlib.util.spec_from_file_location('bench',root/'benchmarks/bench_shapes.py')
bench=importlib.util.module_from_spec(spec);spec.loader.exec_module(bench)
torch.cuda.set_device(0)
lib=ctypes.CDLL(str(root/'02_optimized_gemm/libmoe_int8_shared.so'))
fn=lib.moe_int8_benchmark
fn.argtypes=[ctypes.c_void_p]*6+[ctypes.c_int]*4+[ctypes.c_void_p]+[ctypes.c_int]*4+[ctypes.POINTER(ctypes.c_float)]
fn.restype=ctypes.c_int
args=argparse.Namespace(warmup=0,iterations=1,rounds=1,check_samples=65536,seed=20261020)
cases=[]
def pair(name,counts,n,k,cap):
 for layout in ('contiguous','masked'):
  c=dict(name=name+'_'+layout,layout=layout,counts=counts,n=n,k=k)
  if layout=='masked':c['capacity']=cap
  cases.append(c)
for k in (1,31,32,33,63,64,65,259):
 pair('k_boundary_'+str(k),[0,1,3,17,5],19,k,19)
for n in (1,15,16,17,31,32,33):
 pair('mn_boundary_'+str(n),[1,15,16,17,31,32,33],n,33,35)
for g in (65,129,384):
 counts=([0,1,3,17,2]*((g+4)//5))[:g]
 for i in (63,64,127,128,g-1):
  if i<g:counts[i]=17
 pair('split_'+str(g),counts,19,33,19)
pair('empty_first_batch',[0]*64+[3]*64+[17],19,33,19)
pair('empty_middle_batch',[3]+[0]*127+[17],19,33,19)
pair('empty_last_batch',[3]*128+[0],19,33,19)
pair('max_k',[1,0,3],3,32768,5)
cases.append(dict(name='all_empty_positive_capacity',layout='masked',counts=[0]*129,n=19,k=33,capacity=19))
report=dict(timestamp_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),scope='full CPU INT64/FP64 references; all finite outputs and unchanged masked padding; nondefault streams; no timing claims',torch_version=torch.__version__,source_sha256=hashlib.sha256((root/'02_optimized_gemm/optimized_gemm.cpp').read_bytes()).hexdigest(),library_sha256=hashlib.sha256((root/'02_optimized_gemm/libmoe_int8_shared.so').read_bytes()).hexdigest(),harness_sha256=hashlib.sha256((root/'benchmarks/bench_shapes.py').read_bytes()).hexdigest(),results=[],api_checks=[],raw_checks=[])
def save():out.write_text(json.dumps(report,indent=2,allow_nan=False)+'\n')
for i,c in enumerate(cases):
 bench.validate_case(c)
 r=bench.run_case(c,fn,args);report['results'].append(r);save()
 assert r['status']=='PASS' and r['reference_mode']=='full',r
 print(i+1,len(cases),c['name'],'PASS',r['checked_elements'],flush=True)
for name in ('moe_int8_contiguous','moe_int8_masked'):
 api=getattr(lib,name);api.argtypes=[ctypes.c_void_p]*6+[ctypes.c_int]*4+[ctypes.c_void_p];api.restype=ctypes.c_int
 for g in (-1,0,1,64,65,384,4096,4097,2147483647):
  rc=api(*([None]*6),g,0,19,33,None)
  assert (rc==0)==(1<=g<=4096),(name,g,rc)
  report['api_checks'].append(dict(api=name,groups=g,rows=0,status=rc))
 rc=api(*([None]*6),1,1,19,33,None);assert rc!=0
 report['api_checks'].append(dict(api=name,groups=1,rows=1,null_buffers=True,status=rc))
# Raw full-range and zero data: exact powers-of-two scales; valid zeros must be written.
stream=torch.cuda.Stream()
for layout in ('contiguous','masked'):
 api=getattr(lib,'moe_int8_'+layout)
 for av,bv,k in ((-128,-128,32768),(-128,127,32768),(0,127,33)):
  with torch.cuda.stream(stream):
   counts=[1,0,3];g=3;n=3;cap=5;total=4;rows=cap if layout=='masked' else total
   physical=g*rows if layout=='masked' else rows
   a=torch.full((physical,k),av,dtype=torch.int8,device='cuda')
   b=torch.full((g,n,k),bv,dtype=torch.int8,device='cuda')
   sa=torch.full((physical,),.5,device='cuda');sb=torch.full((g,n),.25,device='cuda')
   c=torch.full((physical,n),bench.SENTINEL,device='cuda')
   meta=torch.tensor(counts if layout=='masked' else [0,1,1,4],dtype=torch.int32,device='cuda')
   status=api(*(v.data_ptr() for v in (a,b,sa,sb,meta,c)),g,rows,n,k,stream.cuda_stream);assert status==0
  stream.synchronize()
  expected=c.cpu().numpy();checked=padding=0
  for e,m in enumerate(counts):
   start=e*cap if layout=='masked' else (0,1,1)[e]
   assert (expected[start:start+m]==float(av*bv*k)*.125).all()
   checked+=m*n
   if layout=='masked':
    assert (expected[start+m:start+cap]==bench.SENTINEL).all()
    padding+=(cap-m)*n
  report['raw_checks'].append(dict(layout=layout,a=av,b=bv,k=k,checked_elements=checked,padding_checked=padding,status='PASS'))
# Change lengths on the same GPU metadata buffer between calls.
with torch.cuda.stream(stream):
 g=129;cap=19;n=3;k=5
 a=torch.ones((g*cap,k),dtype=torch.int8,device='cuda')
 b=torch.ones((g,n,k),dtype=torch.int8,device='cuda')
 sa=torch.ones(g*cap,device='cuda');sb=torch.ones((g,n),device='cuda')
 c=torch.full((g*cap,n),bench.SENTINEL,device='cuda')
 meta=torch.zeros(g,dtype=torch.int32,device='cuda')
 for active in ((0,63,64,128),(1,62,65,127)):
  c.fill_(bench.SENTINEL);meta.zero_()
  meta[list(active)]=17
  status=lib.moe_int8_masked(*(v.data_ptr() for v in (a,b,sa,sb,meta,c)),g,cap,n,k,stream.cuda_stream);assert status==0
  stream.synchronize()
  valid=(torch.arange(cap,device='cuda')[None,:]<meta[:,None]).reshape(-1)
  assert bool((c[valid]==5).all().item()) and bool((c[~valid]==bench.SENTINEL).all().item())
  report['raw_checks'].append(dict(name='metadata_reuse',active_experts=list(active),checked_elements=int(valid.sum().item())*n,padding_checked=int((~valid).sum().item())*n,status='PASS'))
report['status']='PASS';save()
print('ALL_PASS',len(cases),len(report['api_checks']),len(report['raw_checks']),flush=True)
PY
```

</details>



### 本轮正确性结果

[shared_correctness_2026-10-20.json](reports/shared_correctness_2026-10-20.json) 中 45 组全量参考、
20 项接口检查、8 项极值和元数据复用检查全部通过。
合计全量参考检查 177,758 个有效输出，检查 370,702 个 masked padding 元素，错误数为 0。
45 组随机全量参考的最大绝对误差为 `3.125993680441752e-05`，均满足 `atol=1e-6, rtol=1e-5`。
原始输入包含整个 INT8 区间；额外检查 `-128×-128`、`-128×127` 在 K=32768 时的累加，
以及有效结果应为零时是否确实写回。两次原地修改 GPU masked_m 后重新调用的检查均通过。
这些检查验证量化后算术和数据布局，不是与原始浮点模型对照的量化质量验收。

## 2026-10-20 性能对比

本轮在同一 C500 16 GB、25% 计算配额实例上分别重新编译并测量两份库。
两份实现各 7/7 case 通过数值抽查、全量有限值和 masked padding 检查。
每份报告抽查 96,768 个有效输出，检查 20,519,202 个 padding 元素，错误数均为 0。

| Case | 朴素版 ms | 共享版 ms | 加速比 | 共享版有效 TOPS |
|---|---:|---:|---:|---:|
| FLAME T=16 / contiguous | 2.8823 | 0.4797 | 6.01× | 0.5770 |
| FLAME T=16 / masked | 2.8884 | 0.4431 | 6.52× | 0.6247 |
| FLAME T=4096 / contiguous | 644.5789 | 57.0001 | 11.31× | 1.2433 |
| FLAME T=4096 / masked | 644.2264 | 30.0096 | 21.47× | 2.3615 |
| 上游大 M / contiguous | 5943.4121 | 287.4504 | 20.68× | 2.2763 |
| 合成 G=129 / contiguous | 0.9147 | 0.3960 | 2.31× | 0.2101 |
| 合成 G=129 / masked | 0.8142 | 0.2364 | 3.44× | 0.3519 |

加速比是本轮朴素版中位耗时除以共享版中位耗时，没有使用旧报告直接计算。
共享版轮间极差/中位数最高为 9.47%，朴素版最高为 8.93%；这里不是置信区间。

原始记录：

- [朴素版复测](reports/naive_results_2026-10-20.json)
- [共享版测量](reports/shared_results_2026-10-20.json)
- [逐 case 对照与原始报告哈希](reports/comparison_2026-10-20.json)

已核对两份报告的 case、输入 seed、参数、设备和计时程序哈希；每个 worker 的源码/库哈希与控制器一致。
库与源码哈希分别标识文件，构建关联依靠先从对应源码执行上述 build.sh；本轮确实重新构建后运行。
性能测试和全部正确性测试使用的共享库哈希一致。报告中的 git_head 为测量时的提交，
应同时结合 source_sha256 和 library_sha256 识别工作区内的新实现。

仍保留统一网格上界和 64 专家拆批，因此无效 block 的调度开销未被移除。
共享版较大 M 的 contiguous/masked 耗时差异值得后续分析，但本轮未做 profiler 归因或布局优劣的严格对照。
本轮未使用硬件矩阵指令、异步流水线或 profiler；未测带宽利用率，不宣称达到甲方 fused MoE 验收目标。

测试入口的 resume 补充检查通过：相同实现可保留全部 7 项 PASS；旧计时脚本哈希和不同源码哈希均被拒绝，未重新执行 GPU 测量。


## 目录与报告归档后的调用检查（2026-10-20）

源码改名及报告移动后，本实现通过 contiguous/masked 两个 G=129 尾部 case。
[本次检查报告](reports/reorganization_check_2026-10-20.json) 记录实际源码、库及测试脚本哈希。
本轮 warmup=0、iterations=1、rounds=1，仅验证路径及调用可用，不作为新的性能基线。


## INT8 向量加载（2026-10-20）

本阶段直接在共享内存版上修改，比较起点是提交 `23528c1`，不是第一课朴素版。
原来的加载已经沿连续 K 方向组织线程；这次继续组织加载线程，让符合条件的输入
从逐字节读取变为一次读取连续四个 INT8。输出仍是一线程一个元素，计算、共享内存布局、
同步点、scale、contiguous/masked 约定和超过 64 个专家的拆批方式都保持原样。

### 加载映射与尾部

`BLOCK_M=16, BLOCK_N=16, BLOCK_K=32`，256 个线程合作加载 A/B 共 1024 字节。
前 128 个线程加载 A，后 128 个加载 B；每个线程读一个 32 位字，拆成四个 INT8，
写入原来的共享内存 tile。B 仍从 `[G,N,K]` 转置到共享内存 `[K,N]`。

| 线性线程 tid | 加载的相对位置 | 一次读取的 K 位置 |
|---:|---|---|
| 0 | A 第 0 行 | 0～3 |
| 1 | A 第 0 行 | 4～7 |
| 8 | A 第 1 行 | 0～3 |
| 128 | B 第 0 行 | 0～3 |
| 136 | B 第 1 行 | 0～3 |

主机调用层仅在 `K % 4 == 0` 且 A、B 地址都满足 4 字节对齐时选择向量特化。
因为每行跨度为 K 字节，这也保证后续行及专家起点的对齐。M、N 不需要是 4 或 16 的倍数。
不满足条件时选择保留原代码的标量特化，不要求调用者重新分配或 padding。

例如 K=36，第二个 K tile 从 32 开始：只有相对 K=0 的四字节包读取全局位置 32～35；
其他包不读全局内存，在共享内存中写零。M/N 越界行同样不读取；无效输出不写回，
masked 的未使用容量保持原值。K=259 则整次调用使用原来的逐字节加载和尾部判断。
这是计算 tile 内补零，没有扩大 A/B 的显存尺寸。

`load_int8x4` 使用 MACA Clang 的 `__may_alias__` 类型扩展进行对齐的 `uint32_t` 读取，
避免把普通 `uint32_t*` 转换误当成可移植的别名规则。编译时检查小端字节序，
再按低到高字节拆包；另有静态断言保护当前“一线程一个四字节包”的 tile/线程映射。
修改 tile 大小时必须重新检查这套映射，不能只改常量。

完整 tile 的源码输入加载从 1024 次字节读取变成 256 次四字节读取，读取的有效字节数仍为 1024。
这不意味着 HBM 流量减少四倍。共享内存写入和标量乘加仍有开销，本阶段没有加入矩阵指令、
寄存器分块或访存计算流水线。
[编译器 IR 摘录](reports/vector_codegen_2026-10-20.txt) 确认向量路径出现
`load i32 ... align 4`，回退路径保留 `load i8`；这不是硬件带宽或事务计数证据。

### 向量阶段验证

- [59 组全量 CPU 参考、20 项接口和 8 项原始数据检查](reports/vector_correctness_2026-10-20.json) 全部通过。
  覆盖两种布局、空专家、全空批次、M/N/K 尾部、K=4/28/36/60、K=32768、G=65/129/384、
  INT8 极值、零输出，以及同一 GPU 元数据缓冲区原地修改后复用。
- [12 项地址偏移检查](reports/vector_alignment_checks_2026-10-20.json) 全部通过。
  两种布局分别检查 A/B 字节偏移 `(0,0)、(1,0)、(0,1)、(1,1)、(2,3)、(3,2)`；
  所有有效输出与 CPU 参考一致，全部输出与共享内存基线逐位一致，未使用容量保持哨兵值。
- 上述数值检查共检查 287,730 个有效输出和 540,258 个 masked padding 元素，错误数为零。
  59 组随机参考最大绝对误差为 `3.125993680441752e-05`，满足 `atol=1e-6, rtol=1e-5`。

这里验证已经量化的 INT8 算术与接口；没有评估原始浮点模型量化后的误差。
G=4096 的零行接口检查通过，最大专家数的非零大矩阵组合没有穷举。

### 向量阶段性能对照

同一 C500 16 GB、25% 计算配额实例上，重新编译共享内存基线和当前实现，
使用同一套固定 7 case、seed 和公共测试程序。每个 case 用独立进程同时加载两份库，
按“共享→向量→向量→共享”测量。每次运行 warmup=3、iterations=2、rounds=7，
每版合计 14 个单次调用平均值，以其中位数计算加速比。每次运行都检查自己的输出。
这次采用交替对照以减少顺序漂移；不能拿本表直接与旧的独立进程报告拼接计算加速比。

| Case | 共享内存基线 ms | 当前实现 ms | 基线/当前 | 实际加载路径 |
|---|---:|---:|---:|---|
| FLAME T=16 / contiguous | 0.4817 | 0.4012 | 1.201× | INT8x4 |
| FLAME T=16 / masked | 0.4440 | 0.3643 | 1.219× | INT8x4 |
| FLAME T=4096 / contiguous | 57.4618 | 52.1081 | 1.103× | INT8x4 |
| FLAME T=4096 / masked | 30.0153 | 24.8444 | 1.208× | INT8x4 |
| 上游大 M / contiguous | 292.7910 | 232.4603 | 1.260× | INT8x4 |
| G=129、K=259 / contiguous | 0.3972 | 0.5480 | 0.725× | 标量回退 |
| G=129、K=259 / masked | 0.2273 | 0.2304 | 0.987× | 标量回退 |

5 个走 INT8x4 路径的 case 加速为 1.10～1.26 倍；这个收益相对共享内存版。
FLAME 的路由片段和上游生成 case 的来源保持原样，仍然只是 grouped GEMM 测试。
两种布局的网格空块数量不同，不能用表中耗时直接断言布局优劣。

两个 K=259 case 走标量回退。尤其 contiguous 的向量库两轮测量出现约 0.70 与 0.40 ms
两簇数据，使合并中位数约为 0.55 ms、加速比低于 1，不能把它当成“性能保持不变”。
[加长预热与计时批次后的复查](reports/vector_fallback_followup_2026-10-20.json)
仍观察到波动或退化，故保留原始测量并继续记录风险。
后续同一批显存缓冲区交替测量的结果见
[固定缓冲区诊断](reports/vector_same_buffers_2026-10-20.json)。


固定缓冲区诊断先完成数据准备，再让两份库使用相同的 A/B/scale/元数据和输出地址，
按 ABBA、BAAB 共 8 次交替调用；warmup=50、iterations=50、rounds=15。
每版合计 60 个计时样本，contiguous 的中位数为基线 0.377953 ms、当前 0.377917 ms（1.000×）；
masked 为 0.221501 ms、0.220032 ms（1.007×）。该诊断只测计时，数值验证由前述全量测试覆盖。
固定地址下没有重现明显退化，但仍不能据此认定分配地址是波动的唯一原因，
也不能删除重新分配输入时测得的慢样本。对回退路径不承诺稳定加速，后续可用 profiler 继续定位。

原始 [7 case 对照报告](reports/vector_comparison_2026-10-20.json) 保存所有样本、case、
seed、环境以及源码/库/脚本哈希；7/7 case 的数值抽查、全量有限值及 padding 检查通过。
性能测试是 MACA event 范围内的一次 grouped GEMM 调用（包含各拆批 kernel 及其间可能的间隙），
不包括量化、路由、CPU 检查和数据生成。数值 PASS 不表示达到性能目标。
没有实测硬件带宽利用率、没有 A100 同口径对照，也没有 fused MoE 端到端吞吐。

早期探索测量曾有 worker 以 -9 退出，另有一次候选加载只保留了 IR 的 align 1；
它们没有混入本表。最终候选重新执行全部数值检查及 7 case 对照，使用相同源码和库哈希。
探索产物保留在 C500 工作目录的 `build/vector_attempt1/`，不把 -9 无证据地归因为 GPU 或内存故障。

### 向量阶段复现

在 C500 仓库根目录先构建原共享内存基线和当前版本：

```bash
mkdir -p /tmp/moe_vector_baseline_2026_10_20
git archive 23528c1456bd1ec6c710816cdf425624d67356c0 \
  02_optimized_gemm/optimized_gemm.cpp 02_optimized_gemm/build.sh \
  | tar -x -C /tmp/moe_vector_baseline_2026_10_20
bash /tmp/moe_vector_baseline_2026_10_20/02_optimized_gemm/build.sh
bash 02_optimized_gemm/build.sh
```

三份新报告保存了实际执行的驱动脚本。以下提取脚本并改用新输出名，避免覆盖已归档结果。
按顺序运行，避免同时执行多个 GPU 性能测试。它们沿用本实例的绝对工作目录和基线路径。

```bash
python - <<'PY'
import json
from pathlib import Path
for kind in ('correctness', 'alignment_checks', 'comparison'):
    name = 'vector_' + kind + '_2026-10-20'
    report = Path('02_optimized_gemm/reports') / (name + '.json')
    script = json.loads(report.read_text())['reproduction_script']
    script = script.replace(name + '.json', name + '_rerun.json')
    Path('/tmp/' + name + '_rerun.py').write_text(script)
PY
python /tmp/vector_correctness_2026-10-20_rerun.py
python /tmp/vector_alignment_checks_2026-10-20_rerun.py
python /tmp/vector_comparison_2026-10-20_rerun.py
```

源码仍在 `optimized_gemm.cpp` 中：先读 `load_int8x4`，再读 `if constexpr (Vectorized)`，
最后读 `launch_grouped` 的对齐判断。用本阶段提交相对 `23528c1` 的 diff 即可看到完整增量。
