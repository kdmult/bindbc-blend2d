// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.font;

import bindbc.blend2d.bind.api;
import bindbc.blend2d.bind.array;
import bindbc.blend2d.bind.fontdefs;
import bindbc.blend2d.bind.geometry;
import bindbc.blend2d.bind.glyphbuffer;
import bindbc.blend2d.bind.path;
import bindbc.blend2d.bind.string;
import bindbc.blend2d.bind.variant;

//extern (System):

//! \addtogroup blend2d_api_text
//! \{

// ============================================================================
// [BLFontData - Core]
// ============================================================================

//! Font data [C Interface - Virtual Function Table].
struct BLFontDataVirt {
    BLResult function(BLFontDataImpl* impl) destroy;
    BLResult function(const(BLFontDataImpl)* impl, uint faceIndex, BLArrayCore* out_) listTags;
    size_t function(const(BLFontDataImpl)* impl, uint faceIndex, BLFontTable* dst, const(BLTag)* tags, size_t n) queryTables;
}

//! Font data [C Interface - Impl].
struct BLFontDataImpl {
    //! Virtual function table.
    const(BLFontDataVirt)* virt;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;
    //! Type of the face that would be created with this font-data.
    ubyte faceType;
    //! Reserved for future use, must be zero.
    ubyte[3] reserved;

    //! Number of font-faces stored in this font-data instance.
    uint faceCount;
    //! Font-data flags.
    uint flags;
}

//! Font data [C Interface - Core].
struct BLFontDataCore {
    BLFontDataImpl* impl;
}

// ============================================================================
// [BLFontFace - Core]
// ============================================================================

//! Font face [C Interface - Virtual Function Table].
struct BLFontFaceVirt {
    BLResult function(BLFontFaceImpl* impl) destroy;
}

//! Font face [C Interface - Impl].
struct BLFontFaceImpl {
    //! Virtual function table.
    const(BLFontFaceVirt)* virt;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;

    //! Font-face default weight (1..1000) [0 if font-face is not initialized].
    ushort weight;
    //! Font-face default stretch (1..9) [0 if font-face is not initialized].
    ubyte stretch;
    //! Font-face default style.
    ubyte style;

    //! Font-face information.
    BLFontFaceInfo faceInfo;
    //! Unique face id assigned by Blend2D for caching.
    ulong faceUniqueId;

    //! Font data.
    BLFontDataCore data;
    //! Full name.
    BLStringCore fullName;
    //! Family name.
    BLStringCore familyName;
    //! Subfamily name.
    BLStringCore subfamilyName;
    //! PostScript name.
    BLStringCore postScriptName;

    //! Font-face metrics in design units.
    BLFontDesignMetrics designMetrics;
    //! Font-face unicode coverage (specified in OS/2 header).
    BLFontUnicodeCoverage unicodeCoverage;
    //! Font-face panose classification.
    BLFontPanose panose;
}

//! Font face [C Interface - Core].
struct BLFontFaceCore {
    BLFontFaceImpl* impl;
}

// ============================================================================
// [BLFont - Core]
// ============================================================================

//! Font [C Interface - Impl].
struct BLFontImpl {
    //! Font-face used by this font.
    BLFontFaceCore face;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;

    //! Font width (1..1000) [0 if the font is not initialized].
    ushort weight;
    //! Font stretch (1..9) [0 if the font is not initialized].
    ubyte stretch;
    //! Font style.
    ubyte style;

    //! Font features.
    BLArrayCore features;
    //! Font variations.
    BLArrayCore variations;
    //! Font metrics.
    BLFontMetrics metrics;
    //! Font matrix.
    BLFontMatrix matrix;
}

//! Font [C Interface - Core].
struct BLFontCore {
    BLFontImpl* impl;
}

//! \}
