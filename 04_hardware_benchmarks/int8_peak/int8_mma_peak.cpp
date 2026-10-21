#include <mcr/mc_runtime.h>

#include <algorithm>
#include <array>
#include <chrono>
#include <cmath>
#include <cstddef>
#include <cstdint>
#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <limits>
#include <random>
#include <stdexcept>
#include <string>
#include <vector>

// 只改变外层循环的编译期展开因子；iterations 仍表示实际 MMA 轮数。
#ifndef MMA_PEAK_UNROLL
#define MMA_PEAK_UNROLL 1
#endif
static_assert(MMA_PEAK_UNROLL == 1 || MMA_PEAK_UNROLL == 2 ||
              MMA_PEAK_UNROLL == 4 || MMA_PEAK_UNROLL == 8 ||
              MMA_PEAK_UNROLL == 16 || MMA_PEAK_UNROLL == 32 ||
              MMA_PEAK_UNROLL == 64 || MMA_PEAK_UNROLL == 128 ||
              MMA_PEAK_UNROLL == 256, "Unsupported MMA loop unroll factor");

// 每个配置预热 1 次，正式测量 3 次。
constexpr int kWarmupRuns = 1;
constexpr std::size_t kMeasuredRuns = 3;

// 完整的 16x16x16 MMA：4096 次乘法 + 4096 次加法。
// 这是整个 wave 协作执行一次 MMA 的运算量，不能再乘线程数。
constexpr std::uint64_t kOpsPerMma = 16ULL * 16 * 16 * 2;

#define MC_CHECK(call)                                                     \
    do {                                                                   \
        const mcError_t mc_status_ = (call);                                \
        if (mc_status_ != mcSuccess) {                                      \
            std::cerr << #call << ": " << mcGetErrorString(mc_status_)       \
                      << " (" << __FILE__ << ":" << __LINE__ << ")\n";       \
            std::exit(EXIT_FAILURE);                                       \
        }                                                                  \
    } while (0)

struct BenchConfig {
    // 初始值用于跑通正确性；后续扫描配置寻找吞吐上限。
    int blocks = 1;
    int threads_per_block = 64;
    int accumulators = 1;   // 每个 wave 协作维护的独立矩阵累加器数量
    int iterations = 4096;  // 热循环次数，每轮更新所有累加器一次
};

struct BenchResult {
    BenchConfig config{};

    // 每次测量对应同一配置、相同运算量的一次 kernel 执行。
    std::array<float, kMeasuredRuns> elapsed_ms{};
    std::array<double, kMeasuredRuns> sample_tops{};

    std::uint64_t total_ops = 0;  // 单次 kernel 的总运算量，不包含预热
    double mean_ms = 0.0;

    // 主吞吐 = total_ops / (mean_ms * 1e9)，不是 sample_tops 的平均值。
    double tops_from_mean_ms = 0.0;
    bool correct = false;  // 检查 GPU 输出通过后才能设置为 true
};

// 查询当前设备，不切换设备，也不运行性能测试。
mcDeviceProp_t queryDevice() {
    int device_id = 0;
    MC_CHECK(mcGetDevice(&device_id));

    mcDeviceProp_t device{};
    MC_CHECK(mcGetDeviceProperties(&device, device_id));

    std::cout << "Device " << device_id << ": " << device.name << '\n'
              << "Runtime-reported architecture: " << device.mxArchName << '\n'
              << "Wave size: " << device.waveSize << '\n'
              << "Max threads per block: " << device.maxThreadsPerBlock << '\n'
              << "Max block dimension X: " << device.maxThreadsDim[0] << '\n'
              << "Max grid dimension X: " << device.maxGridSize[0] << '\n'
              << "Visible global memory: "
              << static_cast<double>(device.totalGlobalMem) / (1024.0 * 1024.0)
              << " MiB\n"
              << "Runtime-reported AP count: " << device.multiProcessorCount << '\n'
              << "Runtime-reported core clock: " << device.clockRate / 1000.0
              << " MHz (not a measured clock)\n";
    // AP 数量仅记录环境；后续 TOPS 按实际启动的工作量和耗时计算。
    return device;
}

// 约定：一维 grid/block；累加器从 0 开始，每轮执行一次 K=16 的 MMA。
// 这里只检查设备级限制；具体 kernel 的资源限制还需在实现后检查。
void validateConfig(const BenchConfig& config, const mcDeviceProp_t& device) {
    constexpr int kMmaWaveSize = 64;  // 当前 C500 INT8 MMA 的协作线程数
    if (device.waveSize != kMmaWaveSize) {
        throw std::invalid_argument("This C500 MMA benchmark requires a 64-thread wave");
    }

    if (config.blocks <= 0 || config.blocks > device.maxGridSize[0]) {
        throw std::invalid_argument("blocks must be positive and fit maxGridSize[0]");
    }
    if (config.threads_per_block <= 0 ||
        config.threads_per_block > device.maxThreadsPerBlock ||
        config.threads_per_block > device.maxThreadsDim[0]) {
        throw std::invalid_argument("threads_per_block exceeds the device limits or is nonpositive");
    }
    if (config.threads_per_block % device.waveSize != 0) {
        throw std::invalid_argument("threads_per_block must contain only complete waves");
    }

    // 后续 launchPeakKernel 按这些数量选择模板实例。
    if (config.accumulators != 1 && config.accumulators != 2 &&
        config.accumulators != 4 && config.accumulators != 8 &&
        (config.accumulators < 16 || config.accumulators > 32)) {
        throw std::invalid_argument("accumulators must be 1, 2, 4, 8, or any integer in 16..32");
    }
    if (config.iterations <= 0) {
        throw std::invalid_argument("iterations must be positive");
    }

    // 完整 INT8 范围 [-128,127] 的保守界限；中间计算使用 INT64。
    // 每个输出元素每轮累加 16 个乘积，独立累加器不相互求和。
    constexpr std::int64_t kMaxAbsInput = 128;
    constexpr std::int64_t kMaxAbsPerIteration = 16 * kMaxAbsInput * kMaxAbsInput;
    constexpr std::int64_t kMaxSafeIterations =
        std::numeric_limits<std::int32_t>::max() / kMaxAbsPerIteration;
    if (static_cast<std::int64_t>(config.iterations) > kMaxSafeIterations) {
        throw std::invalid_argument(
            "iterations must be <= 8191 to guarantee INT32 safety for full-range INT8 inputs");
    }
}

