#include <mcr/mc_runtime.h>

#include <algorithm>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <limits>
#include <stdexcept>
#include <string>
#include <vector>

// Report which runtime call failed instead of silently continuing.
#define MC_CHECK(call)                                                   \
    do {                                                                 \
        mcError_t status = (call);                                        \
        if (status != mcSuccess) {                                        \
            std::cerr << #call << ": " << mcGetErrorString(status)         \
                      << " (line " << __LINE__ << ")\n";                  \
            std::exit(EXIT_FAILURE);                                     \
        }                                                                \
    } while (0)

// Bounded large-shape teaching contract. 32768 * (-128 * -128)
// is 536870912, safely within INT32 even for raw full-range INT8 inputs.
constexpr int max_expert_rows = 65536;
constexpr int max_nk = 32768;
constexpr int max_groups = 4096; // Bounded API contract, not a hardware limit.
constexpr int groups_per_launch = 64;
constexpr int BLOCK_M = 16, BLOCK_N = 16, BLOCK_K = 32;
static_assert(int64_t(max_groups) * max_expert_rows <= std::numeric_limits<int32_t>::max(),
              "contiguous offsets must fit INT32");
static_assert(sizeof(size_t) >= 8, "large buffers require 64-bit indexing");

// Borrowed GPU views. Inputs are read-only; the caller owns every allocation.
// meta = offsets[G+1] for contiguous, or masked_m[G] for masked.
struct GemmView {
    const int8_t *a, *b;
    const float *a_scale, *b_scale;
    const int32_t* meta;
    float* c;
};

// Two template instances implement the existing contiguous and masked contracts.
template <bool Masked>
__global__ void shared_int8_gemm(GemmView data, int groups, int rows, int n, int k,
                               int group_base) {
    const int group = group_base + blockIdx.z;
    if (group >= groups) return; // Uniform for the entire block.

    int valid_m;
    size_t expert_row_base;
    if constexpr (Masked) {
        valid_m = data.meta[group];
        if (valid_m < 0 || valid_m > rows) return;
        expert_row_base = size_t(group) * rows;
    } else {
        const int begin = data.meta[group], end = data.meta[group + 1];
        if (data.meta[0] != 0 || data.meta[groups] != rows ||
            begin < 0 || end < begin || end > rows || end - begin > max_expert_rows) return;
        valid_m = end - begin;
        expert_row_base = begin;
    }
    const int m0 = blockIdx.y * BLOCK_M, n0 = blockIdx.x * BLOCK_N;
    // Only BLOCK-uniform conditions may return before a barrier.
    if (m0 >= valid_m || n0 >= n) return;

    __shared__ int8_t tile_a[BLOCK_M][BLOCK_K];
    // B is [G,N,K] globally; transpose the tile so output-column threads read
    // consecutive shared addresses. The extra column changes the bank mapping.
    __shared__ int8_t tile_b[BLOCK_K][BLOCK_N + 1];
    const int tx = threadIdx.x, ty = threadIdx.y;
    const int tid = ty * BLOCK_N + tx;
    const int row = m0 + ty, col = n0 + tx;
    int32_t sum = 0; // One output per thread, as in the naive lesson.

    for (int k0 = 0; k0 < k; k0 += BLOCK_K) {
        // 256 threads cooperate on 512 A elements and 512 B elements.
        // Adjacent linear thread IDs read along the contiguous global K axis.
        for (int i = tid; i < BLOCK_M * BLOCK_K; i += BLOCK_M * BLOCK_N) {
            const int r = i / BLOCK_K, kk = i % BLOCK_K;
            tile_a[r][kk] = (m0 + r < valid_m && k0 + kk < k)
                ? data.a[(expert_row_base + m0 + r) * k + k0 + kk] : int8_t(0);
        }
        for (int i = tid; i < BLOCK_N * BLOCK_K; i += BLOCK_M * BLOCK_N) {
            const int c = i / BLOCK_K, kk = i % BLOCK_K;
            tile_b[kk][c] = (n0 + c < n && k0 + kk < k)
                ? data.b[(size_t(group) * n + n0 + c) * k + k0 + kk] : int8_t(0);
        }
        __syncthreads(); // All tile writes must finish before any reader uses them.

        #pragma unroll
        for (int kk = 0; kk < BLOCK_K; ++kk)
            sum += static_cast<int32_t>(tile_a[ty][kk]) *
                   static_cast<int32_t>(tile_b[kk][tx]);

        __syncthreads(); // All readers must finish before the next tile overwrites it.
    }
    // Partial-row/column threads still participated in every barrier.
    // Write valid outputs only; masked padding must retain its original value.
    if (row < valid_m && col < n) {
        const size_t physical_row = expert_row_base + row;
        data.c[physical_row * n + col] = static_cast<float>(sum) *
            data.a_scale[physical_row] * data.b_scale[size_t(group) * n + col];
    }
}

