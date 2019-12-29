// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.image;

import core.stdc.string;
import core.stdc.stdint;

import bindbc.blend2d.bind.api;
import bindbc.blend2d.bind.array;
import bindbc.blend2d.bind.format;
import bindbc.blend2d.bind.geometry;
import bindbc.blend2d.bind.variant;

extern(System) :

//! \addtogroup blend2d_api_imaging
//! \{

// ============================================================================
// [Constants]
// ============================================================================

//! Image codec feature bits.
enum BLImageCodecFeatures {
    //! Image codec supports reading images (can create BLImageDecoder).
    BL_IMAGE_CODEC_FEATURE_READ = 0x00000001u,
    //! Image codec supports writing images (can create BLImageEncoder).
    BL_IMAGE_CODEC_FEATURE_WRITE = 0x00000002u,
    //! Image codec supports lossless compression.
    BL_IMAGE_CODEC_FEATURE_LOSSLESS = 0x00000004u,
    //! Image codec supports loosy compression.
    BL_IMAGE_CODEC_FEATURE_LOSSY = 0x00000008u,
    //! Image codec supports writing multiple frames (GIF).
    BL_IMAGE_CODEC_FEATURE_MULTI_FRAME = 0x00000010u,
    //! Image codec supports IPTC metadata.
    BL_IMAGE_CODEC_FEATURE_IPTC = 0x10000000u,
    //! Image codec supports EXIF metadata.
    BL_IMAGE_CODEC_FEATURE_EXIF = 0x20000000u,
    //! Image codec supports XMP metadata.
    BL_IMAGE_CODEC_FEATURE_XMP = 0x40000000u
}

//! Flags used by `BLImageInfo`.
enum BLImageInfoFlags {
    //! Progressive mode.
    BL_IMAGE_INFO_FLAG_PROGRESSIVE = 0x00000001u
}

//! Filter type used by `BLImage::scale()`.
enum BLImageScaleFilter {
    //! No filter or uninitialized.
    BL_IMAGE_SCALE_FILTER_NONE = 0,
    //! Nearest neighbor filter (radius 1.0).
    BL_IMAGE_SCALE_FILTER_NEAREST = 1,
    //! Bilinear filter (radius 1.0).
    BL_IMAGE_SCALE_FILTER_BILINEAR = 2,
    //! Bicubic filter (radius 2.0).
    BL_IMAGE_SCALE_FILTER_BICUBIC = 3,
    //! Bell filter (radius 1.5).
    BL_IMAGE_SCALE_FILTER_BELL = 4,
    //! Gauss filter (radius 2.0).
    BL_IMAGE_SCALE_FILTER_GAUSS = 5,
    //! Hermite filter (radius 1.0).
    BL_IMAGE_SCALE_FILTER_HERMITE = 6,
    //! Hanning filter (radius 1.0).
    BL_IMAGE_SCALE_FILTER_HANNING = 7,
    //! Catrom filter (radius 2.0).
    BL_IMAGE_SCALE_FILTER_CATROM = 8,
    //! Bessel filter (radius 3.2383).
    BL_IMAGE_SCALE_FILTER_BESSEL = 9,
    //! Sinc filter (radius 2.0, adjustable through `BLImageScaleOptions`).
    BL_IMAGE_SCALE_FILTER_SINC = 10,
    //! Lanczos filter (radius 2.0, adjustable through `BLImageScaleOptions`).
    BL_IMAGE_SCALE_FILTER_LANCZOS = 11,
    //! Blackman filter (radius 2.0, adjustable through `BLImageScaleOptions`).
    BL_IMAGE_SCALE_FILTER_BLACKMAN = 12,
    //! Mitchell filter (radius 2.0, parameters 'b' and 'c' passed through `BLImageScaleOptions`).
    BL_IMAGE_SCALE_FILTER_MITCHELL = 13,
    //! Filter using a user-function, must be passed through `BLImageScaleOptions`.
    BL_IMAGE_SCALE_FILTER_USER = 14,

    //! Count of image-scale filters.
    BL_IMAGE_SCALE_FILTER_COUNT = 15
}

// ============================================================================
// [Typedefs]
// ============================================================================

//! A user function that can be used by `BLImage::scale()`.
alias BLImageScaleUserFunc = uint function(double* dst, const(double)* tArray, size_t n, const(void)* data);

// ============================================================================
// [BLImageData]
// ============================================================================

