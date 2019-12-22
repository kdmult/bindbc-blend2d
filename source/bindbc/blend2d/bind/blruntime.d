// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.blruntime;

import bindbc.blend2d.bind.blapi;

//extern (System):

//! \addtogroup blend2d_api_runtime
//! \{

// ============================================================================
// [Constants]
// ============================================================================

//! Blend2D runtime limits.
//!
//! \note These constanst are used across Blend2D, but they are not designed to
//! be ABI stable. New versions of Blend2D can increase certain limits without
//! notice. Use runtime to query the limits dynamically, see `BLRuntimeBuildInfo`.
enum BLRuntimeLimits {
    //! Maximum width and height of an image.
    BL_RUNTIME_MAX_IMAGE_SIZE = 65535,
    //! Maximum number of threads for asynchronous operations (including rendering).
    BL_RUNTIME_MAX_THREAD_COUNT = 32
}

//! Type of runtime information that can be queried through `blRuntimeQueryInfo()`.
enum BLRuntimeInfoType {
    //! Blend2D build information.
    BL_RUNTIME_INFO_TYPE_BUILD = 0,
    //! System information (includes CPU architecture, features, cores, etc...).
    BL_RUNTIME_INFO_TYPE_SYSTEM = 1,
    //! Runtime information regarding memory used, reserved, etc...
    BL_RUNTIME_INFO_TYPE_MEMORY = 2,

    //! Count of runtime information types.
    BL_RUNTIME_INFO_TYPE_COUNT = 3
}

//! Blend2D runtime build type.
enum BLRuntimeBuildType {
    //! Describes a Blend2D debug build.
    BL_RUNTIME_BUILD_TYPE_DEBUG = 0,
    //! Describes a Blend2D release build.
    BL_RUNTIME_BUILD_TYPE_RELEASE = 1
}

//! CPU architecture that can be queried by `BLRuntime::querySystemInfo()`.
enum BLRuntimeCpuArch {
    //! Unknown architecture.
    BL_RUNTIME_CPU_ARCH_UNKNOWN = 0,
    //! 32-bit or 64-bit X86 architecture.
    BL_RUNTIME_CPU_ARCH_X86 = 1,
    //! 32-bit or 64-bit ARM architecture.
    BL_RUNTIME_CPU_ARCH_ARM = 2,
    //! 32-bit or 64-bit MIPS architecture.
    BL_RUNTIME_CPU_ARCH_MIPS = 3
}

//! CPU features Blend2D supports.
enum BLRuntimeCpuFeatures {
    BL_RUNTIME_CPU_FEATURE_X86_SSE2 = 0x00000001u,
    BL_RUNTIME_CPU_FEATURE_X86_SSE3 = 0x00000002u,
    BL_RUNTIME_CPU_FEATURE_X86_SSSE3 = 0x00000004u,
    BL_RUNTIME_CPU_FEATURE_X86_SSE4_1 = 0x00000008u,
    BL_RUNTIME_CPU_FEATURE_X86_SSE4_2 = 0x00000010u,
    BL_RUNTIME_CPU_FEATURE_X86_AVX = 0x00000020u,
    BL_RUNTIME_CPU_FEATURE_X86_AVX2 = 0x00000040u
}

//! Runtime cleanup flags that can be used through `BLRuntime::cleanup()`.
enum BLRuntimeCleanupFlags {
    //! Cleanup object memory pool.
    BL_RUNTIME_CLEANUP_OBJECT_POOL = 0x00000001u,
    //! Cleanup zeroed memory pool.
    BL_RUNTIME_CLEANUP_ZEROED_POOL = 0x00000002u,
    //! Cleanup thread pool (would join unused threads).
    BL_RUNTIME_CLEANUP_THREAD_POOL = 0x00000010u,

    //! Cleanup everything.
    BL_RUNTIME_CLEANUP_EVERYTHING = 0xFFFFFFFFu
}

// ============================================================================
// [BLRuntime - BuildInfo]
// ============================================================================

//! Blend2D build information.
struct BLRuntimeBuildInfo {
    union {
        //! Blend2D version stored as `((MAJOR << 16) | (MINOR << 8) | PATCH)`.
        uint version_;

        //! Decomposed Blend2D version so it's easier to access without bit shifting.
        struct {
            // LITTLE ENDIAN
            ubyte patchVersion;
            ubyte minorVersion;
            ushort majorVersion;
        }
    }

    //! Blend2D build type, see `BLRuntimeBuildType`.
    uint buildType;

    //! Baseline CPU features, see `BLRuntimeCpuFeatures`.
    //!
    //! These features describe CPU features that were detected at compile-time.
    //! Baseline features are used to compile all source files so they represent
    //! the minimum feature-set the target CPU must support to run Blend2D.
    //!
    //! Official Blend2D builds set baseline at SSE2 on X86 target and NEON on
    //! ARM target. Custom builds can set use different baseline, which can be
    //! read through `BLRuntimeBuildInfo`.
    uint baselineCpuFeatures;

    //! Supported CPU features, see `BLRuntimeCpuFeatures`.
    //!
    //! These features do not represent the features that the host CPU must support,
    //! instead, they represent all features that Blend2D can take advantage of in
    //! C++ code that uses instruction intrinsics. For example if AVX2 is part of
    //! `supportedCpuFeatures` it means that Blend2D can take advantage of it if
    //! there is a separate code-path.
    uint supportedCpuFeatures;

    //! Maximum size of an image (both width and height).
    uint maxImageSize;

    //! Maximum number of threads for asynchronous operations, including rendering.
    uint maxThreadCount;

    //! Reserved, must be zero.
    uint[2] reserved;

    //! Identification of the C++ compiler used to build Blend2D.
    char[32] compilerInfo;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLRuntime - SystemInfo]
// ============================================================================

//! System information queried by the runtime.
struct BLRuntimeSystemInfo {
    //! Host CPU architecture, see `BLRuntimeCpuArch`.
    uint cpuArch;
    //! Host CPU features, see `BLRuntimeCpuFeatures`.
    uint cpuFeatures;
    //! Number of cores of the host CPU/CPUs.
    uint coreCount;
    //! Number of threads of the host CPU/CPUs.
    uint threadCount;

    //! Minimum stack size of threads.
    uint minThreadStackSize;
    //! Minimum stack size of worker threads used by Blend2D.
    uint minWorkerStackSize;
    //! Allocation granularity of virtual memory (includes thread's stack).
    uint allocationGranularity;
    //! Reserved for future use.
    uint[5] reserved;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLRuntime - MemoryInfo]
// ============================================================================

//! Blend2D memory information that provides how much memory Blend2D allocated
//! and some other details about memory use.
struct BLRuntimeMemoryInfo {
    //! Virtual memory used at this time.
    size_t vmUsed;
    //! Virtual memory reserved (allocated internally).
    size_t vmReserved;
    //! Overhead required to manage virtual memory allocations.
    size_t vmOverhead;
    //! Number of blocks of virtual memory allocated.
    size_t vmBlockCount;

    //! Zeroed memory used at this time.
    size_t zmUsed;
    //! Zeroed memory reserved (allocated internally).
    size_t zmReserved;
    //! Overhead required to manage zeroed memory allocations.
    size_t zmOverhead;
    //! Number of blocks of zeroed memory allocated.
    size_t zmBlockCount;

    //! Count of dynamic pipelines created and cached.
    size_t dynamicPipelineCount;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLRuntime - C++ API]
// ============================================================================

//! Interface to access Blend2D runtime (wraps C-API).

// {BLRuntime}

//! \}

// BLEND2D_BLRUNTIME_H