struct PreparedInputs {
    // 每个累加器一对矩阵，所有 wave 共享这些只读输入。
    // A[acc][m][k]：行主序；B[acc][n][k]：逻辑 B[K,N] 的列主序存储。
    std::vector<std::int8_t> host_a;
    std::vector<std::int8_t> host_b;
    std::size_t wave_count = 0;
    std::size_t output_elements = 0;

    // 显存所有权交给调用者；使用完后分别 mcFree，不复制对象共享所有权。
    std::int8_t* device_a = nullptr;
    std::int8_t* device_b = nullptr;
    std::int32_t* device_c = nullptr;
};

PreparedInputs prepareInputs(const BenchConfig& config, const mcDeviceProp_t& device) {
    validateConfig(config, device);
    constexpr std::size_t kMatrixElements = 16 * 16;
    const std::size_t input_elements =
        static_cast<std::size_t>(config.accumulators) * kMatrixElements;
    const std::size_t input_bytes = input_elements * sizeof(std::int8_t);

    // 使用 64 位计算 grid 中的 wave 总数，避免先进行 int 乘法而溢出。
    const std::uint64_t waves = static_cast<std::uint64_t>(config.blocks) *
        (config.threads_per_block / device.waveSize);
    const std::uint64_t output_matrices = waves * config.accumulators;
    constexpr std::size_t kOutputMatrixBytes = kMatrixElements * sizeof(std::int32_t);
    if (output_matrices >
        (std::numeric_limits<std::size_t>::max() - 2 * input_bytes) / kOutputMatrixBytes) {
        throw std::overflow_error("Input/output buffer sizes exceed size_t range");
    }
    const std::size_t output_elements =
        static_cast<std::size_t>(output_matrices) * kMatrixElements;
    const std::size_t output_bytes = output_elements * sizeof(std::int32_t);
    const std::size_t required_bytes = 2 * input_bytes + output_bytes;

    std::size_t free_bytes = 0, total_bytes = 0;
    MC_CHECK(mcMemGetInfo(&free_bytes, &total_bytes));
    if (required_bytes > free_bytes) {
        throw std::runtime_error("Not enough free device memory for this configuration");
    }

    PreparedInputs inputs;
    inputs.wave_count = static_cast<std::size_t>(waves);
    inputs.output_elements = output_elements;
    inputs.host_a.resize(input_elements);
    inputs.host_b.resize(input_elements);

    // 固定种子便于复现；非零小整数便于校验，保留 CPU 副本供 checkResults 使用。
    constexpr std::array<std::int8_t, 4> kValues = {-2, -1, 1, 2};
    std::mt19937 generator(20261021);
    for (std::size_t i = 0; i < input_elements; ++i) {
        inputs.host_a[i] = kValues[generator() % kValues.size()];
        inputs.host_b[i] = kValues[generator() % kValues.size()];
    }

    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&inputs.device_a), input_bytes));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&inputs.device_b), input_bytes));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&inputs.device_c), output_bytes));
    MC_CHECK(mcMemcpy(inputs.device_a, inputs.host_a.data(), input_bytes, mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(inputs.device_b, inputs.host_b.data(), input_bytes, mcMemcpyHostToDevice));

    // C[wave][acc][m][n] 为行主序，每个 wave/累加器独立存放结果。
    // 用哨兵值标记未写入的输出；后续 kernel 的寄存器累加器仍必须从 0 开始。
    MC_CHECK(mcMemset(inputs.device_c, 0xCD, output_bytes));
    MC_CHECK(mcStreamSynchronize(0));  // 输入拷贝和初始化完成后才返回，均在计时区间外。
    return inputs;
}

// 启动约定：一维 grid/block，block 线程数是 64 的整数倍；先 validateConfig。
// 具体线程数上限还须通过 mcFuncGetAttributes 查询当前模板实例。
// A/B 来自 prepareInputs；C 至少容纳 [wave_count][NUM_ACC][16][16]。
template <int NUM_ACC>
__global__ void mmaPeakKernel(const std::int8_t* __restrict__ a,
                              const std::int8_t* __restrict__ b,
                              std::int32_t* __restrict__ c, int iterations) {
    static_assert(NUM_ACC == 1 || NUM_ACC == 2 || NUM_ACC == 4 ||
                  NUM_ACC == 8 || (NUM_ACC >= 16 && NUM_ACC <= 32), "Unsupported accumulator count");
#if defined(__MACA_ARCH__)
    static_assert(__MACA_ARCH__ == 1000, "This INT8 MMA kernel targets C500 / xcore1000");
#endif
    using Accumulator = std::int32_t __attribute__((ext_vector_type(4)));
    constexpr int kWaveSize = 64;
    constexpr int kMatrixElements = 16 * 16;
    const int lane = threadIdx.x % kWaveSize;
    const std::size_t wave = static_cast<std::size_t>(blockIdx.x) *
        (blockDim.x / kWaveSize) + threadIdx.x / kWaveSize;

    // lane%16 对应 A 的行、B 的列；lane/16 对应 K 方向的四元素分段。
    const int input_mn = lane % 16;
    const int input_k = (lane / 16) * 4;
    std::int32_t a_frag[NUM_ACC];
    std::int32_t b_frag[NUM_ACC];
    Accumulator sums[NUM_ACC];

    // 1. 热循环前读显存，将四个 INT8 的位模式装入一个 32 位输入寄存器。
    // 这是编译器内建的 4 字节拷贝，不是运行时 mcMemcpy；也不做数值转换。
#pragma unroll
    for (int acc = 0; acc < NUM_ACC; ++acc) {
        const int base = acc * kMatrixElements + input_mn * 16 + input_k;
        __builtin_memcpy(&a_frag[acc], a + base, sizeof(std::int32_t));
        __builtin_memcpy(&b_frag[acc], b + base, sizeof(std::int32_t));
        sums[acc] = {0, 0, 0, 0};
    }

    // 2. 每轮每个 wave 执行 NUM_ACC 次 MMA；各条累加链没有相互依赖。
    // 外层按编译期因子展开，内层按 NUM_ACC 展开；总 iterations 不变。
    // 不足整组的轮次由编译器生成尾循环，仍需执行并校验。
#pragma unroll MMA_PEAK_UNROLL
    for (int iteration = 0; iteration < iterations; ++iteration) {
#pragma unroll
        for (int acc = 0; acc < NUM_ACC; ++acc) {
            sums[acc] = __builtin_mxc_mma_16x16x16i8(a_frag[acc], b_frag[acc], sums[acc]);
        }
    }

    // 3. 每个 lane 持有同一列的四个输出，转换为约定的行主序 C。
    // 不同 wave/累加器使用互不重叠的 16x16 输出区域。
#pragma unroll
    for (int acc = 0; acc < NUM_ACC; ++acc) {
        const std::size_t output_base = (wave * NUM_ACC + acc) * kMatrixElements;
#pragma unroll
        for (int j = 0; j < 4; ++j) {
            const int row = (lane / 16) * 4 + j;
            const int col = lane % 16;
            c[output_base + row * 16 + col] = sums[acc][j];
        }
    }
}

