// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.region;

import bindbc.blend2d.bind.api;
import bindbc.blend2d.bind.array;
import bindbc.blend2d.bind.geometry;
import bindbc.blend2d.bind.variant;

//extern (System):

//! \addtogroup blend2d_api_geometry
//! \{

// ============================================================================
// [Constants]
// ============================================================================

//! Region type.
enum BLRegionType {
    //! Region is empty (has no rectangles).
    BL_REGION_TYPE_EMPTY = 0,
    //! Region has one rectangle (rectangular).
    BL_REGION_TYPE_RECT = 1,
    //! Region has more YX sorted rectangles.
    BL_REGION_TYPE_COMPLEX = 2,
    //! Count of region types.
    BL_REGION_TYPE_COUNT = 3
}

// ============================================================================
// [BLRegion - Core]
// ============================================================================

//! 2D region [C Interface - Impl].
struct BLRegionImpl {
    //! Region capacity (rectangles).
    size_t capacity;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;
    //! Reserved, must be zero.
    ubyte[4] reserved;

    //! Union of either raw `data` & `size` members or their `view`.
    union {
        struct {
            //! Region data (Y/X sorted rectangles).
            BLBoxI* data;
            //! Region size (count of rectangles in the region).
            size_t size;
        }

        //! Region data and size as `BLRegionView`.
        BLRegionView view;
    }

    //! Bounding box, empty regions have [0, 0, 0, 0].
    BLBoxI boundingBox;
}

//! 2D region [C Interface - Core].
struct BLRegionCore {
    BLRegionImpl* impl;
}

//! \}
