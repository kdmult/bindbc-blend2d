// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.context;

import bindbc.blend2d.bind.api;
import bindbc.blend2d.bind.array;
import bindbc.blend2d.bind.font;
import bindbc.blend2d.bind.fontdefs;
import bindbc.blend2d.bind.geometry;
import bindbc.blend2d.bind.image;
import bindbc.blend2d.bind.matrix;
import bindbc.blend2d.bind.path;
import bindbc.blend2d.bind.rgba;
import bindbc.blend2d.bind.region;
import bindbc.blend2d.bind.variant;

//extern (System):

//! \addtogroup blend2d_api_rendering
//! \{

// ============================================================================
// [Constants]
// ============================================================================

//! Rendering context type.
enum BLContextType {
    //! No rendering context.
    BL_CONTEXT_TYPE_NONE = 0,
    //! Dummy rendering context.
    BL_CONTEXT_TYPE_DUMMY = 1,

    /*
    //! Proxy rendering context.
    BL_CONTEXT_TYPE_PROXY = 2,
    */

    //! Software-accelerated rendering context.
    BL_CONTEXT_TYPE_RASTER = 3,

    //! Count of rendering context types.
    BL_CONTEXT_TYPE_COUNT = 4
}

//! Rendering context hint.
enum BLContextHint {
    //! Rendering quality.
    BL_CONTEXT_HINT_RENDERING_QUALITY = 0,
    //! Gradient quality.
    BL_CONTEXT_HINT_GRADIENT_QUALITY = 1,
    //! Pattern quality.
    BL_CONTEXT_HINT_PATTERN_QUALITY = 2,

    //! Count of rendering context hints.
    BL_CONTEXT_HINT_COUNT = 8
}

//! Describes a rendering operation type - fill or stroke.
//!
//! The rendering context allows to get and set fill & stroke options directly
//! or via "style" functions that take the rendering operation type (`opType`)
//! and dispatch the call to the right function.
enum BLContextOpType {
    //! Fill operation type.
    BL_CONTEXT_OP_TYPE_FILL = 0,
    //! Stroke operation type.
    BL_CONTEXT_OP_TYPE_STROKE = 1,

    //! Count of rendering operations.
    BL_CONTEXT_OP_TYPE_COUNT = 2
}

//! Rendering context flush-flags, use with `BLContext::flush()`.
enum BLContextFlushFlags {
    //! Wait for completion (will block).
    BL_CONTEXT_FLUSH_SYNC = 0x80000000u
}

//! Rendering context create-flags.
enum BLContextCreateFlags {
    //! When creating an asynchronous rendering context that uses threads for
    //! rendering, the rendering context can sometimes allocate less threads
    //! than specified if the built-in thread-pool doesn't have enough threads
    //! available. This flag will force the thread-pool to override the thread
    //! limit temporarily to fulfill the thread count requirement.
    //!
    //! \note This flag is ignored if `BLContextCreateInfo::threadCount == 0`.
    BL_CONTEXT_CREATE_FLAG_FORCE_THREADS = 0x00000001u,

    //! Fallback to synchronous rendering in case that acquiring threads from
    //! thread-pool failed. This flag only makes sense when asynchronous mode
    //! was specified by having non-zero thread count. In that case if the
    //! rendering context fails to acquire at least one thread it would fallback
    //! to synchronous mode instead.
    //!
    //! \note This flag is ignored if `BLContextCreateInfo::threadCount == 0`.
    BL_CONTEXT_CREATE_FLAG_FALLBACK_TO_SYNC = 0x00000002u,

    //! If this flag is specified and asynchronous rendering is enabled then
    //! the context would create its own isolated thread-pool, which is useful
    //! for debugging purposes.
    //!
    //! Do not use this flag in production as rendering contexts with isolated
    //! thread-pool have to create and destroy all threads they use. This flag
    //! is only useful for testing, debugging, and isolated benchmarking.
    BL_CONTEXT_CREATE_FLAG_ISOLATED_THREADS = 0x00000010u,

    //! If this flag is specified and JIT pipeline generation enabled then the
    //! rendering context would create its own isolated JIT runtime. which is
    //! useful for debugging purposes. This flag will be ignored if JIT pipeline
    //! generation is either not supported or was disabled by other flags.
    //!
    //! Do not use this flag in production as rendering contexts with isolated
    //! JIT runtime do not use global pipeline cache, that's it, after the
    //! rendering context is destroyed the JIT runtime is destroyed with it with
    //! all compiled pipelines. This flag is only useful for testing, debugging,
    //! and isolated benchmarking.
    BL_CONTEXT_CREATE_FLAG_ISOLATED_JIT = 0x00000020u,

