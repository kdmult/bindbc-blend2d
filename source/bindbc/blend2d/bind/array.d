// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.array;

import bindbc.blend2d.bind.api;
import bindbc.blend2d.bind.variant;

//extern (System):

// ============================================================================
// [BLArray - Core]
// ============================================================================

//! \addtogroup blend2d_api_globals
//! \{

//! Array container [C Interface - Impl].
struct BLArrayImpl {
    union {
        struct {
            //! Array data (as `void`).
            void* data;
            //! Array size.
            size_t size;
        }
        //! Array data and size as a view.
        BLDataView view;
    }
    //! Array capacity.
    size_t capacity;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;

    //! Item size in bytes.
    ubyte itemSize;
    //! Function dispatch used to handle arrays that don't store simple items.
    ubyte dispatchType;
    //! Reserved, must be set to 0.
    ubyte[2] reserved;
}

//! Array container [C Interface - Core].
struct BLArrayCore {
    BLArrayImpl* impl;
}

//! \}