bool overlaps_output(const void* input, size_t bytes, float* output, size_t out_bytes) {
    uintptr_t start = reinterpret_cast<uintptr_t>(input);
    uintptr_t out = reinterpret_cast<uintptr_t>(output);
    // Subtraction avoids overflowing the end-address calculation.
    return start <= out ? out - start < bytes : start - out < out_bytes;
}

// Shared host checks. This does not dereference GPU metadata or synchronize.
// Pointers must refer to sufficiently large buffers on the current device.
static mcError_t launch_grouped(GemmView data, int groups, int rows, int n, int k,
                               bool masked, mcStream_t stream) {
    if (groups < 1 || groups > max_groups || n < 1 || n > max_nk || k < 1 || k > max_nk ||
        rows < 0 || rows > (masked ? max_expert_rows : groups * max_expert_rows))
        return mcErrorInvalidValue;
    // T=0 or capacity=0: no GPU work, and null data pointers are allowed.
    if (rows == 0) return mcSuccess;
    if (!data.a || !data.b || !data.a_scale || !data.b_scale || !data.meta || !data.c)
        return mcErrorInvalidValue;
    for (const void* ptr : {static_cast<const void*>(data.a_scale),
                            static_cast<const void*>(data.b_scale),
                            static_cast<const void*>(data.meta),
                            static_cast<const void*>(data.c)})
        if (reinterpret_cast<uintptr_t>(ptr) % 4) return mcErrorInvalidValue;
    size_t physical_rows = masked ? size_t(groups) * rows : rows;
    size_t out_bytes = physical_rows * n * sizeof(float);
    if (overlaps_output(data.a, physical_rows * k, data.c, out_bytes) ||
        overlaps_output(data.b, size_t(groups) * n * k, data.c, out_bytes) ||
        overlaps_output(data.a_scale, physical_rows * sizeof(float), data.c, out_bytes) ||
        overlaps_output(data.b_scale, size_t(groups) * n * sizeof(float), data.c, out_bytes) ||
        overlaps_output(data.meta, size_t(groups + (masked ? 0 : 1)) * sizeof(int32_t),
                        data.c, out_bytes)) return mcErrorInvalidValue;
    // For contiguous, T is an upper bound on every expert's M. The teaching
    // contract limits M<=max_expert_rows, so this grid needs no CPU readback of offsets.
    int row_bound = masked ? rows : std::min(rows, max_expert_rows);
    dim3 block(BLOCK_N, BLOCK_M);
    // Keep global pointers/metadata: group_base + blockIdx.z selects the expert.
    // In particular, contiguous offsets remain GLOBAL; no CPU readback/rebasing.
    // All batches are enqueued on the caller's stream without intermediate sync.
    for (int group_base = 0; group_base < groups; group_base += groups_per_launch) {
        int batch_groups = std::min(groups_per_launch, groups - group_base);
        dim3 grid((n + BLOCK_N - 1) / BLOCK_N, (row_bound + BLOCK_M - 1) / BLOCK_M, batch_groups);
        if (masked)
            shared_int8_gemm<true><<<grid, block, 0, stream>>>(data, groups, rows, n, k, group_base);
        else
            shared_int8_gemm<false><<<grid, block, 0, stream>>>(data, groups, rows, n, k, group_base);
        mcError_t status = mcGetLastError();
        if (status != mcSuccess) return status; // Earlier batches may already be queued.
    }
    return mcSuccess; // Execution errors surface on caller synchronization.
}