    //! Override CPU features when creating isolated context.
    BL_CONTEXT_CREATE_FLAG_OVERRIDE_CPU_FEATURES = 0x00000040u
}

//! Clip mode.
enum BLClipMode {
    //! Clipping to a rectangle that is aligned to the pixel grid.
    BL_CLIP_MODE_ALIGNED_RECT = 0,
    //! Clipping to a rectangle that is not aligned to pixel grid.
    BL_CLIP_MODE_UNALIGNED_RECT = 1,
    //! Clipping to a non-rectangular area that is defined by using mask.
    BL_CLIP_MODE_MASK = 2,

    //! Count of clip modes.
    BL_CLIP_MODE_COUNT = 3
}

//! Composition & blending operator.
enum BLCompOp {
    //! Source-over [default].
    BL_COMP_OP_SRC_OVER = 0,
    //! Source-copy.
    BL_COMP_OP_SRC_COPY = 1,
    //! Source-in.
    BL_COMP_OP_SRC_IN = 2,
    //! Source-out.
    BL_COMP_OP_SRC_OUT = 3,
    //! Source-atop.
    BL_COMP_OP_SRC_ATOP = 4,
    //! Destination-over.
    BL_COMP_OP_DST_OVER = 5,
    //! Destination-copy [nop].
    BL_COMP_OP_DST_COPY = 6,
    //! Destination-in.
    BL_COMP_OP_DST_IN = 7,
    //! Destination-out.
    BL_COMP_OP_DST_OUT = 8,
    //! Destination-atop.
    BL_COMP_OP_DST_ATOP = 9,
    //! Xor.
    BL_COMP_OP_XOR = 10,
    //! Clear.
    BL_COMP_OP_CLEAR = 11,
    //! Plus.
    BL_COMP_OP_PLUS = 12,
    //! Minus.
    BL_COMP_OP_MINUS = 13,
    //! Multiply.
    BL_COMP_OP_MULTIPLY = 14,
    //! Screen.
    BL_COMP_OP_SCREEN = 15,
    //! Overlay.
    BL_COMP_OP_OVERLAY = 16,
    //! Darken.
    BL_COMP_OP_DARKEN = 17,
    //! Lighten.
    BL_COMP_OP_LIGHTEN = 18,
    //! Color dodge.
    BL_COMP_OP_COLOR_DODGE = 19,
    //! Color burn.
    BL_COMP_OP_COLOR_BURN = 20,
    //! Linear burn.
    BL_COMP_OP_LINEAR_BURN = 21,
    //! Linear light.
    BL_COMP_OP_LINEAR_LIGHT = 22,
    //! Pin light.
    BL_COMP_OP_PIN_LIGHT = 23,
    //! Hard-light.
    BL_COMP_OP_HARD_LIGHT = 24,
    //! Soft-light.
    BL_COMP_OP_SOFT_LIGHT = 25,
    //! Difference.
    BL_COMP_OP_DIFFERENCE = 26,
    //! Exclusion.
    BL_COMP_OP_EXCLUSION = 27,

    //! Count of composition & blending operators.
    BL_COMP_OP_COUNT = 28
}

//! Gradient rendering quality.
enum BLGradientQuality {
    //! Nearest neighbor.
    BL_GRADIENT_QUALITY_NEAREST = 0,

    //! Count of gradient quality options.
    BL_GRADIENT_QUALITY_COUNT = 1
}

//! Pattern quality.
enum BLPatternQuality {
    //! Nearest neighbor.
    BL_PATTERN_QUALITY_NEAREST = 0,
    //! Bilinear.
    BL_PATTERN_QUALITY_BILINEAR = 1,

    //! Count of pattern quality options.
    BL_PATTERN_QUALITY_COUNT = 2
}

//! Rendering quality.
enum BLRenderingQuality {
    //! Render using anti-aliasing.
    BL_RENDERING_QUALITY_ANTIALIAS = 0,

    //! Count of rendering quality options.
    BL_RENDERING_QUALITY_COUNT = 1
}

// ============================================================================
// [BLContext - CreateInfo]
// ============================================================================

//! Information that can be used to customize the rendering context.
struct BLContextCreateInfo {
    //! Create flags, see `BLContextCreateFlags`.
    uint flags;