//! Data that describes a raster image. Used by `BLImage`.
struct BLImageData {
    void* pixelData;
    intptr_t stride;
    BLSizeI size;
    uint format;
    uint flags;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLImageInfo]
// ============================================================================

//! Image information provided by image codecs.
struct BLImageInfo {
    //! Image size.
    BLSizeI size;
    //! Pixel density per one meter, can contain fractions.
    BLSize density;

    //! Image flags.
    uint flags;
    //! Image depth.
    ushort depth;
    //! Number of planes.
    ushort planeCount;
    //! Number of frames (0 = unknown/unspecified).
    ulong frameCount;

    //! Image format (as understood by codec).
    char[16] format;
    //! Image compression (as understood by codec).
    char[16] compression;

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLImageScaleOptions]
// ============================================================================

//! Options that can used to customize image scaling.
struct BLImageScaleOptions {
    BLImageScaleUserFunc userFunc;
    void* userData;

    double radius;

    union {
        double[3] data;

        struct _Anonymous_0 {
            double b;
            double c;
        }

        _Anonymous_0 mitchell;
    }

    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
}

// ============================================================================
// [BLImage - Core]
// ============================================================================

//! Image [C Interface - Impl].
struct BLImageImpl {
    //! Pixel data.
    void* pixelData;
    //! Image stride.
    intptr_t stride;
    //! Non-null if the image has a writer.
    void* writer;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;

    //! Image format.
    ubyte format;
    //! Image flags.
    ubyte flags;
    //! Image depth (in bits).
    ushort depth;
    //! Image size.
    BLSizeI size;
}

//! Image [C Interface - Core].
struct BLImageCore {
    BLImageImpl* impl;
}

// ============================================================================
// [BLImage - C++]
// ============================================================================

//! 2D raster image [C++ API].

//! \cond INTERNAL

//! \endcond

//! \name Construction & Destruction
//! \{

//! \}

//! \name Operator Overloads
//! \{

//! \}

//! \name Common Functionality
//! \{

//! Create a deep copy of the `other` image.

//! Tests whether the image is a built-in null instance.

//! Tests whether the image is empty (has no size).

//! \}

//! \name Create Functionality
//! \{

//! Create a new image of a specified width `w`, height `h`, and `format`.
//!
//! \note It's important to always test whether the function succeeded as
//! allocating pixel-data can fail. If invalid arguments (invalid size or
//! format) were passed to the function a `BL_ERROR_INVALID_VALUE` result
//! will be returned and no data will be allocated. It's also important
//! to notice that `BLImage::create()` would not change anything if the
//! function fails (the previous image content would be kept as is).

//! Create a new image from external data.

//! \}

//! \name Image Data
//! \{

//! Returns image width.

//! Returns image height.

//! Returns image size.

//! Returns image format, see `BLFormat`.

//! \}

//! \name Image IO
//! \{

//! \}

// ============================================================================
// [BLImageCodec - Core]
// ============================================================================

//! Image codec [C Interface - Virtual Function Table].
struct BLImageCodecVirt {
    BLResult function(BLImageCodecImpl* impl) destroy;
    uint function(const(BLImageCodecImpl)* impl, const(ubyte)* data, size_t size) inspectData;
    BLResult function(const(BLImageCodecImpl)* impl, BLImageDecoderCore* dst) createDecoder;
    BLResult function(const(BLImageCodecImpl)* impl, BLImageEncoderCore* dst) createEncoder;
}

//! Image codec [C Interface - Impl].
struct BLImageCodecImpl {
    //! Virtual function table.
    const(BLImageCodecVirt)* virt;
    //! Image codec name like "PNG", "JPEG", etc...
    const(char)* name;
    //! Image codec vendor, built-in codecs use "Blend2D".
    const(char)* vendor;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;

    //! Image codec features.
    uint features;
    //! Mime type.
    const(char)* mimeType;
    //! Known file extensions used by this image codec separated by "|".
    const(char)* extensions;
}

//! Image codec [C Interface - Core].
struct BLImageCodecCore {
    BLImageCodecImpl* impl;
}

// ============================================================================
// [BLImageCodec - C++]
// ============================================================================

//! Image codec [C++ API].
//!
//! Provides a unified interface for inspecting image data and creating image
//! decoders & encoders.

//! \cond INTERNAL

//! \endcond

//! \name Construction & Destruction
//! \{

//! \}

//! \name Operator Overloads
//! \{

//! \}

//! \name Common Functionality
//! \{

//! Tests whether the image codec is a built-in null instance.

