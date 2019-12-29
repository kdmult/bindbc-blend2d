// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.pattern;

import bindbc.blend2d.bind.geometry;
import bindbc.blend2d.bind.image;
import bindbc.blend2d.bind.matrix;
import bindbc.blend2d.bind.variant;

//extern (System):

//! \addtogroup blend2d_api_styling
//! \{

// ============================================================================
// [BLPattern - Core]
// ============================================================================

//! Pattern [C Interface - Impl].
struct BLPatternImpl {
    //! Image used by the pattern.
    BLImageCore image;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;

    //! Reserved, must be zero.
    ubyte patternType;
    //! Pattern extend mode, see `BLExtendMode`.
    ubyte extendMode;
    //! Type of the transformation matrix.
    ubyte matrixType;
    //! Reserved, must be zero.
    ubyte[1] reserved;

    //! Pattern transformation matrix.
    BLMatrix2D matrix;
    //! Image area to use.
    BLRectI area;
}

//! Pattern [C Interface - Core].
struct BLPatternCore {
    BLPatternImpl* impl;
}

//! \}
