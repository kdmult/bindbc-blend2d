// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.blpath;

import bindbc.blend2d.bind.blarray;
import bindbc.blend2d.bind.blgeometry;
import bindbc.blend2d.bind.blvariant;

extern (System):

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

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;

    //! Path flags related to caching.
    uint flags;
    //! Path vertex/command capacity.
    size_t capacity;
}

//! 2D vector path [C Interface - Core].
struct BLPathCore {
    BLPathImpl* impl;
}

// ============================================================================
// [BLPath - C++]
// ============================================================================

//! 2D vector path [C++ API].

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

//! Tests whether the 2D path is a built-in null instance.

//! Tests whether the path is empty (its size equals zero).

//! Tests whether this path and the `other` path are equal.
//!
//! The equality check is deep. The data of both paths is examined and binary
//! compared (thus a slight difference like -0 and +0 would make the equality
//! check to fail).

//! \}

//! \name Path Content
//! \{

//! Returns path size (count of vertices used).

//! Returns path capacity (count of allocated vertices).

//! Returns path's vertex data (read-only).

//! Returns the end of path's vertex data (read-only).

//! Returns path's command data (read-only).

//! Returns the end of path's command data (read-only).

//! Returns the path data as a read-only `BLPathView`.

//! \}

//! \name Path Construction
//! \{

//! Clears the content of the path.

//! Shrinks the capacity of the path to fit the current usage.

//! Reserves the capacity of the path for at least `n` vertices and commands.

//! Sets vertex at `index` to `cmd` and `pt`.
//!
//! Pass `BL_PATH_CMD_PRESERVE` in `cmd` to preserve the current command.

//! Sets vertex at `index` to `cmd` and `[x, y]`.
//!
//! Pass `BL_PATH_CMD_PRESERVE` in `cmd` to preserve the current command.

//! Moves to `p0`.
//!
//! Appends `BL_PATH_CMD_MOVE[p0]` command to the path.

//! Moves to `[x0, y0]`.
//!
//! Appends `BL_PATH_CMD_MOVE[x0, y0]` command to the path.

//! Adds line to `p1`.
//!
//! Appends `BL_PATH_CMD_ON[p1]` command to the path.

//! Adds line to `[x1, y1]`.
//!
//! Appends `BL_PATH_CMD_ON[x1, y1]` command to the path.

//! Adds a polyline (LineTo) of the given `poly` array of size `count`.
//!
//! Appends multiple `BL_PATH_CMD_ON[x[i], y[i]]` commands to the path depending on `count` parameter.

//! Adds a quadratic curve to `p1` and `p2`.
//!
//! Appends the following commands to the path:
//!   - `BL_PATH_CMD_QUAD[p1]`
//!   - `BL_PATH_CMD_ON[p2]`
//!
//! Matches SVG 'Q' path command:
//!   - https://www.w3.org/TR/SVG/paths.html#PathDataQuadraticBezierCommands

//! Adds a quadratic curve to `[x1, y1]` and `[x2, y2]`.
//!
//! Appends the following commands to the path:
//!   - `BL_PATH_CMD_QUAD[x1, y1]`
//!   - `BL_PATH_CMD_ON[x2, y2]`
//!
//! Matches SVG 'Q' path command:
//!   - https://www.w3.org/TR/SVG/paths.html#PathDataQuadraticBezierCommands

//! Adds a cubic curve to `p1`, `p2`, `p3`.
//!
//! Appends the following commands to the path:
//!   - `BL_PATH_CMD_CUBIC[p1]`
//!   - `BL_PATH_CMD_CUBIC[p2]`
//!   - `BL_PATH_CMD_ON[p3]`
//!
//! Matches SVG 'C' path command:
//!   - https://www.w3.org/TR/SVG/paths.html#PathDataCubicBezierCommands

//! Adds a cubic curve to `[x1, y1]`, `[x2, y2]`, and `[x3, y3]`.
//!
//! Appends the following commands to the path:
//!   - `BL_PATH_CMD_CUBIC[x1, y1]`
//!   - `BL_PATH_CMD_CUBIC[x2, y2]`
//!   - `BL_PATH_CMD_ON[x3, y3]`
//!
//! Matches SVG 'C' path command:
//!   - https://www.w3.org/TR/SVG/paths.html#PathDataCubicBezierCommands

//! Adds a smooth quadratic curve to `p2`, calculating `p1` from last points.
//!
//! Appends the following commands to the path:
//!   - `BL_PATH_CMD_QUAD[calculated]`
//!   - `BL_PATH_CMD_ON[p2]`
//!
//! Matches SVG 'T' path command:
//!   - https://www.w3.org/TR/SVG/paths.html#PathDataQuadraticBezierCommands

//! Adds a smooth quadratic curve to `[x2, y2]`, calculating `[x1, y1]` from last points.
//!
//! Appends the following commands to the path:
//!   - `BL_PATH_CMD_QUAD[calculated]`
//!   - `BL_PATH_CMD_ON[x2, y2]`
//!
//! Matches SVG 'T' path command:
//!   - https://www.w3.org/TR/SVG/paths.html#PathDataQuadraticBezierCommands

//! Adds a smooth cubic curve to `p2` and `p3`, calculating `p1` from last points.
//!
//! Appends the following commands to the path:
//!   - `BL_PATH_CMD_CUBIC[calculated]`
//!   - `BL_PATH_CMD_CUBIC[p2]`
//!   - `BL_PATH_CMD_ON[p3]`
//!
//! Matches SVG 'S' path command:
//!   - https://www.w3.org/TR/SVG/paths.html#PathDataCubicBezierCommands

