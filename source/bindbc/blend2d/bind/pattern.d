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
    //! Reserved, must be null.
    void*[2] reservedHeader;

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

// ============================================================================
// [BLPattern - C++]
// ============================================================================

//! Pattern [C++ API].

//! \cond INTERNAL

//! \endcond

//! \name Construction & Destruction
//! \{

//! \}

//! \name Overloaded Operators
//! \{

//! \}

//! \name Common Functionality
//! \{

//! Tests whether the pattern is a built-in null instance.

//! \}

//! \name Create Pattern
//! \{

//! \}

//! \name Pattern Source
//! \{

//! \}

//! \name Pattern Options
//! \{

//! \}

//! \name Transformations
//! \{

//! Applies a matrix operation to the current transformation matrix (internal).

//! \cond INTERNAL
//! Applies a matrix operation to the current transformation matrix (internal).

//! \endcond

//! \}

//! \}

// BLEND2D_BLPATTERN_H
