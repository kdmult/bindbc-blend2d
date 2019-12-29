// // [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.gradient;

import bindbc.blend2d.bind.geometry;
import bindbc.blend2d.bind.matrix;
import bindbc.blend2d.bind.rgba;
import bindbc.blend2d.bind.variant;

//extern (System):

//! \addtogroup blend2d_api_styling
//! \{

// ============================================================================
// [Constants]
// ============================================================================

//! Gradient type.
enum BLGradientType {
    //! Linear gradient type.
    BL_GRADIENT_TYPE_LINEAR = 0,
    //! Radial gradient type.
    BL_GRADIENT_TYPE_RADIAL = 1,
    //! Conical gradient type.
    BL_GRADIENT_TYPE_CONICAL = 2,

    //! Count of gradient types.
    BL_GRADIENT_TYPE_COUNT = 3
}

//! Gradient data index.
enum BLGradientValue {
    //! x0 - start 'x' for Linear/Radial and center 'x' for Conical.
    BL_GRADIENT_VALUE_COMMON_X0 = 0,
    //! y0 - start 'y' for Linear/Radial and center 'y' for Conical.
    BL_GRADIENT_VALUE_COMMON_Y0 = 1,
    //! x1 - end 'x' for Linear/Radial.
    BL_GRADIENT_VALUE_COMMON_X1 = 2,
    //! y1 - end 'y' for Linear/Radial.
    BL_GRADIENT_VALUE_COMMON_Y1 = 3,
    //! Radial gradient r0 radius.
    BL_GRADIENT_VALUE_RADIAL_R0 = 4,
    //! Conical gradient angle.
    BL_GRADIENT_VALUE_CONICAL_ANGLE = 2,

    //! Count of gradient values.
    BL_GRADIENT_VALUE_COUNT = 6
}

// ============================================================================
// [BLGradientStop]
// ============================================================================

//! Defines an `offset` and `rgba` color that us used by `BLGradient` to define
//! a linear transition between colors.
struct BLGradientStop {
    double offset;
    BLRgba64 rgba;

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

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLLinearGradientValues]
// ============================================================================

//! Linear gradient values packed into a structure.
struct BLLinearGradientValues {
    double x0;
    double y0;
    double x1;
    double y1;

    // --------------------------------------------------------------------------

    //! \name Construction & Destruction
    //! \{

    //! \}

    //! \name Common Functionality
    //! \{

    //! \}

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLRadialGradientValues]
// ============================================================================

//! Radial gradient values packed into a structure.
struct BLRadialGradientValues {
    double x0;
    double y0;
    double x1;
    double y1;
    double r0;

    // --------------------------------------------------------------------------

    //! \name Construction & Destruction
    //! \{

    //! \}

    //! \name Common Functionality
    //! \{

    //! \}

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLConicalGradientValues]
// ============================================================================

//! Conical gradient values packed into a structure.
struct BLConicalGradientValues {
    double x0;
    double y0;
    double angle;

    // --------------------------------------------------------------------------

    //! \name Construction & Destruction
    //! \{

    //! \}

    //! \name Common Functionality
    //! \{

    //! \}

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLGradient - Core]
// ============================================================================

//! Gradient [C Interface - Impl].
struct BLGradientImpl {
    //! Stop capacity.
    size_t capacity;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;

    //! Gradient type, see `BLGradientType`.
    ubyte gradientType;
    //! Gradient extend mode, see `BLExtendMode`.
    ubyte extendMode;
    //! Type of the transformation matrix.
    ubyte matrixType;
    //! Reserved, must be zero.
    ubyte[1] reserved;

    //! Union of either raw `stops` & `size` members or their `view`.
    union {
        struct {
            //! Gradient stop data.
            BLGradientStop* stops;
            //! Gradient stop count.
            size_t size;
        }

        //! Gradient stop view (C++ only).
    }

    //! Gradient transformation matrix.
    BLMatrix2D matrix;

    union {
        //! Gradient values (coordinates, radius, angle).
        double[BLGradientValue.BL_GRADIENT_VALUE_COUNT] values;
        //! Linear parameters.
        BLLinearGradientValues linear;
        //! Radial parameters.
        BLRadialGradientValues radial;
        //! Conical parameters.
        BLConicalGradientValues conical;
    }
}

//! Gradient [C Interface - Core].
struct BLGradientCore {
    BLGradientImpl* impl;
}


//! \}
