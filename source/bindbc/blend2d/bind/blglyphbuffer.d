// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.blglyphbuffer;

import bindbc.blend2d.bind.blfontdefs;

//extern (System):

//! \addtogroup blend2d_api_text
//! \{

// ============================================================================
// [BLGlyphBuffer - Core]
// ============================================================================

//! Glyph buffer [C Interface - Impl].
//!
//! \note This is not a `BLVariantImpl` compatible Impl.
struct BLGlyphBufferImpl {
    union {
        struct {
            //! Glyph item data.
            BLGlyphItem* glyphItemData;
            //! Glyph placement data.
            BLGlyphPlacement* placementData;
            //! Number of either code points or glyph indexes in the glyph-buffer.
            size_t size;
            //! Reserved, used exclusively by BLGlyphRun.
            uint reserved;
            //! Flags shared between BLGlyphRun and BLGlyphBuffer.
            uint flags;
        }

        //! Glyph run data that can be passed directly to the rendering context.
        BLGlyphRun glyphRun;
    }

    //! Glyph info data - additional information of each `BLGlyphItem`.
    BLGlyphInfo* glyphInfoData;
}

//! Glyph buffer [C Interface - Core].
struct BLGlyphBufferCore {
    BLGlyphBufferImpl* impl;
}

// ============================================================================
// [BLGlyphBuffer - C++]
// ============================================================================

//! Glyph buffer [C++ API].
//!
//! Can hold either text or glyphs and provides basic memory management that is
//! used for text shaping, character to glyph mapping, glyph substitution, and
//! glyph positioning.
//!
//! Glyph buffer provides two separate buffers called 'primary' and 'secondary'
//! that serve different purposes during processing. Primary buffer always holds
//! actualy `BLGlyphItem` array, and secondary buffer is either used as a scratch
//! buffer during glyph substitution or hold glyph positions after the processing
//! is complete and glyph positions were calculated.

//! \name Constructors & Destructors
//! \{

//! \}

//! \name Overloaded Operators
//! \{

//! \}

//! \name Accessors
//! \{

//! Tests whether the glyph-buffer has `flag` set.

//! Tests whether the buffer contains unicode data.

//! Tests whether the buffer contains glyph-id data.

//! Tests whether the input string contained invalid characters (unicode encoding errors).

//! Tests whether the input string contained undefined characters that weren't mapped properly to glyphs.

//! Tests whether one or more operation was terminated before completion because of invalid data in a font.

//! \}

//! \name Operations
//! \{

//! Resets the `BLGlyphBuffer` into its construction state. The content will
//! be cleared and allocated memory released.

//! Clears the content of `BLGlyphBuffer` without releasing internal buffers.

//! Sets the text content of this `BLGlyphBuffer`.
//!
//! This is a generic function that accepts `void*` data, which is specified
//! by `encoding`. The `size` argument depends on encoding as well. If the
//! encoding specifies byte string (LATIN1 or UTF8) then it's bytes, if the
//! encoding specifies UTF16 or UTF32 then it would describe the number of
//! `uint16_t` or `uint32_t` code points, respectively.
//!
//! Null-terminated string can be specified by passing `SIZE_MAX` as `size`.

//! Sets the text content of this `BLGlyphBuffer` from LATIN1 (ISO/IEC 8859-1)
//! string.

//! Sets the text content of this `BLGlyphBuffer` from UTF-8 encoded string.
//! The `size` parameter represents the length of the `data` in bytes.

//! \overload

//! Sets the text content of this `BLGlyphBuffer` from UTF-16 encoded string.
//! The `size` parameter represents the length of the `data` in 16-bit units.

//! Sets the text content of this `BLGlyphBuffer` from UTF-32 encoded string.
//! The `size` parameter represents the length of the `data` in 32-bit units.

//! Sets the text content of this `BLGlyphBuffer` from `wchar_t` encoded string.
//! The `size` parameter represents the length of the `data` in `wchar_t` units.

//! Sets the glyph content of this `BLGlyphBuffer` from either `uint16_t` array
//! or any structure that contains 16-bit glyph ids. The `advance` parameter
//! specifies the size of such structure (set to sizeof(uint16_t) for uint16_t
//! array) and `size` specifies how many glyph ids the passed `data` represents.

//! \}

//! \}

// BLEND2D_BLGLYPHBUFFER_H
