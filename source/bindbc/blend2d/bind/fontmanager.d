// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.fontmanager;

import bindbc.blend2d.bind.api;

//extern (System):

//! \addtogroup blend2d_api_text
//! \{

// ============================================================================
// [BLFontManager - Core]
// ============================================================================

//! Font manager [C Interface - Virtual Function Table].
struct BLFontManagerVirt
{
    BLResult function (BLFontManagerImpl* impl) destroy;
}

//! Font manager [C Interface - Impl].
struct BLFontManagerImpl
{
    //! Virtual function table.
    const(BLFontManagerVirt)* virt;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;
    //! Reserved for future use, must be zero.
    ubyte[4] reserved;
}

//! Font manager [C Interface - Core].
struct BLFontManagerCore
{
    BLFontManagerImpl* impl;
}

//! \}
