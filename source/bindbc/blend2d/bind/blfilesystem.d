// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.blfilesystem;

import core.stdc.string;
import core.stdc.stdint;

import bindbc.blend2d.bind.blarray;

extern(System) :

//! \addtogroup blend2d_api_filesystem
//! \{

// ============================================================================
// [Constants]
// ============================================================================

//! File open flags, see `BLFile::open()`.
enum BLFileOpenFlags {
    //! Opens the file for reading.
    //!
    //! The following system flags are used when opening the file:
    //!   * `O_RDONLY` (Posix)
    //!   * `GENERIC_READ` (Windows)
    BL_FILE_OPEN_READ = 0x00000001u,

    //! Opens the file for writing:
    //!
    //! The following system flags are used when opening the file:
    //!   * `O_WRONLY` (Posix)
    //!   * `GENERIC_WRITE` (Windows)
    BL_FILE_OPEN_WRITE = 0x00000002u,

    //! Opens the file for reading & writing.
    //!
    //! The following system flags are used when opening the file:
    //!   * `O_RDWR` (Posix)
    //!   * `GENERIC_READ | GENERIC_WRITE` (Windows)
    BL_FILE_OPEN_RW = 0x00000003u,

    //! Creates the file if it doesn't exist or opens it if it does.
    //!
    //! The following system flags are used when opening the file:
    //!   * `O_CREAT` (Posix)
    //!   * `CREATE_ALWAYS` or `OPEN_ALWAYS` depending on other flags (Windows)
    BL_FILE_OPEN_CREATE = 0x00000004u,

    //! Opens the file for deleting or renaming (Windows).
    //!
    //! Adds `DELETE` flag when opening the file to `ACCESS_MASK`.
    BL_FILE_OPEN_DELETE = 0x00000008u,

    //! Truncates the file.
    //!
    //! The following system flags are used when opening the file:
    //!   * `O_TRUNC` (Posix)
    //!   * `TRUNCATE_EXISTING` (Windows)
    BL_FILE_OPEN_TRUNCATE = 0x00000010u,

    //! Opens the file for reading in exclusive mode (Windows).
    //!
    //! Exclusive mode means to not specify the `FILE_SHARE_READ` option.
    BL_FILE_OPEN_READ_EXCLUSIVE = 0x10000000u,

    //! Opens the file for writing in exclusive mode (Windows).
    //!
    //! Exclusive mode means to not specify the `FILE_SHARE_WRITE` option.
    BL_FILE_OPEN_WRITE_EXCLUSIVE = 0x20000000u,

    //! Opens the file for both reading and writing (Windows).
    //!
    //! This is a combination of both `BL_FILE_OPEN_READ_EXCLUSIVE` and
    //! `BL_FILE_OPEN_WRITE_EXCLUSIVE`.
    BL_FILE_OPEN_RW_EXCLUSIVE = 0x30000000u,

    //! Creates the file in exclusive mode - fails if the file already exists.
    //!
    //! The following system flags are used when opening the file:
    //!   * `O_EXCL` (Posix)
    //!   * `CREATE_NEW` (Windows)
    BL_FILE_OPEN_CREATE_EXCLUSIVE = 0x40000000u,

    //! Opens the file for deleting or renaming in exclusive mode (Windows).
    //!
    //! Exclusive mode means to not specify the `FILE_SHARE_DELETE` option.
    BL_FILE_OPEN_DELETE_EXCLUSIVE = 0x80000000u
}

//! File seek mode, see `BLFile::seek()`.
//!
//! \note Seek constants should be compatible with constants used by both POSIX
//! and Windows API.
enum BLFileSeek {
    //! Seek from the beginning of the file (SEEK_SET).
    BL_FILE_SEEK_SET = 0,
    //! Seek from the current position (SEEK_CUR).
    BL_FILE_SEEK_CUR = 1,
    //! Seek from the end of the file (SEEK_END).
    BL_FILE_SEEK_END = 2,

    //! Count of seek modes.
    BL_FILE_SEEK_COUNT = 3
}

//! File read flags used by `BLFileSystem::readFile()`.
enum BLFileReadFlags {
    //! Use memory mapping to read the content of the file.
    //!
    //! The destination buffer `BLArray<>` would be configured to use the memory
    //! mapped buffer instead of allocating its own.
    BL_FILE_READ_MMAP_ENABLED = 0x00000001u,

    //! Avoid memory mapping of small files.
    //!
    //! The size of small file is determined by Blend2D, however, you should
    //! expect it to be 16kB or 64kB depending on host operating system.
    BL_FILE_READ_MMAP_AVOID_SMALL = 0x00000002u,

    //! Do not fallback to regular read if memory mapping fails. It's worth noting
    //! that memory mapping would fail for files stored on filesystem that is not
    //! local (like a mounted network filesystem, etc...).
    BL_FILE_READ_MMAP_NO_FALLBACK = 0x00000008u
}

// ============================================================================
// [BLFile - Core]
// ============================================================================

//! A thin abstraction over a native OS file IO [C Interface - Core].
struct BLFileCore {
    //! A file handle - either a file descriptor used by POSIX or file handle used
    //! by Windows. On both platforms the handle is always `intptr_t` to make FFI
    //! easier (it's basically the size of a pointer / machine register).
    //!
    //! \note In C++ mode you can use `BLFileCore::Handle` or `BLFile::Handle` to
    //! get the handle type. In C mode you must use `intptr_t`. A handle of value
    //! `-1` is considered invalid and/or uninitialized. This value also matches
    //! `INVALID_HANDLE_VALUE`, which is used by Windows API and defined to -1 as
    //! well.
    intptr_t handle;
}

// ============================================================================
// [BLFile - C++]
// ============================================================================

//! A thin abstraction over a native OS file IO [C++ API].
//!
//! A thin wrapper around a native OS file support. The file handle is always
//! `intptr_t` and it refers to either a file descriptor on POSIX targets and
//! file handle on Windows targets.

// Prevent copy-constructor and copy-assignment.

//! \name Construction & Destruction
//! \{

//! \}

//! \name Common Functionality
//! \{

//! \}

//! \name File API
//! \{

//! Tests whether the file is open.

//! Returns the file handle and sets to invalid. After this operation you
//! will be the sole owner of the handle and you will be responsible for
//! closing it.

//! \}

// ============================================================================
// [BLFileSystem]
// ============================================================================

//! File-system utilities.

//! Reads a file into the `dst` buffer.
//!
//! Optionally you can set `maxSize` to non-zero value that would restrict the
//! maximum bytes to read to such value. In addition, `readFlags` can be used to
//! enable file mapping. See `BLFileReadFlags` for more details.

// {BLFileSystem}

//! \}

// BLEND2D_BLFILESYSTEM_H