// 指定模板实例的带检查启动；这些主机端检查必须在正式计时区间外执行。
// 调用方负责检查启动错误和等待完成。
template <int NUM_ACC>
void launchPeakKernelImpl(const BenchConfig& config, const PreparedInputs& inputs,
                         const mcDeviceProp_t& device, mcStream_t stream) {
    validateConfig(config, device);
    if (config.accumulators != NUM_ACC) {
        throw std::invalid_argument("Template accumulator count does not match the configuration");
    }
    if (inputs.device_a == nullptr || inputs.device_b == nullptr || inputs.device_c == nullptr) {
        throw std::invalid_argument("Input/output device buffers must be prepared first");
    }

    constexpr std::size_t kElementsPerWave = NUM_ACC * 16 * 16;
    const std::uint64_t waves = static_cast<std::uint64_t>(config.blocks) *
        (config.threads_per_block / device.waveSize);
    if (waves > std::numeric_limits<std::size_t>::max() / kElementsPerWave) {
        throw std::overflow_error("Output element count exceeds size_t range");
    }
    if (inputs.host_a.size() != kElementsPerWave || inputs.host_b.size() != kElementsPerWave ||
        inputs.wave_count != waves || inputs.output_elements != waves * kElementsPerWave) {
        throw std::invalid_argument("Prepared buffer sizes do not match the launch configuration");
    }

    // 查询当前 NUM_ACC 实例的上限，不能借用另一个模板实例的资源信息。
    mcFuncAttributes attributes{};
    MC_CHECK(mcFuncGetAttributes(
        &attributes, reinterpret_cast<const void*>(mmaPeakKernel<NUM_ACC>)));
    if (config.threads_per_block > attributes.maxThreadsPerBlock) {
        throw std::invalid_argument("threads_per_block exceeds this kernel's thread limit");
    }

    mmaPeakKernel<NUM_ACC><<<config.blocks, config.threads_per_block, 0, stream>>>(
        inputs.device_a, inputs.device_b, inputs.device_c, config.iterations);
}

// 按配置选择编译好的模板实例；此带检查入口用于计时外的启动，例如预热。
void launchPeakKernel(const BenchConfig& config, const PreparedInputs& inputs,
                      const mcDeviceProp_t& device, mcStream_t stream) {
    switch (config.accumulators) {
        case 1: return launchPeakKernelImpl<1>(config, inputs, device, stream);
        case 2: return launchPeakKernelImpl<2>(config, inputs, device, stream);
        case 4: return launchPeakKernelImpl<4>(config, inputs, device, stream);
        case 8: return launchPeakKernelImpl<8>(config, inputs, device, stream);
        case 16: return launchPeakKernelImpl<16>(config, inputs, device, stream);
        case 17: return launchPeakKernelImpl<17>(config, inputs, device, stream);
        case 18: return launchPeakKernelImpl<18>(config, inputs, device, stream);
        case 19: return launchPeakKernelImpl<19>(config, inputs, device, stream);
        case 20: return launchPeakKernelImpl<20>(config, inputs, device, stream);
        case 21: return launchPeakKernelImpl<21>(config, inputs, device, stream);
        case 22: return launchPeakKernelImpl<22>(config, inputs, device, stream);
        case 23: return launchPeakKernelImpl<23>(config, inputs, device, stream);
        case 24: return launchPeakKernelImpl<24>(config, inputs, device, stream);
        case 25: return launchPeakKernelImpl<25>(config, inputs, device, stream);
        case 26: return launchPeakKernelImpl<26>(config, inputs, device, stream);
        case 27: return launchPeakKernelImpl<27>(config, inputs, device, stream);
        case 28: return launchPeakKernelImpl<28>(config, inputs, device, stream);
        case 29: return launchPeakKernelImpl<29>(config, inputs, device, stream);
        case 30: return launchPeakKernelImpl<30>(config, inputs, device, stream);
        case 31: return launchPeakKernelImpl<31>(config, inputs, device, stream);
        case 32: return launchPeakKernelImpl<32>(config, inputs, device, stream);
        default:
            throw std::invalid_argument("accumulators must be 1, 2, 4, 8, or any integer in 16..32");
    }
}