// Stable C entry points: borrowed device pointers, caller-provided output,
// explicit stream, no allocations/copies/quantization/synchronization inside.
extern "C" mcError_t moe_int8_contiguous(
    const int8_t* a, const int8_t* b, const float* a_scale, const float* b_scale,
    const int32_t* offsets, float* c, int groups, int total_m, int n, int k,
    mcStream_t stream) {
    return launch_grouped({a, b, a_scale, b_scale, offsets, c},
                          groups, total_m, n, k, false, stream);
}

extern "C" mcError_t moe_int8_masked(
    const int8_t* a, const int8_t* b, const float* a_scale, const float* b_scale,
    const int32_t* masked_m, float* c, int groups, int capacity, int n, int k,
    mcStream_t stream) {
    return launch_grouped({a, b, a_scale, b_scale, masked_m, c},
                          groups, capacity, n, k, true, stream);
}

// Measurement-only entry point. Unlike the compute APIs this synchronizes.
// Keep event recording and repeated launches in C++ to avoid Python gaps.
// host_ms[samples] receives milliseconds per grouped call for each batch.
extern "C" mcError_t moe_int8_benchmark(
    const int8_t* a, const int8_t* b, const float* a_scale, const float* b_scale,
    const int32_t* metadata, float* c, int groups, int rows, int n, int k,
    mcStream_t stream, int masked, int warmup, int iterations, int samples,
    float* host_ms) {
    if (!host_ms || (masked != 0 && masked != 1) || warmup < 0 || warmup > 100 ||
        iterations < 1 || iterations > 1000 || samples < 1 || samples > 100)
        return mcErrorInvalidValue;
    GemmView data{a, b, a_scale, b_scale, metadata, c};
    mcEvent_t start{}, stop{};
    mcError_t status = mcEventCreate(&start);
    if (status != mcSuccess) return status;
    status = mcEventCreate(&stop);
    if (status != mcSuccess) { mcEventDestroy(start); return status; }
    auto measure = [&]() -> mcError_t {
#define BENCH_CHECK(call) do { mcError_t s = (call); if (s != mcSuccess) return s; } while (0)
        for (int i = 0; i < warmup; ++i)
            BENCH_CHECK(launch_grouped(data, groups, rows, n, k, masked, stream));
        BENCH_CHECK(mcStreamSynchronize(stream));
        for (int sample = 0; sample < samples; ++sample) {
            BENCH_CHECK(mcEventRecord(start, stream));
            for (int i = 0; i < iterations; ++i)
                BENCH_CHECK(launch_grouped(data, groups, rows, n, k, masked, stream));
            BENCH_CHECK(mcEventRecord(stop, stream));
            BENCH_CHECK(mcEventSynchronize(stop));
            BENCH_CHECK(mcEventElapsedTime(&host_ms[sample], start, stop));
            host_ms[sample] /= iterations;
        }
#undef BENCH_CHECK
        return mcSuccess;
    };
    status = measure();
    mcError_t stop_status = mcEventDestroy(stop), start_status = mcEventDestroy(start);
    if (status != mcSuccess) return status;
    return stop_status != mcSuccess ? stop_status : start_status;
}

// The remainder is demo/input preparation, not part of either compute entry point.
struct DeviceBuffers {
    int8_t *a = nullptr, *b = nullptr;
    float *a_scale = nullptr, *b_scale = nullptr, *c = nullptr;
    int32_t* metadata = nullptr;
};

struct HostExpert {
    int m, n, k;
    std::vector<float> a_float, b_float, a_scale, b_scale, c;
    std::vector<int8_t> a, b;
};