//! \}

//! \name Properties
//! \{

//! Returns image codec name (i.e, "PNG", "JPEG", etc...).

//! Returns the image codec vendor (i.e. "Blend2D" for all built-in codecs).

//! Returns a mime-type associated with the image codec's format.

//! Returns a list of file extensions used to store image of this codec, separated by '|' character.

//! Returns image codec flags, see `BLImageCodecFeatures`.

//! Tests whether the image codec has a flag `flag`.

//! \}

//! \name Find Functionality
//! \{

//! \}

//! \name Codec Functionality
//! \{

//! \}

//! \name Built-In Codecs
//! \{

//! \}

// ============================================================================
// [BLImageDecoder - Core]
// ============================================================================

//! Image decoder [C Interface - Virtual Function Table].
struct BLImageDecoderVirt {
    BLResult function(BLImageDecoderImpl* impl) destroy;
    BLResult function(BLImageDecoderImpl* impl) restart;
    BLResult function(BLImageDecoderImpl* impl, BLImageInfo* infoOut, const(ubyte)* data, size_t size) readInfo;
    BLResult function(BLImageDecoderImpl* impl, BLImageCore* imageOut, const(ubyte)* data, size_t size) readFrame;
}

//! Image decoder [C Interface - Impl].
struct BLImageDecoderImpl {
    //! Virtual function table.
    const(BLImageDecoderVirt)* virt;
    //! Image codec that created this decoder.
    BLImageCodecCore codec;
    //! Handle in case that this decoder wraps a thirt-party library.
    void* handle;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;

    //! Last faulty result (if failed).
    BLResult lastResult;
    //! Current frame index.
    ulong frameIndex;
    //! Position in source buffer.
    size_t bufferIndex;
}

//! Image decoder [C Interface - Core]
struct BLImageDecoderCore {
    BLImageDecoderImpl* impl;
}

// ============================================================================
// [BLImageDecoder - C++]
// ============================================================================

//! Image decoder [C++ API].

//! \cond INTERNAL

//! \endcond

//! \name Construction & Destruction
//! \{

//! \}

//! \name Operator Overloads
//! \{

//! \}

//! \name Common Functionality
//! \{

//! Tests whether the image decoder is a built-in null instance.

//! \}

//! \name Properties
//! \{

//! Returns the last decoding result.

//! Returns the current frame index (to be decoded).

//! Returns the position in source buffer.

//! \}

//! \name Decoder Functionality
//! \{

//! \}

// ============================================================================
// [BLImageEncoder - Core]
// ============================================================================

//! Image encoder [C Interface - Virtual Function Table].
struct BLImageEncoderVirt {
    BLResult function(BLImageEncoderImpl* impl) destroy;
    BLResult function(BLImageEncoderImpl* impl) restart;
    BLResult function(BLImageEncoderImpl* impl, BLArrayCore* dst, const(BLImageCore)* image) writeFrame;
}

//! Image encoder [C Interface - Impl].
struct BLImageEncoderImpl {
    //! Virtual function table.
    const(BLImageEncoderVirt)* virt;
    //! Image codec that created this encoder.
    BLImageCodecCore codec;
    //! Handle in case that this encoder wraps a thirt-party library.
    void* handle;

    //! Reference count.
    size_t refCount;
    //! Impl type.
    ubyte implType;
    //! Impl traits.
    ubyte implTraits;
    //! Memory pool data.
    ushort memPoolData;

    //! Last faulty result (if failed).
    BLResult lastResult;
    //! Current frame index.
    ulong frameIndex;
    //! Position in source buffer.
    size_t bufferIndex;
}

//! Image encoder [C Interface - Core].
struct BLImageEncoderCore {
    BLImageEncoderImpl* impl;
}

// ============================================================================
// [BLImageEncoder - C++]
// ============================================================================

//! Image encoder [C++ API].

//! \cond INTERNAL

//! \endcond

//! \name Construction & Destruction
//! \{

//! \}

//! \name Operator Overloads
//! \{

//! \}

//! \name Common Functionality
//! \{

//! Tests whether the image encoder is a built-in null instance.

//! \}

//! \name Properties
//! \{

//! Returns the last decoding result.

//! Returns the current frame index (yet to be written).

//! Returns the position in destination buffer.

//! \}

//! \name Encoder Functionality
//! \{

//! Encodes the given `image` and writes the encoded data to the destination buffer `dst`.

//! \}

//! \}

// BLEND2D_BLIMAGE_H