// 在计时结束后调用；stream 必须是产生 C 的那条流。
// 返回 true 表示所有输出精确匹配；数值错误返回 false，配置错误抛出异常。
bool checkResults(const BenchConfig& config, const PreparedInputs& inputs,
                  const mcDeviceProp_t& device, mcStream_t stream) {
    validateConfig(config, device);
    constexpr std::size_t kMatrixElements = 16 * 16;
    const std::size_t elements_per_wave =
        static_cast<std::size_t>(config.accumulators) * kMatrixElements;
    const std::uint64_t waves = static_cast<std::uint64_t>(config.blocks) *
        (config.threads_per_block / device.waveSize);
    if (waves > std::numeric_limits<std::size_t>::max() / elements_per_wave) {
        throw std::overflow_error("Output element count exceeds size_t range");
    }
    const std::size_t output_elements = static_cast<std::size_t>(waves) * elements_per_wave;
    if (inputs.device_c == nullptr || inputs.host_a.size() != elements_per_wave ||
        inputs.host_b.size() != elements_per_wave || inputs.wave_count != waves ||
        inputs.output_elements != output_elements) {
        throw std::invalid_argument("Prepared buffers do not match the result-check configuration");
    }

    // 所有 wave 使用相同输入，只需为每个累加器计算一份 16x16 参考矩阵。
    // GPU 累加器从 0 开始，每轮重复同一个乘积，所以最终值为 iterations*(A*B)。
    std::vector<std::int64_t> expected(elements_per_wave);
    for (int acc = 0; acc < config.accumulators; ++acc) {
        const std::size_t base = static_cast<std::size_t>(acc) * kMatrixElements;
        for (int row = 0; row < 16; ++row) {
            for (int col = 0; col < 16; ++col) {
                std::int64_t sum = 0;
                for (int k = 0; k < 16; ++k) {
                    sum += static_cast<std::int64_t>(inputs.host_a[base + row * 16 + k]) *
                           static_cast<std::int64_t>(inputs.host_b[base + col * 16 + k]);
                }
                sum *= config.iterations;
                if (sum < std::numeric_limits<std::int32_t>::min() ||
                    sum > std::numeric_limits<std::int32_t>::max()) {
                    throw std::overflow_error("CPU reference is outside the INT32 range");
                }
                expected[base + row * 16 + col] = sum;
            }
        }
    }

    // 分块检查完整 C，避免按 GPU 输出总大小分配 CPU 缓冲区。
    constexpr std::size_t kChunkElements = 65536;
    std::vector<std::int32_t> actual(std::min(output_elements, kChunkElements));
    std::size_t mismatches = 0;
    std::int64_t max_abs_error = 0;
    for (std::size_t offset = 0; offset < output_elements;) {
        const std::size_t count = std::min(actual.size(), output_elements - offset);
        // 同一条流保证回读发生在前面的 kernel 之后；只等待这条流。
        MC_CHECK(mcMemcpyAsync(actual.data(), inputs.device_c + offset,
                              count * sizeof(std::int32_t), mcMemcpyDeviceToHost, stream));
        MC_CHECK(mcStreamSynchronize(stream));
        for (std::size_t i = 0; i < count; ++i) {
            const std::size_t index = offset + i;
            const std::int64_t reference = expected[index % elements_per_wave];
            const std::int64_t value = actual[i];
            const std::int64_t error = value >= reference ? value - reference : reference - value;
            max_abs_error = std::max(max_abs_error, error);
            if (value != reference) {
                if (mismatches < 5) {
                    const std::size_t matrix = index / kMatrixElements;
                    std::cerr << "Mismatch: wave=" << matrix / config.accumulators
                              << ", accumulator=" << matrix % config.accumulators
                              << ", row=" << (index % kMatrixElements) / 16
                              << ", col=" << index % 16
                              << ", expected=" << reference << ", actual=" << value << '\n';
                }
                ++mismatches;
            }
        }
        offset += count;
    }

    std::cout << "Checked elements: " << output_elements
              << ", mismatches: " << mismatches
              << ", max_abs_error: " << max_abs_error << '\n'
              << (mismatches == 0 ? "PASS" : "FAIL")
              << ": all wave/accumulator outputs checked\n";
    return mismatches == 0;
}

// 完整测量一个配置，拥有本次使用的显存、流和 Event，返回三次原始耗时。
// NUM_ACC 在进入本函数前确定，预热与三次计时使用同一个模板实例。
template <int NUM_ACC>
BenchResult benchmarkOneConfigImpl(const BenchConfig& config, const mcDeviceProp_t& device) {
    BenchResult result{};
    result.config = config;  // 固定本次配置，预热与三次测量都使用这个副本。
    const BenchConfig& measured = result.config;
    validateConfig(measured, device);
    if (measured.accumulators != NUM_ACC) {
        throw std::invalid_argument("Template accumulator count does not match the configuration");
    }

    // 单次 kernel 的实际工作量：wave 数 * 每轮 MMA 数 * 循环次数 * 8192。
    result.total_ops = static_cast<std::uint64_t>(measured.blocks) *
        (measured.threads_per_block / device.waveSize);
    const std::array<std::uint64_t, 3> factors = {
        static_cast<std::uint64_t>(measured.accumulators),
        static_cast<std::uint64_t>(measured.iterations), kOpsPerMma};
    for (std::uint64_t factor : factors) {
        if (result.total_ops > std::numeric_limits<std::uint64_t>::max() / factor) {
            throw std::overflow_error("Total operation count exceeds UINT64 range");
        }
        result.total_ops *= factor;
    }

    // 所有分配和输入拷贝均先完成，之后才建立计时区间。
    auto inputs = prepareInputs(measured, device);
    mcStream_t stream{};
    mcEvent_t start{}, stop{};
    auto cleanup = [&] {
        if (start != nullptr) MC_CHECK(mcEventDestroy(start));
        if (stop != nullptr) MC_CHECK(mcEventDestroy(stop));
        if (stream != nullptr) MC_CHECK(mcStreamDestroy(stream));
        MC_CHECK(mcFree(inputs.device_a));
        MC_CHECK(mcFree(inputs.device_b));
        MC_CHECK(mcFree(inputs.device_c));
    };

    try {
        MC_CHECK(mcStreamCreateWithFlags(&stream, mcStreamNonBlocking));
        MC_CHECK(mcEventCreate(&start));
        MC_CHECK(mcEventCreate(&stop));

        // 同一配置预热一次；带检查的入口在这里查询 kernel 属性，计时尚未开始。
        for (int warmup = 0; warmup < kWarmupRuns; ++warmup) {
            launchPeakKernelImpl<NUM_ACC>(measured, inputs, device, stream);
            MC_CHECK(mcGetLastError());
        }
        MC_CHECK(mcStreamSynchronize(stream));

        for (std::size_t sample = 0; sample < kMeasuredRuns; ++sample) {
            // 恢复哨兵，避免旧输出掩盖漏写；在同一流的开始 Event 之前执行。
            MC_CHECK(mcMemsetAsync(inputs.device_c, 0xCD,
                                  inputs.output_elements * sizeof(std::int32_t), stream));

            MC_CHECK(mcEventRecord(start, stream));
            // 预热已检查过同一配置和资源上限，此处只提交完全相同的 kernel。
            mmaPeakKernel<NUM_ACC><<<measured.blocks, measured.threads_per_block, 0, stream>>>(
                inputs.device_a, inputs.device_b, inputs.device_c, measured.iterations);
            MC_CHECK(mcEventRecord(stop, stream));

            // 结束 Event 先入队，再检查启动错误和等待；不把这些检查插在两 Event 之间。
            MC_CHECK(mcGetLastError());
            MC_CHECK(mcEventSynchronize(stop));
            MC_CHECK(mcEventElapsedTime(&result.elapsed_ms[sample], start, stop));
            if (!(result.elapsed_ms[sample] > 0.0f) ||
                !std::isfinite(result.elapsed_ms[sample])) {
                throw std::runtime_error("Event duration must be positive and finite; increase the workload");
            }
            result.mean_ms += static_cast<double>(result.elapsed_ms[sample]);
        }
        result.mean_ms /= static_cast<double>(kMeasuredRuns);

        // 三次测量都结束后才回读和校验最后一次输出；校验过程的打印也在计时外。
        result.correct = checkResults(measured, inputs, device, stream);
        if (result.correct) {
            for (std::size_t sample = 0; sample < kMeasuredRuns; ++sample) {
                result.sample_tops[sample] = static_cast<double>(result.total_ops) /
                    (static_cast<double>(result.elapsed_ms[sample]) * 1.0e9);
            }
            // 主吞吐按平均耗时计算，不对三次 TOPS 做算术平均。
            result.tops_from_mean_ms = static_cast<double>(result.total_ops) /
                (result.mean_ms * 1.0e9);
        } // 校验失败保留耗时，TOPS 字段维持为 0，避免当作有效性能结果。
    } catch (...) {
        cleanup();
        throw;
    }
    cleanup();
    return result;
}