// Use wider CPU arithmetic and a different loop order for the reference.
std::vector<int64_t> reference_gemm(const std::vector<int8_t>& a,
                                  const std::vector<int8_t>& b,
                                  int m, int n, int k) {
    std::vector<int64_t> c(size_t(m) * n, 0);
    for (size_t row = 0; row < m; ++row) {
        for (size_t p = 0; p < k; ++p) {
            for (size_t col = 0; col < n; ++col) {
                c[row * n + col] += static_cast<int64_t>(a[row * k + p]) *
                                   static_cast<int64_t>(b[p * n + col]);
            }
        }
    }
    return c;
}

// Symmetric quantization: x ~= q * scale, zero point = 0.
// Round halfway away from zero, then clamp BEFORE converting to int8_t.
int8_t quantize_value(float x, float scale) {
    float q = std::round(x / scale);
    return static_cast<int8_t>(std::clamp(q, -127.0f, 127.0f));
}

void quantize_a_rows(const std::vector<float>& input, std::vector<int8_t>& q,
                     std::vector<float>& scales, int m, int k) {
    for (size_t row = 0; row < m; ++row) {
        float max_abs = 0;
        for (size_t p = 0; p < k; ++p)
            max_abs = std::max(max_abs, std::abs(input[row * k + p]));
        // A zero row stays zero; scale=1 avoids division by zero.
        scales[row] = max_abs == 0 ? 1.0f : max_abs / 127.0f;
        for (size_t p = 0; p < k; ++p)
            q[row * k + p] = quantize_value(input[row * k + p], scales[row]);
    }
}

void quantize_b_columns(const std::vector<float>& input, std::vector<int8_t>& q,
                        std::vector<float>& scales, int k, int n) {
    for (size_t col = 0; col < n; ++col) {
        float max_abs = 0;
        for (size_t p = 0; p < k; ++p)
            max_abs = std::max(max_abs, std::abs(input[p * n + col]));
        scales[col] = max_abs == 0 ? 1.0f : max_abs / 127.0f;
        for (size_t p = 0; p < k; ++p)
            q[p * n + col] = quantize_value(input[p * n + col], scales[col]);
    }
}

// Original floating inputs: this reference measures quantization loss.
std::vector<double> reference_float_gemm(const std::vector<float>& a,
                                        const std::vector<float>& b,
                                        int m, int n, int k) {
    std::vector<double> c(size_t(m) * n, 0);
    for (size_t row = 0; row < m; ++row)
        for (size_t p = 0; p < k; ++p)
            for (size_t col = 0; col < n; ++col)
                c[row * n + col] += static_cast<double>(a[row * k + p]) *
                                   static_cast<double>(b[p * n + col]);
    return c;
}

int parse_dimension(const char* value, int minimum = 1, int maximum = max_nk) {
    std::string text(value);
    if (text.empty() || !std::all_of(text.begin(), text.end(),
                                   [](char ch) { return ch >= '0' && ch <= '9'; }))
        throw std::invalid_argument("dimensions must contain decimal digits only");
    size_t used = 0;
    int result = std::stoi(text, &used);
    if (used != text.size() || result < minimum || result > maximum)
        throw std::invalid_argument("M/capacity must be in [0,65536]; N and K in [1,32768]");
    return result;
}

// A bounded teaching interface: 1..max_groups, with one M per group.
std::vector<int> parse_tokens(const char* value) {
    std::string text(value);
    std::vector<int> tokens;
    size_t begin = 0;
    while (true) {
        size_t end = text.find(',', begin);
        std::string item = text.substr(begin, end == std::string::npos ? end : end - begin);
        tokens.push_back(parse_dimension(item.c_str(), 0, max_expert_rows));
        if (tokens.size() > max_groups)
            throw std::invalid_argument("the teaching example supports 1..4096 experts");
        if (end == std::string::npos) break;
        begin = end + 1;
    }
    return tokens;
}

