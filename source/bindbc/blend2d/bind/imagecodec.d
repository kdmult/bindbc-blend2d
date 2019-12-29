// [Blend2D]
// 2D Vector Graphics Powered by a JIT Compiler.
//
// [License]
// Zlib - See LICENSE.md file in the package.
module bindbc.blend2d.bind.imagecodec;

import bindbc.blend2d.bind.api;
import bindbc.blend2d.bind.array;
import bindbc.blend2d.bind.image;

//extern (System):

//! \addtogroup blend2d_api_imaging
//! \{

// ============================================================================
// [BLImageCodec - Constants]
// ============================================================================

//! Image codec feature bits.
enum BLImageCodecFeatures
{
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

// ============================================================================
// [BLImageCodec - Core]
// ============================================================================

//! Image codec [C Interface - Virtual Function Table].
struct BLImageCodecVirt
{
    BLResult function (BLImageCodecImpl* impl) destroy;
    uint function (const(BLImageCodecImpl)* impl, const(ubyte)* data, size_t size) inspectData;
    BLResult function (const(BLImageCodecImpl)* impl, BLImageDecoderCore* dst) createDecoder;
    BLResult function (const(BLImageCodecImpl)* impl, BLImageEncoderCore* dst) createEncoder;
}

//! Image codec [C Interface - Impl].
struct BLImageCodecImpl
{
    //! Virtual function table.
    const(BLImageCodecVirt)* virt;

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

    //! Image codec name like "PNG", "JPEG", etc...
    const(char)* name;
    //! Image codec vendor, built-in codecs use "Blend2D".
    const(char)* vendor;
    //! Mime type.
    const(char)* mimeType;
    //! Known file extensions used by this image codec separated by "|".
    const(char)* extensions;
}

//! Image codec [C Interface - Core].
struct BLImageCodecCore
{
    BLImageCodecImpl* impl;
}

// ============================================================================
// [BLImageDecoder - Core]
// ============================================================================

//! Image decoder [C Interface - Virtual Function Table].
struct BLImageDecoderVirt
{
    BLResult function (BLImageDecoderImpl* impl) destroy;
    BLResult function (BLImageDecoderImpl* impl) restart;
    BLResult function (BLImageDecoderImpl* impl, BLImageInfo* infoOut, const(ubyte)* data, size_t size) readInfo;
    BLResult function (BLImageDecoderImpl* impl, BLImageCore* imageOut, const(ubyte)* data, size_t size) readFrame;
}

//! Image decoder [C Interface - Impl].
struct BLImageDecoderImpl
{
    //! Virtual function table.
    const(BLImageDecoderVirt)* virt;

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

    //! Image codec that created this decoder.
    BLImageCodecCore codec;
    //! Handle in case that this decoder wraps a thirt-party library.
    void* handle;
    //! Current frame index.
    ulong frameIndex;
    //! Position in source buffer.
    size_t bufferIndex;
}

//! Image decoder [C Interface - Core]
struct BLImageDecoderCore
{
    BLImageDecoderImpl* impl;
}

// ============================================================================
// [BLImageEncoder - Core]
// ============================================================================

//! Image encoder [C Interface - Virtual Function Table].
struct BLImageEncoderVirt
{
    BLResult function (BLImageEncoderImpl* impl) destroy;
    BLResult function (BLImageEncoderImpl* impl) restart;
    BLResult function (BLImageEncoderImpl* impl, BLArrayCore* dst, const(BLImageCore)* image) writeFrame;
}

//! Image encoder [C Interface - Impl].
struct BLImageEncoderImpl
{
    //! Virtual function table.
    const(BLImageEncoderVirt)* virt;

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

    //! Image codec that created this encoder.
    BLImageCodecCore codec;
    //! Handle in case that this encoder wraps a thirt-party library.
    void* handle;
    //! Current frame index.
    ulong frameIndex;
    //! Position in source buffer.
    size_t bufferIndex;
}

//! Image encoder [C Interface - Core].
struct BLImageEncoderCore
{
    BLImageEncoderImpl* impl;
}

//! \}
