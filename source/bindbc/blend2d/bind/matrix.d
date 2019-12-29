// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.matrix;

import bindbc.blend2d.bind.geometry;

//extern (System):

//! \addtogroup blend2d_api_geometry
//! \{

// ============================================================================
// [Typedefs]
// ============================================================================

//! A generic function that can be used to transform an array of points that use
//! `double` precision coordinates. This function will be 99.99% of time used with
//! `BLMatrix2D` so the `ctx` would point to a `const BLMatrix2D*` instance.
alias BLMapPointDArrayFunc = uint function(const(void)* ctx, BLPoint* dst, const(BLPoint)* src, size_t count);

// ============================================================================
// [Constants]
// ============================================================================

//! 2D matrix type that can be obtained by calling `BLMatrix2D::type()`.
//!
//! ```
//!  Identity  Transl.  Scale     Swap    Affine
//!   [1  0]   [1  0]   [.  0]   [0  .]   [.  .]
//!   [0  1]   [0  1]   [0  .]   [.  0]   [.  .]
//!   [0  0]   [.  .]   [.  .]   [.  .]   [.  .]
//! ```
enum BLMatrix2DType {
    //! Identity matrix.
    BL_MATRIX2D_TYPE_IDENTITY = 0,
    //! Has translation part (the rest is like identity).
    BL_MATRIX2D_TYPE_TRANSLATE = 1,
    //! Has translation and scaling parts.
    BL_MATRIX2D_TYPE_SCALE = 2,
    //! Has translation and scaling parts, however scaling swaps X/Y.
    BL_MATRIX2D_TYPE_SWAP = 3,
    //! Generic affine matrix.
    BL_MATRIX2D_TYPE_AFFINE = 4,
    //! Invalid/degenerate matrix not useful for transformations.
    BL_MATRIX2D_TYPE_INVALID = 5,

    //! Count of matrix types.
    BL_MATRIX2D_TYPE_COUNT = 6
}

//! 2D matrix data index.
enum BLMatrix2DValue {
    //! Value at index 0 - M00.
    BL_MATRIX2D_VALUE_00 = 0,
    //! Value at index 1 - M01.
    BL_MATRIX2D_VALUE_01 = 1,
    //! Value at index 2 - M10.
    BL_MATRIX2D_VALUE_10 = 2,
    //! Value at index 3 - M11.
    BL_MATRIX2D_VALUE_11 = 3,
    //! Value at index 4 - M20.
    BL_MATRIX2D_VALUE_20 = 4,
    //! Value at index 5 - M21.
    BL_MATRIX2D_VALUE_21 = 5,

    //! Count of `BLMatrix2D` values.
    BL_MATRIX2D_VALUE_COUNT = 6
}

//! 2D matrix operation.
enum BLMatrix2DOp {
    //! Reset matrix to identity (argument ignored, should be nullptr).
    BL_MATRIX2D_OP_RESET = 0,
    //! Assign (copy) the other matrix.
    BL_MATRIX2D_OP_ASSIGN = 1,

    //! Translate the matrix by [x, y].
    BL_MATRIX2D_OP_TRANSLATE = 2,
    //! Scale the matrix by [x, y].
    BL_MATRIX2D_OP_SCALE = 3,
    //! Skew the matrix by [x, y].
    BL_MATRIX2D_OP_SKEW = 4,
    //! Rotate the matrix by the given angle about [0, 0].
    BL_MATRIX2D_OP_ROTATE = 5,
    //! Rotate the matrix by the given angle about [x, y].
    BL_MATRIX2D_OP_ROTATE_PT = 6,
    //! Transform this matrix by other `BLMatrix2D`.
    BL_MATRIX2D_OP_TRANSFORM = 7,