// Retain every expert until grouped execution ends.
HostExpert prepare_expert(int expert_id, int m, int n, int k, bool zero_edges) {
    HostExpert h;
    h.m = m; h.n = n; h.k = k;
    // No tokens, no output: even weight buffers are unnecessary for this call.
    if (m == 0) return h;
    h.a_float.resize(size_t(m) * k); h.b_float.resize(size_t(k) * n);
    h.a.resize(size_t(m) * k); h.b.resize(size_t(k) * n);
    h.a_scale.resize(m); h.b_scale.resize(n);
    // A missing GPU write must fail validation, including when expected C is zero.
    h.c.assign(size_t(m) * n, std::numeric_limits<float>::quiet_NaN());
    auto& a_float = h.a_float; auto& b_float = h.b_float;
    auto& a = h.a; auto& b = h.b;
    auto& a_scale = h.a_scale; auto& b_scale = h.b_scale;
    for (size_t row = 0; row < m; ++row)
        for (size_t p = 0; p < k; ++p)
            a_float[row * k + p] = (static_cast<int>((row * k + p + expert_id * 5) % 17) - 8) *
                                   0.13f * (1 + row % 7 + expert_id);
    for (size_t p = 0; p < k; ++p)
        for (size_t col = 0; col < n; ++col)
            b_float[p * n + col] = (static_cast<int>(((p * n + col) * 3 + expert_id * 7) % 17) - 8) *
                                   0.17f * (1 + col % 5 + expert_id);
    if (zero_edges) {
        for (size_t p = 0; p < k; ++p) {
            a_float[size_t(m - 1) * k + p] = 0;
            b_float[p * n + n - 1] = 0;
        }
    }
    quantize_a_rows(a_float, a, a_scale, m, k);
    quantize_b_columns(b_float, b, b_scale, k, n);
    // Full-range INT8 accumulation is safe for K <= max_nk (see contract above).
    return h;
}

// Keep the old per-expert [K,N] CPU arrays as an independent reference.
// Only the packed GPU input changes to the NT weight layout [G,N,K].
struct HostPacked {
    std::vector<int8_t> a, b;
    std::vector<float> a_scale, b_scale, c;
};

std::vector<int32_t> make_offsets(const std::vector<int>& counts) {
    std::vector<int32_t> offsets(1, 0);
    for (int count : counts) offsets.push_back(offsets.back() + count);
    return offsets;
}

HostPacked pack_contiguous(const std::vector<HostExpert>& experts,
                               const std::vector<int32_t>& offsets, int n, int k) {
    HostPacked packed;
    int total_m = offsets.back();
    packed.a.resize(size_t(total_m) * k);
    packed.b.assign(experts.size() * n * k, 0);
    packed.a_scale.resize(total_m);
    packed.b_scale.assign(experts.size() * n, 1.0f);
    packed.c.assign(size_t(total_m) * n, std::numeric_limits<float>::quiet_NaN());
    for (size_t group = 0; group < experts.size(); ++group) {
        const auto& h = experts[group];
        if (h.m == 0) continue; // Empty weights keep their reserved zero-filled slot.
        std::copy(h.a.begin(), h.a.end(), packed.a.begin() + size_t(offsets[group]) * k);
        std::copy(h.a_scale.begin(), h.a_scale.end(), packed.a_scale.begin() + offsets[group]);
        std::copy(h.b_scale.begin(), h.b_scale.end(), packed.b_scale.begin() + group * n);
        // Same mathematical weights, different physical layout: [K,N] -> [N,K].
        for (size_t col = 0; col < n; ++col)
            for (size_t p = 0; p < k; ++p)
                packed.b[(size_t(group) * n + col) * k + p] = h.b[p * n + col];
    }
    return packed;
}

