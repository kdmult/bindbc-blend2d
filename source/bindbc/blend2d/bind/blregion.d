// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.blregion;

import bindbc.blend2d.bind.blapi;
import bindbc.blend2d.bind.blarray;
import bindbc.blend2d.bind.blgeometry;
import bindbc.blend2d.bind.blvariant;

extern (System):

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
    //! Bounding box, empty regions have [0, 0, 0, 0].
    BLBoxI boundingBox;
}

//! 2D region [C Interface - Core].
struct BLRegionCore {
    BLRegionImpl* impl;
}

// ============================================================================
// [BLRegion - C++]
// ============================================================================

//! 2D region [C++ API].
//!
//! Region is a set of rectangles sorted and coalesced by their Y/X coordinates.

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

//! Tests whether the region is a built-in null instance.

//! Tests whether the region is empty.

//! Tests whether this region and `other` are equal.

//! \}

//! \name Region Content
//! \{

//! Returns the type of the region, see `BLRegionType`.
//!
//! This inline method has also a C API equivalent `blRegionGetType()`.

//! Tests whether the region is one rectangle.

//! Tests whether the region is complex.

//! Returns the region size.

//! Returns the region capacity.

//! Returns a const pointer to the region data.

//! Returns the region's bounding box.

//! Returns the region data as `BLRegionView`.

//! \}

//! \name Region Operations
//! \{

//! Reserves at least `n` boxes in this region.

//! Shrinks the region data so it consumes only memory it requires.

//! Translates the region by the given point `pt`.
//!
//! Possible overflow will be handled by clipping to a maximum region boundary,
//! so the final region could be smaller than the region before translation.

//! Translates the region by the given point `pt` and clip it to the given `clipBox`.

//! Translates the region with `r` and clip it to the given `clipBox`.

//! \}

//! \name Hit Testing
//! \{

//! Tests if a given point `pt` is in region, returns `BLHitTest`.

//! Tests if a given `box` is in region, returns `BLHitTest`.

//! \}

//! \}

// BLEND2D_BLREGION_H
