// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.blstring;

import bindbc.blend2d.bind.blapi;
import bindbc.blend2d.bind.blvariant;

extern (System):

//! \addtogroup blend2d_api_globals
//! \{

// ============================================================================
// [BLString - Core]
// ============================================================================

//! Byte string [C Interface - Impl].
struct BLStringImpl {
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

    //! Reserved, will be part of string data.
    ubyte[4] reserved;
}

//! Byte string [C Interface - Core].
struct BLStringCore {
    BLStringImpl* impl;
}

// ============================================================================
// [BLString - C++]
// ============================================================================

//! Byte string [C++ API].
//!
//! Blend2D always uses UTF-8 encoding in public APIs so all strings are assumed
//! UTF-8 by default. However, `BLString` can hold arbitrary byte sequence and
//! act as a raw byte-string when this functionality is required.

//! \cond INTERNAL

//! \endcond

//! \name Construction & Destruction
//! \{

//! Creates a default constructed string.
//!
//! Default constructed strings share a built-in "none" instance.

//! Move constructor.
//!
//! \note The `other` string is reset by move construction, so its state
//! after the move operation is the same as a default constructed string.

//! Copy constructor, performs weak copy of the data held by the `other` string.

//! Constructor that creates a string from the given `impl`.
//!
//! \note The reference count of the passed `impl` is not increased.

//! Destroys the string.

//! \}

//! \name Overloaded Operators
//! \{

//! Tests whether the string has any content.
//!
//! \note This is essentially the opposite of `empty()`.

//! Move assignment.
//!
//! \note The `other` string is reset by move assignment, so its state
//! after the move operation is the same as a default constructed string.

//! Copy assignment, performs weak copy of the data held by the `other` string.

//! Returns a character at the given `index`.
//!
//! \note This is the same as calling `at(index)`.

//! \}

//! \name Common Functionality
//! \{

//! Clears the content of the string and releases its data.
//!
//! After reset the string content matches a default constructed string.

//! Swaps the content of this string with the `other` string.

//! Replaces the content of the string by `c` character or multiple characters
//! if `n` is greater than one.

//! Move assignment, the same as `operator=`, but returns a `BLResult` instead of `this`.

//! Copy assignment, the same as `operator=`, but returns a `BLResult` instead of `this`.

//! Replaces the string by the content described by the given string `view`.

//! Replaces the string by `str` data of the given length `n`.
//!
//! \note The implementation assumes null terminated string if `n` equals to `SIZE_MAX`.

//! Copy assignment, but creates a deep copy of the `other` string instead of weak copy.

//! Replaces the content of the string by a result of calling `snprintf(fmt, args...)`.

//! Replaces the content of the string by a result of calling `vsnprintf(fmt, ap)`.

//! Tests whether the string is empty (has no content).
//!
//! Returns `true` if the string's length is zero.

//! \}

//! \name Accessors
//! \{

//! Returns a character at the given `index`.
//!
//! \note Index must be valid and cannot be out of bounds, otherwise the
//! result is undefined and would trigger an assertion failure in debug mode.

//! Returns the size of the string [in bytes].

//! Returns the capacity of the string [in bytes].

//! Returns a read-only data of the string.

//! Returns the end of the string data.
//!
//! The returned pointer points to the null terminator, the data still can
//! be read, but it's not considered as string data by Blend2D anymore.

//! Returns the content of the string as `BLStringView`.

//! \}

//! \name String Manipulation
//! \{

//! Clears the content of the string without releasing its dynamically allocated data, if possible.

//! Shrinks the capacity of the string to match the current content.

//! Reserves at least `n` bytes in the string for further manipulation (most probably appending).

//! Resizes the string to `n` and fills the additional data by `fill` pattern.

//! Truncates the string length to `n`.
//!
//! It does nothing if the the string length is less than `n`.

//! Makes the string mutable.
//!
//! This operation checks whether the string is mutable and if not it makes a
//! deep copy of its content so it can be modified. Please note that you can
//! only modify the content that is defined by its length property. Even if
//! the string had higher capacity before `makeMutable()` it's not guaranteed
//! that the possible new data would match that capacity.
//!
//! If you want to make the string mutable for the purpose of appending or
//! making other modifications please consider using `modifyOp()` and
//! `insertOp()` instead.

//! \name Equality & Comparison
//! \{

//! Returns whether this string and `other` are equal (i.e. their contents match).

//! Returns whether this string and other string `view` are equal.

//! Returns whether this string and the given string data `str` of length `n` are equal.

//! Compares this string with `other` and returns either `-1`, `0`, or `1`.

//! Compares this string with other string `view` and returns either `-1`, `0`, or `1`.

//! Compares this string with other string data and returns either `-1`, `0`, or `1`.

//! \}

//! \name Search
//! \{

//! Returns the first index at which a given character `c` can be found in
//! the string, or `SIZE_MAX` if not present.

//! Returns the index at which a given character `c` can be found in
//! the string starting from `fromIndex`, or `SIZE_MAX` if not present.

//! Returns the last index at which a given character `c` can be found in
//! the string, or `SIZE_MAX` if not present.

//! Returns the index at which a given character `c` can be found in
//! the string starting from `fromIndex` and ending at `0`, or `SIZE_MAX`
//! if not present.

//! \}

//! \}

// BLEND2D_BLSTRING_H
