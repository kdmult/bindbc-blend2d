// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.blfont;

import bindbc.blend2d.bind.blapi;
import bindbc.blend2d.bind.blarray;
import bindbc.blend2d.bind.blfontdefs;
import bindbc.blend2d.bind.blgeometry;
import bindbc.blend2d.bind.blglyphbuffer;
import bindbc.blend2d.bind.blpath;
import bindbc.blend2d.bind.blstring;
import bindbc.blend2d.bind.blvariant;

//extern (System):

//! \addtogroup blend2d_api_text
//! \{

// ============================================================================
// [BLFontData - Core]
// ============================================================================

//! Font data [C Interface - Virtual Function Table].
struct BLFontDataVirt {
    BLResult function(BLFontDataImpl* impl) destroy;
    BLResult function(const(BLFontDataImpl)* impl, BLArrayCore* out_) listTags;
    size_t function(const(BLFontDataImpl)* impl, BLFontTable* dst, const(BLTag)* tags, size_t n) queryTables;
}

//! Font data [C Interface - Impl].
struct BLFontDataImpl {
    //! Virtual function table.
    const(BLFontDataVirt)* virt;
    //! Pointer to the start of font-data (null if the data is provided at a table level).
    void* data;
    //! Size of `data` [in bytes] (zero if the data is provided at a table level).
    size_t size;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;
    //! Font-data flags.
    uint flags;
    //! Offset to the font header from the beginning of `data`.
    size_t headerOffset;
}

//! Font data [C Interface - Core].
struct BLFontDataCore {
    BLFontDataImpl* impl;
}

// ============================================================================
// [BLFontLoader - Core]
// ============================================================================

//! Font loader [C Interface - Virtual Function Table].
struct BLFontLoaderVirt {
    BLResult function(BLFontLoaderImpl* impl) destroy;
    BLFontDataImpl* function(BLFontLoaderImpl* impl, uint faceIndex) dataByFaceIndex;
}

//! Font loader [C Interface - Impl].
struct BLFontLoaderImpl {
    //! Virtual function table.
    const(BLFontLoaderVirt)* virt;
    //! Pointer to the start of font-data (null if the data is provided at table level).
    void* data;
    //! Size of `data` [in bytes] (zero if the data is provided at table level).
    size_t size;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;

    ubyte faceType;
    ubyte[3] reserved;
    uint faceCount;
    uint loaderFlags;
}

//! Font loader [C Interface - Core].
struct BLFontLoaderCore {
    BLFontLoaderImpl* impl;
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
    //! Font data.
    BLFontDataCore data;
    //! Font loader used to load `BLFontData`.
    BLFontLoaderCore loader;

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
    //! Font features.
    BLArrayCore features;
    //! Font variations.
    BLArrayCore variations;

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

    BLFontMetrics metrics;
    BLFontMatrix matrix;
}

//! Font [C Interface - Core].
struct BLFontCore {
    BLFontImpl* impl;
}

//! \}
