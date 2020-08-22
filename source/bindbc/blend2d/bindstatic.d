module bindbc.blend2d.bindstatic;

version(BindBC_Static) version = BindBlend2D_Static;

import core.stdc.stdint;
import core.stdc.stdarg;

auto BL_MAJOR_VERSION(uint ver) { return ver >> 16; }
auto BL_MINOR_VERSION(uint ver) { return (ver >> 8) & ((1 << 8) - 1); }
auto BL_PATCH_VERSION(uint ver) { return ver & ((1 << 8) - 1); }

enum BLEND2D_VERSION_MAJOR = BL_MAJOR_VERSION(BL_VERSION);
enum BLEND2D_VERSION_MINOR = BL_MINOR_VERSION(BL_VERSION);
enum BLEND2D_VERSION_REVISION = BL_PATCH_VERSION(BL_VERSION);

private
enum expandEnum(EnumType, string fqnEnumType = EnumType.stringof) = (){
    string expandEnum = "enum {";
    foreach(m;__traits(allMembers, EnumType)) {
        expandEnum ~= m ~ " = " ~ fqnEnumType ~ "." ~ m ~ ",";
    }
    expandEnum  ~= "}";
    return expandEnum;
}();


mixin(expandEnum!BLResultCode);
mixin(expandEnum!BLByteOrder);
mixin(expandEnum!BLDataAccessFlags);
mixin(expandEnum!BLDataSourceType);
mixin(expandEnum!BLModifyOp);
mixin(expandEnum!BLBooleanOp);
mixin(expandEnum!BLExtendMode);
mixin(expandEnum!BLTextEncoding);
mixin(expandEnum!BLContextType);
mixin(expandEnum!BLContextHint);
mixin(expandEnum!BLContextOpType);
mixin(expandEnum!BLContextFlushFlags);
mixin(expandEnum!BLContextCreateFlags);
mixin(expandEnum!BLContextProperty);
mixin(expandEnum!BLContextErrorFlags);
mixin(expandEnum!BLClipMode);
mixin(expandEnum!BLCompOp);
mixin(expandEnum!BLGradientQuality);
mixin(expandEnum!BLPatternQuality);
mixin(expandEnum!BLRenderingQuality);
mixin(expandEnum!BLFileOpenFlags);
mixin(expandEnum!BLFileSeekType);
mixin(expandEnum!BLFileReadFlags);
mixin(expandEnum!BLGlyphPlacementType);
mixin(expandEnum!BLGlyphRunFlags);
mixin(expandEnum!BLFontDataFlags);
mixin(expandEnum!BLFontFaceType);
mixin(expandEnum!BLFontFaceFlags);
mixin(expandEnum!BLFontFaceDiagFlags);
mixin(expandEnum!BLFontOutlineType);
mixin(expandEnum!BLFontStretch);
mixin(expandEnum!BLFontStyle);
mixin(expandEnum!BLFontWeight);
mixin(expandEnum!BLFontStringId);
mixin(expandEnum!BLFontUnicodeCoverageIndex);
mixin(expandEnum!BLTextDirection);
mixin(expandEnum!BLTextOrientation);
mixin(expandEnum!BLFormat);
mixin(expandEnum!BLFormatFlags);
mixin(expandEnum!BLGeometryDirection);
mixin(expandEnum!BLGeometryType);
mixin(expandEnum!BLFillRule);
mixin(expandEnum!BLHitTest);
mixin(expandEnum!BLGradientType);
mixin(expandEnum!BLGradientValue);
mixin(expandEnum!BLImageInfoFlags);
mixin(expandEnum!BLImageScaleFilter);
mixin(expandEnum!BLImageCodecFeatures);
mixin(expandEnum!BLMatrix2DType);
mixin(expandEnum!BLMatrix2DValue);
mixin(expandEnum!BLMatrix2DOp);
mixin(expandEnum!BLPathCmd);
mixin(expandEnum!BLPathCmdExtra);
mixin(expandEnum!BLPathFlags);
mixin(expandEnum!BLPathReverseMode);
mixin(expandEnum!BLStrokeJoin);
mixin(expandEnum!BLStrokeCapPosition);
mixin(expandEnum!BLStrokeCap);
mixin(expandEnum!BLStrokeTransformOrder);
mixin(expandEnum!BLFlattenMode);
mixin(expandEnum!BLOffsetMode);
mixin(expandEnum!BLPixelConverterCreateFlags);
mixin(expandEnum!BLRegionType);
mixin(expandEnum!BLRuntimeLimits);
mixin(expandEnum!BLRuntimeInfoType);
mixin(expandEnum!BLRuntimeBuildType);
mixin(expandEnum!BLRuntimeCpuArch);
mixin(expandEnum!BLRuntimeCpuFeatures);
mixin(expandEnum!BLRuntimeCleanupFlags);
mixin(expandEnum!BLStyleType);
mixin(expandEnum!BLImplType);
mixin(expandEnum!BLImplTraits);


//****** api.d ******//

import core.stdc.stddef;
import core.stdc.stdint;

extern (C):

extern (D) auto BL_MAKE_VERSION(T0, T1, T2)(auto ref T0 MAJOR, auto ref T1 MINOR, auto ref T2 PATCH)
{
    return (MAJOR << 16) | (MINOR << 8) | PATCH;
}

enum BL_VERSION = BL_MAKE_VERSION(0, 0, 1);

enum BL_BYTE_ORDER = 1234;

extern (D) auto BL_MAKE_TAG(T0, T1, T2, T3)(auto ref T0 A, auto ref T1 B, auto ref T2 C, auto ref T3 D)
{
    return cast(BLTag) (cast(BLTag) A << 24) | (cast(BLTag) B << 16) | (cast(BLTag) C << 8) | (cast(BLTag) D);
}

//enum BL_DIAGNOSTIC_POP = _Pragma("clang diagnostic pop");
//enum BL_DIAGNOSTIC_NO_INVALID_OFFSETOF = _Pragma("clang diagnostic ignored \"-Winvalid-offsetof\"");
//enum BL_DIAGNOSTIC_NO_SHADOW = _Pragma("clang diagnostic ignored \"-Wshadow\"");
//enum BL_DIAGNOSTIC_NO_STRICT_ALIASING = _Pragma("clang diagnostic ignored \"-Wstrict-aliasing\"");
//enum BL_DIAGNOSTIC_NO_UNUSED_FUNCTIONS = _Pragma("clang diagnostic ignored \"-Wunused-function\"");
//enum BL_DIAGNOSTIC_NO_UNUSED_PARAMETERS = _Pragma("clang diagnostic ignored \"-Wunused-parameter\"");
//enum BL_DIAGNOSTIC_NO_EXTRA_WARNINGS = _Pragma("clang diagnostic ignored \"-Wextra\"");

//struct BLRandom;
//struct BLFileCore;

//struct BLRuntimeBuildInfo;
//struct BLRuntimeSystemInfo;
//struct BLRuntimeResourceInfo;

//struct BLStringCore;
//struct BLStringImpl;

//struct BLArrayCore;
//struct BLArrayImpl;

//struct BLVariantCore;
//struct BLVariantImpl;

//struct BLPointI;
//struct BLPoint;
//struct BLSizeI;
//struct BLSize;
//struct BLBoxI;
//struct BLBox;
//struct BLRectI;
//struct BLRect;
//struct BLLine;
//struct BLTriangle;
//struct BLRoundRect;
//struct BLCircle;
//struct BLEllipse;
//struct BLArc;
//struct BLMatrix2D;
//struct BLApproximationOptions;
//struct BLStrokeOptionsCore;

//struct BLPathCore;
//struct BLPathImpl;
//struct BLPathView;

//struct BLRegionCore;
//struct BLRegionImpl;

//struct BLFormatInfo;
//struct BLImageCore;
//struct BLImageImpl;
//struct BLImageData;
//struct BLImageInfo;
//struct BLImageScaleOptions;

//struct BLPixelConverterCore;
//struct BLPixelConverterOptions;

//struct BLImageCodecCore;
//struct BLImageCodecImpl;
//struct BLImageCodecVirt;

//struct BLImageDecoderCore;
//struct BLImageDecoderImpl;
//struct BLImageDecoderVirt;

//struct BLImageEncoderCore;
//struct BLImageEncoderImpl;
//struct BLImageEncoderVirt;

//struct BLRgba32;
//struct BLRgba64;
//struct BLRgba;

//struct BLGradientCore;
//struct BLGradientImpl;
//struct BLGradientStop;

//struct BLLinearGradientValues;
//struct BLRadialGradientValues;
//struct BLConicalGradientValues;

//struct BLPatternCore;
//struct BLPatternImpl;

//struct BLStyleCore;

//struct BLContextCore;
//struct BLContextImpl;
//struct BLContextVirt;
//struct BLContextCookie;
//struct BLContextCreateInfo;
//struct BLContextHints;
//struct BLContextState;

//struct BLGlyphBufferCore;
//struct BLGlyphBufferImpl;
//struct BLGlyphInfo;
//struct BLGlyphMappingState;
//struct BLGlyphOutlineSinkInfo;
//struct BLGlyphPlacement;
//struct BLGlyphRun;

//struct BLFontUnicodeCoverage;
//struct BLFontFaceInfo;
//struct BLFontQueryProperties;
//struct BLFontFeature;
//struct BLFontDesignMetrics;
//struct BLFontMatrix;
//struct BLFontMetrics;
//struct BLFontPanose;
//struct BLFontTable;
//struct BLFontVariation;
//struct BLTextMetrics;

//struct BLFontCore;
//struct BLFontImpl;
//struct BLFontVirt;

//struct BLFontFaceCore;
//struct BLFontFaceImpl;
//struct BLFontFaceVirt;

//struct BLFontDataCore;
//struct BLFontDataImpl;
//struct BLFontDataVirt;

//struct BLFontManagerCore;
//struct BLFontManagerImpl;
//struct BLFontManagerVirt;

alias BLResult = uint;

alias BLBitWord = ulong;

alias BLTag = uint;

alias BLUniqueId = ulong;

alias BLDestroyImplFunc = void function(void* impl, void* destroyData);

alias BLPathSinkFunc = uint function(BLPathCore* path, const(void)* info, void* closure);

enum BLResultCode
{
    BL_SUCCESS = 0,

    BL_ERROR_START_INDEX = 0x00010000u,

    BL_ERROR_OUT_OF_MEMORY = 0x00010000u,
    BL_ERROR_INVALID_VALUE = 65537,
    BL_ERROR_INVALID_STATE = 65538,
    BL_ERROR_INVALID_HANDLE = 65539,
    BL_ERROR_VALUE_TOO_LARGE = 65540,
    BL_ERROR_NOT_INITIALIZED = 65541,
    BL_ERROR_NOT_IMPLEMENTED = 65542,
    BL_ERROR_NOT_PERMITTED = 65543,

    BL_ERROR_IO = 65544,
    BL_ERROR_BUSY = 65545,
    BL_ERROR_INTERRUPTED = 65546,
    BL_ERROR_TRY_AGAIN = 65547,
    BL_ERROR_TIMED_OUT = 65548,
    BL_ERROR_BROKEN_PIPE = 65549,
    BL_ERROR_INVALID_SEEK = 65550,
    BL_ERROR_SYMLINK_LOOP = 65551,
    BL_ERROR_FILE_TOO_LARGE = 65552,
    BL_ERROR_ALREADY_EXISTS = 65553,
    BL_ERROR_ACCESS_DENIED = 65554,
    BL_ERROR_MEDIA_CHANGED = 65555,
    BL_ERROR_READ_ONLY_FS = 65556,
    BL_ERROR_NO_DEVICE = 65557,
    BL_ERROR_NO_ENTRY = 65558,
    BL_ERROR_NO_MEDIA = 65559,
    BL_ERROR_NO_MORE_DATA = 65560,
    BL_ERROR_NO_MORE_FILES = 65561,
    BL_ERROR_NO_SPACE_LEFT = 65562,
    BL_ERROR_NOT_EMPTY = 65563,
    BL_ERROR_NOT_FILE = 65564,
    BL_ERROR_NOT_DIRECTORY = 65565,
    BL_ERROR_NOT_SAME_DEVICE = 65566,
    BL_ERROR_NOT_BLOCK_DEVICE = 65567,

    BL_ERROR_INVALID_FILE_NAME = 65568,
    BL_ERROR_FILE_NAME_TOO_LONG = 65569,

    BL_ERROR_TOO_MANY_OPEN_FILES = 65570,
    BL_ERROR_TOO_MANY_OPEN_FILES_BY_OS = 65571,
    BL_ERROR_TOO_MANY_LINKS = 65572,
    BL_ERROR_TOO_MANY_THREADS = 65573,
    BL_ERROR_THREAD_POOL_EXHAUSTED = 65574,

    BL_ERROR_FILE_EMPTY = 65575,
    BL_ERROR_OPEN_FAILED = 65576,
    BL_ERROR_NOT_ROOT_DEVICE = 65577,

    BL_ERROR_UNKNOWN_SYSTEM_ERROR = 65578,

    BL_ERROR_INVALID_ALIGNMENT = 65579,
    BL_ERROR_INVALID_SIGNATURE = 65580,
    BL_ERROR_INVALID_DATA = 65581,
    BL_ERROR_INVALID_STRING = 65582,
    BL_ERROR_DATA_TRUNCATED = 65583,
    BL_ERROR_DATA_TOO_LARGE = 65584,
    BL_ERROR_DECOMPRESSION_FAILED = 65585,

    BL_ERROR_INVALID_GEOMETRY = 65586,
    BL_ERROR_NO_MATCHING_VERTEX = 65587,

    BL_ERROR_NO_MATCHING_COOKIE = 65588,
    BL_ERROR_NO_STATES_TO_RESTORE = 65589,

    BL_ERROR_IMAGE_TOO_LARGE = 65590,
    BL_ERROR_IMAGE_NO_MATCHING_CODEC = 65591,
    BL_ERROR_IMAGE_UNKNOWN_FILE_FORMAT = 65592,
    BL_ERROR_IMAGE_DECODER_NOT_PROVIDED = 65593,
    BL_ERROR_IMAGE_ENCODER_NOT_PROVIDED = 65594,

    BL_ERROR_PNG_MULTIPLE_IHDR = 65595,
    BL_ERROR_PNG_INVALID_IDAT = 65596,
    BL_ERROR_PNG_INVALID_IEND = 65597,
    BL_ERROR_PNG_INVALID_PLTE = 65598,
    BL_ERROR_PNG_INVALID_TRNS = 65599,
    BL_ERROR_PNG_INVALID_FILTER = 65600,

    BL_ERROR_JPEG_UNSUPPORTED_FEATURE = 65601,
    BL_ERROR_JPEG_INVALID_SOS = 65602,
    BL_ERROR_JPEG_INVALID_SOF = 65603,
    BL_ERROR_JPEG_MULTIPLE_SOF = 65604,
    BL_ERROR_JPEG_UNSUPPORTED_SOF = 65605,

    BL_ERROR_FONT_NOT_INITIALIZED = 65606,
    BL_ERROR_FONT_NO_MATCH = 65607,
    BL_ERROR_FONT_NO_CHARACTER_MAPPING = 65608,
    BL_ERROR_FONT_MISSING_IMPORTANT_TABLE = 65609,
    BL_ERROR_FONT_FEATURE_NOT_AVAILABLE = 65610,
    BL_ERROR_FONT_CFF_INVALID_DATA = 65611,
    BL_ERROR_FONT_PROGRAM_TERMINATED = 65612,

    BL_ERROR_INVALID_GLYPH = 65613
}

enum BLByteOrder
{
    BL_BYTE_ORDER_LE = 0,

    BL_BYTE_ORDER_BE = 1,

    BL_BYTE_ORDER_NATIVE = BL_BYTE_ORDER == 1234 ? BL_BYTE_ORDER_LE : BL_BYTE_ORDER_BE,

    BL_BYTE_ORDER_SWAPPED = BL_BYTE_ORDER == 1234 ? BL_BYTE_ORDER_BE : BL_BYTE_ORDER_LE
}

enum BLDataAccessFlags
{
    BL_DATA_ACCESS_READ = 0x01u,

    BL_DATA_ACCESS_WRITE = 0x02u,

    BL_DATA_ACCESS_RW = 0x03u
}

enum BLDataSourceType
{
    BL_DATA_SOURCE_TYPE_NONE = 0,

    BL_DATA_SOURCE_TYPE_MEMORY = 1,

    BL_DATA_SOURCE_TYPE_FILE = 2,

    BL_DATA_SOURCE_TYPE_CUSTOM = 3,

    BL_DATA_SOURCE_TYPE_COUNT = 4
}

enum BLModifyOp
{
    BL_MODIFY_OP_ASSIGN_FIT = 0,

    BL_MODIFY_OP_ASSIGN_GROW = 1,

    BL_MODIFY_OP_APPEND_FIT = 2,

    BL_MODIFY_OP_APPEND_GROW = 3,

    BL_MODIFY_OP_COUNT = 4
}

enum BLBooleanOp
{
    BL_BOOLEAN_OP_COPY = 0,

    BL_BOOLEAN_OP_AND = 1,

    BL_BOOLEAN_OP_OR = 2,

    BL_BOOLEAN_OP_XOR = 3,

    BL_BOOLEAN_OP_SUB = 4,

    BL_BOOLEAN_OP_COUNT = 5
}

enum BLExtendMode
{
    BL_EXTEND_MODE_PAD = 0,

    BL_EXTEND_MODE_REPEAT = 1,

    BL_EXTEND_MODE_REFLECT = 2,

    BL_EXTEND_MODE_PAD_X_PAD_Y = 0,

    BL_EXTEND_MODE_REPEAT_X_REPEAT_Y = 1,

    BL_EXTEND_MODE_REFLECT_X_REFLECT_Y = 2,

    BL_EXTEND_MODE_PAD_X_REPEAT_Y = 3,

    BL_EXTEND_MODE_PAD_X_REFLECT_Y = 4,

    BL_EXTEND_MODE_REPEAT_X_PAD_Y = 5,

    BL_EXTEND_MODE_REPEAT_X_REFLECT_Y = 6,

    BL_EXTEND_MODE_REFLECT_X_PAD_Y = 7,

    BL_EXTEND_MODE_REFLECT_X_REPEAT_Y = 8,

    BL_EXTEND_MODE_SIMPLE_COUNT = 3,

    BL_EXTEND_MODE_COMPLEX_COUNT = 9
}