// 在任何开始 Event 入队之前完成分派，计时循环中不再按累加器数量分支。
BenchResult benchmarkOneConfig(const BenchConfig& config, const mcDeviceProp_t& device) {
    switch (config.accumulators) {
        case 1: return benchmarkOneConfigImpl<1>(config, device);
        case 2: return benchmarkOneConfigImpl<2>(config, device);
        case 4: return benchmarkOneConfigImpl<4>(config, device);
        case 8: return benchmarkOneConfigImpl<8>(config, device);
        case 16: return benchmarkOneConfigImpl<16>(config, device);
        case 17: return benchmarkOneConfigImpl<17>(config, device);
        case 18: return benchmarkOneConfigImpl<18>(config, device);
        case 19: return benchmarkOneConfigImpl<19>(config, device);
        case 20: return benchmarkOneConfigImpl<20>(config, device);
        case 21: return benchmarkOneConfigImpl<21>(config, device);
        case 22: return benchmarkOneConfigImpl<22>(config, device);
        case 23: return benchmarkOneConfigImpl<23>(config, device);
        case 24: return benchmarkOneConfigImpl<24>(config, device);
        case 25: return benchmarkOneConfigImpl<25>(config, device);
        case 26: return benchmarkOneConfigImpl<26>(config, device);
        case 27: return benchmarkOneConfigImpl<27>(config, device);
        case 28: return benchmarkOneConfigImpl<28>(config, device);
        case 29: return benchmarkOneConfigImpl<29>(config, device);
        case 30: return benchmarkOneConfigImpl<30>(config, device);
        case 31: return benchmarkOneConfigImpl<31>(config, device);
        case 32: return benchmarkOneConfigImpl<32>(config, device);
        default:
            throw std::invalid_argument("accumulators must be 1, 2, 4, 8, or any integer in 16..32");
    }
}

// 只展示已经完成测量和校验的结果，不在此函数中启动 GPU 工作。
void printResult(const BenchResult& result) {
    const auto old_flags = std::cout.flags();
    const auto old_precision = std::cout.precision();
    const BenchConfig& config = result.config;
    const std::uint64_t waves = static_cast<std::uint64_t>(config.blocks) *
        (config.threads_per_block / 64);

    std::cout << "\nINT8 MMA benchmark result\n"
              << "blocks=" << config.blocks
              << ", threads_per_block=" << config.threads_per_block
              << ", accumulators=" << config.accumulators
              << ", iterations=" << config.iterations << '\n'
              << "Total waves: " << waves << '\n'
              << "MMA shape: 16x16x16; OPS per wave-level MMA: " << kOpsPerMma << '\n'
              << "OPS per measured kernel: " << result.total_ops << '\n'
              << "Warmup runs: " << kWarmupRuns
              << "; measured runs: " << kMeasuredRuns << '\n'
              << "Timing: same-stream GPU Events around the full kernel\n"
              << std::fixed << std::setprecision(9);
    for (std::size_t sample = 0; sample < kMeasuredRuns; ++sample) {
        std::cout << "Sample " << sample + 1 << ": " << result.elapsed_ms[sample] << " ms";
        if (result.correct) {
            std::cout << ", " << result.sample_tops[sample] << " TOPS";
        }
        std::cout << '\n';
    }
    std::cout << "Mean time: " << result.mean_ms << " ms\n"
              << "Correctness: " << (result.correct ? "PASS" : "FAIL") << '\n';
    if (result.correct) {
        std::cout << "TOPS from mean time: " << result.tops_from_mean_ms
                  << " = total_ops / (mean_ms * 1e9)\n";
    } else {
        std::cout << "TOPS unavailable: correctness check failed\n";
    }
    std::cout << "Measured configuration throughput; not a theoretical hardware peak.\n";
    std::cout.flags(old_flags);
    std::cout.precision(old_precision);
}

// 每种模板的资源上限分别查询，不能用设备级线程上限替代 kernel 上限。
mcFuncAttributes queryKernelAttributes(int accumulators) {
    mcFuncAttributes attributes{};
    switch (accumulators) {
        case 1: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<1>))); break;
        case 2: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<2>))); break;
        case 4: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<4>))); break;
        case 8: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<8>))); break;
        case 16: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<16>))); break;
        case 17: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<17>))); break;
        case 18: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<18>))); break;
        case 19: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<19>))); break;
        case 20: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<20>))); break;
        case 21: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<21>))); break;
        case 22: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<22>))); break;
        case 23: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<23>))); break;
        case 24: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<24>))); break;
        case 25: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<25>))); break;
        case 26: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<26>))); break;
        case 27: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<27>))); break;
        case 28: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<28>))); break;
        case 29: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<29>))); break;
        case 30: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<30>))); break;
        case 31: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<31>))); break;
        case 32: MC_CHECK(mcFuncGetAttributes(&attributes,
            reinterpret_cast<const void*>(mmaPeakKernel<32>))); break;
        default: throw std::invalid_argument("Unsupported accumulator count");
    }
    return attributes;
}