// NaN in valid outputs detects missed writes; a finite sentinel in padding
// detects accidental writes. Padding A/scale are poisoned and must never be read.
constexpr float padding_sentinel = -123456.75f;
HostPacked pack_masked(const std::vector<HostExpert>& experts, int capacity, int n, int k) {
    HostPacked packed;
    size_t rows = experts.size() * capacity;
    packed.a.assign(rows * k, 127);
    packed.b.assign(experts.size() * n * k, 0);
    packed.a_scale.assign(rows, std::numeric_limits<float>::quiet_NaN());
    packed.b_scale.assign(experts.size() * n, 1.0f);
    packed.c.assign(rows * n, padding_sentinel);
    for (size_t group = 0; group < experts.size(); ++group) {
        const auto& h = experts[group];
        if (h.m == 0) continue;
        size_t row_base = group * capacity;
        std::copy(h.a.begin(), h.a.end(), packed.a.begin() + row_base * k);
        std::copy(h.a_scale.begin(), h.a_scale.end(), packed.a_scale.begin() + row_base);
        std::copy(h.b_scale.begin(), h.b_scale.end(), packed.b_scale.begin() + group * n);
        std::fill_n(packed.c.begin() + row_base * n, size_t(h.m) * n,
                    std::numeric_limits<float>::quiet_NaN());
        for (size_t col = 0; col < n; ++col)
            for (size_t p = 0; p < k; ++p)
                packed.b[(size_t(group) * n + col) * k + p] = h.b[p * n + col];
    }
    return packed;
}

DeviceBuffers upload_buffers(const HostPacked& h,
                                   const std::vector<int32_t>& metadata) {
    DeviceBuffers d;
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.a), h.a.size() * sizeof(int8_t)));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.b), h.b.size() * sizeof(int8_t)));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.a_scale), h.a_scale.size() * sizeof(float)));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.b_scale), h.b_scale.size() * sizeof(float)));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.c), h.c.size() * sizeof(float)));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.metadata), metadata.size() * sizeof(int32_t)));
    MC_CHECK(mcMemcpy(d.a, h.a.data(), h.a.size() * sizeof(int8_t), mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d.b, h.b.data(), h.b.size() * sizeof(int8_t), mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d.a_scale, h.a_scale.data(), h.a_scale.size() * sizeof(float), mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d.b_scale, h.b_scale.data(), h.b_scale.size() * sizeof(float), mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d.c, h.c.data(), h.c.size() * sizeof(float), mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d.metadata, metadata.data(), metadata.size() * sizeof(int32_t), mcMemcpyHostToDevice));
    return d;
}

void free_buffers(const DeviceBuffers& d) {
    MC_CHECK(mcFree(d.a));
    MC_CHECK(mcFree(d.b));
    MC_CHECK(mcFree(d.a_scale));
    MC_CHECK(mcFree(d.b_scale));
    MC_CHECK(mcFree(d.c));
    MC_CHECK(mcFree(d.metadata));
}

