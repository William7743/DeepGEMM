// Lesson 02: cooperative shared-memory tiles; scalar INT8 math, no MMA yet.
#include <mcr/mc_runtime.h>
#include <algorithm>
#include <cstdint>
#include <limits>

constexpr int max_expert_rows = 65536;
constexpr int max_nk = 32768;
constexpr int max_groups = 4096;
constexpr int groups_per_launch = 64;
constexpr int BLOCK_M = 16, BLOCK_N = 16, BLOCK_K = 32;
static_assert(int64_t(max_groups) * max_expert_rows <= std::numeric_limits<int32_t>::max(),
              "contiguous offsets must fit INT32");
static_assert(sizeof(size_t) >= 8, "large buffers require 64-bit indexing");
// Full-range INT8: K<=32768 gives |sum|<=32768*16384, within INT32.
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