// 扫描配置，不改变 kernel 和单配置计时方法；仅正确性通过的配置参与排名。
// CSV 是生成的测试报告，逐配置刷新，禁止覆盖已有结果。
void scanConfigs(const mcDeviceProp_t& device, int iterations, const std::string& csv_path,
                 bool wide = false) {
    BenchConfig validation{};
    validation.iterations = iterations;
    validateConfig(validation, device);
    std::vector<int> block_counts = {1, 8, 16, 32, 64, 104, 208, 416, 832};
    if (wide) block_counts.insert(block_counts.end(), {1664, 3328, 6656});
    constexpr std::array<int, 4> thread_counts = {64, 128, 256, 512};
    constexpr std::array<int, 5> accumulator_counts = {1, 2, 4, 8, 16};
    std::array<mcFuncAttributes, accumulator_counts.size()> attributes{};
    std::vector<BenchConfig> configs;
    std::size_t skipped = 0;
    for (std::size_t index = 0; index < accumulator_counts.size(); ++index) {
        const int accumulators = accumulator_counts[index];
        attributes[index] = queryKernelAttributes(accumulators);
        const auto& attr = attributes[index];
        std::cout << "Kernel accumulators=" << accumulators << ": registers=" << attr.numRegs
                  << ", local_bytes=" << attr.localSizeBytes
                  << ", shared_bytes=" << attr.sharedSizeBytes
                  << ", max_threads=" << attr.maxThreadsPerBlock << '\n';
        for (int blocks : block_counts) {
            for (int threads : thread_counts) {
                if (blocks > device.maxGridSize[0] || threads > device.maxThreadsPerBlock ||
                    threads > device.maxThreadsDim[0] || threads > attr.maxThreadsPerBlock) {
                    ++skipped;
                    continue;
                }
                BenchConfig config{};
                config.blocks = blocks;
                config.threads_per_block = threads;
                config.accumulators = accumulators;
                config.iterations = iterations;
                validateConfig(config, device);
                configs.push_back(config);
            }
        }
    }
    if (configs.empty()) throw std::runtime_error("No supported scan configurations");
    // 打散大/小配置与累加器顺序，减轻固定升序与温度/时间趋势的关联；种子固定。
    std::mt19937 order_generator(20261021);
    std::shuffle(configs.begin(), configs.end(), order_generator);

    if (std::filesystem::exists(csv_path)) {
        throw std::runtime_error("Report already exists; choose a new CSV path: " + csv_path);
    }
    std::ofstream csv;
    csv.exceptions(std::ios::failbit | std::ios::badbit);
    csv.open(csv_path);
    csv << std::setprecision(std::numeric_limits<double>::max_digits10)
        << "order,blocks,threads_per_block,accumulators,iterations,waves,total_ops,"
        << "elapsed_ms_1,elapsed_ms_2,elapsed_ms_3,sample_tops_1,sample_tops_2,sample_tops_3,"
        << "mean_ms,tops_from_mean_ms,range_over_median,correct,num_regs,local_bytes,"
        << "shared_bytes,kernel_max_threads\n";
    std::cout << "Scan configurations: " << configs.size() << "; skipped by limits: " << skipped
              << "; fixed iterations: " << iterations << "; shuffle seed: 20261021\n"
              << "CSV report: " << csv_path << '\n';
    std::vector<BenchResult> results;
    results.reserve(configs.size());
    for (std::size_t index = 0; index < configs.size(); ++index) {
        const auto& config = configs[index];
        std::cout << "[" << index + 1 << "/" << configs.size() << "] blocks=" << config.blocks
                  << ", threads=" << config.threads_per_block
                  << ", accumulators=" << config.accumulators << std::endl;
        const BenchResult result = benchmarkOneConfig(config, device);
        const auto attr_index = static_cast<std::size_t>(std::find(
            accumulator_counts.begin(), accumulator_counts.end(), config.accumulators) -
            accumulator_counts.begin());
        const auto& attr = attributes[attr_index];
        auto sorted_times = result.elapsed_ms;
        std::sort(sorted_times.begin(), sorted_times.end());
        const double variation = (static_cast<double>(sorted_times.back()) - sorted_times.front()) /
                                 sorted_times[kMeasuredRuns / 2];
        csv << index + 1 << ',' << config.blocks << ',' << config.threads_per_block << ','
            << config.accumulators << ',' << config.iterations << ','
            << static_cast<std::uint64_t>(config.blocks) * (config.threads_per_block / 64) << ','
            << result.total_ops;
        for (float time : result.elapsed_ms) csv << ',' << time;
        for (double tops : result.sample_tops) csv << ',' << tops;
        csv << ',' << result.mean_ms << ',' << result.tops_from_mean_ms << ',' << variation
            << ',' << (result.correct ? 1 : 0) << ',' << attr.numRegs << ',' << attr.localSizeBytes
            << ',' << attr.sharedSizeBytes << ',' << attr.maxThreadsPerBlock << std::endl;
        if (!result.correct) {
            throw std::runtime_error("Scan stopped: correctness failed; partial CSV preserved");
        }
        results.push_back(result);
        std::cout << "Mean time: " << result.mean_ms
                  << " ms; TOPS from mean time: " << result.tops_from_mean_ms << '\n';
    }
    csv.close();
    std::stable_sort(results.begin(), results.end(), [](const BenchResult& a, const BenchResult& b) {
        return a.tops_from_mean_ms > b.tops_from_mean_ms;
    });
    std::cout << "\nTop configurations by TOPS from mean time\n"
              << "rank,blocks,threads,accumulators,mean_ms,tops_from_mean_ms\n";
    const auto old_precision = std::cout.precision();
    std::cout << std::setprecision(9);
    for (std::size_t index = 0; index < std::min<std::size_t>(5, results.size()); ++index) {
        const auto& result = results[index];
        std::cout << index + 1 << ',' << result.config.blocks << ','
                  << result.config.threads_per_block << ',' << result.config.accumulators << ','
                  << result.mean_ms << ',' << result.tops_from_mean_ms << '\n';
    }
    std::cout.precision(old_precision);
    std::cout << "Best configuration within the tested range (ranked by mean-time TOPS):\n";
    printResult(results.front());
    std::cout << "All " << results.size() << " tested configurations passed correctness.\n"
              << "Timing isolation and instance quota must be recorded separately.\n";
}