enum BLTextEncoding
{
    BL_TEXT_ENCODING_UTF8 = 0,

    BL_TEXT_ENCODING_UTF16 = 1,

    BL_TEXT_ENCODING_UTF32 = 2,

    BL_TEXT_ENCODING_LATIN1 = 3,

    BL_TEXT_ENCODING_WCHAR = wchar_t.sizeof == 4 ? BL_TEXT_ENCODING_UTF32 : wchar_t.sizeof == 2 ? BL_TEXT_ENCODING_UTF16 : BL_TEXT_ENCODING_UTF8,

    BL_TEXT_ENCODING_COUNT = 4
}

BLResult blTraceError(BLResult result);

struct BLRange
{
    size_t start;
    size_t end;
}

struct BLCreateForeignInfo
{
    void* data;
    size_t size;
    BLDestroyImplFunc destroyFunc;
    void* destroyData;
}

struct BLArrayView
{
    const(void)* data;
    size_t size;
}

struct BLStringView
{
    const(char)* data;
    size_t size;
}

struct BLRegionView
{
    const(BLBoxI)* data;
    size_t size;
}

alias BLDataView = BLArrayView;

version(BindBlend2D_Static) BLResult blArrayInit(BLArrayCore* self, uint arrayTypeId);
version(BindBlend2D_Static) BLResult blArrayDestroy(BLArrayCore* self);
version(BindBlend2D_Static) BLResult blArrayReset(BLArrayCore* self);
version(BindBlend2D_Static) BLResult blArrayCreateFromData(BLArrayCore* self, void* data, size_t size, size_t capacity, uint dataAccessFlags, BLDestroyImplFunc destroyFunc, void* destroyData);
version(BindBlend2D_Static) size_t blArrayGetSize(const(BLArrayCore)* self);
version(BindBlend2D_Static) size_t blArrayGetCapacity(const(BLArrayCore)* self);
version(BindBlend2D_Static) const(void)* blArrayGetData(const(BLArrayCore)* self);
version(BindBlend2D_Static) BLResult blArrayClear(BLArrayCore* self);
version(BindBlend2D_Static) BLResult blArrayShrink(BLArrayCore* self);
version(BindBlend2D_Static) BLResult blArrayReserve(BLArrayCore* self, size_t n);
version(BindBlend2D_Static) BLResult blArrayResize(BLArrayCore* self, size_t n, const(void)* fill);
version(BindBlend2D_Static) BLResult blArrayMakeMutable(BLArrayCore* self, void** dataOut);
version(BindBlend2D_Static) BLResult blArrayModifyOp(BLArrayCore* self, uint op, size_t n, void** dataOut);
version(BindBlend2D_Static) BLResult blArrayInsertOp(BLArrayCore* self, size_t index, size_t n, void** dataOut);
version(BindBlend2D_Static) BLResult blArrayAssignMove(BLArrayCore* self, BLArrayCore* other);
version(BindBlend2D_Static) BLResult blArrayAssignWeak(BLArrayCore* self, const(BLArrayCore)* other);
version(BindBlend2D_Static) BLResult blArrayAssignDeep(BLArrayCore* self, const(BLArrayCore)* other);
version(BindBlend2D_Static) BLResult blArrayAssignView(BLArrayCore* self, const(void)* items, size_t n);
version(BindBlend2D_Static) BLResult blArrayAppendU8(BLArrayCore* self, ubyte value);
version(BindBlend2D_Static) BLResult blArrayAppendU16(BLArrayCore* self, ushort value);
version(BindBlend2D_Static) BLResult blArrayAppendU32(BLArrayCore* self, uint value);
version(BindBlend2D_Static) BLResult blArrayAppendU64(BLArrayCore* self, ulong value);
version(BindBlend2D_Static) BLResult blArrayAppendF32(BLArrayCore* self, float value);
version(BindBlend2D_Static) BLResult blArrayAppendF64(BLArrayCore* self, double value);
version(BindBlend2D_Static) BLResult blArrayAppendItem(BLArrayCore* self, const(void)* item);
version(BindBlend2D_Static) BLResult blArrayAppendView(BLArrayCore* self, const(void)* items, size_t n);
version(BindBlend2D_Static) BLResult blArrayInsertU8(BLArrayCore* self, size_t index, ubyte value);
version(BindBlend2D_Static) BLResult blArrayInsertU16(BLArrayCore* self, size_t index, ushort value);
version(BindBlend2D_Static) BLResult blArrayInsertU32(BLArrayCore* self, size_t index, uint value);
version(BindBlend2D_Static) BLResult blArrayInsertU64(BLArrayCore* self, size_t index, ulong value);
version(BindBlend2D_Static) BLResult blArrayInsertF32(BLArrayCore* self, size_t index, float value);
version(BindBlend2D_Static) BLResult blArrayInsertF64(BLArrayCore* self, size_t index, double value);
version(BindBlend2D_Static) BLResult blArrayInsertItem(BLArrayCore* self, size_t index, const(void)* item);
version(BindBlend2D_Static) BLResult blArrayInsertView(BLArrayCore* self, size_t index, const(void)* items, size_t n);
version(BindBlend2D_Static) BLResult blArrayReplaceU8(BLArrayCore* self, size_t index, ubyte value);
version(BindBlend2D_Static) BLResult blArrayReplaceU16(BLArrayCore* self, size_t index, ushort value);
version(BindBlend2D_Static) BLResult blArrayReplaceU32(BLArrayCore* self, size_t index, uint value);
version(BindBlend2D_Static) BLResult blArrayReplaceU64(BLArrayCore* self, size_t index, ulong value);
version(BindBlend2D_Static) BLResult blArrayReplaceF32(BLArrayCore* self, size_t index, float value);
version(BindBlend2D_Static) BLResult blArrayReplaceF64(BLArrayCore* self, size_t index, double value);
version(BindBlend2D_Static) BLResult blArrayReplaceItem(BLArrayCore* self, size_t index, const(void)* item);
version(BindBlend2D_Static) BLResult blArrayReplaceView(BLArrayCore* self, size_t rStart, size_t rEnd, const(void)* items, size_t n);
version(BindBlend2D_Static) BLResult blArrayRemoveIndex(BLArrayCore* self, size_t index);
version(BindBlend2D_Static) BLResult blArrayRemoveRange(BLArrayCore* self, size_t rStart, size_t rEnd);
version(BindBlend2D_Static) bool blArrayEquals(const(BLArrayCore)* a, const(BLArrayCore)* b);

