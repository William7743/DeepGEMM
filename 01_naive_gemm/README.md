# INT8 grouped GEMM：contiguous / masked 与调用入口

本课为两种布局提供独立的 C 调用入口。kernel 仍是朴素 INT8 点积、INT32 累加和 FP32 缩放输出，尚未使用硬件矩阵指令。

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

- G 为 1～64，N/K 为 1～32768，每专家 M 为 0～65536；masked capacity 为 0～65536；contiguous T 为 0～G*65536。尺寸在范围内仍须有足够的主机内存和显存，不保证所有上限的组合都能在当前设备上分配。
- 所有指针指向当前 GPU 上足够大的缓冲区。INT8 地址无额外对齐要求，FP32 和 INT32 地址至少 4 字节对齐。
- 输出 C 不得与输入、scale 或分组信息重叠；入口检查给定地址范围的重叠、空指针、对齐和主机尺寸。裸指针接口无法确认真实分配大小或张量所属设备，这由调用者保证。
- 调用者必须保证 GPU 分组信息合法、scale 为有限值。入口不为读取 GPU 元数据而隐式同步。kernel 对越界长度/偏移有保护，但非法 GPU 元数据不保证结果正确，也不会同步返回一个校验错误。
- T=0 或 capacity=0 时不启动 kernel，允许数据指针为空。capacity>0 且所有 masked_m=0 时仍启动一次 kernel，由 GPU 判断无有效行；整个输出保持不变。这允许 CPU 不读取动态长度。

只有计算调用异步。演示程序的打包、上传、同步、拷回和 CPU 对照都放在入口之外。

## 编译、运行及共享库

```bash
cd /root/MOE/C500_int8_02All/01_naive_gemm
bash build.sh
export LD_LIBRARY_PATH=/opt/maca/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}

./naive_gemm.out --tokens 3,0,5 19 23
./naive_gemm.out --masked 8 --tokens 3,0,5 19 23
./naive_gemm.out --masked 17 --tokens 0,15,16,17,0 17 23 --zero-edges
./naive_gemm.out --masked 8 --tokens 0,0,0 4 5  # 有容量，全空，padding 不变
./naive_gemm.out --masked 0 --tokens 0,0 4 5   # 零容量，不启动
./naive_gemm.out 3 5 4 5                      # 旧用法保持兼容

bash build.sh --shared                       # 生成 libmoe_int8.so
```

共享库由同一个现有 cpp 文件编译，定义 `MOE_GEMM_LIBRARY` 排除 main；当前不新增头文件或 Python 包。C++ 调用者可使用上面的声明链接共享库，Python 可通过 ctypes 传递 GPU 地址；这不是自动注册的 PyTorch 算子，也尚未验证 graph capture 或 autograd。

调用示意（所有参数都已经准备好）：

```cpp
mcError_t status = moe_int8_masked(d_a, d_b, d_sa, d_sb, d_lengths, d_c,
                                  groups, capacity, n, k, stream);
// 检查 status；可继续提交同一 stream 上的其他工作。
// 需要 CPU 读取输出或释放数据之前，由调用者同步。
```

## mcPyTorch 通过共享库调用的最小例子

先执行 `bash build.sh --shared`，在已配置 mcPyTorch 的服务器 Python 环境运行下面的代码。这里演示调用者自己分配输入、输出，填入已量化 INT8 数据；不是把 Python 浮点 GEMM 当作后端。

```python
import ctypes
from pathlib import Path
import torch

lib = ctypes.CDLL(str(Path("libmoe_int8.so").resolve()))
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

先看两个 `extern "C"` 入口和 `launch_grouped`，再比较两个 kernel 中的行号计算。然后看 `pack_masked`、main 中的非默认 stream 调用，以及 padding 检查。新 contiguous 调度使用 `min(T,65536)` 作为行数上界，避免入口依赖 CPU 的 max(counts)；它保证覆盖合法元数据，但可能产生更多空转 block，尚未调优。

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
- offsets 和 masked_m 仍为 INT32，当前最多 64*65536 行，足够表示。
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
python bench_shapes.py
# 中断后恢复；源码、共享库、shape 和计时参数须与已保存结果一致
python bench_shapes.py --resume
# 只运行匹配的 case，另外保存结果
python bench_shapes.py --match masked_g6_m20 --output selected_results.json
# 可指定预热次数、每批重复次数、计时批数、每专家校验数量
python bench_shapes.py --warmup 1 --iterations 1 --rounds 5 --check-samples 128
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

原始数据见 [benchmark_results.json](benchmark_results.json)。24/24 均为 sampled PASS：共 45056 个数值参考点通过，所有有效输出的有限值检查通过，所有 masked 填充区保持不变。此前小例子全量对照不替代这次大 shape 的抽样口径。

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
- 后续可以先做分块与数据复用，再以相同 shape、输入规则和计时范围复测；硬件矩阵指令作为下一阶段。保持本 JSON 作为基线，复测可用 `--output benchmark_repeat.json` 保存另一份结果。

独立进程完成剩余 21 组后，容器 OOM kill 计数仍为 2，本次恢复阶段未出现新的 OOM kill。

断点恢复验证：相同参数恢复时跳过全部 24 个已通过 case；将 seed 改为 1 时拒绝恢复并返回非零，已有结果文件 SHA256 保持不变。普通可执行文件也重新编译，并通过 counts=[3,0,5] 的 masked 全量回归检查。

shape 哈希统一以 CRLF 转 LF 后的字节计算，避免 Git 换行转换误拒绝恢复；原始实测文件的字节哈希另存为 shapes_raw_sha256。本基线只补记了换行归一化元数据，配置、计时样本和校验结果均未修改。
