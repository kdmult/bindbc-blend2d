// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.string;

import bindbc.blend2d.bind.api;
import bindbc.blend2d.bind.variant;

//extern (System):

//! \addtogroup blend2d_api_globals
//! \{

// ============================================================================
// [BLString - Core]
// ============================================================================

//! Byte string [C Interface - Impl].
struct BLStringImpl {
    //! String capacity [in bytes].
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
    uint reserved;

    union {
        struct {
            //! String data [null terminated].
            char* data;
            //! String size [in bytes].
            size_t size;
        }

        //! String data and size as `BLStringView`.
        BLStringView view;
    }
}

//! Byte string [C Interface - Core].
struct BLStringCore {
    BLStringImpl* impl;
}

//! \}
