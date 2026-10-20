#include <mcr/mc_runtime.h>

#include <cerrno>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <stdexcept>
#include <vector>

#define MC_CHECK(call)                                                     \
    do {                                                                   \
        mcError_t status = (call);                                          \
        if (status != mcSuccess) {                                          \
            std::cerr << #call << ": " << mcGetErrorString(status)           \
                      << " (line " << __LINE__ << ")\n";                    \
            std::exit(EXIT_FAILURE);                                       \
        }                                                                  \
    } while (0)

// Row-major A[M,K] * B[K,N] = C[M,N].
// One thread computes one output; there is no shared-memory tile yet.
__global__ void naive_int8_gemm(const int8_t* a, const int8_t* b, int32_t* c,
                               int m, int n, int k) {
    const int col = blockIdx.x * blockDim.x + threadIdx.x;
    const int row = blockIdx.y * blockDim.y + threadIdx.y;
    if (row >= m || col >= n) return;

    int32_t sum = 0;
    for (int p = 0; p < k; ++p) {
        sum += static_cast<int32_t>(a[size_t(row) * k + p]) *
               static_cast<int32_t>(b[size_t(p) * n + col]);
    }
    c[size_t(row) * n + col] = sum;
}

int parse_dimension(const char* text, int maximum) {
    char* end = nullptr;
    errno = 0;
    const long value = std::strtol(text, &end, 10);
    if (errno != 0 || end == text || *end != '\0' || value < 1 || value > maximum)
        throw std::invalid_argument("dimensions must be integers: 1<=M,N<=4096, 1<=K<=32768");
    return static_cast<int>(value);
}

int main(int argc, char** argv) {
    // Small defaults keep the full CPU reference quick.
    int m = 64, n = 64, k = 64;
    if (argc != 1 && argc != 4) {
        std::cerr << "Usage: " << argv[0] << " [M N K]\n";
        return EXIT_FAILURE;
    }
    if (argc == 4) {
        try {
            m = parse_dimension(argv[1], 4096);
            n = parse_dimension(argv[2], 4096);
            k = parse_dimension(argv[3], 32768);
        } catch (const std::exception& error) {
            std::cerr << error.what() << '\n';
            return EXIT_FAILURE;
        }
    }

    // Even full-range INT8 inputs are safe: K*16384 <= 536870912 < INT32_MAX.
    const size_t a_elements = size_t(m) * k;
    const size_t b_elements = size_t(k) * n;
    const size_t c_elements = size_t(m) * n;
    const size_t a_bytes = a_elements * sizeof(int8_t);
    const size_t b_bytes = b_elements * sizeof(int8_t);
    const size_t c_bytes = c_elements * sizeof(int32_t);
    std::vector<int8_t> a(a_elements), b(b_elements);
    std::vector<int32_t> c(c_elements);
    // Deterministic signed inputs, already INT8; no floating-point quantization.
    for (size_t i = 0; i < a_elements; ++i)
        a[i] = static_cast<int8_t>(int((i * 17 + 11) % 256) - 128);
    for (size_t i = 0; i < b_elements; ++i)
        b[i] = static_cast<int8_t>(int((i * 29 + 7) % 256) - 128);

    mcDeviceProp_t properties{};
    MC_CHECK(mcGetDeviceProperties(&properties, 0));
    std::cout << "Device: " << properties.name << '\n'
              << "M=" << m << ", N=" << n << ", K=" << k << '\n'
              << "Row-major INT8 A[M,K] * INT8 B[K,N] -> INT32 C[M,N]\n";

    int8_t *da = nullptr, *db = nullptr;
    int32_t* dc = nullptr;
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&da), a_bytes));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&db), b_bytes));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&dc), c_bytes));
    MC_CHECK(mcMemcpy(da, a.data(), a_bytes, mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(db, b.data(), b_bytes, mcMemcpyHostToDevice));
    // A recognizable initial value also helps expose missing output writes.
    MC_CHECK(mcMemset(dc, 0xA5, c_bytes));

    const dim3 block(16, 16);
    const dim3 grid((n + block.x - 1) / block.x, (m + block.y - 1) / block.y);
    naive_int8_gemm<<<grid, block>>>(da, db, dc, m, n, k);
    MC_CHECK(mcGetLastError());       // Launch errors.
    MC_CHECK(mcDeviceSynchronize()); // Execution errors; wait before validation.
    MC_CHECK(mcMemcpy(c.data(), dc, c_bytes, mcMemcpyDeviceToHost));
    MC_CHECK(mcFree(da));
    MC_CHECK(mcFree(db));
    MC_CHECK(mcFree(dc));

    // Independently accumulate in INT64 and check EVERY output exactly.
    size_t mismatches = 0;
    int64_t max_abs_error = 0;
    for (int row = 0; row < m; ++row) {
        for (int col = 0; col < n; ++col) {
            int64_t expected = 0;
            for (int p = 0; p < k; ++p)
                expected += int64_t(a[size_t(row) * k + p]) *
                            int64_t(b[size_t(p) * n + col]);
            const int64_t actual = c[size_t(row) * n + col];
            const int64_t difference = actual >= expected ? actual - expected : expected - actual;
            if (difference > max_abs_error) max_abs_error = difference;
            if (actual != expected) {
                if (mismatches < 5)
                    std::cerr << "Mismatch C[" << row << ',' << col << "]: GPU="
                              << actual << ", CPU=" << expected << '\n';
                ++mismatches;
            }
        }
    }
    std::cout << "Checked elements: " << c_elements
              << ", mismatches: " << mismatches
              << ", max_abs_error: " << max_abs_error << '\n';
    std::cout << (mismatches == 0 ? "PASS" : "FAIL") << '\n';
    return mismatches == 0 ? EXIT_SUCCESS : EXIT_FAILURE;
}
