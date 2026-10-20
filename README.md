# C500 MoE 算子学习

这是从零开始的教学目录。用自然语言描述一个小功能，由 AI 协助实现、讲解和验证，再逐步理解 grouped GEMM 和 MoE 优化。

## 目录

- [位置与分支](#位置与分支)
- [学习顺序](#学习顺序)
- [每个小功能的完成方式](#每个小功能的完成方式)
- [当前性能测试入口](#当前性能测试入口)
- [第二课：共享内存分块](#第二课共享内存分块)
- [第二课后续：INT8 向量加载](#第二课后续int8-向量加载)
- [公共测试目录迁移验证（2026-10-20）](#公共测试目录迁移验证2026-10-20)
- [报告归档与持续优化目录（2026-10-20）](#报告归档与持续优化目录2026-10-20)

## 位置与分支

- C500 工作目录：`/root/MOE/C500_int8_02All`
- GitHub：`William7743/DeepGEMM`
- 教学分支：`DeepGemm-MUXI-Learn`
- 正式适配分支：`DeepGemm-MUXI`

教学分支以独立历史从空目录起步，不预先复制正式适配实现，也不包含整个上游 DeepGEMM 源码。阅读上游结构时使用已有仓库作为参考。第一课位于 [01_naive_gemm](01_naive_gemm/README.md)。

## 学习顺序

1. 认识 DeepGEMM 的功能、仓库结构及它在 MoE 中的位置。
2. 直接编写朴素 INT8 GEMM，使用 INT32 累加和输出，理解 M/N/K 和线程映射。
3. 加入 scale 缩放写回，理解 W8A8 计算过程。
4. 扩展到两个专家，再处理各专家不同的 token 数与布局。
5. 支持大尺寸 INT8 grouped GEMM：扩大尺寸范围、使用 64 位数组偏移，在 contiguous/masked 下验证真实规模的矩阵。
6. 接入可追溯的 shape 集合；区分上游生成测试与实际模型在 TP/EP 切分下的采集数据。
7. 学习分块与数据复用，再逐步接触 MMA 和流水线。
8. 使用计时和性能分析工具，每次验证一个优化假设。

这些是学习方向，不意味着一次生成全部代码。具体练习随学习进度确定。

## 每个小功能的完成方式

1. 先说明输入、输出、计算过程和期望结果。
2. 编写最小可理解的实现，并解释新增的关键代码。
3. 在 C500 上运行，记录正确性结果；涉及优化时记录前后计时口径和数据。
4. 用自己的话解释关键部分，再提交该功能并推送到教学分支。

计算实现使用编号目录，例如 `01_naive_gemm/`、`02_optimized_gemm/`；两者共用 `benchmarks/` 中的测试工具与 shape 配置。目录中包含源码、构建/运行命令和简短笔记；运行产物不提交。功能尚未验证时明确标注，不写成“通过”。

一个完整优化阶段完成代码、验证、报告和文档后，整理成一个英文 Git 提交再推送。阶段内的小修改可以保留在本地，README 的目录补充随该阶段一起提交。


## 当前性能测试入口

公共目录 `benchmarks/` 包含 `bench_shapes.py`、`prepare_flame_shapes.py`，以及
`shapes.json`、`shapes_flame.json`、`baseline_shapes_2026-10-16.json`。
测试报告保留在对应实现目录。两份 kernel、共享库和既有报告没有移动。
从仓库根目录可用相同配置分别运行：

```bash
bash 01_naive_gemm/build.sh --shared
bash 02_optimized_gemm/build.sh
python benchmarks/bench_shapes.py \
  --shapes benchmarks/baseline_shapes_2026-10-16.json \
  --output 01_naive_gemm/reports/baseline_rerun.json \
  --warmup 3 --iterations 2 --rounds 7 --check-samples 256 --seed 20261016
python benchmarks/bench_shapes.py \
  --shapes benchmarks/baseline_shapes_2026-10-16.json \
  --library 02_optimized_gemm/libmoe_int8_shared.so --source 02_optimized_gemm/optimized_gemm.cpp \
  --output 02_optimized_gemm/reports/shared_rerun.json \
  --warmup 3 --iterations 2 --rounds 7 --check-samples 256 --seed 20261016
```

脚本默认库和源码仍指向朴素版，默认输出为 `01_naive_gemm/reports/benchmark_rerun.json`。使用新输出文件保留历史报告；路径调整改变脚本哈希，旧报告不能用新脚本直接 `--resume`。

`benchmarks/shapes.json` 保存 24 组上游生成 shape；`benchmarks/bench_shapes.py` 读取配置、调用 MACA C++ 计时入口并保存正确性与性能记录。运行方法、计时口径和结果见 [第一课说明](01_naive_gemm/README.md)。这套数据用于建立朴素实现的基线，真实模型 TP/EP 采集数据仍需后续补充。

`benchmarks/prepare_flame_shapes.py` 从固定版本的 FLAME-MoE 路由片段提取各专家 token 数，
生成独立的 `shapes_flame.json`。它使用模型专家层尺寸，在单卡上测试 64 个专家的 FC1/FC2、
contiguous/masked 共 16 组配置；输入矩阵与 scale 仍随机生成，不是完整 MoE 或原训练部署的重现。

当前两个 C 接口支持 1～4096 个专家，内部每批最多启动 64 个专家，保持上游一次调用。
自动拆批的小尺寸正确性记录见 `01_naive_gemm/reports/batching_correctness_results.json`；
该步骤验证调用层与跨批索引，尚未增加分块复用或矩阵指令优化。

优化前固定基线使用 `benchmarks/baseline_shapes_2026-10-16.json` 的 7 个代表性 case。
当前朴素 kernel 保留不变；基线的环境、计时方法、结果与复现命令见第一课说明末尾。


## 第二课：共享内存分块

实现位于 [02_optimized_gemm](02_optimized_gemm/README.md)，独立生成 `libmoe_int8_shared.so`。
保留第一课朴素 kernel 作为对照，仍提供 contiguous/masked 两种接口和超过 64 个专家的自动拆批。
先通过 `16×16×32` 分块合作加载及共享内存复用改善数据访问，不使用硬件矩阵指令。
构建、正确性证据及同一环境下的 7 个固定 case 性能对比见第二课说明。


## 公共测试目录迁移验证（2026-10-20）

两份脚本和三份配置移入 `benchmarks/`，FLAME 提取脚本及三份配置与移动前逐字节一致。
测试脚本只调整默认路径和获取环境信息的工作目录，计算、采样、数值检查和计时逻辑保持原样。
朴素版从 `/tmp` 启动，共享内存版从仓库根目录启动；均通过固定基线中两个 G=129 尾部 case，
每个 case 覆盖三次 kernel 启动，两种布局共 4/4 PASS。每份报告抽查 52,736 个有效输出、
检查 469,282 个 padding 元素，错误数均为 0。两版使用相同 case、输入 seed 和计时参数。
本轮 warmup=0、iterations=1、rounds=1，仅验证迁移后的入口，不作为新性能基线。
两份报告完整保存此次截取的两条配置；未重跑其余大尺寸 case 或重新下载 FLAME trace。

- [朴素版迁移检查](01_naive_gemm/reports/benchmarks_migration_2026-10-20.json)
- [共享内存版迁移检查](02_optimized_gemm/reports/benchmarks_migration_2026-10-20.json)

另确认新报告 `--resume` 可保留两项 PASS，旧测试脚本报告被拒绝续跑且原文未修改；
默认 24 组 shape 能从新目录读取及验证，FLAME 提取工具的 `--help` 可运行。


## 报告归档与持续优化目录（2026-10-20）

计算实现分别位于 `01_naive_gemm/naive_gemm.cpp` 与 `02_optimized_gemm/optimized_gemm.cpp`。
各实现的 JSON 报告集中在各自的 `reports/`，公共脚本和 shape 配置仍位于 `benchmarks/`。
本次只整理名称与路径，不修改 kernel；12 份历史报告内容保持不变。
后续在优化源码上逐步提交，当前共享内存阶段及报告名仍保留，可用 `git log --follow` 跨改名查阅。


C500 上从新目录重新构建优化版成功；朴素版和优化版的 contiguous/masked 共 4 个 case 全部通过。
每份报告抽查 52,736 个有效输出、检查 469,282 个 padding 元素，均无错误。
另验证默认报告目录存在，12 份历史报告在服务器移动前后的 SHA256 一致。
本次未重跑完整性能集合，新检查只验证改名和路径调整后的调用。

- [朴素版整理检查](01_naive_gemm/reports/reorganization_check_2026-10-20.json)
- [优化版整理检查](02_optimized_gemm/reports/reorganization_check_2026-10-20.json)


## 第二课后续：INT8 向量加载

继续修改 `02_optimized_gemm/optimized_gemm.cpp`，不增加新的优化目录。
对 K 可被 4 整除且 A/B 起始地址为 4 字节对齐的输入，每线程一次读取连续 4 个 INT8；
其余输入使用原来的标量加载路径。两种布局、scale 规则和 64 专家拆批接口保持一致。

当前 5 个向量路径 case 相对共享内存基线加速 1.10～1.26 倍；两个 K=259 的回退 case
存在计时波动和部分测量退化，不能宣称所有 shape 都加速。
具体映射、尾部规则、7 个 case 的原始对照和复现命令见
[INT8 向量加载阶段说明](02_optimized_gemm/README.md#int8-向量加载2026-10-20)。
