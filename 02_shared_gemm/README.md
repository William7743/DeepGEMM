# 教学对照起点：原样复制朴素 grouped GEMM

本提交将 `01_naive_gemm/naive_gemm.cpp` 原样复制为本目录的 `shared_gemm.cpp`，
下一提交将在同一路径上加入共享内存分块，方便通过 GitHub commit diff 学习。
`bash build.sh` 编译共享库；`MOE_GEMM_LIBRARY` 仅排除 CPU 演示的 main。
本提交的文件名仍为 shared_gemm.cpp，但计算暂为朴素实现。

本目录已有的性能和正确性 JSON 来自历史共享内存实现（提交 5500e78），
不是此教学起点的测量记录。后续提交会恢复课程说明，已有报告不覆盖。

---

以下保留原共享内存课程说明，描述的是历史实现 5500e78；本教学起点尚未应用优化。

# 第二课：共享内存分块 INT8 grouped GEMM

本课保留第一课朴素 kernel，新增一个可独立编译的共享库。
输入输出、INT8/INT32/FP32 数值约定、contiguous/masked 布局及每次最多 64 个专家的自动拆批保持一致。
当前仍由一个线程计算一个输出元素，不包含 INT8 MMA、异步流水线或 persistent 调度。
固定的 32 项块内累加循环使用展开；本轮不做消融实验，不将全部收益归因于单一改动。

## 核心变化

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

## 构建与调用

```bash
cd /root/MOE/C500_int8_02All/02_shared_gemm
bash build.sh
```

生成 `libmoe_int8_shared.so`，导出与第一课相同的 `moe_int8_contiguous`、`moe_int8_masked`
及测量专用的 `moe_int8_benchmark`。本课没有重复拷贝 CPU 演示主程序，使用第一课 Python 入口调用共享库。
compute 接口使用调用方的 stream，不分配、不复制、不同步；benchmark 入口为 GPU event 计时而同步。
公共尺寸边界、指针检查及无工作调用与第一课一致。G=1～4096，N/K=1～32768，
每专家 M≤65536；尺寸符合限制仍需有足够内存。输入与输出必须符合接口的分配及不重叠约定。
GPU 元数据必须由调用方验证，kernel 的局部保护不会把非法元数据转换为正确结果。
同一调用期间，调用方不能并发改写输入、scale 或元数据。

## 固定性能对照

先编译两份库。使用完全相同的 7 个 case、case 名、随机种子和计时参数，分别写入不同报告：

```bash
cd /root/MOE/C500_int8_02All
bash 01_naive_gemm/build.sh --shared
bash 02_shared_gemm/build.sh
export LD_LIBRARY_PATH=/opt/maca/lib:/opt/mxdriver/lib:${LD_LIBRARY_PATH:-}
python 01_naive_gemm/bench_shapes.py \
  --shapes 01_naive_gemm/baseline_shapes_2026-10-16.json \
  --output 02_shared_gemm/naive_rerun.json \
  --warmup 3 --iterations 2 --rounds 7 --check-samples 256 --seed 20261016
python 01_naive_gemm/bench_shapes.py \
  --shapes 01_naive_gemm/baseline_shapes_2026-10-16.json \
  --library 02_shared_gemm/libmoe_int8_shared.so \
  --source 02_shared_gemm/shared_gemm.cpp \
  --output 02_shared_gemm/shared_rerun.json \
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
out=root/'02_shared_gemm/shared_correctness_rerun.json'
spec=importlib.util.spec_from_file_location('bench',root/'01_naive_gemm/bench_shapes.py')
bench=importlib.util.module_from_spec(spec);spec.loader.exec_module(bench)
torch.cuda.set_device(0)
lib=ctypes.CDLL(str(root/'02_shared_gemm/libmoe_int8_shared.so'))
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
report=dict(timestamp_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),scope='full CPU INT64/FP64 references; all finite outputs and unchanged masked padding; nondefault streams; no timing claims',torch_version=torch.__version__,source_sha256=hashlib.sha256((root/'02_shared_gemm/shared_gemm.cpp').read_bytes()).hexdigest(),library_sha256=hashlib.sha256((root/'02_shared_gemm/libmoe_int8_shared.so').read_bytes()).hexdigest(),harness_sha256=hashlib.sha256((root/'01_naive_gemm/bench_shapes.py').read_bytes()).hexdigest(),results=[],api_checks=[],raw_checks=[])
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

[shared_correctness_2026-10-20.json](shared_correctness_2026-10-20.json) 中 45 组全量参考、
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

- [朴素版复测](naive_results_2026-10-20.json)
- [共享版测量](shared_results_2026-10-20.json)
- [逐 case 对照与原始报告哈希](comparison_2026-10-20.json)

已核对两份报告的 case、输入 seed、参数、设备和计时程序哈希；每个 worker 的源码/库哈希与控制器一致。
库与源码哈希分别标识文件，构建关联依靠先从对应源码执行上述 build.sh；本轮确实重新构建后运行。
性能测试和全部正确性测试使用的共享库哈希一致。报告中的 git_head 为测量时的提交，
应同时结合 source_sha256 和 library_sha256 识别工作区内的新实现。

仍保留统一网格上界和 64 专家拆批，因此无效 block 的调度开销未被移除。
共享版较大 M 的 contiguous/masked 耗时差异值得后续分析，但本轮未做 profiler 归因或布局优劣的严格对照。
本轮未使用硬件矩阵指令、异步流水线或 profiler；未测带宽利用率，不宣称达到甲方 fused MoE 验收目标。

测试入口的 resume 补充检查通过：相同实现可保留全部 7 项 PASS；旧计时脚本哈希和不同源码哈希均被拒绝，未重新执行 GPU 测量。