// 稳态验证：每个样本连续启动多个相同 kernel，同时记录 Event 与 CPU 墙钟。
// 每个 kernel 的寄存器累加器重新清零；batch 不增加单个 INT32 输出的累加次数。
template <int NUM_ACC>
void benchmarkSustainedImpl(const BenchConfig& config, const mcDeviceProp_t& device,
                            int sample_count, int kernels_per_sample, const std::string& csv_path) {
    validateConfig(config, device);
    if (config.accumulators != NUM_ACC || sample_count <= 0 || sample_count > 1000 ||
        kernels_per_sample <= 0 || kernels_per_sample > 10000) {
        throw std::invalid_argument("Invalid sustained configuration: samples 1..1000, batch 1..10000");
    }
    const auto attributes = queryKernelAttributes(NUM_ACC);
    std::cout << "Kernel resources: accumulators=" << NUM_ACC
              << ", registers=" << attributes.numRegs
              << ", local_bytes=" << attributes.localSizeBytes
              << ", max_threads=" << attributes.maxThreadsPerBlock << std::endl;
    if (config.threads_per_block > attributes.maxThreadsPerBlock) {
        throw std::invalid_argument("threads_per_block exceeds this kernel's thread limit");
    }
    std::uint64_t batch_ops = static_cast<std::uint64_t>(config.blocks) *
        (config.threads_per_block / device.waveSize);
    const std::array<std::uint64_t, 4> factors = {NUM_ACC,
        static_cast<std::uint64_t>(config.iterations), kOpsPerMma,
        static_cast<std::uint64_t>(kernels_per_sample)};
    for (auto factor : factors) {
        if (batch_ops > std::numeric_limits<std::uint64_t>::max() / factor) {
            throw std::overflow_error("Batch operation count exceeds UINT64 range");
        }
        batch_ops *= factor;
    }
    if (std::filesystem::exists(csv_path)) {
        throw std::runtime_error("Report already exists; choose a new CSV path: " + csv_path);
    }
    std::ofstream csv;
    csv.exceptions(std::ios::failbit | std::ios::badbit);
    csv.open(csv_path);
    csv << std::setprecision(std::numeric_limits<double>::max_digits10)
        << "sample,blocks,threads_per_block,accumulators,iterations,kernels_per_sample,"
        << "ops_per_kernel,batch_ops,event_ms,wall_ms,event_tops,wall_tops,correct\n";
    auto inputs = prepareInputs(config, device);
    mcStream_t stream{};
    mcEvent_t start{}, stop{};
    auto cleanup = [&] {
        if (start != nullptr) MC_CHECK(mcEventDestroy(start));
        if (stop != nullptr) MC_CHECK(mcEventDestroy(stop));
        if (stream != nullptr) MC_CHECK(mcStreamDestroy(stream));
        MC_CHECK(mcFree(inputs.device_a));
        MC_CHECK(mcFree(inputs.device_b));
        MC_CHECK(mcFree(inputs.device_c));
    };
    try {
        MC_CHECK(mcStreamCreateWithFlags(&stream, mcStreamNonBlocking));
        MC_CHECK(mcEventCreate(&start));
        MC_CHECK(mcEventCreate(&stop));
        // 在所有计时前完成带检查启动、数值预检与至少 2 秒设备预热。
        launchPeakKernelImpl<NUM_ACC>(config, inputs, device, stream);
        MC_CHECK(mcGetLastError());
        if (!checkResults(config, inputs, device, stream)) {
            throw std::runtime_error("Sustained preflight correctness failed");
        }
        const auto warmup_start = std::chrono::steady_clock::now();
        std::uint64_t warmup_launches = 0;
        do {
            for (int launch = 0; launch < 8; ++launch) {
                mmaPeakKernel<NUM_ACC><<<config.blocks, config.threads_per_block, 0, stream>>>(
                    inputs.device_a, inputs.device_b, inputs.device_c, config.iterations);
                ++warmup_launches;
            }
            MC_CHECK(mcGetLastError());
            MC_CHECK(mcStreamSynchronize(stream));
        } while (std::chrono::steady_clock::now() - warmup_start < std::chrono::seconds(2));
        std::cout << "Sustained warmup: at least 2 seconds, " << warmup_launches
                  << " launches; samples=" << sample_count << ", kernels/sample="
                  << kernels_per_sample << std::endl;
        double event_sum = 0.0, wall_sum = 0.0;
        for (int sample = 0; sample < sample_count; ++sample) {
            MC_CHECK(mcMemsetAsync(inputs.device_c, 0xCD,
                                  inputs.output_elements * sizeof(std::int32_t), stream));
            MC_CHECK(mcStreamSynchronize(stream));
            const auto wall_start = std::chrono::steady_clock::now();
            MC_CHECK(mcEventRecord(start, stream));
            for (int launch = 0; launch < kernels_per_sample; ++launch) {
                mmaPeakKernel<NUM_ACC><<<config.blocks, config.threads_per_block, 0, stream>>>(
                    inputs.device_a, inputs.device_b, inputs.device_c, config.iterations);
            }
            MC_CHECK(mcEventRecord(stop, stream));
            MC_CHECK(mcGetLastError());
            MC_CHECK(mcEventSynchronize(stop));
            const auto wall_stop = std::chrono::steady_clock::now();
            float event_ms = 0.0f;
            MC_CHECK(mcEventElapsedTime(&event_ms, start, stop));
            const double wall_ms = std::chrono::duration<double, std::milli>(wall_stop - wall_start).count();
            if (!(event_ms > 0.0f) || !std::isfinite(event_ms) ||
                !(wall_ms > 0.0) || !std::isfinite(wall_ms)) {
                throw std::runtime_error("Sustained timing must be positive and finite");
            }
            // 每个样本都检查最后一个 kernel 的全部输出；不是只检查最后一个样本。
            // batch 内各 kernel 使用相同输入并覆盖同一 C，不声称逐个保留中间输出。
            const bool correct = checkResults(config, inputs, device, stream);
            const double event_tops = correct ? batch_ops / (event_ms * 1.0e9) : 0.0;
            const double wall_tops = correct ? batch_ops / (wall_ms * 1.0e9) : 0.0;
            csv << sample + 1 << ',' << config.blocks << ',' << config.threads_per_block << ','
                << NUM_ACC << ',' << config.iterations << ',' << kernels_per_sample << ','
                << batch_ops / kernels_per_sample << ',' << batch_ops << ',' << event_ms << ','
                << wall_ms << ',' << event_tops << ',' << wall_tops << ',' << (correct ? 1 : 0)
                << std::endl;
            if (!correct) throw std::runtime_error("Sustained sample correctness failed");
            event_sum += event_ms;
            wall_sum += wall_ms;
            std::cout << "Sustained sample " << sample + 1 << ": Event=" << event_ms
                      << " ms, wall=" << wall_ms << " ms, Event TOPS=" << event_tops
                      << ", wall TOPS=" << wall_tops << std::endl;
        }
        csv.close();
        std::cout << std::setprecision(9) << "Sustained mean Event TOPS: "
                  << batch_ops / ((event_sum / sample_count) * 1.0e9)
                  << "; mean wall TOPS: " << batch_ops / ((wall_sum / sample_count) * 1.0e9)
                  << "\nWall scope includes Event submission, kernel submissions, and final wait; "
                  << "allocation/copies/validation/printing are outside both intervals.\n";
    } catch (...) {
        cleanup();
        throw;
    }
    cleanup();
}

