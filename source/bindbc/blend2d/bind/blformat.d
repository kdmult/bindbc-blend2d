// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.blformat;

import bindbc.blend2d.bind.blapi;
import bindbc.blend2d.bind.blrgba;

extern (System):

//! \addtogroup blend2d_api_imaging
//! \{

// ============================================================================
// [Constants]
// ============================================================================

//! Pixel format.
//!
//! Compatibility Table
//! -------------------
//!
//! ```
//! +---------------------+---------------------+-----------------------------+
//! | Blend2D Format      | Cairo Format        | QImage::Format              |
//! +---------------------+---------------------+-----------------------------+
//! | BL_FORMAT_PRGB32    | CAIRO_FORMAT_ARGB32 | Format_ARGB32_Premultiplied |
//! | BL_FORMAT_XRGB32    | CAIRO_FORMAT_RGB24  | Format_RGB32                |
//! | BL_FORMAT_A8        | CAIRO_FORMAT_A8     | n/a                         |
//! +---------------------+---------------------+-----------------------------+
//! ```
enum BLFormat {
    //! None or invalid pixel format.
    BL_FORMAT_NONE = 0,
    //! 32-bit premultiplied ARGB pixel format (8-bit components).
    BL_FORMAT_PRGB32 = 1,
    //! 32-bit (X)RGB pixel format (8-bit components, alpha ignored).
    BL_FORMAT_XRGB32 = 2,
    //! 8-bit alpha-only pixel format.
    BL_FORMAT_A8 = 3,

    //! Count of pixel formats.
    BL_FORMAT_COUNT = 4,
    //! Count of pixel formats (reserved for future use).
    BL_FORMAT_RESERVED_COUNT = 16
}

//! Pixel format flags.
enum BLFormatFlags {
    //! Pixel format provides RGB components.
    BL_FORMAT_FLAG_RGB = 0x00000001u,
    //! Pixel format provides only alpha component.
    BL_FORMAT_FLAG_ALPHA = 0x00000002u,
    //! A combination of `BL_FORMAT_FLAG_RGB | BL_FORMAT_FLAG_ALPHA`.
    BL_FORMAT_FLAG_RGBA = 0x00000003u,
    //! Pixel format provides LUM component (and not RGB components).
    BL_FORMAT_FLAG_LUM = 0x00000004u,
    //! A combination of `BL_FORMAT_FLAG_LUM | BL_FORMAT_FLAG_ALPHA`.
    BL_FORMAT_FLAG_LUMA = 0x00000006u,
    //! Indexed pixel format the requres a palette (I/O only).
    BL_FORMAT_FLAG_INDEXED = 0x00000010u,
    //! RGB components are premultiplied by alpha component.
    BL_FORMAT_FLAG_PREMULTIPLIED = 0x00000100u,
    //! Pixel format doesn't use native byte-order (I/O only).
    BL_FORMAT_FLAG_BYTE_SWAP = 0x00000200u,

    // The following flags are only informative. They are part of `blFormatInfo[]`,
    // but doesn't have to be passed to `BLPixelConverter` as they can be easily
    // calculated.

    //! Pixel components are byte aligned (all 8bpp).
    BL_FORMAT_FLAG_BYTE_ALIGNED = 0x00010000u
}

// ============================================================================
// [BLFormatInfo]
// ============================================================================

//! Provides a detailed information about a pixel format. Use `blFormatInfo`
//! array to get an information of Blend2D native pixel formats.
struct BLFormatInfo {
    uint depth;
    uint flags;

    union {
        struct {
            ubyte[4] sizes;
            ubyte[4] shifts;
        }

        struct {
            ubyte rSize;
            ubyte gSize;
            ubyte bSize;
            ubyte aSize;

            ubyte rShift;
            ubyte gShift;
            ubyte bShift;
            ubyte aShift;
        }

        const(BLRgba32)* palette;
    }

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

//! Pixel format information of Blend2D native pixel formats, see `BLFormat`.
extern __gshared const(BLFormatInfo)[BLFormat.BL_FORMAT_RESERVED_COUNT] blFormatInfo;

// {Extern:C}

//! \}

// BLEND2D_BLFORMAT_H