    //! Post-translate the matrix by [x, y].
    BL_MATRIX2D_OP_POST_TRANSLATE = 8,
    //! Post-scale the matrix by [x, y].
    BL_MATRIX2D_OP_POST_SCALE = 9,
    //! Post-skew the matrix by [x, y].
    BL_MATRIX2D_OP_POST_SKEW = 10,
    //! Post-rotate the matrix about [0, 0].
    BL_MATRIX2D_OP_POST_ROTATE = 11,
    //! Post-rotate the matrix about a reference BLPoint.
    BL_MATRIX2D_OP_POST_ROTATE_PT = 12,
    //! Post-transform this matrix by other `BLMatrix2D`.
    BL_MATRIX2D_OP_POST_TRANSFORM = 13,

    //! Count of matrix operations.
    BL_MATRIX2D_OP_COUNT = 14
}

// ============================================================================
// [BLMatrix2D]
// ============================================================================

//! 2D matrix represents an affine transformation matrix that can be used to
//! transform geometry and images.
struct BLMatrix2D {
    union {
        //! Matrix values, use `BL_MATRIX2D_VALUE` indexes to get a particular one.
        double[BLMatrix2DValue.BL_MATRIX2D_VALUE_COUNT] m;
        //! Matrix values that map `m` to named values that can be used directly.
        struct {
            double m00;
            double m01;
            double m10;
            double m11;
            double m20;
            double m21;
        }
    }

    // --------------------------------------------------------------------------

    //! \name Construction & Destruction
    //! \{

    //! Creates an uninitialized 2D matrix, you must initialize all members before use.

    //! Creates a new matrix initialized to a copy of `src` matrix.

    //! Creates a new matrix initialized to:
    //!
    //! ```
    //!   [m00 m01]
    //!   [m10 m11]
    //!   [m20 m21]
    //! ```

    //! \}

    //! \name Static Constructors
    //! \{

    //! Creates a new matrix initialized to identity.

    //! \overload

    //! Creates a new matrix initialized to translation.

    //! \overload

    //! \overload

    //! \overload

    //! \overload

    //! Creates a new matrix initialized to scaling.

    //! Creates a new matrix initialized to rotation.

    //! \overload

    //! \overload

    //! Create a new skewing matrix.

    //! \overload

    //! \}

    //! \name Reset Matrix
    //! \{

    //! Resets matrix to identity.

    //! Resets matrix to `other` (copy its content to this matrix).

    //! Resets matrix to [`m00`, `m01`, `m10`, `m11`, `m20`, `m21`].

    //! Resets matrix to translation.

    //! Resets matrix to translation.

    //! Resets matrix to translation.

    //! Resets matrix to scaling.

    //! Resets matrix to scaling.

    //! Resets matrix to scaling.

    //! Resets matrix to scaling.

    //! Resets matrix to skewing.

    //! Resets matrix to skewing.

    //! Resets matrix to rotation specified by `sin` and `cos` and optional translation `tx` and `ty`.

    //! Resets matrix to rotation specified by `sin` and `cos` and optional translation `t`.

    //! Resets matrix to rotation.

    //! Resets matrix to rotation around a point `[x, y]`.

    //! Resets matrix to rotation around a point `p`.

    //! \}

    //! \name Overloaded Operators
    //! \{

    //! \}

    //! \name Common Functionality
    //! \{

    //! \}

    //! \name Matrix Properties
    //! \{

    //! Returns the matrix type, see `BLMatrix2DType`.

    //! Calculates the matrix determinant.

    //! \}

    //! \name Matrix Operations
    //! \{

    //! Inverts the matrix, returns `BL_SUCCESS` if the matrix has been inverted successfully.

    //! \}

    //! \name Map Points and Primitives
    //! \{

    //! \}

    //! \name Static Operations
    //! \{

    //! Inverts `src` matrix and stores the result in `dst.
    //!
    //! \overload

    //! \}

    // --------------------------------------------------------------------------
}

//! Array of functions for transforming points indexed by `BLMatrixType`. Each
//! function is optimized for the respective type. This is mostly used internally,
//! but exported for users that can take advantage of Blend2D SIMD optimziations.
extern __gshared BLMapPointDArrayFunc[BLMatrix2DType.BL_MATRIX2D_TYPE_COUNT] blMatrix2DMapPointDArrayFuncs;

// {Extern:C}

//! \}

// BLEND2D_BLMATRIX_H
