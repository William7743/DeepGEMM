// MACA C++ adapter: native INT8 tensor-core grouped GEMM, FP32 epilogue.
// The mctlass implementation is supplied by the installed MetaX MACA SDK.
#include <mcr/mc_runtime.h>
#include <mctlass/frontend_op/gemm_config.h>
#include <mctlass/frontend_op/epilogue_output_op_config.h>
#include <cstdint>
#include <cstdio>
#include <exception>
#include <limits>

namespace {
thread_local char last_error[512] = {};

int fail(const char* message, int status = -1) {
  std::snprintf(last_error, sizeof(last_error), "%s (status=%d)", message, status);
  return status == 0 ? -1 : status;
}

template<int TileM>
int launch(const void* a, const void* b, void* d, const void* sa, const void* sb,
           const void* segments, const void* weights, const void* tiles,
           int groups, int m, int n, int k, mcStream_t stream) {
  using Shape = mctlass::gemm::GemmShape<TileM, 128, 256>;
  using Warp = mctlass::gemm::GemmShape<(TileM == 128 ? 64 : TileM),
                                     (TileM == 128 ? 64 : 32), 256>;
  using Epilogue = typename LinearCombinationScaleConfig<
      int32_t, float, float, 4, scaleType::ScaleAvBv>::epilogueOutputOp;
  using Gemm = typename gemmContiguousGroupedConfig<
      int8_t, mctlass::layout::RowMajor,
      int8_t, mctlass::layout::ColumnMajor,
      float, mctlass::layout::RowMajor, int32_t, mctlass::arch::Sm80,
      Shape, Warp, mctlass::gemm::GemmShape<16, 16, 16>,
      Epilogue, 4, 16, 16>::mctlassGemm;
  // SDK kernel writes ptr_C; use the same allocation for ptr_C and ptr_D.
  typename Gemm::Arguments args{
      {static_cast<const float*>(sa), static_cast<const float*>(sb)},
      const_cast<int8_t*>(static_cast<const int8_t*>(a)),
      const_cast<int8_t*>(static_cast<const int8_t*>(b)),
      static_cast<float*>(d), static_cast<float*>(d), groups, m, n, k,
      static_cast<const int*>(segments), static_cast<const int*>(weights),
      static_cast<const int*>(tiles), k, k, n, n};
  auto status = Gemm::can_implement(args);
  if (status != mctlass::Status::kSuccess)
    return fail("mctlass cannot implement this configuration", int(status));
  if (Gemm::get_workspace_size(args) != 0)
    return fail("unexpected nonzero mctlass workspace requirement");
  Gemm op;
  status = op(args, nullptr, stream);
  if (status != mctlass::Status::kSuccess)
    return fail("mctlass grouped GEMM launch failed", int(status));
  auto runtime_status = mcGetLastError();
  if (runtime_status != mcSuccess)
    return fail(mcGetErrorString(runtime_status), int(runtime_status));
  return 0;
}
}  // namespace

extern "C" const char* dg_maca_last_error() { return last_error; }

extern "C" int dg_maca_gemm(
    const void* a, const void* b, void* d, const void* sa, const void* sb,
    const void* segments, const void* weights, const void* tiles,
    int groups, int m, int n, int k, int tile_m, void* stream) {
  last_error[0] = '\0';
  if (groups <= 0 || m < 0 || n <= 0 || k <= 0 || n % 128 || k % 256 || k > 131071)
    return fail("invalid dimensions: G>0, M>=0, N%128=0, K%256=0, K<=131071 required");
  const int64_t max_index = std::numeric_limits<int32_t>::max();
  if (int64_t(m)*k > max_index || int64_t(m)*n > max_index ||
      int64_t(groups)*n > max_index/k)
    return fail("SDK kernel uses int32 element offsets; tensor exceeds supported size");
  if (tile_m != 16 && tile_m != 32 && tile_m != 64 && tile_m != 128)
    return fail("tile_m must be 16, 32, 64 or 128");
  if (m == 0) return 0;
  if (!a || !b || !d || !sa || !sb || !segments || !weights || !tiles)
    return fail("null device pointer");
  if (uintptr_t(a)%16 || uintptr_t(b)%16 || uintptr_t(d)%16 ||
      uintptr_t(sa)%4 || uintptr_t(sb)%4 || uintptr_t(segments)%4 ||
      uintptr_t(weights)%4 || uintptr_t(tiles)%4)
    return fail("misaligned device pointer");
  try {
    auto s = reinterpret_cast<mcStream_t>(stream);
    switch (tile_m) {
      case 16: return launch<16>(a,b,d,sa,sb,segments,weights,tiles,groups,m,n,k,s);
      case 32: return launch<32>(a,b,d,sa,sb,segments,weights,tiles,groups,m,n,k,s);
      case 64: return launch<64>(a,b,d,sa,sb,segments,weights,tiles,groups,m,n,k,s);
      case 128:return launch<128>(a,b,d,sa,sb,segments,weights,tiles,groups,m,n,k,s);
    }
  } catch (const std::exception& e) {
    return fail(e.what());
  } catch (...) {
    return fail("unknown native exception");
  }
  return fail("unreachable tile selection");
}
