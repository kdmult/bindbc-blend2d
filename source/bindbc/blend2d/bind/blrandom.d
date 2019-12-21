// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.blrandom;

import bindbc.blend2d.bind.blapi;

extern (System):

//! \addtogroup blend2d_api_globals
//! \{

// ============================================================================
// [BLRandom]
// ============================================================================

//! Simple pseudo random number generator.
//!
//! The current implementation uses a PRNG called `XORSHIFT+`, which has 64-bit
//! seed, 128 bits of state, and full period `2^128 - 1`.
//!
//! Based on a paper by Sebastiano Vigna:
//!   http://vigna.di.unimi.it/ftp/papers/xorshiftplus.pdf
struct BLRandom {
    ulong[2] data;

    // --------------------------------------------------------------------------

    //! \name Construction & Destruction
    //! \{

    //! \}

    //! \name Overloaded Operators
    //! \{

    //! \}

    //! \name Common Functionality
    //! \{

    //! Resets the random number generator to the given `seed`.

    //! Tests whether the random number generator is equivalent to `other`.

    //! \}

    //! \name Random Numbers
    //! \{

    //! Returns the next `uint64_t` value.

    //! Returns the next `uint32_t` value.

    //! Returns the next `double` precision floating point in [0..1) range.

    //! \}

    // --------------------------------------------------------------------------
}

//! \}

// BLEND2D_BLRANDOM_H
