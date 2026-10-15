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

// Contiguous INT8 NT contract (FP32 per-token/per-channel scales):
// A[T,K], B[G,N,K], C[T,N], A_scale[T], B_scale[G,N], offsets[G+1].
// offsets[g+1]-offsets[g] is expert g's M; repeated offsets mean an empty expert.
struct DeviceContiguous {
    int8_t *a = nullptr, *b = nullptr;
    float *a_scale = nullptr, *b_scale = nullptr, *c = nullptr;
    int32_t* offsets = nullptr;
};

// One launch, still one output element per thread. B is physically [G,N,K].
__global__ void naive_contiguous_int8_gemm(DeviceContiguous data,
                                          int num_groups, int n, int k) {
    int group = blockIdx.z;
    if (group >= num_groups) return;
    int begin = data.offsets[group];
    int m = data.offsets[group + 1] - begin;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    if (row >= m || col >= n) return;
    int global_row = begin + row;

    int32_t sum = 0;
    for (int p = 0; p < k; ++p) {
        sum += static_cast<int32_t>(data.a[global_row * k + p]) *
               static_cast<int32_t>(data.b[(group * n + col) * k + p]);
    }
    data.c[global_row * n + col] = static_cast<float>(sum) *
                                 data.a_scale[global_row] * data.b_scale[group * n + col];
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

int parse_dimension(const char* value, int minimum = 1) {
    std::string text(value);
    if (text.empty() || !std::all_of(text.begin(), text.end(),
                                   [](char ch) { return ch >= '0' && ch <= '9'; }))
        throw std::invalid_argument("dimensions must contain decimal digits only");
    size_t used = 0;
    int result = std::stoi(text, &used);
    if (used != text.size() || result < minimum || result > 1024)
        throw std::invalid_argument("M must be in [0,1024]; N and K in [1,1024]");
    return result;
}

// A bounded teaching interface: 1..64 groups, with one M per group.
std::vector<int> parse_tokens(const char* value) {
    std::string text(value);
    std::vector<int> tokens;
    size_t begin = 0;
    while (true) {
        size_t end = text.find(',', begin);
        std::string item = text.substr(begin, end == std::string::npos ? end : end - begin);
        tokens.push_back(parse_dimension(item.c_str(), 0));
        if (tokens.size() > 64)
            throw std::invalid_argument("the teaching example supports 1..64 experts");
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

// Keep the old per-expert [K,N] CPU arrays as an independent reference.
// Only the packed GPU input changes to the NT weight layout [G,N,K].
struct HostContiguous {
    std::vector<int8_t> a, b;
    std::vector<float> a_scale, b_scale, c;
};

std::vector<int32_t> make_offsets(const std::vector<int>& counts) {
    std::vector<int32_t> offsets(1, 0);
    for (int count : counts) offsets.push_back(offsets.back() + count);
    return offsets;
}

HostContiguous pack_contiguous(const std::vector<HostExpert>& experts,
                               const std::vector<int32_t>& offsets, int n, int k) {
    HostContiguous packed;
    int total_m = offsets.back();
    packed.a.resize(total_m * k);
    packed.b.assign(experts.size() * n * k, 0);
    packed.a_scale.resize(total_m);
    packed.b_scale.assign(experts.size() * n, 1.0f);
    packed.c.assign(total_m * n, std::numeric_limits<float>::quiet_NaN());
    for (size_t group = 0; group < experts.size(); ++group) {
        const auto& h = experts[group];
        if (h.m == 0) continue; // Empty weights keep their reserved zero-filled slot.
        std::copy(h.a.begin(), h.a.end(), packed.a.begin() + offsets[group] * k);
        std::copy(h.a_scale.begin(), h.a_scale.end(), packed.a_scale.begin() + offsets[group]);
        std::copy(h.b_scale.begin(), h.b_scale.end(), packed.b_scale.begin() + group * n);
        // Same mathematical weights, different physical layout: [K,N] -> [N,K].
        for (int col = 0; col < n; ++col)
            for (int p = 0; p < k; ++p)
                packed.b[(group * n + col) * k + p] = h.b[p * n + col];
    }
    return packed;
}

DeviceContiguous upload_contiguous(const HostContiguous& h,
                                   const std::vector<int32_t>& offsets) {
    DeviceContiguous d;
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.a), h.a.size() * sizeof(int8_t)));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.b), h.b.size() * sizeof(int8_t)));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.a_scale), h.a_scale.size() * sizeof(float)));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.b_scale), h.b_scale.size() * sizeof(float)));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.c), h.c.size() * sizeof(float)));
    MC_CHECK(mcMalloc(reinterpret_cast<void**>(&d.offsets), offsets.size() * sizeof(int32_t)));
    MC_CHECK(mcMemcpy(d.a, h.a.data(), h.a.size() * sizeof(int8_t), mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d.b, h.b.data(), h.b.size() * sizeof(int8_t), mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d.a_scale, h.a_scale.data(), h.a_scale.size() * sizeof(float), mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d.b_scale, h.b_scale.data(), h.b_scale.size() * sizeof(float), mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d.c, h.c.data(), h.c.size() * sizeof(float), mcMemcpyHostToDevice));
    MC_CHECK(mcMemcpy(d.offsets, offsets.data(), offsets.size() * sizeof(int32_t), mcMemcpyHostToDevice));
    return d;
}

