#include <mcr/mc_runtime.h>

#include <algorithm>
#include <cmath>
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
                               const float* a_scale, const float* b_scale,
                               float* c, int m, int n, int k) {
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    if (row >= m || col >= n) return;

    int32_t sum = 0;
    for (int p = 0; p < k; ++p) {
        sum += static_cast<int32_t>(a[row * k + p]) *
               static_cast<int32_t>(b[p * n + col]);
    }
    // Zero points are zero. Scale once AFTER the integer dot product.
    // a_scale has M entries (tokens), b_scale has N entries (output channels).
    c[row * n + col] = static_cast<float>(sum) * a_scale[row] * b_scale[col];
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

// Symmetric quantization: x ~= q * scale, zero point = 0.
// Round halfway away from zero, then clamp BEFORE converting to int8_t.
int8_t quantize_value(float x, float scale) {
    float q = std::round(x / scale);
    return static_cast<int8_t>(std::clamp(q, -127.0f, 127.0f));
}

void quantize_a_rows(const std::vector<float>& input, std::vector<int8_t>& q,
                     std::vector<float>& scales, int m, int k) {
    for (int row = 0; row < m; ++row) {
        float max_abs = 0;
        for (int p = 0; p < k; ++p)
            max_abs = std::max(max_abs, std::abs(input[row * k + p]));
        // A zero row stays zero; scale=1 avoids division by zero.
        scales[row] = max_abs == 0 ? 1.0f : max_abs / 127.0f;
        for (int p = 0; p < k; ++p)
            q[row * k + p] = quantize_value(input[row * k + p], scales[row]);
    }
}

void quantize_b_columns(const std::vector<float>& input, std::vector<int8_t>& q,
                        std::vector<float>& scales, int k, int n) {
    for (int col = 0; col < n; ++col) {
        float max_abs = 0;
        for (int p = 0; p < k; ++p)
            max_abs = std::max(max_abs, std::abs(input[p * n + col]));
        scales[col] = max_abs == 0 ? 1.0f : max_abs / 127.0f;
        for (int p = 0; p < k; ++p)
            q[p * n + col] = quantize_value(input[p * n + col], scales[col]);
    }
}

// Original floating inputs: this reference measures quantization loss.
std::vector<double> reference_float_gemm(const std::vector<float>& a,
                                        const std::vector<float>& b,
                                        int m, int n, int k) {
    std::vector<double> c(m * n, 0);
    for (int row = 0; row < m; ++row)
        for (int p = 0; p < k; ++p)
            for (int col = 0; col < n; ++col)
                c[row * n + col] += static_cast<double>(a[row * k + p]) *
                                   static_cast<double>(b[p * n + col]);
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

// Each call owns one expert's CPU arrays and GPU buffers.
// Run and verify it completely before returning; two calls mean two launches.
int run_expert(int expert_id, int m, int n, int k, bool zero_edges) {
    std::cout << "\n=== Expert " << expert_id << " ===\n";
    // 1. Generate floating inputs, then quantize on CPU.
    // Finite, moderate values for this lesson; not a general quantization API.
    std::vector<float> a_float(m * k), b_float(k * n);
    std::vector<int8_t> a(m * k), b(k * n);
    std::vector<float> c(m * n), a_scale(m), b_scale(n);
    for (int row = 0; row < m; ++row)
        for (int p = 0; p < k; ++p)
            a_float[row * k + p] = (static_cast<int>((row * k + p + expert_id * 5) % 17) - 8) *
                                   0.13f * (1 + row % 7 + expert_id);
    for (int p = 0; p < k; ++p)
        for (int col = 0; col < n; ++col)
            b_float[p * n + col] = (static_cast<int>(((p * n + col) * 3 + expert_id * 7) % 17) - 8) *
                                   0.17f * (1 + col % 5 + expert_id);
    if (zero_edges) {
        for (int p = 0; p < k; ++p) {
            a_float[(m - 1) * k + p] = 0;
            b_float[p * n + n - 1] = 0;
        }
    }
    quantize_a_rows(a_float, a, a_scale, m, k);
    quantize_b_columns(b_float, b, b_scale, k, n);
    // |q| <= 127, K <= 1024: |sum| <= 16,516,096, safe in INT32.
    auto reference = reference_gemm(a, b, m, n, k);
    auto float_reference = reference_float_gemm(a_float, b_float, m, n, k);

    // 2. Allocate GPU buffers and copy inputs to device 0.
    MC_CHECK(mcSetDevice(0));
    int8_t *d_a = nullptr, *d_b = nullptr;
    float *d_c = nullptr, *d_a_scale = nullptr, *d_b_scale = nullptr;
    size_t a_bytes = a.size() * sizeof(int8_t);
    size_t b_bytes = b.size() * sizeof(int8_t);
    size_t c_bytes = c.size() * sizeof(float);
    size_t a_scale_bytes = a_scale.size() * sizeof(float);
    size_t b_scale_bytes = b_scale.size() * sizeof(float);
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d_a), a_bytes));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d_b), b_bytes));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d_c), c_bytes));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d_a_scale), a_scale_bytes));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d_b_scale), b_scale_bytes));
    MC_CHECK(mcMemcpy(d_a, a.data(), a_bytes, mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d_b, b.data(), b_bytes, mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d_a_scale, a_scale.data(), a_scale_bytes, mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d_b_scale, b_scale.data(), b_scale_bytes, mcMemcpyHostToDevice));

    // 3. Launch 16x16 threads per block. Round grid dimensions upwards.
    dim3 block(16, 16);
    dim3 grid((n + block.x - 1) / block.x, (m + block.y - 1) / block.y);
    naive_int8_gemm<<<grid, block>>>(d_a, d_b, d_a_scale, d_b_scale, d_c, m, n, k);
    MC_CHECK(mcGetLastError());            // Launch errors.
    MC_CHECK(mcDeviceSynchronize());       // Wait and catch execution errors.

    // 4. Copy the result back and release GPU memory.
    MC_CHECK(mcMemcpy(c.data(), d_c, c_bytes, mcMemcpyDeviceToHost));
    MC_CHECK(mcFree(d_a));
    MC_CHECK(mcFree(d_b));
    MC_CHECK(mcFree(d_c));
    MC_CHECK(mcFree(d_a_scale));
    MC_CHECK(mcFree(d_b_scale));

    // 5. Check EVERY output against INT64 accumulation + FP64 scaling.
    // FP32 multiplication rounds: use absolute + relative tolerance.
    constexpr double atol = 1e-6, rtol = 1e-5;
    double max_abs_error = 0, max_relative_error = 0;
    double quant_max_abs_error = 0, quant_squared_error = 0, float_squared_norm = 0;
    size_t mismatches = 0;
    for (size_t i = 0; i < c.size(); ++i) {
        int row = static_cast<int>(i) / n, col = static_cast<int>(i) % n;
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
              << "zero_edges=" << zero_edges << "; row-major\n"
              << "block=(" << block.x << ',' << block.y << "), grid=("
              << grid.x << ',' << grid.y << ")\n";
    if (m <= 8 && n <= 8) {
        if (k <= 8) {
            std::cout << "A first row: float -> INT8 -> reconstructed float\n";
            for (int p = 0; p < k; ++p)
                std::cout << a_float[p] << " -> " << static_cast<int>(a[p])
                          << " -> " << a[p] * a_scale[0] << '\n';
        }
        std::cout << "A row scales:";
        for (float s : a_scale) std::cout << ' ' << s;
        std::cout << "\nB column scales:";
        for (float s : b_scale) std::cout << ' ' << s;
        std::cout << '\n';
        std::cout << "GPU C:\n";
        for (int row = 0; row < m; ++row) {
            for (int col = 0; col < n; ++col)
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

int main(int argc, char** argv) {
    // Optional command line: ./naive_gemm.out M N K [--zero-edges]
    int m = 3, n = 4, k = 5;
    bool zero_edges = argc == 5 && std::string(argv[4]) == "--zero-edges";
    if (argc != 1 && argc != 4 && !zero_edges) {
        std::cerr << "Usage: " << argv[0] << " [M N K [--zero-edges]]\n";
        return EXIT_FAILURE;
    }
    try {
        if (argc >= 4) {
            m = parse_dimension(argv[1]);
            n = parse_dimension(argv[2]);
            k = parse_dimension(argv[3]);
        }
    } catch (const std::exception& error) {
        std::cerr << "Invalid shape: " << error.what() << '\n';
        return EXIT_FAILURE;
    }

    // Keep both experts at the same shape for this lesson.
    // Their input values, weights, scales and reference results are independent.
    int expert0_status = run_expert(0, m, n, k, zero_edges);
    int expert1_status = run_expert(1, m, n, k, zero_edges);
    bool passed = expert0_status == EXIT_SUCCESS && expert1_status == EXIT_SUCCESS;
    std::cout << "\nTwo experts, two separate kernel launches: "
              << (passed ? "PASS" : "FAIL") << '\n';
    return passed ? EXIT_SUCCESS : EXIT_FAILURE;
}
