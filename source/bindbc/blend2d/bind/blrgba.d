// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.blrgba;

import bindbc.blend2d.bind.blapi;

//extern (System):

//! \addtogroup blend2d_api_styling
//! \{

// ============================================================================
// [BLRgba32]
// ============================================================================

//! 32-bit RGBA color (8-bit per component) stored as `0xAARRGGBB`.
struct BLRgba32 {
    union {
        uint value;

        struct {
            import std.bitmanip : bitfields;

            mixin(bitfields!(uint, "b", 8, uint, "g", 8, uint, "r", 8, uint, "a", 8));

            // LITTLE ENDIAN
        }
    }

    // --------------------------------------------------------------------------

    //! \name Construction & Destruction
    //! \{

    //! \}

    //! \name Overloaded Operators
    //! \{

    //! \}

    //! \name Common Functionality
    //! \{

    //! \}

    //! \name Utilities
    //! \{

    //! Tests whether the color is fully-opaque (alpha equals 0xFFFF).

    //! Tests whether the color is fully-transparent (alpha equals 0).

    //! \}

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLRgba64]
// ============================================================================

//! 64-bit RGBA color (16-bit per component) stored as `0xAAAARRRRGGGGBBBB`.
struct BLRgba64 {
    union {
        ulong value;

        struct {
            import std.bitmanip : bitfields;

            mixin(bitfields!(uint, "b", 16, uint, "g", 16, uint, "r", 16, uint, "a", 16));

            // LITTLE ENDIAN
        }
    }

    // --------------------------------------------------------------------------

    //! \name Construction & Destruction
    //! \{

    //! \}

    //! \name Overloaded Operators
    //! \{

    //! \}

    //! \name Common Functionality
    //! \{

    //! \}

    //! \name Utilities
    //! \{

    //! Tests whether the color is fully-opaque (alpha equals 0xFFFF).

    //! Tests whether the color is fully-transparent (alpha equals 0).

    //! \}

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLRgba128]
// ============================================================================

//! 128-bit RGBA color stored as 4 32-bit floating point values in [RGBA] order.
struct BLRgba128 {
    float r;
    float g;
    float b;
    float a;

    // --------------------------------------------------------------------------

    //! \name Construction & Destruction
    //! \{

    //! \}

    //! \name Overloaded Operators
    //! \{

    //! \}

    //! \name Common Functionality
    //! \{

    //! \}

    //! \name Utilities
    //! \{

    //! Tests whether the color is fully-opaque (alpha equals 1.0).

    //! Tests whether the color is fully-transparent (alpha equals 0.0).

    //! \}

    // --------------------------------------------------------------------------
}

// ============================================================================
// [Out of Class]
// ============================================================================

// ============================================================================
// [Constraints]
// ============================================================================

//! \}

// BLEND2D_BLRGBA_H
