// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.geometry;

import bindbc.blend2d.bind.api;

//extern (System):

//! \addtogroup blend2d_api_geometry
//! \{

// ============================================================================
// [Constants]
// ============================================================================

//! Direction of a geometry used by geometric primitives and paths.
enum BLGeometryDirection {
    //! No direction specified.
    BL_GEOMETRY_DIRECTION_NONE = 0,
    //! Clockwise direction.
    BL_GEOMETRY_DIRECTION_CW = 1,
    //! Counter-clockwise direction.
    BL_GEOMETRY_DIRECTION_CCW = 2
}

//! Geometry type.
//!
//! Geometry describes a shape or path that can be either rendered or added to
//! a BLPath container. Both `BLPath` and `BLContext` provide functionality
//! to work with all geometry types. Please note that each type provided here
//! requires to pass a matching struct or class to the function that consumes
//! a `geometryType` and `geometryData` arguments.
enum BLGeometryType {
    //! No geometry provided.
    BL_GEOMETRY_TYPE_NONE = 0,
    //! BLBoxI struct.
    BL_GEOMETRY_TYPE_BOXI = 1,
    //! BLBox struct.
    BL_GEOMETRY_TYPE_BOXD = 2,
    //! BLRectI struct.
    BL_GEOMETRY_TYPE_RECTI = 3,
    //! BLRect struct.
    BL_GEOMETRY_TYPE_RECTD = 4,
    //! BLCircle struct.
    BL_GEOMETRY_TYPE_CIRCLE = 5,
    //! BLEllipse struct.
    BL_GEOMETRY_TYPE_ELLIPSE = 6,
    //! BLRoundRect struct.
    BL_GEOMETRY_TYPE_ROUND_RECT = 7,
    //! BLArc struct.
    BL_GEOMETRY_TYPE_ARC = 8,
    //! BLArc struct representing chord.
    BL_GEOMETRY_TYPE_CHORD = 9,
    //! BLArc struct representing pie.
    BL_GEOMETRY_TYPE_PIE = 10,
    //! BLLine struct.
    BL_GEOMETRY_TYPE_LINE = 11,
    //! BLTriangle struct.
    BL_GEOMETRY_TYPE_TRIANGLE = 12,
    //! BLArrayView<BLPointI> representing a polyline.
    BL_GEOMETRY_TYPE_POLYLINEI = 13,
    //! BLArrayView<BLPoint> representing a polyline.
    BL_GEOMETRY_TYPE_POLYLINED = 14,
    //! BLArrayView<BLPointI> representing a polygon.
    BL_GEOMETRY_TYPE_POLYGONI = 15,
    //! BLArrayView<BLPoint> representing a polygon.
    BL_GEOMETRY_TYPE_POLYGOND = 16,
    //! BLArrayView<BLBoxI> struct.
    BL_GEOMETRY_TYPE_ARRAY_VIEW_BOXI = 17,
    //! BLArrayView<BLBox> struct.
    BL_GEOMETRY_TYPE_ARRAY_VIEW_BOXD = 18,
    //! BLArrayView<BLRectI> struct.
    BL_GEOMETRY_TYPE_ARRAY_VIEW_RECTI = 19,
    //! BLArrayView<BLRect> struct.
    BL_GEOMETRY_TYPE_ARRAY_VIEW_RECTD = 20,
    //! BLPath (or BLPathCore).
    BL_GEOMETRY_TYPE_PATH = 21,
    //! BLRegion (or BLRegionCore).
    BL_GEOMETRY_TYPE_REGION = 22,

    //! Count of geometry types.
    BL_GEOMETRY_TYPE_COUNT = 23
}

//! Fill rule.
enum BLFillRule {
    //! Non-zero fill-rule.
    BL_FILL_RULE_NON_ZERO = 0,
    //! Even-odd fill-rule.
    BL_FILL_RULE_EVEN_ODD = 1,

    //! Count of fill rule types.
    BL_FILL_RULE_COUNT = 2
}

//! Hit-test result.
enum BLHitTest {
    //!< Fully in.
    BL_HIT_TEST_IN = 0,
    //!< Partially in/out.
    BL_HIT_TEST_PART = 1,
    //!< Fully out.
    BL_HIT_TEST_OUT = 2,

    //!< Hit test failed (invalid argument, NaNs, etc).
    BL_HIT_TEST_INVALID = 0xFFFFFFFFu
}

// ============================================================================
// [BLPointI]
// ============================================================================

//! Point specified as [x, y] using `int` as a storage type.
struct BLPointI {
    int x;
    int y;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLSizeI]
// ============================================================================

//! Size specified as [w, h] using `int` as a storage type.
struct BLSizeI {
    int w;
    int h;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLBoxI]
// ============================================================================

//! Box specified as [x0, y0, x1, y1] using `int` as a storage type.
struct BLBoxI {
    int x0;
    int y0;
    int x1;
    int y1;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLRectI]
// ============================================================================

//! Rectangle specified as [x, y, w, h] using `int` as a storage type.
struct BLRectI {
    int x;
    int y;
    int w;
    int h;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLPoint]
// ============================================================================

//! Point specified as [x, y] using `double` as a storage type.
struct BLPoint {
    double x;
    double y;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLSize]
// ============================================================================

//! Size specified as [w, h] using `double` as a storage type.
struct BLSize {
    double w;
    double h;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLBox]
// ============================================================================

//! Box specified as [x0, y0, x1, y1] using `double` as a storage type.
struct BLBox {
    double x0;
    double y0;
    double x1;
    double y1;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLRect]
// ============================================================================

//! Rectangle specified as [x, y, w, h] using `double` as a storage type.
struct BLRect {
    double x;
    double y;
    double w;
    double h;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLLine]
// ============================================================================

//! Line specified as [x0, y0, x1, y1] using `double` as a storage type.
struct BLLine {
    double x0;
    double y0;
    double x1;
    double y1;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLTriangle]
// ============================================================================

//! Triangle data specified as [x0, y0, x1, y1, x2, y2] using `double` as a storage type.
struct BLTriangle {
    double x0;
    double y0;
    double x1;
    double y1;
    double x2;
    double y2;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLRoundRect]
// ============================================================================

//! Rounded rectangle specified as [x, y, w, h, rx, ry] using `double` as a storage type.
struct BLRoundRect {
    double x;
    double y;
    double w;
    double h;
    double rx;
    double ry;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLCircle]
// ============================================================================

//! Circle specified as [cx, cy, r] using `double` as a storage type.
struct BLCircle {
    double cx;
    double cy;
    double r;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLEllipse]
// ============================================================================

//! Ellipse specified as [cx, cy, rx, ry] using `double` as a storage type.
struct BLEllipse {
    double cx;
    double cy;
    double rx;
    double ry;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLArc]
// ============================================================================

//! Arc specified as [cx, cy, rx, ry, start, sweep[ using `double` as a storage type.
struct BLArc {
    double cx;
    double cy;
    double rx;
    double ry;
    double start;
    double sweep;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

//! \}

// ============================================================================
// [Globals Functions]
// ============================================================================

//! \addtogroup blend2d_api_geometry
//! \{

//! \name Global Specializations
//! \{

//! \}

//! \name Overloaded Operators
//! \{

//! \}

//! \}

// BLEND2D_BLGEOMETRY_H