version(BindBlend2D_Static) BLResult blContextInit(BLContextCore* self);
version(BindBlend2D_Static) BLResult blContextInitAs(BLContextCore* self, BLImageCore* image, const(BLContextCreateInfo)* options);
version(BindBlend2D_Static) BLResult blContextDestroy(BLContextCore* self);
version(BindBlend2D_Static) BLResult blContextReset(BLContextCore* self);
version(BindBlend2D_Static) BLResult blContextAssignMove(BLContextCore* self, BLContextCore* other);
version(BindBlend2D_Static) BLResult blContextAssignWeak(BLContextCore* self, const(BLContextCore)* other);
version(BindBlend2D_Static) uint blContextGetType(const(BLContextCore)* self);
version(BindBlend2D_Static) BLResult blContextGetTargetSize(const(BLContextCore)* self, BLSize* targetSizeOut);
version(BindBlend2D_Static) BLImageCore* blContextGetTargetImage(const(BLContextCore)* self);
version(BindBlend2D_Static) BLResult blContextBegin(BLContextCore* self, BLImageCore* image, const(BLContextCreateInfo)* options);
version(BindBlend2D_Static) BLResult blContextEnd(BLContextCore* self);
version(BindBlend2D_Static) BLResult blContextFlush(BLContextCore* self, uint flags);
version(BindBlend2D_Static) BLResult blContextQueryProperty(const(BLContextCore)* self, uint propertyId, void* valueOut);
version(BindBlend2D_Static) BLResult blContextSave(BLContextCore* self, BLContextCookie* cookie);
version(BindBlend2D_Static) BLResult blContextRestore(BLContextCore* self, const(BLContextCookie)* cookie);
version(BindBlend2D_Static) BLResult blContextGetMetaMatrix(const(BLContextCore)* self, BLMatrix2D* m);
version(BindBlend2D_Static) BLResult blContextGetUserMatrix(const(BLContextCore)* self, BLMatrix2D* m);
version(BindBlend2D_Static) BLResult blContextUserToMeta(BLContextCore* self);
version(BindBlend2D_Static) BLResult blContextMatrixOp(BLContextCore* self, uint opType, const(void)* opData);
version(BindBlend2D_Static) BLResult blContextSetHint(BLContextCore* self, uint hintType, uint value);
version(BindBlend2D_Static) BLResult blContextSetHints(BLContextCore* self, const(BLContextHints)* hints);
version(BindBlend2D_Static) BLResult blContextSetFlattenMode(BLContextCore* self, uint mode);
version(BindBlend2D_Static) BLResult blContextSetFlattenTolerance(BLContextCore* self, double tolerance);
version(BindBlend2D_Static) BLResult blContextSetApproximationOptions(BLContextCore* self, const(BLApproximationOptions)* options);
version(BindBlend2D_Static) BLResult blContextSetCompOp(BLContextCore* self, uint compOp);
version(BindBlend2D_Static) BLResult blContextSetGlobalAlpha(BLContextCore* self, double alpha);
version(BindBlend2D_Static) BLResult blContextSetFillAlpha(BLContextCore* self, double alpha);
version(BindBlend2D_Static) BLResult blContextGetFillStyle(const(BLContextCore)* self, BLStyleCore* styleOut);
version(BindBlend2D_Static) BLResult blContextSetFillStyle(BLContextCore* self, const(BLStyleCore)* style);
version(BindBlend2D_Static) BLResult blContextSetFillStyleRgba(BLContextCore* self, const(BLRgba)* rgba);
version(BindBlend2D_Static) BLResult blContextSetFillStyleRgba32(BLContextCore* self, uint rgba32);
version(BindBlend2D_Static) BLResult blContextSetFillStyleRgba64(BLContextCore* self, ulong rgba64);
version(BindBlend2D_Static) BLResult blContextSetFillStyleObject(BLContextCore* self, const(void)* object);
version(BindBlend2D_Static) BLResult blContextSetFillRule(BLContextCore* self, uint fillRule);
version(BindBlend2D_Static) BLResult blContextSetStrokeAlpha(BLContextCore* self, double alpha);
version(BindBlend2D_Static) BLResult blContextGetStrokeStyle(const(BLContextCore)* self, BLStyleCore* styleOut);
version(BindBlend2D_Static) BLResult blContextSetStrokeStyle(BLContextCore* self, const(BLStyleCore)* style);
version(BindBlend2D_Static) BLResult blContextSetStrokeStyleRgba(BLContextCore* self, const(BLRgba)* rgba);
version(BindBlend2D_Static) BLResult blContextSetStrokeStyleRgba32(BLContextCore* self, uint rgba32);
version(BindBlend2D_Static) BLResult blContextSetStrokeStyleRgba64(BLContextCore* self, ulong rgba64);
version(BindBlend2D_Static) BLResult blContextSetStrokeStyleObject(BLContextCore* self, const(void)* object);
version(BindBlend2D_Static) BLResult blContextSetStrokeWidth(BLContextCore* self, double width);
version(BindBlend2D_Static) BLResult blContextSetStrokeMiterLimit(BLContextCore* self, double miterLimit);
version(BindBlend2D_Static) BLResult blContextSetStrokeCap(BLContextCore* self, uint position, uint strokeCap);
version(BindBlend2D_Static) BLResult blContextSetStrokeCaps(BLContextCore* self, uint strokeCap);
version(BindBlend2D_Static) BLResult blContextSetStrokeJoin(BLContextCore* self, uint strokeJoin);
version(BindBlend2D_Static) BLResult blContextSetStrokeDashOffset(BLContextCore* self, double dashOffset);
version(BindBlend2D_Static) BLResult blContextSetStrokeDashArray(BLContextCore* self, const(BLArrayCore)* dashArray);
version(BindBlend2D_Static) BLResult blContextSetStrokeTransformOrder(BLContextCore* self, uint transformOrder);
version(BindBlend2D_Static) BLResult blContextGetStrokeOptions(const(BLContextCore)* self, BLStrokeOptionsCore* options);
version(BindBlend2D_Static) BLResult blContextSetStrokeOptions(BLContextCore* self, const(BLStrokeOptionsCore)* options);
version(BindBlend2D_Static) BLResult blContextClipToRectI(BLContextCore* self, const(BLRectI)* rect);
version(BindBlend2D_Static) BLResult blContextClipToRectD(BLContextCore* self, const(BLRect)* rect);
version(BindBlend2D_Static) BLResult blContextRestoreClipping(BLContextCore* self);
version(BindBlend2D_Static) BLResult blContextClearAll(BLContextCore* self);
version(BindBlend2D_Static) BLResult blContextClearRectI(BLContextCore* self, const(BLRectI)* rect);
version(BindBlend2D_Static) BLResult blContextClearRectD(BLContextCore* self, const(BLRect)* rect);
version(BindBlend2D_Static) BLResult blContextFillAll(BLContextCore* self);
version(BindBlend2D_Static) BLResult blContextFillRectI(BLContextCore* self, const(BLRectI)* rect);
version(BindBlend2D_Static) BLResult blContextFillRectD(BLContextCore* self, const(BLRect)* rect);
version(BindBlend2D_Static) BLResult blContextFillPathD(BLContextCore* self, const(BLPathCore)* path);
version(BindBlend2D_Static) BLResult blContextFillGeometry(BLContextCore* self, uint geometryType, const(void)* geometryData);
version(BindBlend2D_Static) BLResult blContextFillTextI(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding);
version(BindBlend2D_Static) BLResult blContextFillTextD(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding);
version(BindBlend2D_Static) BLResult blContextFillGlyphRunI(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
version(BindBlend2D_Static) BLResult blContextFillGlyphRunD(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
version(BindBlend2D_Static) BLResult blContextStrokeRectI(BLContextCore* self, const(BLRectI)* rect);
version(BindBlend2D_Static) BLResult blContextStrokeRectD(BLContextCore* self, const(BLRect)* rect);
version(BindBlend2D_Static) BLResult blContextStrokePathD(BLContextCore* self, const(BLPathCore)* path);
version(BindBlend2D_Static) BLResult blContextStrokeGeometry(BLContextCore* self, uint geometryType, const(void)* geometryData);
version(BindBlend2D_Static) BLResult blContextStrokeTextI(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding);
version(BindBlend2D_Static) BLResult blContextStrokeTextD(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding);
version(BindBlend2D_Static) BLResult blContextStrokeGlyphRunI(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
version(BindBlend2D_Static) BLResult blContextStrokeGlyphRunD(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
version(BindBlend2D_Static) BLResult blContextBlitImageI(BLContextCore* self, const(BLPointI)* pt, const(BLImageCore)* img, const(BLRectI)* imgArea);
version(BindBlend2D_Static) BLResult blContextBlitImageD(BLContextCore* self, const(BLPoint)* pt, const(BLImageCore)* img, const(BLRectI)* imgArea);
version(BindBlend2D_Static) BLResult blContextBlitScaledImageI(BLContextCore* self, const(BLRectI)* rect, const(BLImageCore)* img, const(BLRectI)* imgArea);
version(BindBlend2D_Static) BLResult blContextBlitScaledImageD(BLContextCore* self, const(BLRect)* rect, const(BLImageCore)* img, const(BLRectI)* imgArea);

version(BindBlend2D_Static) BLResult blFileInit(BLFileCore* self);
version(BindBlend2D_Static) BLResult blFileReset(BLFileCore* self);
version(BindBlend2D_Static) BLResult blFileOpen(BLFileCore* self, const(char)* fileName, uint openFlags);
version(BindBlend2D_Static) BLResult blFileClose(BLFileCore* self);
version(BindBlend2D_Static) BLResult blFileSeek(BLFileCore* self, long offset, uint seekType, long* positionOut);
version(BindBlend2D_Static) BLResult blFileRead(BLFileCore* self, void* buffer, size_t n, size_t* bytesReadOut);
version(BindBlend2D_Static) BLResult blFileWrite(BLFileCore* self, const(void)* buffer, size_t n, size_t* bytesWrittenOut);
version(BindBlend2D_Static) BLResult blFileTruncate(BLFileCore* self, long maxSize);
version(BindBlend2D_Static) BLResult blFileGetSize(BLFileCore* self, ulong* fileSizeOut);

version(BindBlend2D_Static) BLResult blFileSystemReadFile(const(char)* fileName, BLArrayCore* dst, size_t maxSize, uint readFlags);
version(BindBlend2D_Static) BLResult blFileSystemWriteFile(const(char)* fileName, const(void)* data, size_t size, size_t* bytesWrittenOut);

version(BindBlend2D_Static) BLResult blFontInit(BLFontCore* self);
version(BindBlend2D_Static) BLResult blFontDestroy(BLFontCore* self);
version(BindBlend2D_Static) BLResult blFontReset(BLFontCore* self);
version(BindBlend2D_Static) BLResult blFontAssignMove(BLFontCore* self, BLFontCore* other);
version(BindBlend2D_Static) BLResult blFontAssignWeak(BLFontCore* self, const(BLFontCore)* other);
version(BindBlend2D_Static) bool blFontEquals(const(BLFontCore)* a, const(BLFontCore)* b);
version(BindBlend2D_Static) BLResult blFontCreateFromFace(BLFontCore* self, const(BLFontFaceCore)* face, float size);
version(BindBlend2D_Static) BLResult blFontShape(const(BLFontCore)* self, BLGlyphBufferCore* gb);
version(BindBlend2D_Static) BLResult blFontMapTextToGlyphs(const(BLFontCore)* self, BLGlyphBufferCore* gb, BLGlyphMappingState* stateOut);
version(BindBlend2D_Static) BLResult blFontPositionGlyphs(const(BLFontCore)* self, BLGlyphBufferCore* gb, uint positioningFlags);
version(BindBlend2D_Static) BLResult blFontApplyKerning(const(BLFontCore)* self, BLGlyphBufferCore* gb);
version(BindBlend2D_Static) BLResult blFontApplyGSub(const(BLFontCore)* self, BLGlyphBufferCore* gb, size_t index, BLBitWord lookups);
version(BindBlend2D_Static) BLResult blFontApplyGPos(const(BLFontCore)* self, BLGlyphBufferCore* gb, size_t index, BLBitWord lookups);
version(BindBlend2D_Static) BLResult blFontGetMatrix(const(BLFontCore)* self, BLFontMatrix* out_);
version(BindBlend2D_Static) BLResult blFontGetMetrics(const(BLFontCore)* self, BLFontMetrics* out_);
version(BindBlend2D_Static) BLResult blFontGetDesignMetrics(const(BLFontCore)* self, BLFontDesignMetrics* out_);
version(BindBlend2D_Static) BLResult blFontGetTextMetrics(const(BLFontCore)* self, BLGlyphBufferCore* gb, BLTextMetrics* out_);
version(BindBlend2D_Static) BLResult blFontGetGlyphBounds(const(BLFontCore)* self, const(uint)* glyphData, intptr_t glyphAdvance, BLBoxI* out_, size_t count);
version(BindBlend2D_Static) BLResult blFontGetGlyphAdvances(const(BLFontCore)* self, const(uint)* glyphData, intptr_t glyphAdvance, BLGlyphPlacement* out_, size_t count);
version(BindBlend2D_Static) BLResult blFontGetGlyphOutlines(const(BLFontCore)* self, uint glyphId, const(BLMatrix2D)* userMatrix, BLPathCore* out_, BLPathSinkFunc sink, void* closure);
version(BindBlend2D_Static) BLResult blFontGetGlyphRunOutlines(const(BLFontCore)* self, const(BLGlyphRun)* glyphRun, const(BLMatrix2D)* userMatrix, BLPathCore* out_, BLPathSinkFunc sink, void* closure);

version(BindBlend2D_Static) BLResult blFontDataInit(BLFontDataCore* self);
version(BindBlend2D_Static) BLResult blFontDataDestroy(BLFontDataCore* self);
version(BindBlend2D_Static) BLResult blFontDataReset(BLFontDataCore* self);
version(BindBlend2D_Static) BLResult blFontDataAssignMove(BLFontDataCore* self, BLFontDataCore* other);
version(BindBlend2D_Static) BLResult blFontDataAssignWeak(BLFontDataCore* self, const(BLFontDataCore)* other);
version(BindBlend2D_Static) BLResult blFontDataCreateFromFile(BLFontDataCore* self, const(char)* fileName, uint readFlags);
version(BindBlend2D_Static) BLResult blFontDataCreateFromDataArray(BLFontDataCore* self, const(BLArrayCore)* dataArray);
version(BindBlend2D_Static) BLResult blFontDataCreateFromData(BLFontDataCore* self, const(void)* data, size_t dataSize, BLDestroyImplFunc destroyFunc, void* destroyData);
version(BindBlend2D_Static) bool blFontDataEquals(const(BLFontDataCore)* a, const(BLFontDataCore)* b);
version(BindBlend2D_Static) BLResult blFontDataListTags(const(BLFontDataCore)* self, uint faceIndex, BLArrayCore* dst);
version(BindBlend2D_Static) size_t blFontDataQueryTables(const(BLFontDataCore)* self, uint faceIndex, BLFontTable* dst, const(BLTag)* tags, size_t count);

version(BindBlend2D_Static) BLResult blFontFaceInit(BLFontFaceCore* self);
version(BindBlend2D_Static) BLResult blFontFaceDestroy(BLFontFaceCore* self);
version(BindBlend2D_Static) BLResult blFontFaceReset(BLFontFaceCore* self);
version(BindBlend2D_Static) BLResult blFontFaceAssignMove(BLFontFaceCore* self, BLFontFaceCore* other);
version(BindBlend2D_Static) BLResult blFontFaceAssignWeak(BLFontFaceCore* self, const(BLFontFaceCore)* other);
version(BindBlend2D_Static) bool blFontFaceEquals(const(BLFontFaceCore)* a, const(BLFontFaceCore)* b);
version(BindBlend2D_Static) BLResult blFontFaceCreateFromFile(BLFontFaceCore* self, const(char)* fileName, uint readFlags);
version(BindBlend2D_Static) BLResult blFontFaceCreateFromData(BLFontFaceCore* self, const(BLFontDataCore)* fontData, uint faceIndex);
version(BindBlend2D_Static) BLResult blFontFaceGetFaceInfo(const(BLFontFaceCore)* self, BLFontFaceInfo* out_);
version(BindBlend2D_Static) BLResult blFontFaceGetDesignMetrics(const(BLFontFaceCore)* self, BLFontDesignMetrics* out_);
version(BindBlend2D_Static) BLResult blFontFaceGetUnicodeCoverage(const(BLFontFaceCore)* self, BLFontUnicodeCoverage* out_);

version(BindBlend2D_Static) BLResult blFontManagerInit(BLFontManagerCore* self);
version(BindBlend2D_Static) BLResult blFontManagerInitNew(BLFontManagerCore* self);
version(BindBlend2D_Static) BLResult blFontManagerDestroy(BLFontManagerCore* self);
version(BindBlend2D_Static) BLResult blFontManagerReset(BLFontManagerCore* self);
version(BindBlend2D_Static) BLResult blFontManagerAssignMove(BLFontManagerCore* self, BLFontManagerCore* other);
version(BindBlend2D_Static) BLResult blFontManagerAssignWeak(BLFontManagerCore* self, const(BLFontManagerCore)* other);
version(BindBlend2D_Static) BLResult blFontManagerCreate(BLFontManagerCore* self);
version(BindBlend2D_Static) size_t blFontManagerGetFaceCount(const(BLFontManagerCore)* self);
version(BindBlend2D_Static) size_t blFontManagerGetFamilyCount(const(BLFontManagerCore)* self);
version(BindBlend2D_Static) bool blFontManagerHasFace(const(BLFontManagerCore)* self, const(BLFontFaceCore)* face);
version(BindBlend2D_Static) BLResult blFontManagerAddFace(BLFontManagerCore* self, const(BLFontFaceCore)* face);
version(BindBlend2D_Static) BLResult blFontManagerQueryFace(const(BLFontManagerCore)* self, const(char)* name, size_t nameSize, const(BLFontQueryProperties)* properties, BLFontFaceCore* out_);
version(BindBlend2D_Static) BLResult blFontManagerQueryFacesByFamilyName(const(BLFontManagerCore)* self, const(char)* name, size_t nameSize, BLArrayCore* out_);
version(BindBlend2D_Static) bool blFontManagerEquals(const(BLFontManagerCore)* a, const(BLFontManagerCore)* b);

version(BindBlend2D_Static) BLResult blFormatInfoQuery(BLFormatInfo* self, uint format);
version(BindBlend2D_Static) BLResult blFormatInfoSanitize(BLFormatInfo* self);

version(BindBlend2D_Static) BLResult blGlyphBufferInit(BLGlyphBufferCore* self);
version(BindBlend2D_Static) BLResult blGlyphBufferInitMove(BLGlyphBufferCore* self, BLGlyphBufferCore* other);
version(BindBlend2D_Static) BLResult blGlyphBufferDestroy(BLGlyphBufferCore* self);
version(BindBlend2D_Static) BLResult blGlyphBufferReset(BLGlyphBufferCore* self);
version(BindBlend2D_Static) BLResult blGlyphBufferClear(BLGlyphBufferCore* self);
version(BindBlend2D_Static) size_t blGlyphBufferGetSize(const(BLGlyphBufferCore)* self);
version(BindBlend2D_Static) uint blGlyphBufferGetFlags(const(BLGlyphBufferCore)* self);
version(BindBlend2D_Static) const(BLGlyphRun)* blGlyphBufferGetGlyphRun(const(BLGlyphBufferCore)* self);
version(BindBlend2D_Static) const(uint)* blGlyphBufferGetContent(const(BLGlyphBufferCore)* self);
version(BindBlend2D_Static) const(BLGlyphInfo)* blGlyphBufferGetInfoData(const(BLGlyphBufferCore)* self);
version(BindBlend2D_Static) const(BLGlyphPlacement)* blGlyphBufferGetPlacementData(const(BLGlyphBufferCore)* self);
version(BindBlend2D_Static) BLResult blGlyphBufferSetText(BLGlyphBufferCore* self, const(void)* textData, size_t size, uint encoding);
version(BindBlend2D_Static) BLResult blGlyphBufferSetGlyphs(BLGlyphBufferCore* self, const(uint)* glyphData, size_t size);
version(BindBlend2D_Static) BLResult blGlyphBufferSetGlyphsFromStruct(BLGlyphBufferCore* self, const(void)* glyphData, size_t size, size_t glyphIdSize, intptr_t glyphIdAdvance);

version(BindBlend2D_Static) BLResult blGradientInit(BLGradientCore* self);
version(BindBlend2D_Static) BLResult blGradientInitAs(BLGradientCore* self, uint type, const(void)* values, uint extendMode, const(BLGradientStop)* stops, size_t n, const(BLMatrix2D)* m);
version(BindBlend2D_Static) BLResult blGradientDestroy(BLGradientCore* self);
version(BindBlend2D_Static) BLResult blGradientReset(BLGradientCore* self);
version(BindBlend2D_Static) BLResult blGradientAssignMove(BLGradientCore* self, BLGradientCore* other);
version(BindBlend2D_Static) BLResult blGradientAssignWeak(BLGradientCore* self, const(BLGradientCore)* other);
version(BindBlend2D_Static) BLResult blGradientCreate(BLGradientCore* self, uint type, const(void)* values, uint extendMode, const(BLGradientStop)* stops, size_t n, const(BLMatrix2D)* m);
version(BindBlend2D_Static) BLResult blGradientShrink(BLGradientCore* self);
version(BindBlend2D_Static) BLResult blGradientReserve(BLGradientCore* self, size_t n);
version(BindBlend2D_Static) uint blGradientGetType(const(BLGradientCore)* self);
version(BindBlend2D_Static) BLResult blGradientSetType(BLGradientCore* self, uint type);
version(BindBlend2D_Static) double blGradientGetValue(const(BLGradientCore)* self, size_t index);
version(BindBlend2D_Static) BLResult blGradientSetValue(BLGradientCore* self, size_t index, double value);
version(BindBlend2D_Static) BLResult blGradientSetValues(BLGradientCore* self, size_t index, const(double)* values, size_t n);
version(BindBlend2D_Static) uint blGradientGetExtendMode(BLGradientCore* self);
version(BindBlend2D_Static) BLResult blGradientSetExtendMode(BLGradientCore* self, uint extendMode);
version(BindBlend2D_Static) size_t blGradientGetSize(const(BLGradientCore)* self);
version(BindBlend2D_Static) size_t blGradientGetCapacity(const(BLGradientCore)* self);
version(BindBlend2D_Static) const(BLGradientStop)* blGradientGetStops(const(BLGradientCore)* self);
version(BindBlend2D_Static) BLResult blGradientResetStops(BLGradientCore* self);
version(BindBlend2D_Static) BLResult blGradientAssignStops(BLGradientCore* self, const(BLGradientStop)* stops, size_t n);
version(BindBlend2D_Static) BLResult blGradientAddStopRgba32(BLGradientCore* self, double offset, uint argb32);
version(BindBlend2D_Static) BLResult blGradientAddStopRgba64(BLGradientCore* self, double offset, ulong argb64);
version(BindBlend2D_Static) BLResult blGradientRemoveStop(BLGradientCore* self, size_t index);
version(BindBlend2D_Static) BLResult blGradientRemoveStopByOffset(BLGradientCore* self, double offset, uint all);
version(BindBlend2D_Static) BLResult blGradientRemoveStops(BLGradientCore* self, size_t rStart, size_t rEnd);
version(BindBlend2D_Static) BLResult blGradientRemoveStopsFromTo(BLGradientCore* self, double offsetMin, double offsetMax);
version(BindBlend2D_Static) BLResult blGradientReplaceStopRgba32(BLGradientCore* self, size_t index, double offset, uint rgba32);
version(BindBlend2D_Static) BLResult blGradientReplaceStopRgba64(BLGradientCore* self, size_t index, double offset, ulong rgba64);
version(BindBlend2D_Static) size_t blGradientIndexOfStop(const(BLGradientCore)* self, double offset);
version(BindBlend2D_Static) BLResult blGradientApplyMatrixOp(BLGradientCore* self, uint opType, const(void)* opData);
version(BindBlend2D_Static) bool blGradientEquals(const(BLGradientCore)* a, const(BLGradientCore)* b);

version(BindBlend2D_Static) BLResult blImageInit(BLImageCore* self);
version(BindBlend2D_Static) BLResult blImageInitAs(BLImageCore* self, int w, int h, uint format);
version(BindBlend2D_Static) BLResult blImageInitAsFromData(BLImageCore* self, int w, int h, uint format, void* pixelData, intptr_t stride, BLDestroyImplFunc destroyFunc, void* destroyData);
version(BindBlend2D_Static) BLResult blImageDestroy(BLImageCore* self);
version(BindBlend2D_Static) BLResult blImageReset(BLImageCore* self);
version(BindBlend2D_Static) BLResult blImageAssignMove(BLImageCore* self, BLImageCore* other);
version(BindBlend2D_Static) BLResult blImageAssignWeak(BLImageCore* self, const(BLImageCore)* other);
version(BindBlend2D_Static) BLResult blImageAssignDeep(BLImageCore* self, const(BLImageCore)* other);
version(BindBlend2D_Static) BLResult blImageCreate(BLImageCore* self, int w, int h, uint format);
version(BindBlend2D_Static) BLResult blImageCreateFromData(BLImageCore* self, int w, int h, uint format, void* pixelData, intptr_t stride, BLDestroyImplFunc destroyFunc, void* destroyData);
version(BindBlend2D_Static) BLResult blImageGetData(const(BLImageCore)* self, BLImageData* dataOut);
version(BindBlend2D_Static) BLResult blImageMakeMutable(BLImageCore* self, BLImageData* dataOut);
version(BindBlend2D_Static) BLResult blImageConvert(BLImageCore* self, uint format);
version(BindBlend2D_Static) bool blImageEquals(const(BLImageCore)* a, const(BLImageCore)* b);
version(BindBlend2D_Static) BLResult blImageScale(BLImageCore* dst, const(BLImageCore)* src, const(BLSizeI)* size, uint filter, const(BLImageScaleOptions)* options);
version(BindBlend2D_Static) BLResult blImageReadFromFile(BLImageCore* self, const(char)* fileName, const(BLArrayCore)* codecs);
version(BindBlend2D_Static) BLResult blImageReadFromData(BLImageCore* self, const(void)* data, size_t size, const(BLArrayCore)* codecs);
version(BindBlend2D_Static) BLResult blImageWriteToFile(const(BLImageCore)* self, const(char)* fileName, const(BLImageCodecCore)* codec);
version(BindBlend2D_Static) BLResult blImageWriteToData(const(BLImageCore)* self, BLArrayCore* dst, const(BLImageCodecCore)* codec);

version(BindBlend2D_Static) BLResult blImageCodecInit(BLImageCodecCore* self);
version(BindBlend2D_Static) BLResult blImageCodecDestroy(BLImageCodecCore* self);
version(BindBlend2D_Static) BLResult blImageCodecReset(BLImageCodecCore* self);
version(BindBlend2D_Static) BLResult blImageCodecAssignWeak(BLImageCodecCore* self, const(BLImageCodecCore)* other);
version(BindBlend2D_Static) BLResult blImageCodecFindByName(BLImageCodecCore* self, const(char)* name, size_t size, const(BLArrayCore)* codecs);
version(BindBlend2D_Static) BLResult blImageCodecFindByExtension(BLImageCodecCore* self, const(char)* name, size_t size, const(BLArrayCore)* codecs);
version(BindBlend2D_Static) BLResult blImageCodecFindByData(BLImageCodecCore* self, const(void)* data, size_t size, const(BLArrayCore)* codecs);
version(BindBlend2D_Static) uint blImageCodecInspectData(const(BLImageCodecCore)* self, const(void)* data, size_t size);
version(BindBlend2D_Static) BLResult blImageCodecCreateDecoder(const(BLImageCodecCore)* self, BLImageDecoderCore* dst);
version(BindBlend2D_Static) BLResult blImageCodecCreateEncoder(const(BLImageCodecCore)* self, BLImageEncoderCore* dst);

version(BindBlend2D_Static) BLResult blImageCodecArrayInitBuiltInCodecs(BLArrayCore* self);
version(BindBlend2D_Static) BLResult blImageCodecArrayAssignBuiltInCodecs(BLArrayCore* self);
version(BindBlend2D_Static) BLResult blImageCodecAddToBuiltIn(const(BLImageCodecCore)* codec);
version(BindBlend2D_Static) BLResult blImageCodecRemoveFromBuiltIn(const(BLImageCodecCore)* codec);

version(BindBlend2D_Static) BLResult blImageDecoderInit(BLImageDecoderCore* self);
version(BindBlend2D_Static) BLResult blImageDecoderDestroy(BLImageDecoderCore* self);
version(BindBlend2D_Static) BLResult blImageDecoderReset(BLImageDecoderCore* self);
version(BindBlend2D_Static) BLResult blImageDecoderAssignMove(BLImageDecoderCore* self, BLImageDecoderCore* other);
version(BindBlend2D_Static) BLResult blImageDecoderAssignWeak(BLImageDecoderCore* self, const(BLImageDecoderCore)* other);
version(BindBlend2D_Static) BLResult blImageDecoderRestart(BLImageDecoderCore* self);
version(BindBlend2D_Static) BLResult blImageDecoderReadInfo(BLImageDecoderCore* self, BLImageInfo* infoOut, const(ubyte)* data, size_t size);
version(BindBlend2D_Static) BLResult blImageDecoderReadFrame(BLImageDecoderCore* self, BLImageCore* imageOut, const(ubyte)* data, size_t size);

version(BindBlend2D_Static) BLResult blImageEncoderInit(BLImageEncoderCore* self);
version(BindBlend2D_Static) BLResult blImageEncoderDestroy(BLImageEncoderCore* self);
version(BindBlend2D_Static) BLResult blImageEncoderReset(BLImageEncoderCore* self);
version(BindBlend2D_Static) BLResult blImageEncoderAssignMove(BLImageEncoderCore* self, BLImageEncoderCore* other);
version(BindBlend2D_Static) BLResult blImageEncoderAssignWeak(BLImageEncoderCore* self, const(BLImageEncoderCore)* other);
version(BindBlend2D_Static) BLResult blImageEncoderRestart(BLImageEncoderCore* self);
version(BindBlend2D_Static) BLResult blImageEncoderWriteFrame(BLImageEncoderCore* self, BLArrayCore* dst, const(BLImageCore)* image);

version(BindBlend2D_Static) BLResult blMatrix2DSetIdentity(BLMatrix2D* self);
version(BindBlend2D_Static) BLResult blMatrix2DSetTranslation(BLMatrix2D* self, double x, double y);
version(BindBlend2D_Static) BLResult blMatrix2DSetScaling(BLMatrix2D* self, double x, double y);
version(BindBlend2D_Static) BLResult blMatrix2DSetSkewing(BLMatrix2D* self, double x, double y);
version(BindBlend2D_Static) BLResult blMatrix2DSetRotation(BLMatrix2D* self, double angle, double cx, double cy);
version(BindBlend2D_Static) BLResult blMatrix2DApplyOp(BLMatrix2D* self, uint opType, const(void)* opData);
version(BindBlend2D_Static) BLResult blMatrix2DInvert(BLMatrix2D* dst, const(BLMatrix2D)* src);
version(BindBlend2D_Static) uint blMatrix2DGetType(const(BLMatrix2D)* self);
version(BindBlend2D_Static) BLResult blMatrix2DMapPointDArray(const(BLMatrix2D)* self, BLPoint* dst, const(BLPoint)* src, size_t count);

version(BindBlend2D_Static) BLResult blPathInit(BLPathCore* self);
version(BindBlend2D_Static) BLResult blPathDestroy(BLPathCore* self);
version(BindBlend2D_Static) BLResult blPathReset(BLPathCore* self);
version(BindBlend2D_Static) size_t blPathGetSize(const(BLPathCore)* self);
version(BindBlend2D_Static) size_t blPathGetCapacity(const(BLPathCore)* self);
version(BindBlend2D_Static) const(ubyte)* blPathGetCommandData(const(BLPathCore)* self);
version(BindBlend2D_Static) const(BLPoint)* blPathGetVertexData(const(BLPathCore)* self);
version(BindBlend2D_Static) BLResult blPathClear(BLPathCore* self);
version(BindBlend2D_Static) BLResult blPathShrink(BLPathCore* self);
version(BindBlend2D_Static) BLResult blPathReserve(BLPathCore* self, size_t n);
version(BindBlend2D_Static) BLResult blPathModifyOp(BLPathCore* self, uint op, size_t n, ubyte** cmdDataOut, BLPoint** vtxDataOut);
version(BindBlend2D_Static) BLResult blPathAssignMove(BLPathCore* self, BLPathCore* other);
version(BindBlend2D_Static) BLResult blPathAssignWeak(BLPathCore* self, const(BLPathCore)* other);
version(BindBlend2D_Static) BLResult blPathAssignDeep(BLPathCore* self, const(BLPathCore)* other);
version(BindBlend2D_Static) BLResult blPathSetVertexAt(BLPathCore* self, size_t index, uint cmd, double x, double y);
version(BindBlend2D_Static) BLResult blPathMoveTo(BLPathCore* self, double x0, double y0);
version(BindBlend2D_Static) BLResult blPathLineTo(BLPathCore* self, double x1, double y1);
version(BindBlend2D_Static) BLResult blPathPolyTo(BLPathCore* self, const(BLPoint)* poly, size_t count);
version(BindBlend2D_Static) BLResult blPathQuadTo(BLPathCore* self, double x1, double y1, double x2, double y2);
version(BindBlend2D_Static) BLResult blPathCubicTo(BLPathCore* self, double x1, double y1, double x2, double y2, double x3, double y3);
version(BindBlend2D_Static) BLResult blPathSmoothQuadTo(BLPathCore* self, double x2, double y2);
version(BindBlend2D_Static) BLResult blPathSmoothCubicTo(BLPathCore* self, double x2, double y2, double x3, double y3);
version(BindBlend2D_Static) BLResult blPathArcTo(BLPathCore* self, double x, double y, double rx, double ry, double start, double sweep, bool forceMoveTo);
version(BindBlend2D_Static) BLResult blPathArcQuadrantTo(BLPathCore* self, double x1, double y1, double x2, double y2);
version(BindBlend2D_Static) BLResult blPathEllipticArcTo(BLPathCore* self, double rx, double ry, double xAxisRotation, bool largeArcFlag, bool sweepFlag, double x1, double y1);
version(BindBlend2D_Static) BLResult blPathClose(BLPathCore* self);
version(BindBlend2D_Static) BLResult blPathAddGeometry(BLPathCore* self, uint geometryType, const(void)* geometryData, const(BLMatrix2D)* m, uint dir);
version(BindBlend2D_Static) BLResult blPathAddBoxI(BLPathCore* self, const(BLBoxI)* box, uint dir);
version(BindBlend2D_Static) BLResult blPathAddBoxD(BLPathCore* self, const(BLBox)* box, uint dir);
version(BindBlend2D_Static) BLResult blPathAddRectI(BLPathCore* self, const(BLRectI)* rect, uint dir);
version(BindBlend2D_Static) BLResult blPathAddRectD(BLPathCore* self, const(BLRect)* rect, uint dir);
version(BindBlend2D_Static) BLResult blPathAddPath(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range);
version(BindBlend2D_Static) BLResult blPathAddTranslatedPath(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, const(BLPoint)* p);
version(BindBlend2D_Static) BLResult blPathAddTransformedPath(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, const(BLMatrix2D)* m);
version(BindBlend2D_Static) BLResult blPathAddReversedPath(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, uint reverseMode);
version(BindBlend2D_Static) BLResult blPathAddStrokedPath(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, const(BLStrokeOptionsCore)* options, const(BLApproximationOptions)* approx);
version(BindBlend2D_Static) BLResult blPathRemoveRange(BLPathCore* self, const(BLRange)* range);
version(BindBlend2D_Static) BLResult blPathTranslate(BLPathCore* self, const(BLRange)* range, const(BLPoint)* p);
version(BindBlend2D_Static) BLResult blPathTransform(BLPathCore* self, const(BLRange)* range, const(BLMatrix2D)* m);
version(BindBlend2D_Static) BLResult blPathFitTo(BLPathCore* self, const(BLRange)* range, const(BLRect)* rect, uint fitFlags);
version(BindBlend2D_Static) bool blPathEquals(const(BLPathCore)* a, const(BLPathCore)* b);
version(BindBlend2D_Static) BLResult blPathGetInfoFlags(const(BLPathCore)* self, uint* flagsOut);
version(BindBlend2D_Static) BLResult blPathGetControlBox(const(BLPathCore)* self, BLBox* boxOut);
version(BindBlend2D_Static) BLResult blPathGetBoundingBox(const(BLPathCore)* self, BLBox* boxOut);
version(BindBlend2D_Static) BLResult blPathGetFigureRange(const(BLPathCore)* self, size_t index, BLRange* rangeOut);
version(BindBlend2D_Static) BLResult blPathGetLastVertex(const(BLPathCore)* self, BLPoint* vtxOut);
version(BindBlend2D_Static) BLResult blPathGetClosestVertex(const(BLPathCore)* self, const(BLPoint)* p, double maxDistance, size_t* indexOut, double* distanceOut);
version(BindBlend2D_Static) uint blPathHitTest(const(BLPathCore)* self, const(BLPoint)* p, uint fillRule);

version(BindBlend2D_Static) BLResult blPatternInit(BLPatternCore* self);
version(BindBlend2D_Static) BLResult blPatternInitAs(BLPatternCore* self, const(BLImageCore)* image, const(BLRectI)* area, uint extendMode, const(BLMatrix2D)* m);
version(BindBlend2D_Static) BLResult blPatternDestroy(BLPatternCore* self);
version(BindBlend2D_Static) BLResult blPatternReset(BLPatternCore* self);
version(BindBlend2D_Static) BLResult blPatternAssignMove(BLPatternCore* self, BLPatternCore* other);
version(BindBlend2D_Static) BLResult blPatternAssignWeak(BLPatternCore* self, const(BLPatternCore)* other);
version(BindBlend2D_Static) BLResult blPatternAssignDeep(BLPatternCore* self, const(BLPatternCore)* other);
version(BindBlend2D_Static) BLResult blPatternCreate(BLPatternCore* self, const(BLImageCore)* image, const(BLRectI)* area, uint extendMode, const(BLMatrix2D)* m);
version(BindBlend2D_Static) BLResult blPatternSetImage(BLPatternCore* self, const(BLImageCore)* image, const(BLRectI)* area);
version(BindBlend2D_Static) BLResult blPatternSetArea(BLPatternCore* self, const(BLRectI)* area);
version(BindBlend2D_Static) BLResult blPatternSetExtendMode(BLPatternCore* self, uint extendMode);
version(BindBlend2D_Static) BLResult blPatternApplyMatrixOp(BLPatternCore* self, uint opType, const(void)* opData);
version(BindBlend2D_Static) bool blPatternEquals(const(BLPatternCore)* a, const(BLPatternCore)* b);

version(BindBlend2D_Static) BLResult blPixelConverterInit(BLPixelConverterCore* self);
version(BindBlend2D_Static) BLResult blPixelConverterInitWeak(BLPixelConverterCore* self, const(BLPixelConverterCore)* other);
version(BindBlend2D_Static) BLResult blPixelConverterDestroy(BLPixelConverterCore* self);
version(BindBlend2D_Static) BLResult blPixelConverterReset(BLPixelConverterCore* self);
version(BindBlend2D_Static) BLResult blPixelConverterAssign(BLPixelConverterCore* self, const(BLPixelConverterCore)* other);
version(BindBlend2D_Static) BLResult blPixelConverterCreate(BLPixelConverterCore* self, const(BLFormatInfo)* dstInfo, const(BLFormatInfo)* srcInfo, uint createFlags);

version(BindBlend2D_Static) BLResult blPixelConverterConvert(
    const(BLPixelConverterCore)* self,
    void* dstData,
    intptr_t dstStride,
    const(void)* srcData,
    intptr_t srcStride,
    uint w,
    uint h,
    const(BLPixelConverterOptions)* options);

version(BindBlend2D_Static) BLResult blRandomReset(BLRandom* self, ulong seed);
version(BindBlend2D_Static) uint blRandomNextUInt32(BLRandom* self);
version(BindBlend2D_Static) ulong blRandomNextUInt64(BLRandom* self);
version(BindBlend2D_Static) double blRandomNextDouble(BLRandom* self);

version(BindBlend2D_Static) BLResult blRegionInit(BLRegionCore* self);
version(BindBlend2D_Static) BLResult blRegionDestroy(BLRegionCore* self);
version(BindBlend2D_Static) BLResult blRegionReset(BLRegionCore* self);
version(BindBlend2D_Static) size_t blRegionGetSize(const(BLRegionCore)* self);
version(BindBlend2D_Static) size_t blRegionGetCapacity(const(BLRegionCore)* self);
version(BindBlend2D_Static) const(BLBoxI)* blRegionGetData(const(BLRegionCore)* self);
version(BindBlend2D_Static) BLResult blRegionClear(BLRegionCore* self);
version(BindBlend2D_Static) BLResult blRegionShrink(BLRegionCore* self);
version(BindBlend2D_Static) BLResult blRegionReserve(BLRegionCore* self, size_t n);
version(BindBlend2D_Static) BLResult blRegionAssignMove(BLRegionCore* self, BLRegionCore* other);
version(BindBlend2D_Static) BLResult blRegionAssignWeak(BLRegionCore* self, const(BLRegionCore)* other);
version(BindBlend2D_Static) BLResult blRegionAssignDeep(BLRegionCore* self, const(BLRegionCore)* other);
version(BindBlend2D_Static) BLResult blRegionAssignBoxI(BLRegionCore* self, const(BLBoxI)* src);
version(BindBlend2D_Static) BLResult blRegionAssignBoxIArray(BLRegionCore* self, const(BLBoxI)* data, size_t n);
version(BindBlend2D_Static) BLResult blRegionAssignRectI(BLRegionCore* self, const(BLRectI)* rect);
version(BindBlend2D_Static) BLResult blRegionAssignRectIArray(BLRegionCore* self, const(BLRectI)* data, size_t n);
version(BindBlend2D_Static) BLResult blRegionCombine(BLRegionCore* self, const(BLRegionCore)* a, const(BLRegionCore)* b, uint booleanOp);
version(BindBlend2D_Static) BLResult blRegionCombineRB(BLRegionCore* self, const(BLRegionCore)* a, const(BLBoxI)* b, uint booleanOp);
version(BindBlend2D_Static) BLResult blRegionCombineBR(BLRegionCore* self, const(BLBoxI)* a, const(BLRegionCore)* b, uint booleanOp);
version(BindBlend2D_Static) BLResult blRegionCombineBB(BLRegionCore* self, const(BLBoxI)* a, const(BLBoxI)* b, uint booleanOp);
version(BindBlend2D_Static) BLResult blRegionTranslate(BLRegionCore* self, const(BLRegionCore)* r, const(BLPointI)* pt);
version(BindBlend2D_Static) BLResult blRegionTranslateAndClip(BLRegionCore* self, const(BLRegionCore)* r, const(BLPointI)* pt, const(BLBoxI)* clipBox);
version(BindBlend2D_Static) BLResult blRegionIntersectAndClip(BLRegionCore* self, const(BLRegionCore)* a, const(BLRegionCore)* b, const(BLBoxI)* clipBox);
version(BindBlend2D_Static) bool blRegionEquals(const(BLRegionCore)* a, const(BLRegionCore)* b);
version(BindBlend2D_Static) uint blRegionGetType(const(BLRegionCore)* self);
version(BindBlend2D_Static) uint blRegionHitTest(const(BLRegionCore)* self, const(BLPointI)* pt);
version(BindBlend2D_Static) uint blRegionHitTestBoxI(const(BLRegionCore)* self, const(BLBoxI)* box);

version(BindBlend2D_Static) BLResult blRuntimeInit();
version(BindBlend2D_Static) BLResult blRuntimeShutdown();
version(BindBlend2D_Static) BLResult blRuntimeCleanup(uint cleanupFlags);
version(BindBlend2D_Static) BLResult blRuntimeQueryInfo(uint infoType, void* infoOut);
version(BindBlend2D_Static) BLResult blRuntimeMessageOut(const(char)* msg);
version(BindBlend2D_Static) BLResult blRuntimeMessageFmt(const(char)* fmt, ...);
version(BindBlend2D_Static) BLResult blRuntimeMessageVFmt(const(char)* fmt, va_list ap);

version(BindBlend2D_Static) void blRuntimeAssertionFailure(const(char)* file, int line, const(char)* msg);

//BLResult blResultFromWinError(uint e);

version(BindBlend2D_Static) BLResult blStringInit(BLStringCore* self);
version(BindBlend2D_Static) BLResult blStringInitWithData(BLStringCore* self, const(char)* str, size_t size);
version(BindBlend2D_Static) BLResult blStringDestroy(BLStringCore* self);
version(BindBlend2D_Static) BLResult blStringReset(BLStringCore* self);
version(BindBlend2D_Static) size_t blStringGetSize(const(BLStringCore)* self);
version(BindBlend2D_Static) size_t blStringGetCapacity(const(BLStringCore)* self);
version(BindBlend2D_Static) const(char)* blStringGetData(const(BLStringCore)* self);
version(BindBlend2D_Static) BLResult blStringClear(BLStringCore* self);
version(BindBlend2D_Static) BLResult blStringShrink(BLStringCore* self);
version(BindBlend2D_Static) BLResult blStringReserve(BLStringCore* self, size_t n);
version(BindBlend2D_Static) BLResult blStringResize(BLStringCore* self, size_t n, char fill);
version(BindBlend2D_Static) BLResult blStringMakeMutable(BLStringCore* self, char** dataOut);
version(BindBlend2D_Static) BLResult blStringModifyOp(BLStringCore* self, uint op, size_t n, char** dataOut);
version(BindBlend2D_Static) BLResult blStringInsertOp(BLStringCore* self, size_t index, size_t n, char** dataOut);
version(BindBlend2D_Static) BLResult blStringAssignMove(BLStringCore* self, BLStringCore* other);
version(BindBlend2D_Static) BLResult blStringAssignWeak(BLStringCore* self, const(BLStringCore)* other);
version(BindBlend2D_Static) BLResult blStringAssignDeep(BLStringCore* self, const(BLStringCore)* other);
version(BindBlend2D_Static) BLResult blStringAssignData(BLStringCore* self, const(char)* str, size_t n);
version(BindBlend2D_Static) BLResult blStringApplyOpChar(BLStringCore* self, uint op, char c, size_t n);
version(BindBlend2D_Static) BLResult blStringApplyOpData(BLStringCore* self, uint op, const(char)* str, size_t n);
version(BindBlend2D_Static) BLResult blStringApplyOpString(BLStringCore* self, uint op, const(BLStringCore)* other);
version(BindBlend2D_Static) BLResult blStringApplyOpFormat(BLStringCore* self, uint op, const(char)* fmt, ...);
version(BindBlend2D_Static) BLResult blStringApplyOpFormatV(BLStringCore* self, uint op, const(char)* fmt, va_list ap);
version(BindBlend2D_Static) BLResult blStringInsertChar(BLStringCore* self, size_t index, char c, size_t n);
version(BindBlend2D_Static) BLResult blStringInsertData(BLStringCore* self, size_t index, const(char)* str, size_t n);
version(BindBlend2D_Static) BLResult blStringInsertString(BLStringCore* self, size_t index, const(BLStringCore)* other);
version(BindBlend2D_Static) BLResult blStringRemoveRange(BLStringCore* self, size_t rStart, size_t rEnd);
version(BindBlend2D_Static) bool blStringEquals(const(BLStringCore)* self, const(BLStringCore)* other);
version(BindBlend2D_Static) bool blStringEqualsData(const(BLStringCore)* self, const(char)* str, size_t n);
version(BindBlend2D_Static) int blStringCompare(const(BLStringCore)* self, const(BLStringCore)* other);
version(BindBlend2D_Static) int blStringCompareData(const(BLStringCore)* self, const(char)* str, size_t n);

version(BindBlend2D_Static) BLResult blStrokeOptionsInit(BLStrokeOptionsCore* self);
version(BindBlend2D_Static) BLResult blStrokeOptionsInitMove(BLStrokeOptionsCore* self, BLStrokeOptionsCore* other);
version(BindBlend2D_Static) BLResult blStrokeOptionsInitWeak(BLStrokeOptionsCore* self, const(BLStrokeOptionsCore)* other);
version(BindBlend2D_Static) BLResult blStrokeOptionsDestroy(BLStrokeOptionsCore* self);
version(BindBlend2D_Static) BLResult blStrokeOptionsReset(BLStrokeOptionsCore* self);
version(BindBlend2D_Static) BLResult blStrokeOptionsAssignMove(BLStrokeOptionsCore* self, BLStrokeOptionsCore* other);
version(BindBlend2D_Static) BLResult blStrokeOptionsAssignWeak(BLStrokeOptionsCore* self, const(BLStrokeOptionsCore)* other);

version(BindBlend2D_Static) BLResult blStyleInit(BLStyleCore* self);
version(BindBlend2D_Static) BLResult blStyleInitMove(BLStyleCore* self, BLStyleCore* other);
version(BindBlend2D_Static) BLResult blStyleInitWeak(BLStyleCore* self, const(BLStyleCore)* other);
version(BindBlend2D_Static) BLResult blStyleInitRgba(BLStyleCore* self, const(BLRgba)* rgba);
version(BindBlend2D_Static) BLResult blStyleInitRgba32(BLStyleCore* self, uint rgba32);
version(BindBlend2D_Static) BLResult blStyleInitRgba64(BLStyleCore* self, ulong rgba64);
version(BindBlend2D_Static) BLResult blStyleInitObject(BLStyleCore* self, const(void)* object);
version(BindBlend2D_Static) BLResult blStyleDestroy(BLStyleCore* self);
version(BindBlend2D_Static) BLResult blStyleReset(BLStyleCore* self);
version(BindBlend2D_Static) BLResult blStyleAssignMove(BLStyleCore* self, BLStyleCore* other);
version(BindBlend2D_Static) BLResult blStyleAssignWeak(BLStyleCore* self, const(BLStyleCore)* other);
version(BindBlend2D_Static) BLResult blStyleAssignRgba(BLStyleCore* self, const(BLRgba)* rgba);
version(BindBlend2D_Static) BLResult blStyleAssignRgba32(BLStyleCore* self, uint rgba32);
version(BindBlend2D_Static) BLResult blStyleAssignRgba64(BLStyleCore* self, ulong rgba64);
version(BindBlend2D_Static) BLResult blStyleAssignObject(BLStyleCore* self, const(void)* object);
version(BindBlend2D_Static) uint blStyleGetType(const(BLStyleCore)* self);
version(BindBlend2D_Static) BLResult blStyleGetRgba(const(BLStyleCore)* self, BLRgba* rgbaOut);
version(BindBlend2D_Static) BLResult blStyleGetRgba32(const(BLStyleCore)* self, uint* rgba32Out);
version(BindBlend2D_Static) BLResult blStyleGetRgba64(const(BLStyleCore)* self, ulong* rgba64Out);
version(BindBlend2D_Static) BLResult blStyleGetObject(const(BLStyleCore)* self, void* object);
version(BindBlend2D_Static) bool blStyleEquals(const(BLStyleCore)* a, const(BLStyleCore)* b);

version(BindBlend2D_Static) BLResult blVariantInit(void* self);
version(BindBlend2D_Static) BLResult blVariantInitMove(void* self, void* other);
version(BindBlend2D_Static) BLResult blVariantInitWeak(void* self, const(void)* other);
version(BindBlend2D_Static) BLResult blVariantDestroy(void* self);
version(BindBlend2D_Static) BLResult blVariantReset(void* self);
version(BindBlend2D_Static) uint blVariantGetImplType(const(void)* self);
version(BindBlend2D_Static) BLResult blVariantAssignMove(void* self, void* other);
version(BindBlend2D_Static) BLResult blVariantAssignWeak(void* self, const(void)* other);
version(BindBlend2D_Static) bool blVariantEquals(const(void)* a, const(void)* b);

version(BindBlend2D_Static) version(Windows) BLResult blResultFromWinError(uint e);
version(BindBlend2D_Static) version(Posix) BLResult blResultFromPosixError(int e);

//****** array.d ******//

extern (C):

struct BLArrayImpl
{
    size_t capacity;

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    ubyte itemSize;

    ubyte dispatchType;

    ubyte[2] reserved;

    union
    {
        struct
        {
            void* data;

            size_t size;
        }

        BLDataView view;
    }
}

struct BLArrayCore
{
    BLArrayImpl* impl;
}

//****** bitarray.d ******//

extern (C):


//****** context.d ******//

extern (C):

enum BLContextType
{
    BL_CONTEXT_TYPE_NONE = 0,

    BL_CONTEXT_TYPE_DUMMY = 1,

    BL_CONTEXT_TYPE_RASTER = 3,

    BL_CONTEXT_TYPE_COUNT = 4
}

enum BLContextHint
{
    BL_CONTEXT_HINT_RENDERING_QUALITY = 0,

    BL_CONTEXT_HINT_GRADIENT_QUALITY = 1,

    BL_CONTEXT_HINT_PATTERN_QUALITY = 2,

    BL_CONTEXT_HINT_COUNT = 8
}

enum BLContextOpType
{
    BL_CONTEXT_OP_TYPE_FILL = 0,

    BL_CONTEXT_OP_TYPE_STROKE = 1,

    BL_CONTEXT_OP_TYPE_COUNT = 2
}

enum BLContextFlushFlags
{
    BL_CONTEXT_FLUSH_SYNC = 0x80000000u
}

enum BLContextCreateFlags
{
    BL_CONTEXT_CREATE_FLAG_FALLBACK_TO_SYNC = 0x00000008u,

    BL_CONTEXT_CREATE_FLAG_ISOLATED_THREAD_POOL = 0x01000000u,

    BL_CONTEXT_CREATE_FLAG_ISOLATED_JIT_RUNTIME = 0x02000000u,

    BL_CONTEXT_CREATE_FLAG_ISOLATED_JIT_LOGGING = 0x04000000u,

    BL_CONTEXT_CREATE_FLAG_OVERRIDE_CPU_FEATURES = 0x08000000u
}

enum BLContextProperty
{
    BL_CONTEXT_PROPERTY_THREAD_COUNT = 0,

    BL_CONTEXT_PROPERTY_ACCUMULATED_ERROR_FLAGS = 10
}

enum BLContextErrorFlags
{
    BL_CONTEXT_ERROR_FLAG_INVALID_VALUE = 0x00000001u,

    BL_CONTEXT_ERROR_FLAG_INVALID_STATE = 0x00000002u,

    BL_CONTEXT_ERROR_FLAG_INVALID_GEOMETRY = 0x00000004u,

    BL_CONTEXT_ERROR_FLAG_INVALID_GLYPH = 0x00000008u,

    BL_CONTEXT_ERROR_FLAG_INVALID_FONT = 0x00000010u,

    BL_CONTEXT_ERROR_FLAG_THREAD_POOL_EXHAUSTED = 0x20000000u,

    BL_CONTEXT_ERROR_FLAG_OUT_OF_MEMORY = 0x40000000u,

    BL_CONTEXT_ERROR_FLAG_UNKNOWN_ERROR = 0x80000000u
}

enum BLClipMode
{
    BL_CLIP_MODE_ALIGNED_RECT = 0,

    BL_CLIP_MODE_UNALIGNED_RECT = 1,

    BL_CLIP_MODE_MASK = 2,

    BL_CLIP_MODE_COUNT = 3
}

enum BLCompOp
{
    BL_COMP_OP_SRC_OVER = 0,

    BL_COMP_OP_SRC_COPY = 1,

    BL_COMP_OP_SRC_IN = 2,

    BL_COMP_OP_SRC_OUT = 3,

    BL_COMP_OP_SRC_ATOP = 4,

    BL_COMP_OP_DST_OVER = 5,

    BL_COMP_OP_DST_COPY = 6,

    BL_COMP_OP_DST_IN = 7,

    BL_COMP_OP_DST_OUT = 8,

    BL_COMP_OP_DST_ATOP = 9,

    BL_COMP_OP_XOR = 10,

    BL_COMP_OP_CLEAR = 11,

    BL_COMP_OP_PLUS = 12,

    BL_COMP_OP_MINUS = 13,

    BL_COMP_OP_MODULATE = 14,

    BL_COMP_OP_MULTIPLY = 15,

    BL_COMP_OP_SCREEN = 16,

    BL_COMP_OP_OVERLAY = 17,

    BL_COMP_OP_DARKEN = 18,

    BL_COMP_OP_LIGHTEN = 19,

    BL_COMP_OP_COLOR_DODGE = 20,

    BL_COMP_OP_COLOR_BURN = 21,

    BL_COMP_OP_LINEAR_BURN = 22,

    BL_COMP_OP_LINEAR_LIGHT = 23,

    BL_COMP_OP_PIN_LIGHT = 24,

    BL_COMP_OP_HARD_LIGHT = 25,

    BL_COMP_OP_SOFT_LIGHT = 26,

    BL_COMP_OP_DIFFERENCE = 27,

    BL_COMP_OP_EXCLUSION = 28,

    BL_COMP_OP_COUNT = 29
}

enum BLGradientQuality
{
    BL_GRADIENT_QUALITY_NEAREST = 0,

    BL_GRADIENT_QUALITY_COUNT = 1
}

enum BLPatternQuality
{
    BL_PATTERN_QUALITY_NEAREST = 0,

    BL_PATTERN_QUALITY_BILINEAR = 1,

    BL_PATTERN_QUALITY_COUNT = 2
}

enum BLRenderingQuality
{
    BL_RENDERING_QUALITY_ANTIALIAS = 0,

    BL_RENDERING_QUALITY_COUNT = 1
}

struct BLContextCreateInfo
{
    uint flags;

    uint threadCount;

    uint cpuFeatures;

    uint commandQueueLimit;

    uint[4] reserved;
}

struct BLContextCookie
{
    ulong[2] data;
}

struct BLContextHints
{
    union
    {
        struct
        {
            ubyte renderingQuality;
            ubyte gradientQuality;
            ubyte patternQuality;
        }

        ubyte[BL_CONTEXT_HINT_COUNT] hints;
    }
}

struct BLContextState
{
    BLImageCore* targetImage;

    BLSize targetSize;

    BLContextHints hints;

    ubyte compOp;

    ubyte fillRule;

    ubyte[2] styleType;

    ubyte[4] reserved;

    BLApproximationOptions approximationOptions;

    double globalAlpha;

    double[2] styleAlpha;

    BLStrokeOptionsCore strokeOptions;

    BLMatrix2D metaMatrix;

    BLMatrix2D userMatrix;

    size_t savedStateCount;
}

struct BLContextVirt
{
    BLResult function(BLContextImpl* impl) destroy;
    BLResult function(BLContextImpl* impl, uint flags) flush;

    BLResult function(const(BLContextImpl)* impl, uint propertyId, void* valueOut) queryProperty;

    BLResult function(BLContextImpl* impl, BLContextCookie* cookie) save;
    BLResult function(BLContextImpl* impl, const(BLContextCookie)* cookie) restore;

    BLResult function(BLContextImpl* impl, uint opType, const(void)* opData) matrixOp;
    BLResult function(BLContextImpl* impl) userToMeta;

    BLResult function(BLContextImpl* impl, uint hintType, uint value) setHint;
    BLResult function(BLContextImpl* impl, const(BLContextHints)* hints) setHints;
    BLResult function(BLContextImpl* impl, uint mode) setFlattenMode;
    BLResult function(BLContextImpl* impl, double tolerance) setFlattenTolerance;
    BLResult function(BLContextImpl* impl, const(BLApproximationOptions)* options) setApproximationOptions;

    BLResult function(BLContextImpl* impl, uint compOp) setCompOp;
    BLResult function(BLContextImpl* impl, double alpha) setGlobalAlpha;

    BLResult function(BLContextImpl* impl, double alpha)[2] setStyleAlpha;
    BLResult function(const(BLContextImpl)* impl, BLStyleCore* out_)[2] getStyle;
    BLResult function(BLContextImpl* impl, const(BLStyleCore)* style)[2] setStyle;
    BLResult function(BLContextImpl* impl, const(BLRgba)* rgba)[2] setStyleRgba;
    BLResult function(BLContextImpl* impl, uint rgba32)[2] setStyleRgba32;
    BLResult function(BLContextImpl* impl, ulong rgba64)[2] setStyleRgba64;
    BLResult function(BLContextImpl* impl, const(void)* object)[2] setStyleObject;

    BLResult function(BLContextImpl* impl, uint fillRule) setFillRule;

    BLResult function(BLContextImpl* impl, double width) setStrokeWidth;
    BLResult function(BLContextImpl* impl, double miterLimit) setStrokeMiterLimit;
    BLResult function(BLContextImpl* impl, uint position, uint strokeCap) setStrokeCap;
    BLResult function(BLContextImpl* impl, uint strokeCap) setStrokeCaps;
    BLResult function(BLContextImpl* impl, uint strokeJoin) setStrokeJoin;
    BLResult function(BLContextImpl* impl, double dashOffset) setStrokeDashOffset;
    BLResult function(BLContextImpl* impl, const(BLArrayCore)* dashArray) setStrokeDashArray;
    BLResult function(BLContextImpl* impl, uint transformOrder) setStrokeTransformOrder;
    BLResult function(BLContextImpl* impl, const(BLStrokeOptionsCore)* options) setStrokeOptions;

    BLResult function(BLContextImpl* impl, const(BLRectI)* rect) clipToRectI;
    BLResult function(BLContextImpl* impl, const(BLRect)* rect) clipToRectD;
    BLResult function(BLContextImpl* impl) restoreClipping;

    BLResult function(BLContextImpl* impl) clearAll;
    BLResult function(BLContextImpl* impl, const(BLRectI)* rect) clearRectI;
    BLResult function(BLContextImpl* impl, const(BLRect)* rect) clearRectD;

    BLResult function(BLContextImpl* impl) fillAll;
    BLResult function(BLContextImpl* impl, const(BLRectI)* rect) fillRectI;
    BLResult function(BLContextImpl* impl, const(BLRect)* rect) fillRectD;
    BLResult function(BLContextImpl* impl, const(BLPathCore)* path) fillPathD;
    BLResult function(BLContextImpl* impl, uint geometryType, const(void)* geometryData) fillGeometry;
    BLResult function(BLContextImpl* impl, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding) fillTextI;
    BLResult function(BLContextImpl* impl, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding) fillTextD;
    BLResult function(BLContextImpl* impl, const(BLPointI)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun) fillGlyphRunI;
    BLResult function(BLContextImpl* impl, const(BLPoint)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun) fillGlyphRunD;

    BLResult function(BLContextImpl* impl, const(BLRectI)* rect) strokeRectI;
    BLResult function(BLContextImpl* impl, const(BLRect)* rect) strokeRectD;
    BLResult function(BLContextImpl* impl, const(BLPathCore)* path) strokePathD;
    BLResult function(BLContextImpl* impl, uint geometryType, const(void)* geometryData) strokeGeometry;
    BLResult function(BLContextImpl* impl, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding) strokeTextI;
    BLResult function(BLContextImpl* impl, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding) strokeTextD;
    BLResult function(BLContextImpl* impl, const(BLPointI)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun) strokeGlyphRunI;
    BLResult function(BLContextImpl* impl, const(BLPoint)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun) strokeGlyphRunD;

    BLResult function(BLContextImpl* impl, const(BLPointI)* pt, const(BLImageCore)* img, const(BLRectI)* imgArea) blitImageI;
    BLResult function(BLContextImpl* impl, const(BLPoint)* pt, const(BLImageCore)* img, const(BLRectI)* imgArea) blitImageD;
    BLResult function(BLContextImpl* impl, const(BLRectI)* rect, const(BLImageCore)* img, const(BLRectI)* imgArea) blitScaledImageI;
    BLResult function(BLContextImpl* impl, const(BLRect)* rect, const(BLImageCore)* img, const(BLRectI)* imgArea) blitScaledImageD;
}

struct BLContextImpl
{
    const(BLContextVirt)* virt;

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    uint contextType;

    const(BLContextState)* state;
}

struct BLContextCore
{
    BLContextImpl* impl;
}

//****** filesystem.d ******//

import core.stdc.string;

extern (C):

enum BLFileOpenFlags
{
    BL_FILE_OPEN_READ = 0x00000001u,

    BL_FILE_OPEN_WRITE = 0x00000002u,

    BL_FILE_OPEN_RW = 0x00000003u,

    BL_FILE_OPEN_CREATE = 0x00000004u,

    BL_FILE_OPEN_DELETE = 0x00000008u,

    BL_FILE_OPEN_TRUNCATE = 0x00000010u,

    BL_FILE_OPEN_READ_EXCLUSIVE = 0x10000000u,

    BL_FILE_OPEN_WRITE_EXCLUSIVE = 0x20000000u,

    BL_FILE_OPEN_RW_EXCLUSIVE = 0x30000000u,

    BL_FILE_OPEN_CREATE_EXCLUSIVE = 0x40000000u,

    BL_FILE_OPEN_DELETE_EXCLUSIVE = 0x80000000u
}

enum BLFileSeekType
{
    BL_FILE_SEEK_SET = 0,

    BL_FILE_SEEK_CUR = 1,

    BL_FILE_SEEK_END = 2,

    BL_FILE_SEEK_COUNT = 3
}

enum BLFileReadFlags
{
    BL_FILE_READ_MMAP_ENABLED = 0x00000001u,

    BL_FILE_READ_MMAP_AVOID_SMALL = 0x00000002u,

    BL_FILE_READ_MMAP_NO_FALLBACK = 0x00000008u
}

struct BLFileCore
{
    intptr_t handle;
}

//****** font.d ******//

extern (C):

struct BLFontDataVirt
{
    BLResult function(BLFontDataImpl* impl) destroy;
    BLResult function(const(BLFontDataImpl)* impl, uint faceIndex, BLArrayCore* out_) listTags;
    size_t function(const(BLFontDataImpl)* impl, uint faceIndex, BLFontTable* dst, const(BLTag)* tags, size_t n) queryTables;
}

struct BLFontDataImpl
{
    const(BLFontDataVirt)* virt;

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    ubyte faceType;

    ubyte[3] reserved;

    uint faceCount;

    uint flags;
}

struct BLFontDataCore
{
    BLFontDataImpl* impl;
}

struct BLFontFaceVirt
{
    BLResult function(BLFontFaceImpl* impl) destroy;
}

struct BLFontFaceImpl
{
    const(BLFontFaceVirt)* virt;

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    ushort weight;

    ubyte stretch;

    ubyte style;

    BLFontFaceInfo faceInfo;

    BLUniqueId uniqueId;

    BLFontDataCore data;

    BLStringCore fullName;

    BLStringCore familyName;

    BLStringCore subfamilyName;

    BLStringCore postScriptName;

    BLFontDesignMetrics designMetrics;

    BLFontUnicodeCoverage unicodeCoverage;

    BLFontPanose panose;
}

struct BLFontFaceCore
{
    BLFontFaceImpl* impl;
}

struct BLFontImpl
{
    BLFontFaceCore face;

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    ushort weight;

    ubyte stretch;

    ubyte style;

    BLArrayCore features;

    BLArrayCore variations;

    BLFontMetrics metrics;

    BLFontMatrix matrix;
}

struct BLFontCore
{
    BLFontImpl* impl;
}

//****** fontdefs.d ******//

extern (C):

enum BLGlyphPlacementType
{
    BL_GLYPH_PLACEMENT_TYPE_NONE = 0,

    BL_GLYPH_PLACEMENT_TYPE_ADVANCE_OFFSET = 1,

    BL_GLYPH_PLACEMENT_TYPE_DESIGN_UNITS = 2,

    BL_GLYPH_PLACEMENT_TYPE_USER_UNITS = 3,

    BL_GLYPH_PLACEMENT_TYPE_ABSOLUTE_UNITS = 4
}

enum BLGlyphRunFlags
{
    BL_GLYPH_RUN_FLAG_UCS4_CONTENT = 0x10000000u,

    BL_GLYPH_RUN_FLAG_INVALID_TEXT = 0x20000000u,

    BL_GLYPH_RUN_FLAG_UNDEFINED_GLYPHS = 0x40000000u,

    BL_GLYPH_RUN_FLAG_INVALID_FONT_DATA = 0x80000000u
}

enum BLFontDataFlags
{
    BL_FONT_DATA_FLAG_COLLECTION = 0x00000001u
}

enum BLFontFaceType
{
    BL_FONT_FACE_TYPE_NONE = 0,

    BL_FONT_FACE_TYPE_OPENTYPE = 1,

    BL_FONT_FACE_TYPE_COUNT = 2
}

enum BLFontFaceFlags
{
    BL_FONT_FACE_FLAG_TYPOGRAPHIC_NAMES = 0x00000001u,

    BL_FONT_FACE_FLAG_TYPOGRAPHIC_METRICS = 0x00000002u,

    BL_FONT_FACE_FLAG_CHAR_TO_GLYPH_MAPPING = 0x00000004u,

    BL_FONT_FACE_FLAG_HORIZONTAL_METIRCS = 0x00000010u,

    BL_FONT_FACE_FLAG_VERTICAL_METRICS = 0x00000020u,

    BL_FONT_FACE_FLAG_HORIZONTAL_KERNING = 0x00000040u,

    BL_FONT_FACE_FLAG_VERTICAL_KERNING = 0x00000080u,

    BL_FONT_FACE_FLAG_OPENTYPE_FEATURES = 0x00000100u,

    BL_FONT_FACE_FLAG_PANOSE_DATA = 0x00000200u,

    BL_FONT_FACE_FLAG_UNICODE_COVERAGE = 0x00000400u,

    BL_FONT_FACE_FLAG_BASELINE_Y_EQUALS_0 = 0x00001000u,

    BL_FONT_FACE_FLAG_LSB_POINT_X_EQUALS_0 = 0x00002000u,

    BL_FONT_FACE_FLAG_VARIATION_SEQUENCES = 0x10000000u,

    BL_FONT_FACE_FLAG_OPENTYPE_VARIATIONS = 0x20000000u,

    BL_FONT_FACE_FLAG_SYMBOL_FONT = 0x40000000u,

    BL_FONT_FACE_FLAG_LAST_RESORT_FONT = 0x80000000u
}

enum BLFontFaceDiagFlags
{
    BL_FONT_FACE_DIAG_WRONG_NAME_DATA = 0x00000001u,

    BL_FONT_FACE_DIAG_FIXED_NAME_DATA = 0x00000002u,

    BL_FONT_FACE_DIAG_WRONG_KERN_DATA = 0x00000004u,

    BL_FONT_FACE_DIAG_FIXED_KERN_DATA = 0x00000008u,

    BL_FONT_FACE_DIAG_WRONG_CMAP_DATA = 0x00000010u,

    BL_FONT_FACE_DIAG_WRONG_CMAP_FORMAT = 0x00000020u,

    BL_FONT_FACE_DIAG_WRONG_GDEF_DATA = 0x00000100u,

    BL_FONT_FACE_DIAG_WRONG_GPOS_DATA = 0x00000400u,

    BL_FONT_FACE_DIAG_WRONG_GSUB_DATA = 0x00001000u
}

enum BLFontOutlineType
{
    BL_FONT_OUTLINE_TYPE_NONE = 0,

    BL_FONT_OUTLINE_TYPE_TRUETYPE = 1,

    BL_FONT_OUTLINE_TYPE_CFF = 2,

    BL_FONT_OUTLINE_TYPE_CFF2 = 3
}

enum BLFontStretch
{
    BL_FONT_STRETCH_ULTRA_CONDENSED = 1,

    BL_FONT_STRETCH_EXTRA_CONDENSED = 2,

    BL_FONT_STRETCH_CONDENSED = 3,

    BL_FONT_STRETCH_SEMI_CONDENSED = 4,

    BL_FONT_STRETCH_NORMAL = 5,

    BL_FONT_STRETCH_SEMI_EXPANDED = 6,

    BL_FONT_STRETCH_EXPANDED = 7,

    BL_FONT_STRETCH_EXTRA_EXPANDED = 8,

    BL_FONT_STRETCH_ULTRA_EXPANDED = 9
}

enum BLFontStyle
{
    BL_FONT_STYLE_NORMAL = 0,

    BL_FONT_STYLE_OBLIQUE = 1,

    BL_FONT_STYLE_ITALIC = 2,

    BL_FONT_STYLE_COUNT = 3
}

enum BLFontWeight
{
    BL_FONT_WEIGHT_THIN = 100,

    BL_FONT_WEIGHT_EXTRA_LIGHT = 200,

    BL_FONT_WEIGHT_LIGHT = 300,

    BL_FONT_WEIGHT_SEMI_LIGHT = 350,

    BL_FONT_WEIGHT_NORMAL = 400,

    BL_FONT_WEIGHT_MEDIUM = 500,

    BL_FONT_WEIGHT_SEMI_BOLD = 600,

    BL_FONT_WEIGHT_BOLD = 700,

    BL_FONT_WEIGHT_EXTRA_BOLD = 800,

    BL_FONT_WEIGHT_BLACK = 900,

    BL_FONT_WEIGHT_EXTRA_BLACK = 950
}

enum BLFontStringId
{
    BL_FONT_STRING_COPYRIGHT_NOTICE = 0,

    BL_FONT_STRING_FAMILY_NAME = 1,

    BL_FONT_STRING_SUBFAMILY_NAME = 2,

    BL_FONT_STRING_UNIQUE_IDENTIFIER = 3,

    BL_FONT_STRING_FULL_NAME = 4,

    BL_FONT_STRING_VERSION_STRING = 5,

    BL_FONT_STRING_POST_SCRIPT_NAME = 6,

    BL_FONT_STRING_TRADEMARK = 7,

    BL_FONT_STRING_MANUFACTURER_NAME = 8,

    BL_FONT_STRING_DESIGNER_NAME = 9,

    BL_FONT_STRING_DESCRIPTION = 10,

    BL_FONT_STRING_VENDOR_URL = 11,

    BL_FONT_STRING_DESIGNER_URL = 12,

    BL_FONT_STRING_LICENSE_DESCRIPTION = 13,

    BL_FONT_STRING_LICENSE_INFO_URL = 14,

    BL_FONT_STRING_RESERVED = 15,

    BL_FONT_STRING_TYPOGRAPHIC_FAMILY_NAME = 16,

    BL_FONT_STRING_TYPOGRAPHIC_SUBFAMILY_NAME = 17,

    BL_FONT_STRING_COMPATIBLE_FULL_NAME = 18,

    BL_FONT_STRING_SAMPLE_TEXT = 19,

    BL_FONT_STRING_POST_SCRIPT_CID_NAME = 20,

    BL_FONT_STRING_WWS_FAMILY_NAME = 21,

    BL_FONT_STRING_WWS_SUBFAMILY_NAME = 22,

    BL_FONT_STRING_LIGHT_BACKGROUND_PALETTE = 23,

    BL_FONT_STRING_DARK_BACKGROUND_PALETTE = 24,

    BL_FONT_STRING_VARIATIONS_POST_SCRIPT_PREFIX = 25,

    BL_FONT_STRING_COMMON_COUNT = 26,

    BL_FONT_STRING_CUSTOM_START_INDEX = 255
}

enum BLFontUnicodeCoverageIndex
{
    BL_FONT_UC_INDEX_BASIC_LATIN = 0,
    BL_FONT_UC_INDEX_LATIN1_SUPPLEMENT = 1,
    BL_FONT_UC_INDEX_LATIN_EXTENDED_A = 2,
    BL_FONT_UC_INDEX_LATIN_EXTENDED_B = 3,
    BL_FONT_UC_INDEX_IPA_EXTENSIONS = 4,

    BL_FONT_UC_INDEX_SPACING_MODIFIER_LETTERS = 5,

    BL_FONT_UC_INDEX_COMBINING_DIACRITICAL_MARKS = 6,
    BL_FONT_UC_INDEX_GREEK_AND_COPTIC = 7,
    BL_FONT_UC_INDEX_COPTIC = 8,
    BL_FONT_UC_INDEX_CYRILLIC = 9,

    BL_FONT_UC_INDEX_ARMENIAN = 10,
    BL_FONT_UC_INDEX_HEBREW = 11,
    BL_FONT_UC_INDEX_VAI = 12,
    BL_FONT_UC_INDEX_ARABIC = 13,

    BL_FONT_UC_INDEX_NKO = 14,
    BL_FONT_UC_INDEX_DEVANAGARI = 15,
    BL_FONT_UC_INDEX_BENGALI = 16,
    BL_FONT_UC_INDEX_GURMUKHI = 17,
    BL_FONT_UC_INDEX_GUJARATI = 18,
    BL_FONT_UC_INDEX_ORIYA = 19,
    BL_FONT_UC_INDEX_TAMIL = 20,
    BL_FONT_UC_INDEX_TELUGU = 21,
    BL_FONT_UC_INDEX_KANNADA = 22,
    BL_FONT_UC_INDEX_MALAYALAM = 23,
    BL_FONT_UC_INDEX_THAI = 24,
    BL_FONT_UC_INDEX_LAO = 25,
    BL_FONT_UC_INDEX_GEORGIAN = 26,

    BL_FONT_UC_INDEX_BALINESE = 27,
    BL_FONT_UC_INDEX_HANGUL_JAMO = 28,
    BL_FONT_UC_INDEX_LATIN_EXTENDED_ADDITIONAL = 29,

    BL_FONT_UC_INDEX_GREEK_EXTENDED = 30,
    BL_FONT_UC_INDEX_GENERAL_PUNCTUATION = 31,

    BL_FONT_UC_INDEX_SUPERSCRIPTS_AND_SUBSCRIPTS = 32,
    BL_FONT_UC_INDEX_CURRENCY_SYMBOLS = 33,
    BL_FONT_UC_INDEX_COMBINING_DIACRITICAL_MARKS_FOR_SYMBOLS = 34,
    BL_FONT_UC_INDEX_LETTERLIKE_SYMBOLS = 35,
    BL_FONT_UC_INDEX_NUMBER_FORMS = 36,
    BL_FONT_UC_INDEX_ARROWS = 37,

    BL_FONT_UC_INDEX_MATHEMATICAL_OPERATORS = 38,

    BL_FONT_UC_INDEX_MISCELLANEOUS_TECHNICAL = 39,
    BL_FONT_UC_INDEX_CONTROL_PICTURES = 40,
    BL_FONT_UC_INDEX_OPTICAL_CHARACTER_RECOGNITION = 41,
    BL_FONT_UC_INDEX_ENCLOSED_ALPHANUMERICS = 42,
    BL_FONT_UC_INDEX_BOX_DRAWING = 43,
    BL_FONT_UC_INDEX_BLOCK_ELEMENTS = 44,
    BL_FONT_UC_INDEX_GEOMETRIC_SHAPES = 45,
    BL_FONT_UC_INDEX_MISCELLANEOUS_SYMBOLS = 46,
    BL_FONT_UC_INDEX_DINGBATS = 47,
    BL_FONT_UC_INDEX_CJK_SYMBOLS_AND_PUNCTUATION = 48,
    BL_FONT_UC_INDEX_HIRAGANA = 49,
    BL_FONT_UC_INDEX_KATAKANA = 50,

    BL_FONT_UC_INDEX_BOPOMOFO = 51,

    BL_FONT_UC_INDEX_HANGUL_COMPATIBILITY_JAMO = 52,
    BL_FONT_UC_INDEX_PHAGS_PA = 53,
    BL_FONT_UC_INDEX_ENCLOSED_CJK_LETTERS_AND_MONTHS = 54,
    BL_FONT_UC_INDEX_CJK_COMPATIBILITY = 55,
    BL_FONT_UC_INDEX_HANGUL_SYLLABLES = 56,
    BL_FONT_UC_INDEX_NON_PLANE = 57,
    BL_FONT_UC_INDEX_PHOENICIAN = 58,
    BL_FONT_UC_INDEX_CJK_UNIFIED_IDEOGRAPHS = 59,

    BL_FONT_UC_INDEX_PRIVATE_USE_PLANE0 = 60,
    BL_FONT_UC_INDEX_CJK_STROKES = 61,

    BL_FONT_UC_INDEX_ALPHABETIC_PRESENTATION_FORMS = 62,
    BL_FONT_UC_INDEX_ARABIC_PRESENTATION_FORMS_A = 63,
    BL_FONT_UC_INDEX_COMBINING_HALF_MARKS = 64,
    BL_FONT_UC_INDEX_VERTICAL_FORMS = 65,

    BL_FONT_UC_INDEX_SMALL_FORM_VARIANTS = 66,
    BL_FONT_UC_INDEX_ARABIC_PRESENTATION_FORMS_B = 67,
    BL_FONT_UC_INDEX_HALFWIDTH_AND_FULLWIDTH_FORMS = 68,
    BL_FONT_UC_INDEX_SPECIALS = 69,
    BL_FONT_UC_INDEX_TIBETAN = 70,
    BL_FONT_UC_INDEX_SYRIAC = 71,
    BL_FONT_UC_INDEX_THAANA = 72,
    BL_FONT_UC_INDEX_SINHALA = 73,
    BL_FONT_UC_INDEX_MYANMAR = 74,
    BL_FONT_UC_INDEX_ETHIOPIC = 75,

    BL_FONT_UC_INDEX_CHEROKEE = 76,
    BL_FONT_UC_INDEX_UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS = 77,
    BL_FONT_UC_INDEX_OGHAM = 78,
    BL_FONT_UC_INDEX_RUNIC = 79,
    BL_FONT_UC_INDEX_KHMER = 80,

    BL_FONT_UC_INDEX_MONGOLIAN = 81,
    BL_FONT_UC_INDEX_BRAILLE_PATTERNS = 82,
    BL_FONT_UC_INDEX_YI_SYLLABLES_AND_RADICALS = 83,

    BL_FONT_UC_INDEX_TAGALOG_HANUNOO_BUHID_TAGBANWA = 84,

    BL_FONT_UC_INDEX_OLD_ITALIC = 85,
    BL_FONT_UC_INDEX_GOTHIC = 86,
    BL_FONT_UC_INDEX_DESERET = 87,
    BL_FONT_UC_INDEX_MUSICAL_SYMBOLS = 88,

    BL_FONT_UC_INDEX_MATHEMATICAL_ALPHANUMERIC_SYMBOLS = 89,
    BL_FONT_UC_INDEX_PRIVATE_USE_PLANE_15_16 = 90,

    BL_FONT_UC_INDEX_VARIATION_SELECTORS = 91,

    BL_FONT_UC_INDEX_TAGS = 92,
    BL_FONT_UC_INDEX_LIMBU = 93,
    BL_FONT_UC_INDEX_TAI_LE = 94,
    BL_FONT_UC_INDEX_NEW_TAI_LUE = 95,
    BL_FONT_UC_INDEX_BUGINESE = 96,
    BL_FONT_UC_INDEX_GLAGOLITIC = 97,
    BL_FONT_UC_INDEX_TIFINAGH = 98,
    BL_FONT_UC_INDEX_YIJING_HEXAGRAM_SYMBOLS = 99,
    BL_FONT_UC_INDEX_SYLOTI_NAGRI = 100,
    BL_FONT_UC_INDEX_LINEAR_B_SYLLABARY_AND_IDEOGRAMS = 101,

    BL_FONT_UC_INDEX_ANCIENT_GREEK_NUMBERS = 102,
    BL_FONT_UC_INDEX_UGARITIC = 103,
    BL_FONT_UC_INDEX_OLD_PERSIAN = 104,
    BL_FONT_UC_INDEX_SHAVIAN = 105,
    BL_FONT_UC_INDEX_OSMANYA = 106,
    BL_FONT_UC_INDEX_CYPRIOT_SYLLABARY = 107,
    BL_FONT_UC_INDEX_KHAROSHTHI = 108,
    BL_FONT_UC_INDEX_TAI_XUAN_JING_SYMBOLS = 109,
    BL_FONT_UC_INDEX_CUNEIFORM = 110,

    BL_FONT_UC_INDEX_COUNTING_ROD_NUMERALS = 111,
    BL_FONT_UC_INDEX_SUNDANESE = 112,
    BL_FONT_UC_INDEX_LEPCHA = 113,
    BL_FONT_UC_INDEX_OL_CHIKI = 114,
    BL_FONT_UC_INDEX_SAURASHTRA = 115,
    BL_FONT_UC_INDEX_KAYAH_LI = 116,
    BL_FONT_UC_INDEX_REJANG = 117,
    BL_FONT_UC_INDEX_CHAM = 118,
    BL_FONT_UC_INDEX_ANCIENT_SYMBOLS = 119,
    BL_FONT_UC_INDEX_PHAISTOS_DISC = 120,
    BL_FONT_UC_INDEX_CARIAN_LYCIAN_LYDIAN = 121,

    BL_FONT_UC_INDEX_DOMINO_AND_MAHJONG_TILES = 122,

    BL_FONT_UC_INDEX_INTERNAL_USAGE_123 = 123,
    BL_FONT_UC_INDEX_INTERNAL_USAGE_124 = 124,
    BL_FONT_UC_INDEX_INTERNAL_USAGE_125 = 125,
    BL_FONT_UC_INDEX_INTERNAL_USAGE_126 = 126,
    BL_FONT_UC_INDEX_INTERNAL_USAGE_127 = 127
}

enum BLTextDirection
{
    BL_TEXT_DIRECTION_LTR = 0,

    BL_TEXT_DIRECTION_RTL = 1,

    BL_TEXT_DIRECTION_COUNT = 2
}

enum BLTextOrientation
{
    BL_TEXT_ORIENTATION_HORIZONTAL = 0,

    BL_TEXT_ORIENTATION_VERTICAL = 1,

    BL_TEXT_ORIENTATION_COUNT = 2
}

struct BLGlyphInfo
{
    uint cluster;
    uint[2] reserved;
}

struct BLGlyphPlacement
{
    BLPointI placement;
    BLPointI advance;
}

struct BLGlyphMappingState
{
    size_t glyphCount;

    size_t undefinedFirst;

    size_t undefinedCount;
}

struct BLGlyphOutlineSinkInfo
{
    size_t glyphIndex;
    size_t contourCount;
}

struct BLGlyphRun
{
    void* glyphData;

    void* placementData;

    size_t size;

    ubyte glyphSize;

    ubyte placementType;

    byte glyphAdvance;

    byte placementAdvance;

    uint flags;
}

struct BLFontFaceInfo
{
    ubyte faceType;

    ubyte outlineType;

    ushort glyphCount;

    uint revision;

    uint faceIndex;

    uint faceFlags;

    uint diagFlags;

    uint[3] reserved;
}

struct BLFontQueryProperties
{
    uint style;

    uint weight;

    uint stretch;
}

struct BLFontTable
{
    const(ubyte)* data;

    size_t size;
}

struct BLFontFeature
{
    BLTag tag;

    uint value;
}

struct BLFontVariation
{
    BLTag tag;

    float value;
}

struct BLFontUnicodeCoverage
{
    uint[4] data;
}

struct BLFontPanose
{
    union
    {
        ubyte[10] data;
        ubyte familyKind;

        struct _Anonymous_0
        {
            ubyte familyKind;
            ubyte serifStyle;
            ubyte weight;
            ubyte proportion;
            ubyte contrast;
            ubyte strokeVariation;
            ubyte armStyle;
            ubyte letterform;
            ubyte midline;
            ubyte xHeight;
        }

        _Anonymous_0 text;

        struct _Anonymous_1
        {
            ubyte familyKind;
            ubyte toolKind;
            ubyte weight;
            ubyte spacing;
            ubyte aspectRatio;
            ubyte contrast;
            ubyte topology;
            ubyte form;
            ubyte finials;
            ubyte xAscent;
        }

        _Anonymous_1 script;

        struct _Anonymous_2
        {
            ubyte familyKind;
            ubyte decorativeClass;
            ubyte weight;
            ubyte aspect;
            ubyte contrast;
            ubyte serifVariant;
            ubyte treatment;
            ubyte lining;
            ubyte topology;
            ubyte characterRange;
        }

        _Anonymous_2 decorative;

        struct _Anonymous_3
        {
            ubyte familyKind;
            ubyte symbolKind;
            ubyte weight;
            ubyte spacing;
            ubyte aspectRatioAndContrast;
            ubyte aspectRatio94;
            ubyte aspectRatio119;
            ubyte aspectRatio157;
            ubyte aspectRatio163;
            ubyte aspectRatio211;
        }

        _Anonymous_3 symbol;
    }
}

struct BLFontMatrix
{
    union
    {
        double[4] m;

        struct
        {
            double m00;
            double m01;
            double m10;
            double m11;
        }
    }
}

struct BLFontMetrics
{
    float size;

    union
    {
        struct
        {
            float ascent;

            float vAscent;

            float descent;

            float vDescent;
        }

        struct
        {
            float[2] ascentByOrientation;
            float[2] descentByOrientation;
        }
    }

    float lineGap;

    float xHeight;

    float capHeight;

    float xMin;

    float yMin;

    float xMax;

    float yMax;

    float underlinePosition;

    float underlineThickness;

    float strikethroughPosition;

    float strikethroughThickness;
}

struct BLFontDesignMetrics
{
    int unitsPerEm;

    int lowestPPEM;

    int lineGap;

    int xHeight;

    int capHeight;

    union
    {
        struct
        {
            int ascent;

            int vAscent;

            int descent;

            int vDescent;

            int hMinLSB;

            int vMinLSB;

            int hMinTSB;

            int vMinTSB;

            int hMaxAdvance;

            int vMaxAdvance;
        }

        struct
        {
            int[2] ascentByOrientation;

            int[2] descentByOrientation;

            int[2] minLSBByOrientation;

            int[2] minTSBByOrientation;

            int[2] maxAdvanceByOrientation;
        }
    }

    union
    {
        BLBoxI glyphBoundingBox;

        struct
        {
            int xMin;

            int yMin;

            int xMax;

            int yMax;
        }
    }

    int underlinePosition;

    int underlineThickness;

    int strikethroughPosition;

    int strikethroughThickness;
}

struct BLTextMetrics
{
    BLPoint advance;
    BLPoint leadingBearing;
    BLPoint trailingBearing;
    BLBox boundingBox;
}

//****** fontmanager.d ******//

extern (C):

struct BLFontManagerVirt
{
    BLResult function(BLFontManagerImpl* impl) destroy;
}

struct BLFontManagerImpl
{
    const(BLFontManagerVirt)* virt;

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    ubyte[4] reserved;
}

struct BLFontManagerCore
{
    BLFontManagerImpl* impl;
}

//****** format.d ******//

extern (C):

enum BLFormat
{
    BL_FORMAT_NONE = 0,

    BL_FORMAT_PRGB32 = 1,

    BL_FORMAT_XRGB32 = 2,

    BL_FORMAT_A8 = 3,

    BL_FORMAT_COUNT = 4,

    BL_FORMAT_RESERVED_COUNT = 16
}

enum BLFormatFlags
{
    BL_FORMAT_FLAG_RGB = 0x00000001u,

    BL_FORMAT_FLAG_ALPHA = 0x00000002u,

    BL_FORMAT_FLAG_RGBA = 0x00000003u,

    BL_FORMAT_FLAG_LUM = 0x00000004u,

    BL_FORMAT_FLAG_LUMA = 0x00000006u,

    BL_FORMAT_FLAG_INDEXED = 0x00000010u,

    BL_FORMAT_FLAG_PREMULTIPLIED = 0x00000100u,

    BL_FORMAT_FLAG_BYTE_SWAP = 0x00000200u,

    BL_FORMAT_FLAG_BYTE_ALIGNED = 0x00010000u,

    BL_FORMAT_FLAG_UNDEFINED_BITS = 0x00020000u,

    BL_FORMAT_FLAG_LE = (BL_BYTE_ORDER == 1234) ? cast(uint) 0 : cast(uint) BL_FORMAT_FLAG_BYTE_SWAP,

    BL_FORMAT_FLAG_BE = (BL_BYTE_ORDER == 4321) ? cast(uint) 0 : cast(uint) BL_FORMAT_FLAG_BYTE_SWAP
}

struct BLFormatInfo
{
    uint depth;
    uint flags;

    union
    {
        struct
        {
            ubyte[4] sizes;
            ubyte[4] shifts;
        }

        struct
        {
            ubyte rSize;
            ubyte gSize;
            ubyte bSize;
            ubyte aSize;

            ubyte rShift;
            ubyte gShift;
            ubyte bShift;
            ubyte aShift;
        }

        BLRgba32* palette;
    }
}

extern __gshared const(BLFormatInfo)[BL_FORMAT_RESERVED_COUNT] blFormatInfo;

//****** geometry.d ******//

extern (C):

enum BLGeometryDirection
{
    BL_GEOMETRY_DIRECTION_NONE = 0,

    BL_GEOMETRY_DIRECTION_CW = 1,

    BL_GEOMETRY_DIRECTION_CCW = 2
}

enum BLGeometryType
{
    BL_GEOMETRY_TYPE_NONE = 0,

    BL_GEOMETRY_TYPE_BOXI = 1,

    BL_GEOMETRY_TYPE_BOXD = 2,

    BL_GEOMETRY_TYPE_RECTI = 3,

    BL_GEOMETRY_TYPE_RECTD = 4,

    BL_GEOMETRY_TYPE_CIRCLE = 5,

    BL_GEOMETRY_TYPE_ELLIPSE = 6,

    BL_GEOMETRY_TYPE_ROUND_RECT = 7,

    BL_GEOMETRY_TYPE_ARC = 8,

    BL_GEOMETRY_TYPE_CHORD = 9,

    BL_GEOMETRY_TYPE_PIE = 10,

    BL_GEOMETRY_TYPE_LINE = 11,

    BL_GEOMETRY_TYPE_TRIANGLE = 12,

    BL_GEOMETRY_TYPE_POLYLINEI = 13,

    BL_GEOMETRY_TYPE_POLYLINED = 14,

    BL_GEOMETRY_TYPE_POLYGONI = 15,

    BL_GEOMETRY_TYPE_POLYGOND = 16,

    BL_GEOMETRY_TYPE_ARRAY_VIEW_BOXI = 17,

    BL_GEOMETRY_TYPE_ARRAY_VIEW_BOXD = 18,

    BL_GEOMETRY_TYPE_ARRAY_VIEW_RECTI = 19,

    BL_GEOMETRY_TYPE_ARRAY_VIEW_RECTD = 20,

    BL_GEOMETRY_TYPE_PATH = 21,

    BL_GEOMETRY_TYPE_REGION = 22,

    BL_GEOMETRY_TYPE_COUNT = 23,

    BL_GEOMETRY_TYPE_SIMPLE_LAST = BL_GEOMETRY_TYPE_TRIANGLE
}

enum BLFillRule
{
    BL_FILL_RULE_NON_ZERO = 0,

    BL_FILL_RULE_EVEN_ODD = 1,

    BL_FILL_RULE_COUNT = 2
}

enum BLHitTest
{
    BL_HIT_TEST_IN = 0,

    BL_HIT_TEST_PART = 1,

    BL_HIT_TEST_OUT = 2,

    BL_HIT_TEST_INVALID = 0xFFFFFFFFu
}

struct BLPointI
{
    int x;
    int y;
}

struct BLSizeI
{
    int w;
    int h;
}

struct BLBoxI
{
    int x0;
    int y0;
    int x1;
    int y1;
}

struct BLRectI
{
    int x;
    int y;
    int w;
    int h;
}

struct BLPoint
{
    double x;
    double y;
}

struct BLSize
{
    double w;
    double h;
}

struct BLBox
{
    double x0;
    double y0;
    double x1;
    double y1;
}

struct BLRect
{
    double x;
    double y;
    double w;
    double h;
}

struct BLLine
{
    double x0;
    double y0;
    double x1;
    double y1;
}

struct BLTriangle
{
    double x0;
    double y0;
    double x1;
    double y1;
    double x2;
    double y2;
}

struct BLRoundRect
{
    double x;
    double y;
    double w;
    double h;
    double rx;
    double ry;
}

struct BLCircle
{
    double cx;
    double cy;
    double r;
}

struct BLEllipse
{
    double cx;
    double cy;
    double rx;
    double ry;
}

struct BLArc
{
    double cx;
    double cy;
    double rx;
    double ry;
    double start;
    double sweep;
}

//****** glyphbuffer.d ******//

extern (C):

struct BLGlyphBufferImpl
{
    union
    {
        struct
        {
            uint* content;

            BLGlyphPlacement* placementData;

            size_t size;

            uint reserved;

            uint flags;
        }

        BLGlyphRun glyphRun;
    }

    BLGlyphInfo* infoData;
}

struct BLGlyphBufferCore
{
    BLGlyphBufferImpl* impl;
}

//****** gradient.d ******//

extern (C):

enum BLGradientType
{
    BL_GRADIENT_TYPE_LINEAR = 0,

    BL_GRADIENT_TYPE_RADIAL = 1,

    BL_GRADIENT_TYPE_CONICAL = 2,

    BL_GRADIENT_TYPE_COUNT = 3
}

enum BLGradientValue
{
    BL_GRADIENT_VALUE_COMMON_X0 = 0,

    BL_GRADIENT_VALUE_COMMON_Y0 = 1,

    BL_GRADIENT_VALUE_COMMON_X1 = 2,

    BL_GRADIENT_VALUE_COMMON_Y1 = 3,

    BL_GRADIENT_VALUE_RADIAL_R0 = 4,

    BL_GRADIENT_VALUE_CONICAL_ANGLE = 2,

    BL_GRADIENT_VALUE_COUNT = 6
}

struct BLGradientStop
{
    double offset;
    BLRgba64 rgba;
}

struct BLLinearGradientValues
{
    double x0;
    double y0;
    double x1;
    double y1;
}

struct BLRadialGradientValues
{
    double x0;
    double y0;
    double x1;
    double y1;
    double r0;
}

struct BLConicalGradientValues
{
    double x0;
    double y0;
    double angle;
}

struct BLGradientImpl
{
    size_t capacity;

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    ubyte gradientType;

    ubyte extendMode;

    ubyte matrixType;

    ubyte[1] reserved;

    union
    {
        struct
        {
            BLGradientStop* stops;

            size_t size;
        }
    }

    BLMatrix2D matrix;

    union
    {
        double[BL_GRADIENT_VALUE_COUNT] values;

        BLLinearGradientValues linear;

        BLRadialGradientValues radial;

        BLConicalGradientValues conical;
    }
}

struct BLGradientCore
{
    BLGradientImpl* impl;
}

//****** image.d ******//

import core.stdc.string;

extern (C):

enum BLImageInfoFlags
{
    BL_IMAGE_INFO_FLAG_PROGRESSIVE = 0x00000001u
}

enum BLImageScaleFilter
{
    BL_IMAGE_SCALE_FILTER_NONE = 0,

    BL_IMAGE_SCALE_FILTER_NEAREST = 1,

    BL_IMAGE_SCALE_FILTER_BILINEAR = 2,

    BL_IMAGE_SCALE_FILTER_BICUBIC = 3,

    BL_IMAGE_SCALE_FILTER_BELL = 4,

    BL_IMAGE_SCALE_FILTER_GAUSS = 5,

    BL_IMAGE_SCALE_FILTER_HERMITE = 6,

    BL_IMAGE_SCALE_FILTER_HANNING = 7,

    BL_IMAGE_SCALE_FILTER_CATROM = 8,

    BL_IMAGE_SCALE_FILTER_BESSEL = 9,

    BL_IMAGE_SCALE_FILTER_SINC = 10,

    BL_IMAGE_SCALE_FILTER_LANCZOS = 11,

    BL_IMAGE_SCALE_FILTER_BLACKMAN = 12,

    BL_IMAGE_SCALE_FILTER_MITCHELL = 13,

    BL_IMAGE_SCALE_FILTER_USER = 14,

    BL_IMAGE_SCALE_FILTER_COUNT = 15
}

alias BLImageScaleUserFunc = uint function(double* dst, const(double)* tArray, size_t n, const(void)* data);

struct BLImageData
{
    void* pixelData;
    intptr_t stride;
    BLSizeI size;
    uint format;
    uint flags;
}

struct BLImageInfo
{
    BLSizeI size;

    BLSize density;

    uint flags;

    ushort depth;

    ushort planeCount;

    ulong frameCount;

    char[16] format;

    char[16] compression;
}

struct BLImageScaleOptions
{
    BLImageScaleUserFunc userFunc;
    void* userData;

    double radius;

    union
    {
        double[3] data;

        struct _Anonymous_0
        {
            double b;
            double c;
        }

        _Anonymous_0 mitchell;
    }
}

struct BLImageImpl
{
    void* pixelData;

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    ubyte format;

    ubyte flags;

    ushort depth;

    BLSizeI size;

    intptr_t stride;
}

struct BLImageCore
{
    BLImageImpl* impl;
}

//****** imagecodec.d ******//

extern (C):

enum BLImageCodecFeatures
{
    BL_IMAGE_CODEC_FEATURE_READ = 0x00000001u,

    BL_IMAGE_CODEC_FEATURE_WRITE = 0x00000002u,

    BL_IMAGE_CODEC_FEATURE_LOSSLESS = 0x00000004u,

    BL_IMAGE_CODEC_FEATURE_LOSSY = 0x00000008u,

    BL_IMAGE_CODEC_FEATURE_MULTI_FRAME = 0x00000010u,

    BL_IMAGE_CODEC_FEATURE_IPTC = 0x10000000u,

    BL_IMAGE_CODEC_FEATURE_EXIF = 0x20000000u,

    BL_IMAGE_CODEC_FEATURE_XMP = 0x40000000u
}

struct BLImageCodecVirt
{
    BLResult function(BLImageCodecImpl* impl) destroy;
    uint function(const(BLImageCodecImpl)* impl, const(ubyte)* data, size_t size) inspectData;
    BLResult function(const(BLImageCodecImpl)* impl, BLImageDecoderCore* dst) createDecoder;
    BLResult function(const(BLImageCodecImpl)* impl, BLImageEncoderCore* dst) createEncoder;
}

struct BLImageCodecImpl
{
    const(BLImageCodecVirt)* virt;

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    uint features;

    const(char)* name;

    const(char)* vendor;

    const(char)* mimeType;

    const(char)* extensions;
}

struct BLImageCodecCore
{
    BLImageCodecImpl* impl;
}

struct BLImageDecoderVirt
{
    BLResult function(BLImageDecoderImpl* impl) destroy;
    BLResult function(BLImageDecoderImpl* impl) restart;
    BLResult function(BLImageDecoderImpl* impl, BLImageInfo* infoOut, const(ubyte)* data, size_t size) readInfo;
    BLResult function(BLImageDecoderImpl* impl, BLImageCore* imageOut, const(ubyte)* data, size_t size) readFrame;
}

struct BLImageDecoderImpl
{
    const(BLImageDecoderVirt)* virt;

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    BLResult lastResult;

    BLImageCodecCore codec;

    void* handle;

    ulong frameIndex;

    size_t bufferIndex;
}

struct BLImageDecoderCore
{
    BLImageDecoderImpl* impl;
}

struct BLImageEncoderVirt
{
    BLResult function(BLImageEncoderImpl* impl) destroy;
    BLResult function(BLImageEncoderImpl* impl) restart;
    BLResult function(BLImageEncoderImpl* impl, BLArrayCore* dst, const(BLImageCore)* image) writeFrame;
}

struct BLImageEncoderImpl
{
    const(BLImageEncoderVirt)* virt;

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    BLResult lastResult;

    BLImageCodecCore codec;

    void* handle;

    ulong frameIndex;

    size_t bufferIndex;
}

struct BLImageEncoderCore
{
    BLImageEncoderImpl* impl;
}

//****** matrix.d ******//

extern (C):

alias BLMapPointDArrayFunc = uint function(const(void)* ctx, BLPoint* dst, const(BLPoint)* src, size_t count);

enum BLMatrix2DType
{
    BL_MATRIX2D_TYPE_IDENTITY = 0,

    BL_MATRIX2D_TYPE_TRANSLATE = 1,

    BL_MATRIX2D_TYPE_SCALE = 2,

    BL_MATRIX2D_TYPE_SWAP = 3,

    BL_MATRIX2D_TYPE_AFFINE = 4,

    BL_MATRIX2D_TYPE_INVALID = 5,

    BL_MATRIX2D_TYPE_COUNT = 6
}

enum BLMatrix2DValue
{
    BL_MATRIX2D_VALUE_00 = 0,

    BL_MATRIX2D_VALUE_01 = 1,

    BL_MATRIX2D_VALUE_10 = 2,

    BL_MATRIX2D_VALUE_11 = 3,

    BL_MATRIX2D_VALUE_20 = 4,

    BL_MATRIX2D_VALUE_21 = 5,

    BL_MATRIX2D_VALUE_COUNT = 6
}

enum BLMatrix2DOp
{
    BL_MATRIX2D_OP_RESET = 0,

    BL_MATRIX2D_OP_ASSIGN = 1,

    BL_MATRIX2D_OP_TRANSLATE = 2,

    BL_MATRIX2D_OP_SCALE = 3,

    BL_MATRIX2D_OP_SKEW = 4,

    BL_MATRIX2D_OP_ROTATE = 5,

    BL_MATRIX2D_OP_ROTATE_PT = 6,

    BL_MATRIX2D_OP_TRANSFORM = 7,

    BL_MATRIX2D_OP_POST_TRANSLATE = 8,

    BL_MATRIX2D_OP_POST_SCALE = 9,

    BL_MATRIX2D_OP_POST_SKEW = 10,

    BL_MATRIX2D_OP_POST_ROTATE = 11,

    BL_MATRIX2D_OP_POST_ROTATE_PT = 12,

    BL_MATRIX2D_OP_POST_TRANSFORM = 13,

    BL_MATRIX2D_OP_COUNT = 14
}

struct BLMatrix2D
{
    union
    {
        double[BL_MATRIX2D_VALUE_COUNT] m;

        struct
        {
            double m00;
            double m01;
            double m10;
            double m11;
            double m20;
            double m21;
        }
    }
}

extern __gshared BLMapPointDArrayFunc[BL_MATRIX2D_TYPE_COUNT] blMatrix2DMapPointDArrayFuncs;


//****** path.d ******//

extern (C):

enum BLPathCmd
{
    BL_PATH_CMD_MOVE = 0,

    BL_PATH_CMD_ON = 1,

    BL_PATH_CMD_QUAD = 2,

    BL_PATH_CMD_CUBIC = 3,

    BL_PATH_CMD_CLOSE = 4,

    BL_PATH_CMD_COUNT = 5
}

enum BLPathCmdExtra
{
    BL_PATH_CMD_PRESERVE = 0xFFFFFFFFu
}

enum BLPathFlags
{
    BL_PATH_FLAG_EMPTY = 0x00000001u,

    BL_PATH_FLAG_MULTIPLE = 0x00000002u,

    BL_PATH_FLAG_QUADS = 0x00000004u,

    BL_PATH_FLAG_CUBICS = 0x00000008u,

    BL_PATH_FLAG_INVALID = 0x40000000u,

    BL_PATH_FLAG_DIRTY = 0x80000000u
}

enum BLPathReverseMode
{
    BL_PATH_REVERSE_MODE_COMPLETE = 0,

    BL_PATH_REVERSE_MODE_SEPARATE = 1,

    BL_PATH_REVERSE_MODE_COUNT = 2
}

enum BLStrokeJoin
{
    BL_STROKE_JOIN_MITER_CLIP = 0,

    BL_STROKE_JOIN_MITER_BEVEL = 1,

    BL_STROKE_JOIN_MITER_ROUND = 2,

    BL_STROKE_JOIN_BEVEL = 3,

    BL_STROKE_JOIN_ROUND = 4,

    BL_STROKE_JOIN_COUNT = 5
}

enum BLStrokeCapPosition
{
    BL_STROKE_CAP_POSITION_START = 0,

    BL_STROKE_CAP_POSITION_END = 1,

    BL_STROKE_CAP_POSITION_COUNT = 2
}

enum BLStrokeCap
{
    BL_STROKE_CAP_BUTT = 0,

    BL_STROKE_CAP_SQUARE = 1,

    BL_STROKE_CAP_ROUND = 2,

    BL_STROKE_CAP_ROUND_REV = 3,

    BL_STROKE_CAP_TRIANGLE = 4,

    BL_STROKE_CAP_TRIANGLE_REV = 5,

    BL_STROKE_CAP_COUNT = 6
}

enum BLStrokeTransformOrder
{
    BL_STROKE_TRANSFORM_ORDER_AFTER = 0,

    BL_STROKE_TRANSFORM_ORDER_BEFORE = 1,

    BL_STROKE_TRANSFORM_ORDER_COUNT = 2
}

enum BLFlattenMode
{
    BL_FLATTEN_MODE_DEFAULT = 0,

    BL_FLATTEN_MODE_RECURSIVE = 1,

    BL_FLATTEN_MODE_COUNT = 2
}

enum BLOffsetMode
{
    BL_OFFSET_MODE_DEFAULT = 0,

    BL_OFFSET_MODE_ITERATIVE = 1,

    BL_OFFSET_MODE_COUNT = 2
}

struct BLApproximationOptions
{
    ubyte flattenMode;

    ubyte offsetMode;

    ubyte[6] reservedFlags;

    double flattenTolerance;

    double simplifyTolerance;

    double offsetParameter;
}

extern __gshared const BLApproximationOptions blDefaultApproximationOptions;

struct BLStrokeOptionsCore
{
    union
    {
        struct
        {
            ubyte startCap;
            ubyte endCap;
            ubyte join;
            ubyte transformOrder;
            ubyte[4] reserved;
        }

        ubyte[BL_STROKE_CAP_POSITION_COUNT] caps;
        ulong hints;
    }

    double width;
    double miterLimit;
    double dashOffset;
    BLArrayCore dashArray;
}

struct BLPathView
{
    const(ubyte)* commandData;
    const(BLPoint)* vertexData;
    size_t size;
}

struct BLPathImpl
{
    size_t capacity;

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    uint flags;

    union
    {
        struct
        {
            ubyte* commandData;

            BLPoint* vertexData;

            size_t size;
        }

        BLPathView view;
    }
}

struct BLPathCore
{
    BLPathImpl* impl;
}

//****** pattern.d ******//

extern (C):

struct BLPatternImpl
{
    BLImageCore image;

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    ubyte patternType;

    ubyte extendMode;

    ubyte matrixType;

    ubyte[1] reserved;

    BLMatrix2D matrix;

    BLRectI area;
}

struct BLPatternCore
{
    BLPatternImpl* impl;
}

//****** pixelconverter.d ******//

import core.stdc.string;

extern (C):

alias BLPixelConverterFunc = uint function(const(BLPixelConverterCore)* self, ubyte* dstData, intptr_t dstStride, const(ubyte)* srcData, intptr_t srcStride, uint w, uint h, const(BLPixelConverterOptions)* options);

enum BLPixelConverterCreateFlags
{
    BL_PIXEL_CONVERTER_CREATE_FLAG_DONT_COPY_PALETTE = 0x00000001u,

    BL_PIXEL_CONVERTER_CREATE_FLAG_ALTERABLE_PALETTE = 0x00000002u,

    BL_PIXEL_CONVERTER_CREATE_FLAG_NO_MULTI_STEP = 0x00000004u
}

struct BLPixelConverterOptions
{
    BLPointI origin;
    size_t gap;
}

struct BLPixelConverterCore
{
    union
    {
        struct
        {
            BLPixelConverterFunc convertFunc;

            ubyte internalFlags;
        }

        ubyte[80] data;
    }
}

//****** random.d ******//

extern (C):

struct BLRandom
{
    ulong[2] data;
}

//****** region.d ******//

extern (C):

enum BLRegionType
{
    BL_REGION_TYPE_EMPTY = 0,

    BL_REGION_TYPE_RECT = 1,

    BL_REGION_TYPE_COMPLEX = 2,

    BL_REGION_TYPE_COUNT = 3
}

struct BLRegionImpl
{
    size_t capacity;

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    ubyte[4] reserved;

    union
    {
        struct
        {
            BLBoxI* data;

            size_t size;
        }

        BLRegionView view;
    }

    BLBoxI boundingBox;
}

struct BLRegionCore
{
    BLRegionImpl* impl;
}

//****** rgba.d ******//

extern (C):

struct BLRgba32
{
    union
    {
        uint value;

        struct
        {
            import std.bitmanip : bitfields;

            mixin(bitfields!(
                uint, "b", 8,
                uint, "g", 8,
                uint, "r", 8,
                uint, "a", 8));
        }
    }
}

struct BLRgba64
{
    union
    {
        ulong value;

        struct
        {
            import std.bitmanip : bitfields;

            mixin(bitfields!(
                uint, "b", 16,
                uint, "g", 16,
                uint, "r", 16,
                uint, "a", 16));
        }
    }
}

struct BLRgba
{
    float r;
    float g;
    float b;
    float a;
}

//****** runtime.d ******//

extern (C):

enum BLRuntimeLimits
{
    BL_RUNTIME_MAX_IMAGE_SIZE = 65535,

    BL_RUNTIME_MAX_THREAD_COUNT = 32
}

enum BLRuntimeInfoType
{
    BL_RUNTIME_INFO_TYPE_BUILD = 0,

    BL_RUNTIME_INFO_TYPE_SYSTEM = 1,

    BL_RUNTIME_INFO_TYPE_RESOURCE = 2,

    BL_RUNTIME_INFO_TYPE_COUNT = 3
}

enum BLRuntimeBuildType
{
    BL_RUNTIME_BUILD_TYPE_DEBUG = 0,

    BL_RUNTIME_BUILD_TYPE_RELEASE = 1
}

enum BLRuntimeCpuArch
{
    BL_RUNTIME_CPU_ARCH_UNKNOWN = 0,

    BL_RUNTIME_CPU_ARCH_X86 = 1,

    BL_RUNTIME_CPU_ARCH_ARM = 2,

    BL_RUNTIME_CPU_ARCH_MIPS = 3
}

enum BLRuntimeCpuFeatures
{
    BL_RUNTIME_CPU_FEATURE_X86_SSE2 = 0x00000001u,
    BL_RUNTIME_CPU_FEATURE_X86_SSE3 = 0x00000002u,
    BL_RUNTIME_CPU_FEATURE_X86_SSSE3 = 0x00000004u,
    BL_RUNTIME_CPU_FEATURE_X86_SSE4_1 = 0x00000008u,
    BL_RUNTIME_CPU_FEATURE_X86_SSE4_2 = 0x00000010u,
    BL_RUNTIME_CPU_FEATURE_X86_AVX = 0x00000020u,
    BL_RUNTIME_CPU_FEATURE_X86_AVX2 = 0x00000040u
}

enum BLRuntimeCleanupFlags
{
    BL_RUNTIME_CLEANUP_OBJECT_POOL = 0x00000001u,

    BL_RUNTIME_CLEANUP_ZEROED_POOL = 0x00000002u,

    BL_RUNTIME_CLEANUP_THREAD_POOL = 0x00000010u,

    BL_RUNTIME_CLEANUP_EVERYTHING = 0xFFFFFFFFu
}

struct BLRuntimeBuildInfo
{
    union
    {
        uint version_;

        struct
        {
            ubyte patchVersion;
            ubyte minorVersion;
            ushort majorVersion;
        }
    }

    uint buildType;

    uint baselineCpuFeatures;

    uint supportedCpuFeatures;

    uint maxImageSize;

    uint maxThreadCount;

    uint[2] reserved;

    char[32] compilerInfo;
}

struct BLRuntimeSystemInfo
{
    uint cpuArch;

    uint cpuFeatures;

    uint coreCount;

    uint threadCount;

    uint threadStackSize;

    uint removed;

    uint allocationGranularity;

    uint[5] reserved;
}

struct BLRuntimeResourceInfo
{
    size_t vmUsed;

    size_t vmReserved;

    size_t vmOverhead;

    size_t vmBlockCount;

    size_t zmUsed;

    size_t zmReserved;

    size_t zmOverhead;

    size_t zmBlockCount;

    size_t dynamicPipelineCount;

    size_t fileHandleCount;

    size_t fileMappingCount;

    size_t[5] reserved;
}

//****** string.d ******//

extern (C):

struct BLStringImpl
{
    size_t capacity;

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    uint reserved;

    union
    {
        struct
        {
            char* data;

            size_t size;
        }

        BLStringView view;
    }
}

struct BLStringCore
{
    BLStringImpl* impl;
}

//****** style.d ******//

extern (C):

enum BLStyleType
{
    BL_STYLE_TYPE_NONE = 0,

    BL_STYLE_TYPE_SOLID = 1,

    BL_STYLE_TYPE_PATTERN = 2,

    BL_STYLE_TYPE_GRADIENT = 3,

    BL_STYLE_TYPE_COUNT = 4
}

struct BLStyleCore
{
    union
    {
        BLRgba rgba;

        BLVariantCore variant;

        BLPatternCore pattern;

        BLGradientCore gradient;

        struct _Anonymous_0
        {
            ulong unknown;
            uint type;
            uint tag;
        }

        _Anonymous_0 data;

        ulong[2] u64Data;
    }
}

//****** variant.d ******//

import core.stdc.string;

extern (C):

enum BLImplType
{
    BL_IMPL_TYPE_NULL = 0,

    BL_IMPL_TYPE_ARRAY_VAR = 1,

    BL_IMPL_TYPE_ARRAY_I8 = 2,

    BL_IMPL_TYPE_ARRAY_U8 = 3,

    BL_IMPL_TYPE_ARRAY_I16 = 4,

    BL_IMPL_TYPE_ARRAY_U16 = 5,

    BL_IMPL_TYPE_ARRAY_I32 = 6,

    BL_IMPL_TYPE_ARRAY_U32 = 7,

    BL_IMPL_TYPE_ARRAY_I64 = 8,

    BL_IMPL_TYPE_ARRAY_U64 = 9,

    BL_IMPL_TYPE_ARRAY_F32 = 10,

    BL_IMPL_TYPE_ARRAY_F64 = 11,

    BL_IMPL_TYPE_ARRAY_STRUCT_1 = 12,

    BL_IMPL_TYPE_ARRAY_STRUCT_2 = 13,

    BL_IMPL_TYPE_ARRAY_STRUCT_3 = 14,

    BL_IMPL_TYPE_ARRAY_STRUCT_4 = 15,

    BL_IMPL_TYPE_ARRAY_STRUCT_6 = 16,

    BL_IMPL_TYPE_ARRAY_STRUCT_8 = 17,

    BL_IMPL_TYPE_ARRAY_STRUCT_10 = 18,

    BL_IMPL_TYPE_ARRAY_STRUCT_12 = 19,

    BL_IMPL_TYPE_ARRAY_STRUCT_16 = 20,

    BL_IMPL_TYPE_ARRAY_STRUCT_20 = 21,

    BL_IMPL_TYPE_ARRAY_STRUCT_24 = 22,

    BL_IMPL_TYPE_ARRAY_STRUCT_32 = 23,

    BL_IMPL_TYPE_BIT_ARRAY = 32,

    BL_IMPL_TYPE_BIT_SET = 33,

    BL_IMPL_TYPE_STRING = 39,

    BL_IMPL_TYPE_PATH = 40,

    BL_IMPL_TYPE_REGION = 43,

    BL_IMPL_TYPE_IMAGE = 44,

    BL_IMPL_TYPE_IMAGE_CODEC = 45,

    BL_IMPL_TYPE_IMAGE_DECODER = 46,

    BL_IMPL_TYPE_IMAGE_ENCODER = 47,

    BL_IMPL_TYPE_GRADIENT = 48,

    BL_IMPL_TYPE_PATTERN = 49,

    BL_IMPL_TYPE_CONTEXT = 55,

    BL_IMPL_TYPE_FONT = 56,

    BL_IMPL_TYPE_FONT_FACE = 57,

    BL_IMPL_TYPE_FONT_DATA = 58,

    BL_IMPL_TYPE_FONT_MANAGER = 59,

    BL_IMPL_TYPE_FONT_FEATURE_OPTIONS = 60,

    BL_IMPL_TYPE_FONT_VARIATION_OPTIONS = 61,

    BL_IMPL_TYPE_COUNT = 64
}

enum BLImplTraits
{
    BL_IMPL_TRAIT_MUTABLE = 0x01u,

    BL_IMPL_TRAIT_IMMUTABLE = 0x02u,

    BL_IMPL_TRAIT_EXTERNAL = 0x04u,

    BL_IMPL_TRAIT_FOREIGN = 0x08u,

    BL_IMPL_TRAIT_VIRT = 0x10u,

    BL_IMPL_TRAIT_NULL = 0x80u
}

struct BLVariantImpl
{
    union
    {
        const(void)* virt;

        uintptr_t unknownHeaderData;
    }

    size_t refCount;

    ubyte implType;

    ubyte implTraits;

    ushort memPoolData;

    ubyte[4] reserved;
}

struct BLVariantCore
{
    BLVariantImpl* impl;
}

extern __gshared BLVariantCore[BL_IMPL_TYPE_COUNT] blNone;