void free_contiguous(const DeviceContiguous& d) {
    MC_CHECK(mcFree(d.a));
    MC_CHECK(mcFree(d.b));
    MC_CHECK(mcFree(d.a_scale));
    MC_CHECK(mcFree(d.b_scale));
    MC_CHECK(mcFree(d.c));
    MC_CHECK(mcFree(d.offsets));
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
    // New: --tokens M0,M1,... N K [--zero-edges]. Keep the old two-expert form.
    std::vector<int> tokens = {3, 5};
    int n = 4, k = 5;
    bool zero_edges = argc == 6 && std::string(argv[5]) == "--zero-edges";
    if (argc != 1 && argc != 5 && !zero_edges) {
        std::cerr << "Usage: " << argv[0]
                  << " [--tokens M0,M1,... N K [--zero-edges]]\n"
                  << "   or: " << argv[0] << " M0 M1 N K [--zero-edges]\n";
        return EXIT_FAILURE;
    }
    try {
        if (argc >= 5) {
            if (std::string(argv[1]) == "--tokens")
                tokens = parse_tokens(argv[2]);
            else
                tokens = {parse_dimension(argv[1], 0), parse_dimension(argv[2], 0)};
            n = parse_dimension(argv[3]);
            k = parse_dimension(argv[4]);
        }
    } catch (const std::exception& error) {
        std::cerr << "Invalid shape: " << error.what() << '\n';
        return EXIT_FAILURE;
    }

    int num_groups = static_cast<int>(tokens.size());
    int max_m = *std::max_element(tokens.begin(), tokens.end());
    auto offsets = make_offsets(tokens);
    std::cout << "Contiguous NT: A[" << offsets.back() << ',' << k << "], B["
              << num_groups << ',' << n << ',' << k << "], C["
              << offsets.back() << ',' << n << "]\noffsets:";
    for (int32_t offset : offsets) std::cout << ' ' << offset;
    std::cout << '\n';
    std::vector<HostExpert> experts;
    for (int group = 0; group < num_groups; ++group)
        experts.push_back(prepare_expert(group, tokens[group], n, k, zero_edges));

    // A zero-height grid is invalid. All-empty input is a successful no-op.
    // No GPU allocation, copy, launch or synchronization is needed in this path.
    if (max_m == 0) {
        bool passed = true;
        std::cout << "All experts empty: GEMM kernel launches=0\n";
        for (int group = 0; group < num_groups; ++group)
            if (check_expert(group, experts[group], zero_edges) != EXIT_SUCCESS)
                passed = false;
        std::cout << "Grouped result: " << (passed ? "PASS" : "FAIL") << '\n';
        return passed ? EXIT_SUCCESS : EXIT_FAILURE;
    }

    auto packed = pack_contiguous(experts, offsets, n, k);
    MC_CHECK(mcSetDevice(0));
    auto device = upload_contiguous(packed, offsets);

    dim3 block(16, 16);
    dim3 grid((n + block.x - 1) / block.x,
              (max_m + block.y - 1) / block.y, num_groups);
    std::cout << "Grouped launch: block=(" << block.x << ',' << block.y
              << "), grid=(" << grid.x << ',' << grid.y << ',' << grid.z << ")\n";
    // Exactly ONE GEMM kernel launch whenever at least one expert is nonempty.
    naive_contiguous_int8_gemm<<<grid, block>>>(device, num_groups, n, k);
    MC_CHECK(mcGetLastError());
    MC_CHECK(mcDeviceSynchronize());

    MC_CHECK(mcMemcpy(packed.c.data(), device.c, packed.c.size() * sizeof(float),
                      mcMemcpyDeviceToHost));
    free_contiguous(device);
    bool passed = true;
    for (int group = 0; group < num_groups; ++group) {
        auto& h = experts[group];
        // Return each contiguous slice to its CPU reference object for verification.
        std::copy(packed.c.begin() + offsets[group] * n,
                  packed.c.begin() + offsets[group + 1] * n, h.c.begin());
        // Always check every expert, even after a previous one failed.
        int status = check_expert(group, h, zero_edges);
        if (status != EXIT_SUCCESS) passed = false;
    }
    std::cout << "\nExperts=" << num_groups << ", GEMM kernel launches=1\n"
              << "Grouped result: " << (passed ? "PASS" : "FAIL") << '\n';
    return passed ? EXIT_SUCCESS : EXIT_FAILURE;
}