    //! Number of threads to acquire from thread-pool and use for rendering.
    //!
    //! If `threadCount` is zero it means to initialize the context for synchronous
    //! rendering. This means that every operation will take effect immediately.
    //! If the number is `1` or greater it means to initialize the context for
    //! asynchronous rendering - in this case `threadCount` specifies how many
    //! threads can execute in parallel.
    uint threadCount;

    //! CPU features to use in isolated JIT runtime (if supported), only used
    //! when `flags` contains `BL_CONTEXT_CREATE_FLAG_OVERRIDE_CPU_FEATURES`.
    uint cpuFeatures;

    //! Reserved for future use, must be zero.
    uint[5] reserved;
}

// ============================================================================
// [BLContext - Cookie]
// ============================================================================

//! Holds an arbitrary 128-bit value (cookie) that can be used to match other
//! cookies. Blend2D uses cookies in places where it allows to "lock" some
//! state that can only be unlocked by a matching cookie. Please don't confuse
//! cookies with a security of any kind, it's just an arbitrary data that must
//! match to proceed with a certain operation.
//!
//! Cookies can be used with `BLContext::save()` and `BLContext::restore()`
//! functions
struct BLContextCookie {
    ulong[2] data;
}

// ============================================================================
// [BLContext - Hints]
// ============================================================================

//! Rendering context hints.
struct BLContextHints {
    union {
        struct {
            ubyte renderingQuality;
            ubyte gradientQuality;
            ubyte patternQuality;
        }

        ubyte[BLContextHint.BL_CONTEXT_HINT_COUNT] hints;
    }
}

// ============================================================================
// [BLContext - State]
// ============================================================================

//! Rendering context state.
//!
//! This state is not meant to be created by users, it's only provided for users
//! that want to introspect it and for C++ API that accesses it directly.
struct BLContextState {
    //! Current context hints.
    BLContextHints hints;
    //! Current composition operator.
    ubyte compOp;
    //! Current fill rule.
    ubyte fillRule;
    //! Current type of a style for fill and stroke operations, see `BLContextOpType`.
    ubyte[2] styleType;
    //! Reserved for future use, must be zero.
    ubyte[4] reserved;

    //! Approximation options.
    BLApproximationOptions approximationOptions;

    //! Current global alpha value [0, 1].
    double globalAlpha;
    //! Current fill or stroke alpha, see `BLContextOpType`.
    double[2] styleAlpha;

    //! Current stroke options.
    BLStrokeOptionsCore strokeOptions;

    //! Current meta transformation matrix.
    BLMatrix2D metaMatrix;
    //! Current user transformation matrix.
    BLMatrix2D userMatrix;

    //! Count of saved states in the context.
    size_t savedStateCount;
}

// ============================================================================
// [BLContext - Core]
// ============================================================================

//! Rendering context [C Interface - Virtual Function Table].
struct BLContextVirt {
    BLResult function(BLContextImpl* impl) destroy;
    BLResult function(BLContextImpl* impl, uint flags) flush;

    BLResult function(BLContextImpl* impl, BLContextCookie* cookie) save;
    BLResult function(BLContextImpl* impl, const(BLContextCookie)* cookie) restore;

    BLResult function(BLContextImpl* impl, uint opType, const(void)* opData) matrixOp;
    BLResult function(BLContextImpl* impl) userToMeta;

    BLResult function(BLContextImpl* impl, uint hintType, uint value) setHint;
    BLResult function(BLContextImpl* impl, const(BLContextHints)* hints) setHints;
    BLResult function(BLContextImpl* impl, uint mode) setFlattenMode;
    BLResult function(BLContextImpl* impl, double tolerance) setFlattenTolerance;
    BLResult function(BLContextImpl* impl, const(BLApproximationOptions)* options) setApproximationOptions;

    BLResult function(BLContextImpl* impl, uint compOp) setCompOp;
    BLResult function(BLContextImpl* impl, double alpha) setGlobalAlpha;

    // Allows to dispatch fill/stroke by `BLContextOpType`.
    BLResult function(BLContextImpl* impl, double alpha)[2] setStyleAlpha;
    BLResult function(BLContextImpl* impl, void* object)[2] getStyle;
    BLResult function(BLContextImpl* impl, uint* rgba32)[2] getStyleRgba32;
    BLResult function(BLContextImpl* impl, ulong* rgba64)[2] getStyleRgba64;
    BLResult function(BLContextImpl* impl, const(void)* object)[2] setStyle;
    BLResult function(BLContextImpl* impl, uint rgba32)[2] setStyleRgba32;
    BLResult function(BLContextImpl* impl, ulong rgba64)[2] setStyleRgba64;

