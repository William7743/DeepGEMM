#include <mcr/mc_runtime.h>

#include <algorithm>
#include <cstdint>
#include <cstdlib>
#include <iostream>
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

// All matrices are row-major: A[M,K] * B[K,N] = C[M,N].
// One thread computes one C[row,col]. No shared memory or MMA yet.
__global__ void naive_int8_gemm(const int8_t* a, const int8_t* b,
                               int32_t* c, int m, int n, int k) {
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    if (row >= m || col >= n) return;

    int32_t sum = 0;
    for (int p = 0; p < k; ++p) {
        sum += static_cast<int32_t>(a[row * k + p]) *
               static_cast<int32_t>(b[p * n + col]);
    }
    c[row * n + col] = sum;
}

// Use wider CPU arithmetic and a different loop order for the reference.
std::vector<int64_t> reference_gemm(const std::vector<int8_t>& a,
                                  const std::vector<int8_t>& b,
                                  int m, int n, int k) {
    std::vector<int64_t> c(m * n, 0);
    for (int row = 0; row < m; ++row) {
        for (int p = 0; p < k; ++p) {
            for (int col = 0; col < n; ++col) {
                c[row * n + col] += static_cast<int64_t>(a[row * k + p]) *
                                   static_cast<int64_t>(b[p * n + col]);
            }
        }
    }
    return c;
}

int parse_dimension(const char* value) {
    std::string text(value);
    size_t used = 0;
    int result = std::stoi(text, &used);
    if (used != text.size() || result < 1 || result > 1024)
        throw std::invalid_argument("dimensions must be integers in [1, 1024]");
    return result;
}

int main(int argc, char** argv) {
    // Optional command line: ./naive_gemm.out M N K
    int m = 3, n = 4, k = 5;
    if (argc != 1 && argc != 4) {
        std::cerr << "Usage: " << argv[0] << " [M N K]\n";
        return EXIT_FAILURE;
    }
    try {
        if (argc == 4) {
            m = parse_dimension(argv[1]);
            n = parse_dimension(argv[2]);
            k = parse_dimension(argv[3]);
        }
    } catch (const std::exception& error) {
        std::cerr << "Invalid shape: " << error.what() << '\n';
        return EXIT_FAILURE;
    }

    // 1. Prepare deterministic CPU inputs, including positive/negative/zero.
    // |a|, |b| <= 8 and K <= 1024, so |sum| <= 65536: INT32 cannot overflow.
    std::vector<int8_t> a(m * k), b(k * n);
    std::vector<int32_t> c(m * n);
    for (size_t i = 0; i < a.size(); ++i)
        a[i] = static_cast<int8_t>(static_cast<int>(i % 17) - 8);
    for (size_t i = 0; i < b.size(); ++i)
        b[i] = static_cast<int8_t>(static_cast<int>((i * 3) % 17) - 8);
    auto reference = reference_gemm(a, b, m, n, k);

    // 2. Allocate GPU buffers and copy inputs to device 0.
    MC_CHECK(mcSetDevice(0));
    int8_t *d_a = nullptr, *d_b = nullptr;
    int32_t* d_c = nullptr;
    size_t a_bytes = a.size() * sizeof(int8_t);
    size_t b_bytes = b.size() * sizeof(int8_t);
    size_t c_bytes = c.size() * sizeof(int32_t);
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d_a), a_bytes));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d_b), b_bytes));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d_c), c_bytes));
    MC_CHECK(mcMemcpy(d_a, a.data(), a_bytes, mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d_b, b.data(), b_bytes, mcMemcpyHostToDevice));

    // 3. Launch 16x16 threads per block. Round grid dimensions upwards.
    dim3 block(16, 16);
    dim3 grid((n + block.x - 1) / block.x, (m + block.y - 1) / block.y);
    naive_int8_gemm<<<grid, block>>>(d_a, d_b, d_c, m, n, k);
    MC_CHECK(mcGetLastError());            // Launch errors.
    MC_CHECK(mcDeviceSynchronize());       // Wait and catch execution errors.

    // 4. Copy the result back and release GPU memory.
    MC_CHECK(mcMemcpy(c.data(), d_c, c_bytes, mcMemcpyDeviceToHost));
    MC_CHECK(mcFree(d_a));
    MC_CHECK(mcFree(d_b));
    MC_CHECK(mcFree(d_c));

    // 5. Check EVERY output element. Integer results must match exactly.
    int64_t max_abs_error = 0;
    size_t mismatches = 0;
    for (size_t i = 0; i < c.size(); ++i) {
        int64_t error = static_cast<int64_t>(c[i]) - reference[i];
        if (error < 0) error = -error;
        max_abs_error = std::max(max_abs_error, error);
        if (error != 0) ++mismatches;
    }
    std::cout << "A[" << m << ',' << k << "] * B[" << k << ',' << n
              << "] -> C[" << m << ',' << n << "]\n"
              << "INT8 inputs, INT32 accumulation/output; row-major\n"
              << "block=(" << block.x << ',' << block.y << "), grid=("
              << grid.x << ',' << grid.y << ")\n";
    if (m <= 8 && n <= 8) {
        std::cout << "GPU C:\n";
        for (int row = 0; row < m; ++row) {
            for (int col = 0; col < n; ++col)
                std::cout << c[row * n + col] << (col + 1 == n ? '\n' : '\t');
        }
    }
    std::cout << "checked_elements=" << c.size()
              << ", mismatches=" << mismatches
              << ", max_abs_error=" << max_abs_error << '\n';
    std::cout << (mismatches == 0 ? "PASS" : "FAIL") << '\n';
    return mismatches == 0 ? EXIT_SUCCESS : EXIT_FAILURE;
}