int check_expert(int expert_id, const HostExpert& h, bool zero_edges) {
    std::cout << "\n=== Expert " << expert_id << " ===\n";
    int m = h.m, n = h.n, k = h.k;
    if (m == 0) {
        // The CPU contract for an empty expert is an empty result, not zeros [1,N].
        bool empty = h.a.empty() && h.a_scale.empty() && h.c.empty();
        std::cout << "M=0: empty expert, no output elements\n"
                  << "checked_elements=0, mismatches=" << (empty ? 0 : 1) << '\n'
                  << (empty ? "PASS" : "FAIL") << " (empty expert contract)\n";
        return empty ? EXIT_SUCCESS : EXIT_FAILURE;
    }
    const auto& a = h.a; const auto& b = h.b;
    const auto& a_float = h.a_float; const auto& b_float = h.b_float;
    const auto& a_scale = h.a_scale; const auto& b_scale = h.b_scale;
    const auto& c = h.c;
    auto reference = reference_gemm(a, b, m, n, k);
    auto float_reference = reference_float_gemm(a_float, b_float, m, n, k);
    // Check EVERY output against INT64 accumulation + FP64 scaling.
    // FP32 multiplication rounds: use absolute + relative tolerance.
    constexpr double atol = 1e-6, rtol = 1e-5;
    double max_abs_error = 0, max_relative_error = 0;
    double quant_max_abs_error = 0, quant_squared_error = 0, float_squared_norm = 0;
    size_t mismatches = 0;
    for (size_t i = 0; i < c.size(); ++i) {
        size_t row = i / n, col = i % n;
        double expected = static_cast<double>(reference[i]) *
                          static_cast<double>(a_scale[row]) * b_scale[col];
        double error = std::abs(static_cast<double>(c[i]) - expected);
        max_abs_error = std::max(max_abs_error, error);
        if (std::abs(expected) > atol)
            max_relative_error = std::max(max_relative_error, error / std::abs(expected));
        if (!std::isfinite(c[i]) || error > atol + rtol * std::abs(expected))
            ++mismatches;
        // Compare TWO CPU references to isolate quantization loss from GPU rounding.
        double quant_error = expected - float_reference[i];
        quant_max_abs_error = std::max(quant_max_abs_error, std::abs(quant_error));
        quant_squared_error += quant_error * quant_error;
        float_squared_norm += float_reference[i] * float_reference[i];
    }
    std::cout << "A[" << m << ',' << k << "] * B[" << k << ',' << n
              << "] -> C[" << m << ',' << n << "]\n"
              << "CPU FP32 -> INT8 quantization; GPU INT32 accumulation -> FP32 output\n"
              << "zero_edges=" << zero_edges << "; row-major\n";
    if (m <= 8 && n <= 8) {
        if (k <= 8) {
            std::cout << "A first row: float -> INT8 -> reconstructed float\n";
            for (size_t p = 0; p < k; ++p)
                std::cout << a_float[p] << " -> " << static_cast<int>(a[p])
                          << " -> " << a[p] * a_scale[0] << '\n';
        }
        std::cout << "A row scales:";
        for (float s : a_scale) std::cout << ' ' << s;
        std::cout << "\nB column scales:";
        for (float s : b_scale) std::cout << ' ' << s;
        std::cout << '\n';
        std::cout << "GPU C:\n";
        for (size_t row = 0; row < m; ++row) {
            for (size_t col = 0; col < n; ++col)
                std::cout << c[row * n + col] << (col + 1 == n ? '\n' : '\t');
        }
    }
    std::cout << "checked_elements=" << c.size()
              << ", mismatches=" << mismatches
              << ", max_abs_error=" << max_abs_error
              << ", max_relative_error_away_from_zero=" << max_relative_error
              << "\natol=" << atol << ", rtol=" << rtol << '\n';
    std::cout << "quantization_max_abs_error=" << quant_max_abs_error
              << ", quantization_relative_L2=";
    if (float_squared_norm > 0)
        std::cout << std::sqrt(quant_squared_error / float_squared_norm);
    else
        std::cout << "N/A (original output norm is zero)";
    std::cout << "\nQuantization metrics are informational, not acceptance thresholds.\n";
    std::cout << (mismatches == 0 ? "PASS" : "FAIL") << " (GPU vs quantized CPU reference)\n";
    return mismatches == 0 ? EXIT_SUCCESS : EXIT_FAILURE;
}

