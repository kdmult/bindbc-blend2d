// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.path;

import bindbc.blend2d.bind.array;
import bindbc.blend2d.bind.geometry;
import bindbc.blend2d.bind.variant;

//extern (System):

//! \addtogroup blend2d_api_geometry
//! \{

// ============================================================================
// [Constants]
// ============================================================================

//! Path command.
enum BLPathCmd {
    //! Move-to command (starts a new figure).
    BL_PATH_CMD_MOVE = 0,
    //! On-path command (interpreted as line-to or the end of a curve).
    BL_PATH_CMD_ON = 1,
    //! Quad-to control point.
    BL_PATH_CMD_QUAD = 2,
    //! Cubic-to control point (always used as a pair of commands).
    BL_PATH_CMD_CUBIC = 3,
    //! Close path.
    BL_PATH_CMD_CLOSE = 4,

    //! Count of path commands.
    BL_PATH_CMD_COUNT = 5
}

//! Path command (never stored in path).
enum BLPathCmdExtra {
    //! Used by `BLPath::setVertexAt` to preserve the current command value.
    BL_PATH_CMD_PRESERVE = 0xFFFFFFFFu
}

//! Path flags.
enum BLPathFlags {
    //! Path is empty (no commands or close commands only).
    BL_PATH_FLAG_EMPTY = 0x00000001u,
    //! Path contains multiple figures.
    BL_PATH_FLAG_MULTIPLE = 0x00000002u,
    //! Path contains quad curves (at least one).
    BL_PATH_FLAG_QUADS = 0x00000004u,
    //! Path contains cubic curves (at least one).
    BL_PATH_FLAG_CUBICS = 0x00000008u,
    //! Path is invalid.
    BL_PATH_FLAG_INVALID = 0x40000000u,
    //! Flags are dirty (not reflecting the current status).
    BL_PATH_FLAG_DIRTY = 0x80000000u
}

//! Path reversal mode.
enum BLPathReverseMode {
    //! Reverse each figure and their order as well (default).
    BL_PATH_REVERSE_MODE_COMPLETE = 0,
    //! Reverse each figure separately (keeps their order).
    BL_PATH_REVERSE_MODE_SEPARATE = 1,

    //! Count of path-reversal modes
    BL_PATH_REVERSE_MODE_COUNT = 2
}

//! Stroke join type.
enum BLStrokeJoin {
    //! Miter-join possibly clipped at `miterLimit` [default].
    BL_STROKE_JOIN_MITER_CLIP = 0,
    //! Miter-join or bevel-join depending on miterLimit condition.
    BL_STROKE_JOIN_MITER_BEVEL = 1,
    //! Miter-join or round-join depending on miterLimit condition.
    BL_STROKE_JOIN_MITER_ROUND = 2,
    //! Bevel-join.
    BL_STROKE_JOIN_BEVEL = 3,
    //! Round-join.
    BL_STROKE_JOIN_ROUND = 4,

    //! Count of stroke join types.
    BL_STROKE_JOIN_COUNT = 5
}

//! Position of a stroke-cap.
enum BLStrokeCapPosition {
    //! Start of the path.
    BL_STROKE_CAP_POSITION_START = 0,
    //! End of the path.
    BL_STROKE_CAP_POSITION_END = 1,

    //! Count of stroke position options.
    BL_STROKE_CAP_POSITION_COUNT = 2
}

//! A presentation attribute defining the shape to be used at the end of open subpaths.
enum BLStrokeCap {
    //! Butt cap [default].
    BL_STROKE_CAP_BUTT = 0,
    //! Square cap.
    BL_STROKE_CAP_SQUARE = 1,
    //! Round cap.
    BL_STROKE_CAP_ROUND = 2,
    //! Round cap reversed.
    BL_STROKE_CAP_ROUND_REV = 3,
    //! Triangle cap.
    BL_STROKE_CAP_TRIANGLE = 4,
    //! Triangle cap reversed.
    BL_STROKE_CAP_TRIANGLE_REV = 5,

    //! Used to catch invalid arguments.
    BL_STROKE_CAP_COUNT = 6
}