//! Adds a smooth cubic curve to `[x2, y2]` and `[x3, y3]`, calculating `[x1, y1]` from last points.
//!
//! Appends the following commands to the path:
//!   - `BL_PATH_CMD_CUBIC[calculated]`
//!   - `BL_PATH_CMD_CUBIC[x2, y2]`
//!   - `BL_PATH_CMD_ON[x3, y3]`
//!
//! Matches SVG 'S' path command:
//!   - https://www.w3.org/TR/SVG/paths.html#PathDataCubicBezierCommands

//! Adds an arc to the path.
//!
//! The center of the arc is specified by `c` and radius by `r`. Both `start`
//! and `sweep` angles are in radians. If the last vertex doesn't match the
//! start of the arc then a `lineTo()` would be emitted before adding the arc.
//! Pass `true` in `forceMoveTo` to always emit `moveTo()` at the beginning of
//! the arc, which starts a new figure.

//! \overload

//! Adds an arc quadrant (90deg) to the path. The first point `p1` specifies
//! the quadrant corner and the last point `p2` specifies the end point.

//! \overload

//! Adds an elliptic arc to the path that follows the SVG specification.
//!
//! Matches SVG 'A' path command:
//!   - https://www.w3.org/TR/SVG/paths.html#PathDataEllipticalArcCommands

//! \overload

//! Closes the current figure.
//!
//! Appends `BL_PATH_CMD_CLOSE` to the path.
//!
//! Matches SVG 'Z' path command:
//!   - https://www.w3.org/TR/SVG/paths.html#PathDataClosePathCommand

//! \}

//! \name Adding Figures
//! \{

//! Adds a closed rectangle to the path specified by `box`.

//! Adds a closed rectangle to the path specified by `box`.

//! Adds a closed rectangle to the path specified by `[x0, y0, x1, y1]`.

//! Adds a closed rectangle to the path specified by `rect`.

//! Adds a closed rectangle to the path specified by `rect`.

//! Adds a closed rectangle to the path specified by `[x, y, w, h]`.

//! Adds a geometry to the path.

//! Adds a closed circle to the path.

//! \overload

//! Adds a closed ellipse to the path.

//! \overload

//! Adds a closed rounded ractangle to the path.

//! \overload

//! Adds an unclosed arc to the path.

//! \overload

//! Adds a closed chord to the path.

//! \overload

//! Adds a closed pie to the path.

//! \overload

//! Adds an unclosed line to the path.

//! \overload

//! Adds a closed triangle.

//! \overload

//! Adds a polyline.

//! \overload

//! \overload

//! \overload

//! Adds a polyline.

//! \overload

//! \overload

//! \overload

//! Adds a polygon.

//! \overload

//! \overload

//! \overload

//! Adds a polygon.

//! \overload

//! \overload

//! \overload

//! Adds an array of closed boxes.

//! \overload

//! \overload

//! \overload

//! Adds an array of closed boxes.

//! \overload

//! \overload

//! \overload

//! Adds an array of closed rectangles.

//! \overload

//! \overload

//! \overload

//! Adds an array of closed rectangles.

//! \overload

//! \overload

//! \overload

//! Adds a closed region (converted to set of rectangles).

//! Adds a closed region (converted to set of rectangles).

//! \}

//! \name Adding Paths
//! \{

//! Adds other `path` to this path.

//! Adds other `path` sliced by the given `range` to this path.

//! Adds other `path` translated by `p` to this path.

//! Adds other `path` translated by `p` and sliced by the given `range` to this path.

//! Adds other `path` transformed by `m` to this path.

//! Adds other `path` transformed by `m` and sliced by the given `range` to this path.

//! Adds other `path`, but reversed.

//! Adds other `path`, but reversed.

//! Adds a stroke of `path` to this path.

//! \overload

//! \}

//! \name Transformations
//! \{

//! Translates the whole path by `p`.

//! Translates a part of the path specified by the given `range` by `p`.

//! Transforms the whole path by matrix `m`.

//! Transforms a part of the path specified by the given `range` by matrix `m`.

//! Fits the whole path into the given `rect` by taking into account fit flags passed by `fitFlags`.

//! Fits a parh of the path specified by the given `range` into the given `rect` by taking into account fit flags passed by `fitFlags`.

//! \}

//! \name Path Information
//! \{

//! Update a path information if necessary.

//! Stores a bounding box of all vertices and control points to `boxOut`.
//!
//! Control box is simply bounds of all vertices the path has without further
//! processing. It contains both on-path and off-path points. Consider using
//! `getBoundingBox()` if you need a visual bounding box.

//! Stores a bounding box of all on-path vertices and curve extremas to `boxOut`.
//!
//! The bounding box stored to `boxOut` could be smaller than a bounding box
//! obtained by `getControlBox()` as it's calculated by merging only start/end
//! points and curves at their extremas (not control points). The resulting
//! bounding box represents a visual bounds of the path.

//! Returns the range describing a figure at the given `index`.

//! Returns the last vertex of the path and stores it to `vtxOut`. If the very
//! last command of the path is `BL_PATH_CMD_CLOSE` then the path will be
//! iterated in reverse order to match the initial vertex of the last figure.

//! \}

//! \name Hit Testing
//! \{

//! Hit tests the given point `p` by respecting the given `fillRule`.

//! \}

//! \}

// BLEND2D_BLPATH_H