#ifndef MOE_GEMM_LIBRARY
int main(int argc, char** argv) {
    std::vector<int> tokens = {3, 5};
    int n = 4, k = 5, capacity = 0;
    bool masked = false, zero_edges = false;
    try {
        int end = argc, first = 1;
        if (end > 1 && std::string(argv[end - 1]) == "--zero-edges") {
            zero_edges = true;
            --end;
        }
        if (first < end && std::string(argv[first]) == "--masked") {
            masked = true;
            if (first + 1 >= end) throw std::invalid_argument("missing capacity");
            capacity = parse_dimension(argv[first + 1], 0, max_expert_rows);
            first += 2;
        }
        if (first != end) {
            if (end - first != 4) throw std::invalid_argument("expected token counts, N, K");
            if (std::string(argv[first]) == "--tokens")
                tokens = parse_tokens(argv[first + 1]);
            else
                tokens = {parse_dimension(argv[first], 0, max_expert_rows), parse_dimension(argv[first + 1], 0, max_expert_rows)};
            n = parse_dimension(argv[first + 2]);
            k = parse_dimension(argv[first + 3]);
        }
        if (masked && *std::max_element(tokens.begin(), tokens.end()) > capacity)
            throw std::invalid_argument("every masked_m must be <= capacity");
    } catch (const std::exception& error) {
        std::cerr << "Invalid arguments: " << error.what() << "\nUsage: " << argv[0]
                  << " [--masked capacity] [--tokens M0,M1,... N K] [--zero-edges]\n"
                  << "Old two-expert M0 M1 N K syntax is also supported.\n";
        return EXIT_FAILURE;
    }
    int groups = static_cast<int>(tokens.size());
    auto offsets = make_offsets(tokens);
    std::vector<int32_t> metadata = masked ? std::vector<int32_t>(tokens.begin(), tokens.end()) : offsets;
    int rows = masked ? capacity : offsets.back();
    std::cout << (masked ? "Masked NT" : "Contiguous NT") << ": groups=" << groups
              << ", " << (masked ? "capacity=" : "total_m=") << rows
              << ", N=" << n << ", K=" << k << '\n'
              << (masked ? "masked_m:" : "offsets:");
    for (int32_t value : metadata) std::cout << ' ' << value;
    std::cout << '\n';
    std::vector<HostExpert> experts;
    for (int group = 0; group < groups; ++group)
        experts.push_back(prepare_expert(group, tokens[group], n, k, zero_edges));

    HostPacked packed;
    if (rows == 0) {
        // Exercise the public no-op contract, including null pointers.
        if (masked)
            MC_CHECK(moe_int8_masked(nullptr, nullptr, nullptr, nullptr, nullptr,
                                    nullptr, groups, 0, n, k, nullptr));
        else
            MC_CHECK(moe_int8_contiguous(nullptr, nullptr, nullptr, nullptr, nullptr,
                                        nullptr, groups, 0, n, k, nullptr));
    } else {
        packed = masked ? pack_masked(experts, capacity, n, k)
                        : pack_contiguous(experts, offsets, n, k);
        MC_CHECK(mcSetDevice(0));
        auto device = upload_buffers(packed, metadata);
        // Nondefault stream makes ownership and synchronization explicit.
        mcStream_t stream;
        MC_CHECK(mcStreamCreate(&stream));
        if (masked)
            MC_CHECK(moe_int8_masked(device.a, device.b, device.a_scale, device.b_scale,
                                    device.metadata, device.c, groups, capacity, n, k, stream));
        else
            MC_CHECK(moe_int8_contiguous(device.a, device.b, device.a_scale, device.b_scale,
                                        device.metadata, device.c, groups, rows, n, k, stream));
        MC_CHECK(mcStreamSynchronize(stream));
        MC_CHECK(mcMemcpy(packed.c.data(), device.c, packed.c.size() * sizeof(float),
                          mcMemcpyDeviceToHost));
        MC_CHECK(mcStreamDestroy(stream));
        free_buffers(device);
    }

    bool passed = true;
    size_t padding_checked = 0, padding_errors = 0;
    for (int group = 0; group < groups; ++group) {
        auto& h = experts[group];
        size_t row_base = masked ? size_t(group) * capacity : offsets[group];
        if (h.m > 0)
            std::copy_n(packed.c.begin() + row_base * n, h.c.size(), h.c.begin());
        if (check_expert(group, h, zero_edges) != EXIT_SUCCESS) passed = false;
        if (masked)
            for (size_t row = h.m; row < capacity; ++row)
                for (size_t col = 0; col < n; ++col) {
                    ++padding_checked;
                    if (packed.c[(row_base + row) * n + col] != padding_sentinel)
                        ++padding_errors;
                }
    }
    if (masked) {
        std::cout << "padding_checked=" << padding_checked
                  << ", padding_errors=" << padding_errors << '\n';
        if (padding_errors) passed = false;
    }
    std::cout << "\nExperts=" << groups << ", GEMM kernel launches="
              << (rows > 0 ? (groups + groups_per_launch - 1) / groups_per_launch : 0)
              << "\nGrouped result: " << (passed ? "PASS" : "FAIL") << '\n';
    return passed ? EXIT_SUCCESS : EXIT_FAILURE;
}
#endif