//! Stroke transform order.
enum BLStrokeTransformOrder {
    //! Transform after stroke  => `Transform(Stroke(Input))` [default].
    BL_STROKE_TRANSFORM_ORDER_AFTER = 0,
    //! Transform before stroke => `Stroke(Transform(Input))`.
    BL_STROKE_TRANSFORM_ORDER_BEFORE = 1,

    //! Count of transform order types.
    BL_STROKE_TRANSFORM_ORDER_COUNT = 2
}

//! Mode that specifies how curves are approximated to line segments.
enum BLFlattenMode {
    //! Use default mode (decided by Blend2D).
    BL_FLATTEN_MODE_DEFAULT = 0,
    //! Recursive subdivision flattening.
    BL_FLATTEN_MODE_RECURSIVE = 1,

    //! Count of flatten modes.
    BL_FLATTEN_MODE_COUNT = 2
}

//! Mode that specifies how to construct offset curves.
enum BLOffsetMode {
    //! Use default mode (decided by Blend2D).
    BL_OFFSET_MODE_DEFAULT = 0,
    //! Iterative offset construction.
    BL_OFFSET_MODE_ITERATIVE = 1,

    //! Count of offset modes.
    BL_OFFSET_MODE_COUNT = 2
}

// ============================================================================
// [BLApproximationOptions]
// ============================================================================

//! Options used to describe how geometry is approximated.
//!
//! This struct cannot be simply zeroed and then passed to functions that accept
//! approximation options. Use `blDefaultApproximationOptions` to setup defaults
//! and then alter values you want to change.
//!
//! Example of using `BLApproximationOptions`:
//!
//! ```
//! // Initialize with defaults first.
//! BLApproximationOptions approx = blDefaultApproximationOptions;
//!
//! // Override values you want to change.
//! approx.simplifyTolerance = 0.02;
//!
//! // ... now safely use approximation options in your code ...
//! ```
struct BLApproximationOptions {
    //! Specifies how curves are flattened, see `BLFlattenMode`.
    ubyte flattenMode;
    //! Specifies how curves are offsetted (used by stroking), see `BLOffsetMode`.
    ubyte offsetMode;
    //! Reserved for future use, must be zero.
    ubyte[6] reservedFlags;

    //! Tolerance used to flatten curves.
    double flattenTolerance;
    //! Tolerance used to approximatecubic curves qith quadratic curves.
    double simplifyTolerance;
    //! Curve offsetting parameter, exact meaning depends on `offsetMode`.
    double offsetParameter;
}

//! Default approximation options used by Blend2D.
extern __gshared const BLApproximationOptions blDefaultApproximationOptions;

// {Extern:C}

// ============================================================================
// [BLStrokeOptions - Core]
// ============================================================================

//! Stroke options [C Interface - Core].
//!
//! This structure may use dynamically allocated memory so it's required to use
//! proper initializers to initialize it and reset it.
struct BLStrokeOptionsCore {
    union {
        struct {
            ubyte startCap;
            ubyte endCap;
            ubyte join;
            ubyte transformOrder;
            ubyte[4] reserved;
        }

        ubyte[BLStrokeCapPosition.BL_STROKE_CAP_POSITION_COUNT] caps;
        ulong hints;
    }

    double width;
    double miterLimit;
    double dashOffset;
    BLArrayCore dashArray;
}

// ============================================================================
// [BLStrokeOptions - C++]
// ============================================================================

// Prevents the following:
//   Base class XXX should be explicitly initialized in the copy constructor [-Wextra]

//! Stroke options [C++ API].
//!
//! You should use this as a structure and use members of `BLStrokeOptionsCore`
//! directly.

// ============================================================================
// [BLPath - View]
// ============================================================================

//! 2D path view provides pointers to vertex and command data along with their
//! size.
struct BLPathView {
    const(ubyte)* commandData;
    const(BLPoint)* vertexData;
    size_t size;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLPath - Core]
// ============================================================================

//! 2D vector path [C Interface - Impl].
struct BLPathImpl {
    //! Union of either raw path-data or their `view`.
    union {
        struct {
            //! Command data
            ubyte* commandData;
            //! Vertex data.
            BLPoint* vertexData;
            //! Vertex/command count.
            size_t size;
        }

        //! Path data as view.
        BLPathView view;
    }
}

//! 2D vector path [C Interface - Core].
struct BLPathCore {
    BLPathImpl* impl;
}

//! \}