    BLResult function(BLContextImpl* impl, uint fillRule) setFillRule;

    BLResult function(BLContextImpl* impl, double width) setStrokeWidth;
    BLResult function(BLContextImpl* impl, double miterLimit) setStrokeMiterLimit;
    BLResult function(BLContextImpl* impl, uint position, uint strokeCap) setStrokeCap;
    BLResult function(BLContextImpl* impl, uint strokeCap) setStrokeCaps;
    BLResult function(BLContextImpl* impl, uint strokeJoin) setStrokeJoin;
    BLResult function(BLContextImpl* impl, double dashOffset) setStrokeDashOffset;
    BLResult function(BLContextImpl* impl, const(BLArrayCore)* dashArray) setStrokeDashArray;
    BLResult function(BLContextImpl* impl, uint transformOrder) setStrokeTransformOrder;
    BLResult function(BLContextImpl* impl, const(BLStrokeOptionsCore)* options) setStrokeOptions;

    BLResult function(BLContextImpl* impl, const(BLRectI)* rect) clipToRectI;
    BLResult function(BLContextImpl* impl, const(BLRect)* rect) clipToRectD;
    BLResult function(BLContextImpl* impl) restoreClipping;

    BLResult function(BLContextImpl* impl) clearAll;
    BLResult function(BLContextImpl* impl, const(BLRectI)* rect) clearRectI;
    BLResult function(BLContextImpl* impl, const(BLRect)* rect) clearRectD;

    BLResult function(BLContextImpl* impl) fillAll;
    BLResult function(BLContextImpl* impl, const(BLRectI)* rect) fillRectI;
    BLResult function(BLContextImpl* impl, const(BLRect)* rect) fillRectD;
    BLResult function(BLContextImpl* impl, const(BLPathCore)* path) fillPathD;
    BLResult function(BLContextImpl* impl, uint geometryType, const(void)* geometryData) fillGeometry;
    BLResult function(BLContextImpl* impl, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding) fillTextI;
    BLResult function(BLContextImpl* impl, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding) fillTextD;
    BLResult function(BLContextImpl* impl, const(BLPointI)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun) fillGlyphRunI;
    BLResult function(BLContextImpl* impl, const(BLPoint)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun) fillGlyphRunD;

    BLResult function(BLContextImpl* impl, const(BLRectI)* rect) strokeRectI;
    BLResult function(BLContextImpl* impl, const(BLRect)* rect) strokeRectD;
    BLResult function(BLContextImpl* impl, const(BLPathCore)* path) strokePathD;
    BLResult function(BLContextImpl* impl, uint geometryType, const(void)* geometryData) strokeGeometry;
    BLResult function(BLContextImpl* impl, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding) strokeTextI;
    BLResult function(BLContextImpl* impl, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding) strokeTextD;
    BLResult function(BLContextImpl* impl, const(BLPointI)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun) strokeGlyphRunI;
    BLResult function(BLContextImpl* impl, const(BLPoint)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun) strokeGlyphRunD;

    BLResult function(BLContextImpl* impl, const(BLPointI)* pt, const(BLImageCore)* img, const(BLRectI)* imgArea) blitImageI;
    BLResult function(BLContextImpl* impl, const(BLPoint)* pt, const(BLImageCore)* img, const(BLRectI)* imgArea) blitImageD;
    BLResult function(BLContextImpl* impl, const(BLRectI)* rect, const(BLImageCore)* img, const(BLRectI)* imgArea) blitScaledImageI;
    BLResult function(BLContextImpl* impl, const(BLRect)* rect, const(BLImageCore)* img, const(BLRectI)* imgArea) blitScaledImageD;
}

//! Rendering context [C Interface - Impl].
struct BLContextImpl {
    //! Virtual function table.
    const(BLContextVirt)* virt;
    //! Current state of the context.
    const(BLContextState)* state;
    //! Reserved header for future use.
    void* reservedHeader;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;
    //! Type of the context, see `BLContextType`.
    uint contextType;

    //! Current size of the target in abstract units, pixels if rendering to `BLImage`.
    BLSize targetSize;
}

//! Rendering context [C Interface - Core].
struct BLContextCore {
    BLContextImpl* impl;
}

//! \}
