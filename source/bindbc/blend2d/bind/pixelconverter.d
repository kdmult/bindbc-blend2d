// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.pixelconverter;

import core.stdc.string;
import core.stdc.stdint;

import bindbc.blend2d.bind.api;
import bindbc.blend2d.bind.format;
import bindbc.blend2d.bind.geometry;

extern(System) :

//! \addtogroup blend2d_api_imaging
//! \{

// ============================================================================
// [BLPixelConverterFunc]
// ============================================================================

//! \cond INTERNAL
//! \ingroup  blend2d_internal
//! Pixel converter function.
alias BLPixelConverterFunc = uint function(const(BLPixelConverterCore)* self, ubyte* dstData, intptr_t dstStride, const(ubyte)* srcData, intptr_t srcStride, uint w, uint h, const(BLPixelConverterOptions)* options);

//! \endcond

// ============================================================================
// [BLPixelConverterCreateFlags]
// ============================================================================

//! Flags used by `BLPixelConverter::create()` function.
enum BLPixelConverterCreateFlags
{
    //! Specifies that the source palette in `BLFormatInfo` doesn't have to by
    //! copied by `BLPixelConverter`. The caller must ensure that the palette
    //! would stay valid until the pixel converter is destroyed.
    BL_PIXEL_CONVERTER_CREATE_FLAG_DONT_COPY_PALETTE = 0x00000001u,

    //! Specifies that the source palette in `BLFormatInfo` is alterable and
    //! the pixel converter can modify it when preparing the conversion. The
    //! modification can be irreversible so only use this flag when you are sure
    //! that the palette passed to `BLPixelConverter::create()` won't be needed
    //! outside of pixel conversion.
    //!
    //! \note The flag `BL_PIXEL_CONVERTER_CREATE_FLAG_DONT_COPY_PALETTE` must be
    //! set as well, otherwise this flag would be ignored.
    BL_PIXEL_CONVERTER_CREATE_FLAG_ALTERABLE_PALETTE = 0x00000002u,

    //! When there is no built-in conversion betweeb the given pixel formats it's
    //! possible to use an intermediate format that is used during conversion. In
    //! such case the base pixel converter creates two more converters that are
    //! then used internally.
    //!
    //! This option disables such feature - creating a pixel converter would fail
    //! with `BL_ERROR_NOT_IMPLEMENTED` error if direct conversion is not possible.
    BL_PIXEL_CONVERTER_CREATE_FLAG_NO_MULTI_STEP = 0x00000004u
}

// ============================================================================
// [BLPixelConverter - Options]
// ============================================================================

//! Pixel conversion options.
struct BLPixelConverterOptions {
    BLPointI origin;
    size_t gap;
}

// ============================================================================
// [BLPixelConverter - Core]
// ============================================================================

//! Pixel converter [C Interface - Core].
struct BLPixelConverterCore {
    union {
        struct {
            //! Converter function.
            BLPixelConverterFunc convertFunc;
            //! Internal flags used by the converter - non-zero value means initialized.
            ubyte internalFlags;
        }

        //! Internal data not exposed to users, aligned to sizeof(void*).
        ubyte[80] data;
    }
}

//! \}
