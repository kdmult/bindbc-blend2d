// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.blpixelconverter;

import core.stdc.string;
import core.stdc.stdint;

import bindbc.blend2d.bind.blapi;
import bindbc.blend2d.bind.blformat;
import bindbc.blend2d.bind.blgeometry;

extern(System) :

//! \addtogroup blend2d_api_imaging
//! \{

// ============================================================================
// [Typedefs]
// ============================================================================

//! \cond INTERNAL
//! \ingroup  blend2d_internal
//! Pixel converter function.
alias BLPixelConverterFunc = uint function(const(BLPixelConverterCore) * self, ubyte * dstData, intptr_t dstStride,
        const(ubyte) * srcData, intptr_t srcStride, uint w, uint h, const(BLPixelConverterOptions) * options);

//! \endcond

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
    //! Converter function.
    BLPixelConverterFunc convertFunc;

    union {
        ubyte strategy;
        //! Internal data used by the pixel converter not exposed to users.
        ubyte[64] data;
    }
}

// ============================================================================
// [BLPixelConverter - C++]
// ============================================================================

//! Pixel converter [C++ API].
//!
//! Provides interface to convert pixels between various pixel formats. The
//! primary purpose of this class is to allow efficient conversion between
//! pixel formats used natively by Blend2D and pixel formats required by I/O.

//! Returns `true` if the converter is initialized.

//! Reset the pixel converter.

//! Convert a single span of pixels of `w` width.

//! Convert a rectangular area of pixels from source format to destination.

//! \}

// BLEND2D_BLPIXELCONVERTER_H