void benchmarkSustained(const BenchConfig& config, const mcDeviceProp_t& device,
                        int samples, int batch, const std::string& csv_path) {
    switch (config.accumulators) {
        case 1: return benchmarkSustainedImpl<1>(config, device, samples, batch, csv_path);
        case 2: return benchmarkSustainedImpl<2>(config, device, samples, batch, csv_path);
        case 4: return benchmarkSustainedImpl<4>(config, device, samples, batch, csv_path);
        case 8: return benchmarkSustainedImpl<8>(config, device, samples, batch, csv_path);
        case 16: return benchmarkSustainedImpl<16>(config, device, samples, batch, csv_path);
        case 17: return benchmarkSustainedImpl<17>(config, device, samples, batch, csv_path);
        case 18: return benchmarkSustainedImpl<18>(config, device, samples, batch, csv_path);
        case 19: return benchmarkSustainedImpl<19>(config, device, samples, batch, csv_path);
        case 20: return benchmarkSustainedImpl<20>(config, device, samples, batch, csv_path);
        case 21: return benchmarkSustainedImpl<21>(config, device, samples, batch, csv_path);
        case 22: return benchmarkSustainedImpl<22>(config, device, samples, batch, csv_path);
        case 23: return benchmarkSustainedImpl<23>(config, device, samples, batch, csv_path);
        case 24: return benchmarkSustainedImpl<24>(config, device, samples, batch, csv_path);
        case 25: return benchmarkSustainedImpl<25>(config, device, samples, batch, csv_path);
        case 26: return benchmarkSustainedImpl<26>(config, device, samples, batch, csv_path);
        case 27: return benchmarkSustainedImpl<27>(config, device, samples, batch, csv_path);
        case 28: return benchmarkSustainedImpl<28>(config, device, samples, batch, csv_path);
        case 29: return benchmarkSustainedImpl<29>(config, device, samples, batch, csv_path);
        case 30: return benchmarkSustainedImpl<30>(config, device, samples, batch, csv_path);
        case 31: return benchmarkSustainedImpl<31>(config, device, samples, batch, csv_path);
        case 32: return benchmarkSustainedImpl<32>(config, device, samples, batch, csv_path);
        default: throw std::invalid_argument("Unsupported accumulator count");
    }
}

// 原单配置/扫描入口保留；新增扩大扫描及稳态验证入口。
int main(int argc, char* argv[]) {
    auto print_usage = [&] {
        std::cout << "Usage: " << argv[0]
                  << " [blocks threads_per_block accumulators iterations]\n"
                  << "       " << argv[0] << " --scan [iterations [report.csv]]\n"
                  << "       " << argv[0] << " --scan-wide [iterations [report.csv]]\n"
                  << "       " << argv[0] << " --sustain blocks threads accumulators iterations samples batch report.csv\n"
                  << "Defaults: 1 64 1 4096\n"
                  << "Accumulators: 1, 2, 4, 8, 16..32; iterations: 1..8191\n";
    };
    if (argc == 2 && std::string(argv[1]) == "--help") {
        print_usage();
        return EXIT_SUCCESS;
    }
    const bool wide = argc >= 2 && std::string(argv[1]) == "--scan-wide";
    const bool scan = argc >= 2 && (std::string(argv[1]) == "--scan" || wide);
    const bool sustain = argc >= 2 && std::string(argv[1]) == "--sustain";
    if ((scan && argc > 4) || (sustain && argc != 9) ||
        (!scan && !sustain && argc != 1 && argc != 5)) {
        print_usage();
        std::cerr << "Error: invalid argument count; see usage\n";
        return EXIT_FAILURE;
    }

    try {
        BenchConfig config{};
        auto parse_positive_int = [](const char* text, const char* name) {
            const std::string value(text);
            std::size_t parsed = 0;
            const long long number = std::stoll(value, &parsed, 10);
            if (parsed != value.size() || number <= 0 ||
                number > std::numeric_limits<int>::max()) {
                throw std::invalid_argument(std::string(name) + " must be a positive INT32 integer");
            }
            return static_cast<int>(number);
        };
        if (scan && argc >= 3) {
            config.iterations = parse_positive_int(argv[2], "iterations");
        } else if (!scan && argc == 5) {
            config.blocks = parse_positive_int(argv[1], "blocks");
            config.threads_per_block = parse_positive_int(argv[2], "threads_per_block");
            config.accumulators = parse_positive_int(argv[3], "accumulators");
            config.iterations = parse_positive_int(argv[4], "iterations");
        } else if (sustain) {
            config.blocks = parse_positive_int(argv[2], "blocks");
            config.threads_per_block = parse_positive_int(argv[3], "threads_per_block");
            config.accumulators = parse_positive_int(argv[4], "accumulators");
            config.iterations = parse_positive_int(argv[5], "iterations");
        }

        const mcDeviceProp_t device = queryDevice();
        std::cout << "Compiled MMA loop unroll factor: " << MMA_PEAK_UNROLL << '\n';
        if (sustain) {
            benchmarkSustained(config, device, parse_positive_int(argv[6], "samples"),
                               parse_positive_int(argv[7], "batch"), argv[8]);
            return EXIT_SUCCESS;
        }
        if (scan) {
            const auto timestamp_ms = std::chrono::duration_cast<std::chrono::milliseconds>(
                std::chrono::system_clock::now().time_since_epoch()).count();
            const std::string csv_path = argc == 4 ? argv[3] :
                "reports/int8_scan_" + std::to_string(timestamp_ms) + ".csv";
            scanConfigs(device, config.iterations, csv_path, wide);
            return EXIT_SUCCESS;
        }
        const BenchResult result = benchmarkOneConfig(config, device);
        printResult(result);
        return result.correct ? EXIT_SUCCESS : EXIT_FAILURE;
    } catch (const std::exception& error) {
        std::cerr << "Error: " << error.what() << '\n';
        return EXIT_FAILURE;
    }
}
