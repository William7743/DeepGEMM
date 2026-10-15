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

// A descriptor contains GPU addresses, not CPU vector addresses.
// Copy the descriptor array to GPU after allocating every expert's buffers.
struct DeviceExpert {
    int8_t *a = nullptr, *b = nullptr;
    float *a_scale = nullptr, *b_scale = nullptr, *c = nullptr;
    int m = 0, n = 0, k = 0;
};

// All matrices are row-major. One thread computes one output element.
// z selects the expert; x/y select its output column/row.
__global__ void naive_grouped_int8_gemm(const DeviceExpert* groups, int num_groups) {
    int group = blockIdx.z;
    if (group >= num_groups) return;
    const DeviceExpert& e = groups[group];
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    // The grid covers max(M): smaller experts skip surplus rows/blocks.
    if (row >= e.m || col >= e.n) return;

    int32_t sum = 0;
    for (int p = 0; p < e.k; ++p) {
        sum += static_cast<int32_t>(e.a[row * e.k + p]) *
               static_cast<int32_t>(e.b[p * e.n + col]);
    }
    e.c[row * e.n + col] = static_cast<float>(sum) * e.a_scale[row] * e.b_scale[col];
}

struct HostExpert {
    int m, n, k;
    std::vector<float> a_float, b_float, a_scale, b_scale, c;
    std::vector<int8_t> a, b;
};

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

// Prepare each expert independently, but retain BOTH until grouped execution ends.
HostExpert prepare_expert(int expert_id, int m, int n, int k, bool zero_edges) {
    HostExpert h;
    h.m = m; h.n = n; h.k = k;
    h.a_float.resize(m * k); h.b_float.resize(k * n);
    h.a.resize(m * k); h.b.resize(k * n);
    h.a_scale.resize(m); h.b_scale.resize(n);
    // A missing GPU write must fail validation, including when expected C is zero.
    h.c.assign(m * n, std::numeric_limits<float>::quiet_NaN());
    auto& a_float = h.a_float; auto& b_float = h.b_float;
    auto& a = h.a; auto& b = h.b;
    auto& a_scale = h.a_scale; auto& b_scale = h.b_scale;
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
    return h;
}

// Allocate independent GPU buffers; the returned descriptor stays on CPU for now.
DeviceExpert upload_expert(const HostExpert& h) {
    DeviceExpert d;
    d.m = h.m; d.n = h.n; d.k = h.k;
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.a), h.a.size() * sizeof(int8_t)));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.b), h.b.size() * sizeof(int8_t)));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.a_scale), h.a_scale.size() * sizeof(float)));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.b_scale), h.b_scale.size() * sizeof(float)));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.c), h.c.size() * sizeof(float)));
    MC_CHECK(mcMemcpy(d.a, h.a.data(), h.a.size() * sizeof(int8_t), mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d.b, h.b.data(), h.b.size() * sizeof(int8_t), mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d.a_scale, h.a_scale.data(), h.a_scale.size() * sizeof(float), mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d.b_scale, h.b_scale.data(), h.b_scale.size() * sizeof(float), mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d.c, h.c.data(), h.c.size() * sizeof(float), mcMemcpyHostToDevice));
    return d;
}

void free_expert(const DeviceExpert& d) {
    MC_CHECK(mcFree(d.a));
    MC_CHECK(mcFree(d.b));
    MC_CHECK(mcFree(d.a_scale));
    MC_CHECK(mcFree(d.b_scale));
    MC_CHECK(mcFree(d.c));
}

int check_expert(int expert_id, const HostExpert& h, bool zero_edges) {
    std::cout << "\n=== Expert " << expert_id << " ===\n";
    int m = h.m, n = h.n, k = h.k;
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
              << "zero_edges=" << zero_edges << "; row-major\n";
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
    // M0 and M1 are the token counts of the two experts; N and K are shared.
    // Optional command line: ./naive_gemm.out M0 M1 N K [--zero-edges]
    int m0 = 3, m1 = 5, n = 4, k = 5;
    bool zero_edges = argc == 6 && std::string(argv[5]) == "--zero-edges";
    if (argc != 1 && argc != 5 && !zero_edges) {
        std::cerr << "Usage: " << argv[0] << " [M0 M1 N K [--zero-edges]]\n";
        return EXIT_FAILURE;
    }
    try {
        if (argc >= 5) {
            m0 = parse_dimension(argv[1]);
            m1 = parse_dimension(argv[2]);
            n = parse_dimension(argv[3]);
            k = parse_dimension(argv[4]);
        }
    } catch (const std::exception& error) {
        std::cerr << "Invalid shape: " << error.what() << '\n';
        return EXIT_FAILURE;
    }

    constexpr int num_groups = 2;
    HostExpert experts[num_groups] = {
        prepare_expert(0, m0, n, k, zero_edges),
        prepare_expert(1, m1, n, k, zero_edges)
    };
    MC_CHECK(mcSetDevice(0));
    DeviceExpert groups[num_groups] = {
        upload_expert(experts[0]), upload_expert(experts[1])
    };

    // A GPU-readable table of pointers, dimensions and scale pointers.
    DeviceExpert* d_groups = nullptr;
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d_groups), sizeof(groups)));
    MC_CHECK(mcMemcpy(d_groups, groups, sizeof(groups), mcMemcpyHostToDevice));

    dim3 block(16, 16);
    dim3 grid((n + block.x - 1) / block.x,
              (std::max(m0, m1) + block.y - 1) / block.y, num_groups);
    std::cout << "Grouped launch: block=(" << block.x << ',' << block.y
              << "), grid=(" << grid.x << ',' << grid.y << ',' << grid.z << ")\n";
    // Exactly ONE GEMM kernel launch for all experts.
    naive_grouped_int8_gemm<<<grid, block>>>(d_groups, num_groups);
    MC_CHECK(mcGetLastError());
    MC_CHECK(mcDeviceSynchronize());

    bool passed = true;
    for (int group = 0; group < num_groups; ++group) {
        auto& h = experts[group];
        MC_CHECK(mcMemcpy(h.c.data(), groups[group].c,
                          h.c.size() * sizeof(float), mcMemcpyDeviceToHost));
        // Always check every expert, even after a previous one failed.
        int status = check_expert(group, h, zero_edges);
        if (status != EXIT_SUCCESS) passed = false;
        free_expert(groups[group]);
    }
    MC_CHECK(mcFree(d_groups));
    std::cout << "\nTwo experts, one grouped GEMM kernel launch: "
              << (passed ? "PASS" : "FAIL") << '\n';
    return passed ? EXIT_SUCCESS : EXIT_FAILURE;
}
