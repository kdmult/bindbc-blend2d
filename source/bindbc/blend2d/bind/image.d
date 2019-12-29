// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.image;

import core.stdc.string;
import core.stdc.stdint;

import bindbc.blend2d.bind.api;
import bindbc.blend2d.bind.array;
import bindbc.blend2d.bind.format;
import bindbc.blend2d.bind.geometry;
import bindbc.blend2d.bind.variant;

extern(System) :

//! \addtogroup blend2d_api_imaging
//! \{

// ============================================================================
// [BLImage - Constants]
// ============================================================================

//! Flags used by `BLImageInfo`.
enum BLImageInfoFlags {
    //! Progressive mode.
    BL_IMAGE_INFO_FLAG_PROGRESSIVE = 0x00000001u
}

//! Filter type used by `BLImage::scale()`.
enum BLImageScaleFilter {
    //! No filter or uninitialized.
    BL_IMAGE_SCALE_FILTER_NONE = 0,
    //! Nearest neighbor filter (radius 1.0).
    BL_IMAGE_SCALE_FILTER_NEAREST = 1,
    //! Bilinear filter (radius 1.0).
    BL_IMAGE_SCALE_FILTER_BILINEAR = 2,
    //! Bicubic filter (radius 2.0).
    BL_IMAGE_SCALE_FILTER_BICUBIC = 3,
    //! Bell filter (radius 1.5).
    BL_IMAGE_SCALE_FILTER_BELL = 4,
    //! Gauss filter (radius 2.0).
    BL_IMAGE_SCALE_FILTER_GAUSS = 5,
    //! Hermite filter (radius 1.0).
    BL_IMAGE_SCALE_FILTER_HERMITE = 6,
    //! Hanning filter (radius 1.0).
    BL_IMAGE_SCALE_FILTER_HANNING = 7,
    //! Catrom filter (radius 2.0).
    BL_IMAGE_SCALE_FILTER_CATROM = 8,
    //! Bessel filter (radius 3.2383).
    BL_IMAGE_SCALE_FILTER_BESSEL = 9,
    //! Sinc filter (radius 2.0, adjustable through `BLImageScaleOptions`).
    BL_IMAGE_SCALE_FILTER_SINC = 10,
    //! Lanczos filter (radius 2.0, adjustable through `BLImageScaleOptions`).
    BL_IMAGE_SCALE_FILTER_LANCZOS = 11,
    //! Blackman filter (radius 2.0, adjustable through `BLImageScaleOptions`).
    BL_IMAGE_SCALE_FILTER_BLACKMAN = 12,
    //! Mitchell filter (radius 2.0, parameters 'b' and 'c' passed through `BLImageScaleOptions`).
    BL_IMAGE_SCALE_FILTER_MITCHELL = 13,
    //! Filter using a user-function, must be passed through `BLImageScaleOptions`.
    BL_IMAGE_SCALE_FILTER_USER = 14,

    //! Count of image-scale filters.
    BL_IMAGE_SCALE_FILTER_COUNT = 15
}

// ============================================================================
// [BLImage - Typedefs]
// ============================================================================

//! A user function that can be used by `BLImage::scale()`.
alias BLImageScaleUserFunc = uint function(double* dst, const(double)* tArray, size_t n, const(void)* data);

// ============================================================================
// [BLImage - Data]
// ============================================================================

//! Data that describes a raster image. Used by `BLImage`.
struct BLImageData {
    void* pixelData;
    intptr_t stride;
    BLSizeI size;
    uint format;
    uint flags;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLImage - Info]
// ============================================================================

//! Image information provided by image codecs.
struct BLImageInfo {
    //! Image size.
    BLSizeI size;
    //! Pixel density per one meter, can contain fractions.
    BLSize density;

    //! Image flags.
    uint flags;
    //! Image depth.
    ushort depth;
    //! Number of planes.
    ushort planeCount;
    //! Number of frames (0 = unknown/unspecified).
    ulong frameCount;

    //! Image format (as understood by codec).
    char[16] format;
    //! Image compression (as understood by codec).
    char[16] compression;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLImage - ScaleOptions]
// ============================================================================

//! Options that can used to customize image scaling.
struct BLImageScaleOptions {
    BLImageScaleUserFunc userFunc;
    void* userData;

    double radius;

    union {
        double[3] data;

        struct _Anonymous_0 {
            double b;
            double c;
        }

        _Anonymous_0 mitchell;
    }

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLImage - Core]
// ============================================================================

//! Image [C Interface - Impl].
struct BLImageImpl {
    //! Pixel data.
    void* pixelData;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;

    //! Image format.
    ubyte format;
    //! Image flags.
    ubyte flags;
    //! Image depth (in bits).
    ushort depth;
    //! Image size.
    BLSizeI size;
    //! Image stride.
    intptr_t stride;
}

//! Image [C Interface - Core].
struct BLImageCore {
    BLImageImpl* impl;
}


//! \}
