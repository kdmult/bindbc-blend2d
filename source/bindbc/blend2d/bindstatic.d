module bindbc.blend2d.bindstatic;

version(BindBC_Static) version = BindBlend2D_Static;

import core.stdc.stdint;
import core.stdc.stdarg;

auto BL_MAKE_VERSION(uint MAJOR, uint MINOR, uint PATCH)
{
    return (MAJOR << 16) | (MINOR << 8) | PATCH;
}

enum BL_VERSION = BL_MAKE_VERSION(0, 8, 0);

private
enum expandEnum(EnumType, string fqnEnumType = EnumType.stringof) = (){
    string expandEnum = "enum {";
    foreach(m;__traits(allMembers, EnumType)) {
        expandEnum ~= m ~ " = " ~ fqnEnumType ~ "." ~ m ~ ",";
    }
    expandEnum  ~= "}";
    return expandEnum;
}();

struct BLObjectImpl;


mixin(expandEnum!BLResultCode);
mixin(expandEnum!BLByteOrder);
mixin(expandEnum!BLDataAccessFlags);
mixin(expandEnum!BLDataSourceType);
mixin(expandEnum!BLModifyOp);
mixin(expandEnum!BLBooleanOp);
mixin(expandEnum!BLExtendMode);
mixin(expandEnum!BLTextEncoding);
mixin(expandEnum!BLObjectInfoShift);
mixin(expandEnum!BLObjectInfoBits);
mixin(expandEnum!BLObjectType);
mixin(expandEnum!BLBitSetConstants);
mixin(expandEnum!BLFileOpenFlags);
mixin(expandEnum!BLFileSeekType);
mixin(expandEnum!BLFileReadFlags);
mixin(expandEnum!BLGeometryDirection);
mixin(expandEnum!BLGeometryType);
mixin(expandEnum!BLFillRule);
mixin(expandEnum!BLHitTest);
mixin(expandEnum!BLOrientation);
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
mixin(expandEnum!BLFormat);
mixin(expandEnum!BLFormatFlags);
mixin(expandEnum!BLImageCodecFeatures);
mixin(expandEnum!BLImageInfoFlags);
mixin(expandEnum!BLImageScaleFilter);
mixin(expandEnum!BLMatrix2DType);
mixin(expandEnum!BLMatrix2DValue);
mixin(expandEnum!BLMatrix2DOp);
mixin(expandEnum!BLContextType);
mixin(expandEnum!BLContextHint);
mixin(expandEnum!BLContextOpType);
mixin(expandEnum!BLContextFlushFlags);
mixin(expandEnum!BLContextCreateFlags);
mixin(expandEnum!BLContextErrorFlags);
mixin(expandEnum!BLClipMode);
mixin(expandEnum!BLCompOp);
mixin(expandEnum!BLGradientQuality);
mixin(expandEnum!BLPatternQuality);
mixin(expandEnum!BLRenderingQuality);
mixin(expandEnum!BLGradientType);
mixin(expandEnum!BLGradientValue);
mixin(expandEnum!BLPixelConverterCreateFlags);
mixin(expandEnum!BLRuntimeLimits);
mixin(expandEnum!BLRuntimeInfoType);
mixin(expandEnum!BLRuntimeBuildType);
mixin(expandEnum!BLRuntimeCpuArch);
mixin(expandEnum!BLRuntimeCpuFeatures);
mixin(expandEnum!BLRuntimeCleanupFlags);


//****** api.d ******//

import core.stdc.stddef;
import core.stdc.stdint;

extern (C):

//struct BLObjectImpl;
alias BLResult = uint;
alias BLTag = uint;
alias BLUniqueId = ulong;
alias BLUnknown = void;

enum BLResultCode
{
    BL_SUCCESS = 0,
    BL_ERROR_START_INDEX = 0x00010000u,
    BL_ERROR_OUT_OF_MEMORY = 0x00010000u,
    BL_ERROR_INVALID_VALUE = 65537,
    BL_ERROR_INVALID_STATE = 65538,
    BL_ERROR_INVALID_HANDLE = 65539,
    BL_ERROR_INVALID_CONVERSION = 65540,
    BL_ERROR_OVERFLOW = 65541,
    BL_ERROR_NOT_INITIALIZED = 65542,
    BL_ERROR_NOT_IMPLEMENTED = 65543,
    BL_ERROR_NOT_PERMITTED = 65544,
    BL_ERROR_IO = 65545,
    BL_ERROR_BUSY = 65546,
    BL_ERROR_INTERRUPTED = 65547,
    BL_ERROR_TRY_AGAIN = 65548,
    BL_ERROR_TIMED_OUT = 65549,
    BL_ERROR_BROKEN_PIPE = 65550,
    BL_ERROR_INVALID_SEEK = 65551,
    BL_ERROR_SYMLINK_LOOP = 65552,
    BL_ERROR_FILE_TOO_LARGE = 65553,
    BL_ERROR_ALREADY_EXISTS = 65554,
    BL_ERROR_ACCESS_DENIED = 65555,
    BL_ERROR_MEDIA_CHANGED = 65556,
    BL_ERROR_READ_ONLY_FS = 65557,
    BL_ERROR_NO_DEVICE = 65558,
    BL_ERROR_NO_ENTRY = 65559,
    BL_ERROR_NO_MEDIA = 65560,
    BL_ERROR_NO_MORE_DATA = 65561,
    BL_ERROR_NO_MORE_FILES = 65562,
    BL_ERROR_NO_SPACE_LEFT = 65563,
    BL_ERROR_NOT_EMPTY = 65564,
    BL_ERROR_NOT_FILE = 65565,
    BL_ERROR_NOT_DIRECTORY = 65566,
    BL_ERROR_NOT_SAME_DEVICE = 65567,
    BL_ERROR_NOT_BLOCK_DEVICE = 65568,
    BL_ERROR_INVALID_FILE_NAME = 65569,
    BL_ERROR_FILE_NAME_TOO_LONG = 65570,
    BL_ERROR_TOO_MANY_OPEN_FILES = 65571,
    BL_ERROR_TOO_MANY_OPEN_FILES_BY_OS = 65572,
    BL_ERROR_TOO_MANY_LINKS = 65573,
    BL_ERROR_TOO_MANY_THREADS = 65574,
    BL_ERROR_THREAD_POOL_EXHAUSTED = 65575,
    BL_ERROR_FILE_EMPTY = 65576,
    BL_ERROR_OPEN_FAILED = 65577,
    BL_ERROR_NOT_ROOT_DEVICE = 65578,
    BL_ERROR_UNKNOWN_SYSTEM_ERROR = 65579,
    BL_ERROR_INVALID_ALIGNMENT = 65580,
    BL_ERROR_INVALID_SIGNATURE = 65581,
    BL_ERROR_INVALID_DATA = 65582,
    BL_ERROR_INVALID_STRING = 65583,
    BL_ERROR_INVALID_KEY = 65584,
    BL_ERROR_DATA_TRUNCATED = 65585,
    BL_ERROR_DATA_TOO_LARGE = 65586,
    BL_ERROR_DECOMPRESSION_FAILED = 65587,
    BL_ERROR_INVALID_GEOMETRY = 65588,
    BL_ERROR_NO_MATCHING_VERTEX = 65589,
    BL_ERROR_INVALID_CREATE_FLAGS = 65590,
    BL_ERROR_NO_MATCHING_COOKIE = 65591,
    BL_ERROR_NO_STATES_TO_RESTORE = 65592,
    BL_ERROR_IMAGE_TOO_LARGE = 65593,
    BL_ERROR_IMAGE_NO_MATCHING_CODEC = 65594,
    BL_ERROR_IMAGE_UNKNOWN_FILE_FORMAT = 65595,
    BL_ERROR_IMAGE_DECODER_NOT_PROVIDED = 65596,
    BL_ERROR_IMAGE_ENCODER_NOT_PROVIDED = 65597,
    BL_ERROR_PNG_MULTIPLE_IHDR = 65598,
    BL_ERROR_PNG_INVALID_IDAT = 65599,
    BL_ERROR_PNG_INVALID_IEND = 65600,
    BL_ERROR_PNG_INVALID_PLTE = 65601,
    BL_ERROR_PNG_INVALID_TRNS = 65602,
    BL_ERROR_PNG_INVALID_FILTER = 65603,
    BL_ERROR_JPEG_UNSUPPORTED_FEATURE = 65604,
    BL_ERROR_JPEG_INVALID_SOS = 65605,
    BL_ERROR_JPEG_INVALID_SOF = 65606,
    BL_ERROR_JPEG_MULTIPLE_SOF = 65607,
    BL_ERROR_JPEG_UNSUPPORTED_SOF = 65608,
    BL_ERROR_FONT_NOT_INITIALIZED = 65609,
    BL_ERROR_FONT_NO_MATCH = 65610,
    BL_ERROR_FONT_NO_CHARACTER_MAPPING = 65611,
    BL_ERROR_FONT_MISSING_IMPORTANT_TABLE = 65612,
    BL_ERROR_FONT_FEATURE_NOT_AVAILABLE = 65613,
    BL_ERROR_FONT_CFF_INVALID_DATA = 65614,
    BL_ERROR_FONT_PROGRAM_TERMINATED = 65615,
    BL_ERROR_INVALID_GLYPH = 65616,
    BL_ERROR_FORCE_UINT = 0xFFFFFFFFu
}

enum BLByteOrder
{
    BL_BYTE_ORDER_LE = 0,
    BL_BYTE_ORDER_BE = 1,
    BL_BYTE_ORDER_NATIVE = 1234 == 1234 ? BL_BYTE_ORDER_LE : BL_BYTE_ORDER_BE,
    BL_BYTE_ORDER_SWAPPED = 1234 == 1234 ? BL_BYTE_ORDER_BE : BL_BYTE_ORDER_LE,
    BL_BYTE_ORDER_FORCE_UINT = 0xFFFFFFFFu
}

enum BLDataAccessFlags
{
    BL_DATA_ACCESS_NO_FLAGS = 0x00u,
    BL_DATA_ACCESS_READ = 0x01u,
    BL_DATA_ACCESS_WRITE = 0x02u,
    BL_DATA_ACCESS_RW = 0x03u,
    BL_DATA_ACCESS_FORCE_UINT = 0xFFFFFFFFu
}

enum BLDataSourceType
{
    BL_DATA_SOURCE_TYPE_NONE = 0,
    BL_DATA_SOURCE_TYPE_MEMORY = 1,
    BL_DATA_SOURCE_TYPE_FILE = 2,
    BL_DATA_SOURCE_TYPE_CUSTOM = 3,
    BL_DATA_SOURCE_TYPE_MAX_VALUE = 3,
    BL_DATA_SOURCE_TYPE_FORCE_UINT = 0xFFFFFFFFu
}

enum BLModifyOp
{
    BL_MODIFY_OP_ASSIGN_FIT = 0,
    BL_MODIFY_OP_ASSIGN_GROW = 1,
    BL_MODIFY_OP_APPEND_FIT = 2,
    BL_MODIFY_OP_APPEND_GROW = 3,
    BL_MODIFY_OP_MAX_VALUE = 3,
    BL_MODIFY_OP_FORCE_UINT = 0xFFFFFFFFu
}

enum BLBooleanOp
{
    BL_BOOLEAN_OP_COPY = 0,
    BL_BOOLEAN_OP_AND = 1,
    BL_BOOLEAN_OP_OR = 2,
    BL_BOOLEAN_OP_XOR = 3,
    BL_BOOLEAN_OP_AND_NOT = 4,
    BL_BOOLEAN_OP_NOT_AND = 5,
    BL_BOOLEAN_OP_MAX_VALUE = 5,
    BL_BOOLEAN_OP_FORCE_UINT = 0xFFFFFFFFu
}

enum BLExtendMode
{
    BL_EXTEND_MODE_PAD = 0,
    BL_EXTEND_MODE_REPEAT = 1,
    BL_EXTEND_MODE_REFLECT = 2,
    BL_EXTEND_MODE_PAD_X_PAD_Y = 0,
    BL_EXTEND_MODE_PAD_X_REPEAT_Y = 3,
    BL_EXTEND_MODE_PAD_X_REFLECT_Y = 4,
    BL_EXTEND_MODE_REPEAT_X_REPEAT_Y = 1,
    BL_EXTEND_MODE_REPEAT_X_PAD_Y = 5,
    BL_EXTEND_MODE_REPEAT_X_REFLECT_Y = 6,
    BL_EXTEND_MODE_REFLECT_X_REFLECT_Y = 2,
    BL_EXTEND_MODE_REFLECT_X_PAD_Y = 7,
    BL_EXTEND_MODE_REFLECT_X_REPEAT_Y = 8,
    BL_EXTEND_MODE_SIMPLE_MAX_VALUE = 2,
    BL_EXTEND_MODE_COMPLEX_MAX_VALUE = 8,
    BL_EXTEND_MODE_MAX_VALUE = 8,
    BL_EXTEND_MODE_FORCE_UINT = 0xFFFFFFFFu
}

enum BLTextEncoding
{
    BL_TEXT_ENCODING_UTF8 = 0,
    BL_TEXT_ENCODING_UTF16 = 1,
    BL_TEXT_ENCODING_UTF32 = 2,
    BL_TEXT_ENCODING_LATIN1 = 3,
    BL_TEXT_ENCODING_WCHAR = wchar_t.sizeof == 4 ? BL_TEXT_ENCODING_UTF32 : wchar_t.sizeof == 2 ? BL_TEXT_ENCODING_UTF16 : BL_TEXT_ENCODING_UTF8,
    BL_TEXT_ENCODING_MAX_VALUE = 3,
    BL_TEXT_ENCODING_FORCE_UINT = 0xFFFFFFFFu
}

BLResult blTraceError(BLResult result);

version(BindBlend2D_Static) void blRuntimeAssertionFailure(const(char)* file, int line, const(char)* msg);

struct BLRange
{
    size_t start;
    size_t end;
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

alias BLDataView = BLArrayView;

enum BLObjectInfoShift
{
    BL_OBJECT_INFO_REF_COUNTED_SHIFT = 0,
    BL_OBJECT_INFO_IMMUTABLE_SHIFT = 1,
    BL_OBJECT_INFO_X_SHIFT = 2,
    BL_OBJECT_INFO_P_SHIFT = 3,
    BL_OBJECT_INFO_C_SHIFT = 10,
    BL_OBJECT_INFO_B_SHIFT = 14,
    BL_OBJECT_INFO_A_SHIFT = 18,
    BL_OBJECT_INFO_TYPE_SHIFT = 22,
    BL_OBJECT_INFO_VIRTUAL_SHIFT = 28,
    BL_OBJECT_INFO_T_MSB_SHIFT = 29,
    BL_OBJECT_INFO_DYNAMIC_SHIFT = 30,
    BL_OBJECT_INFO_MARKER_SHIFT = 31,
    BL_OBJECT_INFO_RC_INIT_SHIFT = BL_OBJECT_INFO_REF_COUNTED_SHIFT,
    BL_OBJECT_INFO_SHIFT_FORCE_UINT = 0xFFFFFFFFu
}

enum BLObjectInfoBits
{
    BL_OBJECT_INFO_REF_COUNTED_FLAG = 0x01u << BLObjectInfoShift.BL_OBJECT_INFO_REF_COUNTED_SHIFT,
    BL_OBJECT_INFO_IMMUTABLE_FLAG = 0x01u << BLObjectInfoShift.BL_OBJECT_INFO_IMMUTABLE_SHIFT,
    BL_OBJECT_INFO_X_FLAG = 0x01u << BLObjectInfoShift.BL_OBJECT_INFO_X_SHIFT,
    BL_OBJECT_INFO_P_MASK = 0x7Fu << BLObjectInfoShift.BL_OBJECT_INFO_B_SHIFT,
    BL_OBJECT_INFO_C_MASK = 0x0Fu << BLObjectInfoShift.BL_OBJECT_INFO_C_SHIFT,
    BL_OBJECT_INFO_B_MASK = 0x0Fu << BLObjectInfoShift.BL_OBJECT_INFO_B_SHIFT,
    BL_OBJECT_INFO_A_MASK = 0x0Fu << BLObjectInfoShift.BL_OBJECT_INFO_A_SHIFT,
    BL_OBJECT_INFO_TYPE_MASK = 0xFFu << BLObjectInfoShift.BL_OBJECT_INFO_TYPE_SHIFT,
    BL_OBJECT_INFO_VIRTUAL_FLAG = 0x01u << BLObjectInfoShift.BL_OBJECT_INFO_VIRTUAL_SHIFT,
    BL_OBJECT_INFO_T_MSB_FLAG = 0x01u << BLObjectInfoShift.BL_OBJECT_INFO_T_MSB_SHIFT,
    BL_OBJECT_INFO_DYNAMIC_FLAG = 0x01u << BLObjectInfoShift.BL_OBJECT_INFO_DYNAMIC_SHIFT,
    BL_OBJECT_INFO_MARKER_FLAG = 0x01u << BLObjectInfoShift.BL_OBJECT_INFO_MARKER_SHIFT,
    BL_OBJECT_INFO_RC_INIT_MASK = 0x03u << BLObjectInfoShift.BL_OBJECT_INFO_RC_INIT_SHIFT,
    BL_OBJECT_INFO_BITS_FORCE_UINT = 0xFFFFFFFFu
}

enum BLObjectType
{
    BL_OBJECT_TYPE_RGBA = 0,
    BL_OBJECT_TYPE_NULL = 1,
    BL_OBJECT_TYPE_PATTERN = 2,
    BL_OBJECT_TYPE_GRADIENT = 3,
    BL_OBJECT_TYPE_IMAGE = 9,
    BL_OBJECT_TYPE_PATH = 10,
    BL_OBJECT_TYPE_FONT = 16,
    BL_OBJECT_TYPE_FONT_FEATURE_SETTINGS = 17,
    BL_OBJECT_TYPE_FONT_VARIATION_SETTINGS = 18,
    BL_OBJECT_TYPE_BOOL = 28,
    BL_OBJECT_TYPE_INT64 = 29,
    BL_OBJECT_TYPE_UINT64 = 30,
    BL_OBJECT_TYPE_DOUBLE = 31,
    BL_OBJECT_TYPE_STRING = 32,
    BL_OBJECT_TYPE_ARRAY_OBJECT = 33,
    BL_OBJECT_TYPE_ARRAY_INT8 = 34,
    BL_OBJECT_TYPE_ARRAY_UINT8 = 35,
    BL_OBJECT_TYPE_ARRAY_INT16 = 36,
    BL_OBJECT_TYPE_ARRAY_UINT16 = 37,
    BL_OBJECT_TYPE_ARRAY_INT32 = 38,
    BL_OBJECT_TYPE_ARRAY_UINT32 = 39,
    BL_OBJECT_TYPE_ARRAY_INT64 = 40,
    BL_OBJECT_TYPE_ARRAY_UINT64 = 41,
    BL_OBJECT_TYPE_ARRAY_FLOAT32 = 42,
    BL_OBJECT_TYPE_ARRAY_FLOAT64 = 43,
    BL_OBJECT_TYPE_ARRAY_STRUCT_1 = 44,
    BL_OBJECT_TYPE_ARRAY_STRUCT_2 = 45,
    BL_OBJECT_TYPE_ARRAY_STRUCT_3 = 46,
    BL_OBJECT_TYPE_ARRAY_STRUCT_4 = 47,
    BL_OBJECT_TYPE_ARRAY_STRUCT_6 = 48,
    BL_OBJECT_TYPE_ARRAY_STRUCT_8 = 49,
    BL_OBJECT_TYPE_ARRAY_STRUCT_10 = 50,
    BL_OBJECT_TYPE_ARRAY_STRUCT_12 = 51,
    BL_OBJECT_TYPE_ARRAY_STRUCT_16 = 52,
    BL_OBJECT_TYPE_ARRAY_STRUCT_20 = 53,
    BL_OBJECT_TYPE_ARRAY_STRUCT_24 = 54,
    BL_OBJECT_TYPE_ARRAY_STRUCT_32 = 55,
    BL_OBJECT_TYPE_CONTEXT = 64,
    BL_OBJECT_TYPE_IMAGE_CODEC = 65,
    BL_OBJECT_TYPE_IMAGE_DECODER = 66,
    BL_OBJECT_TYPE_IMAGE_ENCODER = 67,
    BL_OBJECT_TYPE_FONT_FACE = 68,
    BL_OBJECT_TYPE_FONT_DATA = 69,
    BL_OBJECT_TYPE_FONT_MANAGER = 70,
    BL_OBJECT_TYPE_BIT_SET = 128,
    BL_OBJECT_TYPE_ARRAY_FIRST = 33,
    BL_OBJECT_TYPE_ARRAY_LAST = 55,
    BL_OBJECT_TYPE_MAX_STYLE_VALUE = 3,
    BL_OBJECT_TYPE_MAX_VALUE = 128,
    BL_OBJECT_TYPE_FORCE_UINT = 0xFFFFFFFFu
}

struct BLObjectInfo
{
    uint bits;
}

union BLObjectDetail
{
    void* impl;
    char[16] char_data;
    byte[16] i8_data;
    ubyte[16] u8_data;
    short[8] i16_data;
    ushort[8] u16_data;
    int[4] i32_data;
    uint[4] u32_data;
    long[2] i64_data;
    ulong[2] u64_data;
    float[4] f32_data;
    double[2] f64_data;

    struct
    {
        uint[2] u32_data_overlap;
        uint impl_payload;
        BLObjectInfo info;
    }
}

alias BLDestroyExternalDataFunc = void function(void* impl, void* externalData, void* userData);

struct BLObjectExternalInfo
{
    BLDestroyExternalDataFunc destroyFunc;
    void* userData;
}

version(BindBlend2D_Static) void* blObjectDetailAllocImpl(BLObjectDetail* d, uint info, size_t implSize, size_t* implSizeOut);
version(BindBlend2D_Static) void* blObjectDetailAllocImplExternal(BLObjectDetail* d, uint info, size_t implSize, BLObjectExternalInfo** externalInfoOut, void** externalOptDataOut);
version(BindBlend2D_Static) BLResult blObjectDetailFreeImpl(void* impl, uint info);
version(BindBlend2D_Static) BLResult blObjectInitMove(BLUnknown* self, BLUnknown* other);
version(BindBlend2D_Static) BLResult blObjectInitWeak(BLUnknown* self, const(BLUnknown)* other);
version(BindBlend2D_Static) BLResult blObjectReset(BLUnknown* self);
version(BindBlend2D_Static) BLResult blObjectAssignMove(BLUnknown* self, BLUnknown* other);
version(BindBlend2D_Static) BLResult blObjectAssignWeak(BLUnknown* self, const(BLUnknown)* other);
version(BindBlend2D_Static) BLResult blObjectGetProperty(const(BLUnknown)* self, const(char)* name, size_t nameSize, BLVarCore* valueOut);
version(BindBlend2D_Static) BLResult blObjectGetPropertyBool(const(BLUnknown)* self, const(char)* name, size_t nameSize, bool* valueOut);
version(BindBlend2D_Static) BLResult blObjectGetPropertyInt32(const(BLUnknown)* self, const(char)* name, size_t nameSize, int* valueOut);
version(BindBlend2D_Static) BLResult blObjectGetPropertyInt64(const(BLUnknown)* self, const(char)* name, size_t nameSize, long* valueOut);
version(BindBlend2D_Static) BLResult blObjectGetPropertyUInt32(const(BLUnknown)* self, const(char)* name, size_t nameSize, uint* valueOut);
version(BindBlend2D_Static) BLResult blObjectGetPropertyUInt64(const(BLUnknown)* self, const(char)* name, size_t nameSize, ulong* valueOut);
version(BindBlend2D_Static) BLResult blObjectGetPropertyDouble(const(BLUnknown)* self, const(char)* name, size_t nameSize, double* valueOut);
version(BindBlend2D_Static) BLResult blObjectSetProperty(BLUnknown* self, const(char)* name, size_t nameSize, const(BLUnknown)* value);
version(BindBlend2D_Static) BLResult blObjectSetPropertyBool(BLUnknown* self, const(char)* name, size_t nameSize, bool value);
version(BindBlend2D_Static) BLResult blObjectSetPropertyInt32(BLUnknown* self, const(char)* name, size_t nameSize, int value);
version(BindBlend2D_Static) BLResult blObjectSetPropertyInt64(BLUnknown* self, const(char)* name, size_t nameSize, long value);
version(BindBlend2D_Static) BLResult blObjectSetPropertyUInt32(BLUnknown* self, const(char)* name, size_t nameSize, uint value);
version(BindBlend2D_Static) BLResult blObjectSetPropertyUInt64(BLUnknown* self, const(char)* name, size_t nameSize, ulong value);
version(BindBlend2D_Static) BLResult blObjectSetPropertyDouble(BLUnknown* self, const(char)* name, size_t nameSize, double value);

struct BLObjectVirtBase
{
    BLResult function(BLObjectImpl* impl, uint info) destroy;
    BLResult function(const(BLObjectImpl)* impl, const(char)* name, size_t nameSize, BLVarCore* valueOut) getProperty;
    BLResult function(BLObjectImpl* impl, const(char)* name, size_t nameSize, const(BLVarCore)* value) setProperty;
}

struct BLObjectVirt
{
    BLObjectVirtBase base;
}

struct BLObjectCore
{
    BLObjectDetail _d;
}

version(BindBlend2D_Static) BLResult blArrayInit(BLArrayCore* self, BLObjectType arrayType);
version(BindBlend2D_Static) BLResult blArrayInitMove(BLArrayCore* self, BLArrayCore* other);
version(BindBlend2D_Static) BLResult blArrayInitWeak(BLArrayCore* self, const(BLArrayCore)* other);
version(BindBlend2D_Static) BLResult blArrayDestroy(BLArrayCore* self);
version(BindBlend2D_Static) BLResult blArrayReset(BLArrayCore* self);
version(BindBlend2D_Static) size_t blArrayGetSize(const(BLArrayCore)* self);
version(BindBlend2D_Static) size_t blArrayGetCapacity(const(BLArrayCore)* self);
version(BindBlend2D_Static) size_t blArrayGetItemSize(BLArrayCore* self);
version(BindBlend2D_Static) const(void)* blArrayGetData(const(BLArrayCore)* self);
version(BindBlend2D_Static) BLResult blArrayClear(BLArrayCore* self);
version(BindBlend2D_Static) BLResult blArrayShrink(BLArrayCore* self);
version(BindBlend2D_Static) BLResult blArrayReserve(BLArrayCore* self, size_t n);
version(BindBlend2D_Static) BLResult blArrayResize(BLArrayCore* self, size_t n, const(void)* fill);
version(BindBlend2D_Static) BLResult blArrayMakeMutable(BLArrayCore* self, void** dataOut);
version(BindBlend2D_Static) BLResult blArrayModifyOp(BLArrayCore* self, BLModifyOp op, size_t n, void** dataOut);
version(BindBlend2D_Static) BLResult blArrayInsertOp(BLArrayCore* self, size_t index, size_t n, void** dataOut);
version(BindBlend2D_Static) BLResult blArrayAssignMove(BLArrayCore* self, BLArrayCore* other);
version(BindBlend2D_Static) BLResult blArrayAssignWeak(BLArrayCore* self, const(BLArrayCore)* other);
version(BindBlend2D_Static) BLResult blArrayAssignDeep(BLArrayCore* self, const(BLArrayCore)* other);
version(BindBlend2D_Static) BLResult blArrayAssignData(BLArrayCore* self, const(void)* data, size_t n);
version(BindBlend2D_Static) BLResult blArrayAssignExternalData(BLArrayCore* self, void* data, size_t size, size_t capacity, BLDataAccessFlags dataAccessFlags, BLDestroyExternalDataFunc destroyFunc, void* userData);
version(BindBlend2D_Static) BLResult blArrayAppendU8(BLArrayCore* self, ubyte value);
version(BindBlend2D_Static) BLResult blArrayAppendU16(BLArrayCore* self, ushort value);
version(BindBlend2D_Static) BLResult blArrayAppendU32(BLArrayCore* self, uint value);
version(BindBlend2D_Static) BLResult blArrayAppendU64(BLArrayCore* self, ulong value);
version(BindBlend2D_Static) BLResult blArrayAppendF32(BLArrayCore* self, float value);
version(BindBlend2D_Static) BLResult blArrayAppendF64(BLArrayCore* self, double value);
version(BindBlend2D_Static) BLResult blArrayAppendItem(BLArrayCore* self, const(void)* item);
version(BindBlend2D_Static) BLResult blArrayAppendData(BLArrayCore* self, const(void)* data, size_t n);
version(BindBlend2D_Static) BLResult blArrayInsertU8(BLArrayCore* self, size_t index, ubyte value);
version(BindBlend2D_Static) BLResult blArrayInsertU16(BLArrayCore* self, size_t index, ushort value);
version(BindBlend2D_Static) BLResult blArrayInsertU32(BLArrayCore* self, size_t index, uint value);
version(BindBlend2D_Static) BLResult blArrayInsertU64(BLArrayCore* self, size_t index, ulong value);
version(BindBlend2D_Static) BLResult blArrayInsertF32(BLArrayCore* self, size_t index, float value);
version(BindBlend2D_Static) BLResult blArrayInsertF64(BLArrayCore* self, size_t index, double value);
version(BindBlend2D_Static) BLResult blArrayInsertItem(BLArrayCore* self, size_t index, const(void)* item);
version(BindBlend2D_Static) BLResult blArrayInsertData(BLArrayCore* self, size_t index, const(void)* data, size_t n);
version(BindBlend2D_Static) BLResult blArrayReplaceU8(BLArrayCore* self, size_t index, ubyte value);
version(BindBlend2D_Static) BLResult blArrayReplaceU16(BLArrayCore* self, size_t index, ushort value);
version(BindBlend2D_Static) BLResult blArrayReplaceU32(BLArrayCore* self, size_t index, uint value);
version(BindBlend2D_Static) BLResult blArrayReplaceU64(BLArrayCore* self, size_t index, ulong value);
version(BindBlend2D_Static) BLResult blArrayReplaceF32(BLArrayCore* self, size_t index, float value);
version(BindBlend2D_Static) BLResult blArrayReplaceF64(BLArrayCore* self, size_t index, double value);
version(BindBlend2D_Static) BLResult blArrayReplaceItem(BLArrayCore* self, size_t index, const(void)* item);
version(BindBlend2D_Static) BLResult blArrayReplaceData(BLArrayCore* self, size_t rStart, size_t rEnd, const(void)* data, size_t n);
version(BindBlend2D_Static) BLResult blArrayRemoveIndex(BLArrayCore* self, size_t index);
version(BindBlend2D_Static) BLResult blArrayRemoveRange(BLArrayCore* self, size_t rStart, size_t rEnd);
version(BindBlend2D_Static) bool blArrayEquals(const(BLArrayCore)* a, const(BLArrayCore)* b);

struct BLArrayCore
{
    BLObjectDetail _d;
}

struct BLArrayImpl
{
    void* data;
    size_t size;
    size_t capacity;
}

enum BLBitSetConstants
{
    BL_BIT_SET_INVALID_INDEX = 0xFFFFFFFFu,
    BL_BIT_SET_RANGE_MASK = 0x80000000u,
    BL_BIT_SET_SEGMENT_WORD_COUNT = 4u
}

struct BLBitSetSegment
{
    uint _startWord;
    uint[BL_BIT_SET_SEGMENT_WORD_COUNT] _data;
}

struct BLBitSetData
{
    const(BLBitSetSegment)* segmentData;
    uint segmentCount;
    BLBitSetSegment[3] ssoSegments;
}

version(BindBlend2D_Static) BLResult blBitSetInit(BLBitSetCore* self);
version(BindBlend2D_Static) BLResult blBitSetInitMove(BLBitSetCore* self, BLBitSetCore* other);
version(BindBlend2D_Static) BLResult blBitSetInitWeak(BLBitSetCore* self, const(BLBitSetCore)* other);
version(BindBlend2D_Static) BLResult blBitSetInitRange(BLBitSetCore* self, uint startBit, uint endBit);
version(BindBlend2D_Static) BLResult blBitSetDestroy(BLBitSetCore* self);
version(BindBlend2D_Static) BLResult blBitSetReset(BLBitSetCore* self);
version(BindBlend2D_Static) BLResult blBitSetAssignMove(BLBitSetCore* self, BLBitSetCore* other);
version(BindBlend2D_Static) BLResult blBitSetAssignWeak(BLBitSetCore* self, const(BLBitSetCore)* other);
version(BindBlend2D_Static) BLResult blBitSetAssignDeep(BLBitSetCore* self, const(BLBitSetCore)* other);
version(BindBlend2D_Static) BLResult blBitSetAssignRange(BLBitSetCore* self, uint startBit, uint endBit);
version(BindBlend2D_Static) BLResult blBitSetAssignWords(BLBitSetCore* self, uint startWord, const(uint)* wordData, uint wordCount);
version(BindBlend2D_Static) bool blBitSetIsEmpty(const(BLBitSetCore)* self);
version(BindBlend2D_Static) BLResult blBitSetGetData(const(BLBitSetCore)* self, BLBitSetData* out_);
version(BindBlend2D_Static) uint blBitSetGetSegmentCount(const(BLBitSetCore)* self);
version(BindBlend2D_Static) uint blBitSetGetSegmentCapacity(const(BLBitSetCore)* self);
version(BindBlend2D_Static) uint blBitSetGetCardinality(const(BLBitSetCore)* self);
version(BindBlend2D_Static) uint blBitSetGetCardinalityInRange(const(BLBitSetCore)* self, uint startBit, uint endBit);
version(BindBlend2D_Static) bool blBitSetHasBit(const(BLBitSetCore)* self, uint bitIndex);
version(BindBlend2D_Static) bool blBitSetHasBitsInRange(const(BLBitSetCore)* self, uint startBit, uint endBit);
version(BindBlend2D_Static) bool blBitSetSubsumes(const(BLBitSetCore)* a, const(BLBitSetCore)* b);
version(BindBlend2D_Static) bool blBitSetIntersects(const(BLBitSetCore)* a, const(BLBitSetCore)* b);
version(BindBlend2D_Static) bool blBitSetGetRange(const(BLBitSetCore)* self, uint* startOut, uint* endOut);
version(BindBlend2D_Static) bool blBitSetEquals(const(BLBitSetCore)* a, const(BLBitSetCore)* b);
version(BindBlend2D_Static) int blBitSetCompare(const(BLBitSetCore)* a, const(BLBitSetCore)* b);
version(BindBlend2D_Static) BLResult blBitSetClear(BLBitSetCore* self);
version(BindBlend2D_Static) BLResult blBitSetShrink(BLBitSetCore* self);
version(BindBlend2D_Static) BLResult blBitSetOptimize(BLBitSetCore* self);
version(BindBlend2D_Static) BLResult blBitSetChop(BLBitSetCore* self, uint startBit, uint endBit);
version(BindBlend2D_Static) BLResult blBitSetAddBit(BLBitSetCore* self, uint bitIndex);
version(BindBlend2D_Static) BLResult blBitSetAddRange(BLBitSetCore* self, uint rangeStartBit, uint rangeEndBit);
version(BindBlend2D_Static) BLResult blBitSetAddWords(BLBitSetCore* self, uint startWord, const(uint)* wordData, uint wordCount);
version(BindBlend2D_Static) BLResult blBitSetClearBit(BLBitSetCore* self, uint bitIndex);
version(BindBlend2D_Static) BLResult blBitSetClearRange(BLBitSetCore* self, uint rangeStartBit, uint rangeEndBit);
version(BindBlend2D_Static) BLResult blBitSetBuilderCommit(BLBitSetCore* self, BLBitSetBuilderCore* builder, uint newAreaIndex);
version(BindBlend2D_Static) BLResult blBitSetBuilderAddRange(BLBitSetCore* self, BLBitSetBuilderCore* builder, uint startBit, uint endBit);

struct BLBitSetCore
{
    BLObjectDetail _d;
}

struct BLBitSetBuilderCore
{
    uint _areaShift;
    uint _areaIndex;
}

struct BLBitSetImpl
{
    uint segmentCount;
    uint segmentCapacity;
}

enum BLFileOpenFlags
{
    BL_FILE_OPEN_NO_FLAGS = 0u,
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
    BL_FILE_OPEN_DELETE_EXCLUSIVE = 0x80000000u,
    BL_FILE_OPEN_FORCE_UINT = 0xFFFFFFFFu
}

enum BLFileSeekType
{
    BL_FILE_SEEK_SET = 0,
    BL_FILE_SEEK_CUR = 1,
    BL_FILE_SEEK_END = 2,
    BL_FILE_SEEK_MAX_VALUE = 3,
    BL_FILE_SEEK_FORCE_UINT = 0xFFFFFFFFu
}

enum BLFileReadFlags
{
    BL_FILE_READ_NO_FLAGS = 0u,
    BL_FILE_READ_MMAP_ENABLED = 0x00000001u,
    BL_FILE_READ_MMAP_AVOID_SMALL = 0x00000002u,
    BL_FILE_READ_MMAP_NO_FALLBACK = 0x00000008u,
    BL_FILE_READ_FORCE_UINT = 0xFFFFFFFFu
}

struct BLFileCore
{
    intptr_t handle;
}

version(BindBlend2D_Static) BLResult blFileInit(BLFileCore* self);
version(BindBlend2D_Static) BLResult blFileReset(BLFileCore* self);
version(BindBlend2D_Static) BLResult blFileOpen(BLFileCore* self, const(char)* fileName, BLFileOpenFlags openFlags);
version(BindBlend2D_Static) BLResult blFileClose(BLFileCore* self);
version(BindBlend2D_Static) BLResult blFileSeek(BLFileCore* self, long offset, BLFileSeekType seekType, long* positionOut);
version(BindBlend2D_Static) BLResult blFileRead(BLFileCore* self, void* buffer, size_t n, size_t* bytesReadOut);
version(BindBlend2D_Static) BLResult blFileWrite(BLFileCore* self, const(void)* buffer, size_t n, size_t* bytesWrittenOut);
version(BindBlend2D_Static) BLResult blFileTruncate(BLFileCore* self, long maxSize);
version(BindBlend2D_Static) BLResult blFileGetSize(BLFileCore* self, ulong* fileSizeOut);
version(BindBlend2D_Static) BLResult blFileSystemReadFile(const(char)* fileName, BLArrayCore* dst, size_t maxSize, BLFileReadFlags readFlags);
version(BindBlend2D_Static) BLResult blFileSystemWriteFile(const(char)* fileName, const(void)* data, size_t size, size_t* bytesWrittenOut);

enum BLGeometryDirection
{
    BL_GEOMETRY_DIRECTION_NONE = 0,
    BL_GEOMETRY_DIRECTION_CW = 1,
    BL_GEOMETRY_DIRECTION_CCW = 2,
    BL_GEOMETRY_DIRECTION_FORCE_UINT = 0xFFFFFFFFu
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
    BL_GEOMETRY_TYPE_MAX_VALUE = 21,
    BL_GEOMETRY_TYPE_SIMPLE_LAST = BL_GEOMETRY_TYPE_TRIANGLE,
    BL_GEOMETRY_TYPE_FORCE_UINT = 0xFFFFFFFFu
}

enum BLFillRule
{
    BL_FILL_RULE_NON_ZERO = 0,
    BL_FILL_RULE_EVEN_ODD = 1,
    BL_FILL_RULE_MAX_VALUE = 1,
    BL_FILL_RULE_FORCE_UINT = 0xFFFFFFFFu
}

enum BLHitTest
{
    BL_HIT_TEST_IN = 0,
    BL_HIT_TEST_PART = 1,
    BL_HIT_TEST_OUT = 2,
    BL_HIT_TEST_INVALID = 0xFFFFFFFFu,
    BL_HIT_TEST_FORCE_UINT = 0xFFFFFFFFu
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

enum BLOrientation
{
    BL_ORIENTATION_HORIZONTAL = 0,
    BL_ORIENTATION_VERTICAL = 1,
    BL_ORIENTATION_MAX_VALUE = 1,
    BL_ORIENTATION_FORCE_UINT = 0xFFFFFFFFu
}

enum BLGlyphPlacementType
{
    BL_GLYPH_PLACEMENT_TYPE_NONE = 0,
    BL_GLYPH_PLACEMENT_TYPE_ADVANCE_OFFSET = 1,
    BL_GLYPH_PLACEMENT_TYPE_DESIGN_UNITS = 2,
    BL_GLYPH_PLACEMENT_TYPE_USER_UNITS = 3,
    BL_GLYPH_PLACEMENT_TYPE_ABSOLUTE_UNITS = 4,
    BL_GLYPH_PLACEMENT_TYPE_MAX_VALUE = 4,
    BL_GLYPH_PLACEMENT_TYPE_FORCE_UINT = 0xFFFFFFFFu
}

enum BLGlyphRunFlags
{
    BL_GLYPH_RUN_NO_FLAGS = 0u,
    BL_GLYPH_RUN_FLAG_UCS4_CONTENT = 0x10000000u,
    BL_GLYPH_RUN_FLAG_INVALID_TEXT = 0x20000000u,
    BL_GLYPH_RUN_FLAG_UNDEFINED_GLYPHS = 0x40000000u,
    BL_GLYPH_RUN_FLAG_INVALID_FONT_DATA = 0x80000000u,
    BL_GLYPH_RUN_FLAG_FORCE_UINT = 0xFFFFFFFFu
}

enum BLFontDataFlags
{
    BL_FONT_DATA_NO_FLAGS = 0u,
    BL_FONT_DATA_FLAG_COLLECTION = 0x00000001u,
    BL_FONT_DATA_FLAG_FORCE_UINT = 0xFFFFFFFFu
}

enum BLFontFaceType
{
    BL_FONT_FACE_TYPE_NONE = 0,
    BL_FONT_FACE_TYPE_OPENTYPE = 1,
    BL_FONT_FACE_TYPE_MAX_VALUE = 1,
    BL_FONT_FACE_TYPE_FORCE_UINT = 0xFFFFFFFFu
}

enum BLFontFaceFlags
{
    BL_FONT_FACE_NO_FLAGS = 0u,
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
    BL_FONT_FACE_FLAG_LAST_RESORT_FONT = 0x80000000u,
    BL_FONT_FACE_FLAG_FORCE_UINT = 0xFFFFFFFFu
}

enum BLFontFaceDiagFlags
{
    BL_FONT_FACE_DIAG_NO_FLAGS = 0u,
    BL_FONT_FACE_DIAG_WRONG_NAME_DATA = 0x00000001u,
    BL_FONT_FACE_DIAG_FIXED_NAME_DATA = 0x00000002u,
    BL_FONT_FACE_DIAG_WRONG_KERN_DATA = 0x00000004u,
    BL_FONT_FACE_DIAG_FIXED_KERN_DATA = 0x00000008u,
    BL_FONT_FACE_DIAG_WRONG_CMAP_DATA = 0x00000010u,
    BL_FONT_FACE_DIAG_WRONG_CMAP_FORMAT = 0x00000020u,
    BL_FONT_FACE_DIAG_WRONG_GDEF_DATA = 0x00000100u,
    BL_FONT_FACE_DIAG_WRONG_GPOS_DATA = 0x00000400u,
    BL_FONT_FACE_DIAG_WRONG_GSUB_DATA = 0x00001000u,
    BL_FONT_FACE_DIAG_FORCE_UINT = 0xFFFFFFFFu
}

enum BLFontOutlineType
{
    BL_FONT_OUTLINE_TYPE_NONE = 0,
    BL_FONT_OUTLINE_TYPE_TRUETYPE = 1,
    BL_FONT_OUTLINE_TYPE_CFF = 2,
    BL_FONT_OUTLINE_TYPE_CFF2 = 3,
    BL_FONT_OUTLINE_TYPE_MAX_VALUE = 3,
    BL_FONT_OUTLINE_TYPE_FORCE_UINT = 0xFFFFFFFFu
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
    BL_FONT_STRETCH_ULTRA_EXPANDED = 9,
    BL_FONT_STRETCH_MAX_VALUE = 9,
    BL_FONT_STRETCH_FORCE_UINT = 0xFFFFFFFFu
}

enum BLFontStyle
{
    BL_FONT_STYLE_NORMAL = 0,
    BL_FONT_STYLE_OBLIQUE = 1,
    BL_FONT_STYLE_ITALIC = 2,
    BL_FONT_STYLE_MAX_VALUE = 2,
    BL_FONT_STYLE_FORCE_UINT = 0xFFFFFFFFu
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
    BL_FONT_WEIGHT_EXTRA_BLACK = 950,
    BL_FONT_WEIGHT_FORCE_UINT = 0xFFFFFFFFu
}

enum BLFontStringId
{
    BL_FONT_STRING_ID_COPYRIGHT_NOTICE = 0,
    BL_FONT_STRING_ID_FAMILY_NAME = 1,
    BL_FONT_STRING_ID_SUBFAMILY_NAME = 2,
    BL_FONT_STRING_ID_UNIQUE_IDENTIFIER = 3,
    BL_FONT_STRING_ID_FULL_NAME = 4,
    BL_FONT_STRING_ID_VERSION_STRING = 5,
    BL_FONT_STRING_ID_POST_SCRIPT_NAME = 6,
    BL_FONT_STRING_ID_TRADEMARK = 7,
    BL_FONT_STRING_ID_MANUFACTURER_NAME = 8,
    BL_FONT_STRING_ID_DESIGNER_NAME = 9,
    BL_FONT_STRING_ID_DESCRIPTION = 10,
    BL_FONT_STRING_ID_VENDOR_URL = 11,
    BL_FONT_STRING_ID_DESIGNER_URL = 12,
    BL_FONT_STRING_ID_LICENSE_DESCRIPTION = 13,
    BL_FONT_STRING_ID_LICENSE_INFO_URL = 14,
    BL_FONT_STRING_ID_RESERVED = 15,
    BL_FONT_STRING_ID_TYPOGRAPHIC_FAMILY_NAME = 16,
    BL_FONT_STRING_ID_TYPOGRAPHIC_SUBFAMILY_NAME = 17,
    BL_FONT_STRING_ID_COMPATIBLE_FULL_NAME = 18,
    BL_FONT_STRING_ID_SAMPLE_TEXT = 19,
    BL_FONT_STRING_ID_POST_SCRIPT_CID_NAME = 20,
    BL_FONT_STRING_ID_WWS_FAMILY_NAME = 21,
    BL_FONT_STRING_ID_WWS_SUBFAMILY_NAME = 22,
    BL_FONT_STRING_ID_LIGHT_BACKGROUND_PALETTE = 23,
    BL_FONT_STRING_ID_DARK_BACKGROUND_PALETTE = 24,
    BL_FONT_STRING_ID_VARIATIONS_POST_SCRIPT_PREFIX = 25,
    BL_FONT_STRING_ID_COMMON_MAX_VALUE = 26,
    BL_FONT_STRING_ID_CUSTOM_START_INDEX = 255,
    BL_FONT_STRING_ID_FORCE_UINT = 0xFFFFFFFFu
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
    BL_FONT_UC_INDEX_INTERNAL_USAGE_127 = 127,
    BL_FONT_UC_INDEX_MAX_VALUE = 128,
    BL_FONT_UC_INDEX_FORCE_UINT = 0xFFFFFFFFu
}

enum BLTextDirection
{
    BL_TEXT_DIRECTION_LTR = 0,
    BL_TEXT_DIRECTION_RTL = 1,
    BL_TEXT_DIRECTION_MAX_VALUE = 1,
    BL_TEXT_DIRECTION_FORCE_UINT = 0xFFFFFFFFu
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

struct BLFontFeatureItem
{
    BLTag tag;
    uint value;
}

struct BLFontVariationItem
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

    BLBoxI glyphBoundingBox;
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

version(BindBlend2D_Static) BLResult blStringInit(BLStringCore* self);
version(BindBlend2D_Static) BLResult blStringInitMove(BLStringCore* self, BLStringCore* other);
version(BindBlend2D_Static) BLResult blStringInitWeak(BLStringCore* self, const(BLStringCore)* other);
version(BindBlend2D_Static) BLResult blStringInitWithData(BLStringCore* self, const(char)* str, size_t size);
version(BindBlend2D_Static) BLResult blStringDestroy(BLStringCore* self);
version(BindBlend2D_Static) BLResult blStringReset(BLStringCore* self);
version(BindBlend2D_Static) const(char)* blStringGetData(const(BLStringCore)* self);
version(BindBlend2D_Static) size_t blStringGetSize(const(BLStringCore)* self);
version(BindBlend2D_Static) size_t blStringGetCapacity(const(BLStringCore)* self);
version(BindBlend2D_Static) BLResult blStringClear(BLStringCore* self);
version(BindBlend2D_Static) BLResult blStringShrink(BLStringCore* self);
version(BindBlend2D_Static) BLResult blStringReserve(BLStringCore* self, size_t n);
version(BindBlend2D_Static) BLResult blStringResize(BLStringCore* self, size_t n, char fill);
version(BindBlend2D_Static) BLResult blStringMakeMutable(BLStringCore* self, char** dataOut);
version(BindBlend2D_Static) BLResult blStringModifyOp(BLStringCore* self, BLModifyOp op, size_t n, char** dataOut);
version(BindBlend2D_Static) BLResult blStringInsertOp(BLStringCore* self, size_t index, size_t n, char** dataOut);
version(BindBlend2D_Static) BLResult blStringAssignMove(BLStringCore* self, BLStringCore* other);
version(BindBlend2D_Static) BLResult blStringAssignWeak(BLStringCore* self, const(BLStringCore)* other);
version(BindBlend2D_Static) BLResult blStringAssignDeep(BLStringCore* self, const(BLStringCore)* other);
version(BindBlend2D_Static) BLResult blStringAssignData(BLStringCore* self, const(char)* str, size_t n);
version(BindBlend2D_Static) BLResult blStringApplyOpChar(BLStringCore* self, BLModifyOp op, char c, size_t n);
version(BindBlend2D_Static) BLResult blStringApplyOpData(BLStringCore* self, BLModifyOp op, const(char)* str, size_t n);
version(BindBlend2D_Static) BLResult blStringApplyOpString(BLStringCore* self, BLModifyOp op, const(BLStringCore)* other);
version(BindBlend2D_Static) BLResult blStringApplyOpFormat(BLStringCore* self, BLModifyOp op, const(char)* fmt, ...);
version(BindBlend2D_Static) BLResult blStringApplyOpFormatV(BLStringCore* self, BLModifyOp op, const(char)* fmt, va_list ap);
version(BindBlend2D_Static) BLResult blStringInsertChar(BLStringCore* self, size_t index, char c, size_t n);
version(BindBlend2D_Static) BLResult blStringInsertData(BLStringCore* self, size_t index, const(char)* str, size_t n);
version(BindBlend2D_Static) BLResult blStringInsertString(BLStringCore* self, size_t index, const(BLStringCore)* other);
version(BindBlend2D_Static) BLResult blStringRemoveIndex(BLStringCore* self, size_t index);
version(BindBlend2D_Static) BLResult blStringRemoveRange(BLStringCore* self, size_t rStart, size_t rEnd);
version(BindBlend2D_Static) bool blStringEquals(const(BLStringCore)* a, const(BLStringCore)* b);
version(BindBlend2D_Static) bool blStringEqualsData(const(BLStringCore)* self, const(char)* str, size_t n);
version(BindBlend2D_Static) int blStringCompare(const(BLStringCore)* a, const(BLStringCore)* b);
version(BindBlend2D_Static) int blStringCompareData(const(BLStringCore)* self, const(char)* str, size_t n);

struct BLStringCore
{
    BLObjectDetail _d;
}

struct BLStringImpl
{
    size_t size;
    size_t capacity;
}

version(BindBlend2D_Static) BLResult blFontDataInit(BLFontDataCore* self);
version(BindBlend2D_Static) BLResult blFontDataInitMove(BLFontDataCore* self, BLFontDataCore* other);
version(BindBlend2D_Static) BLResult blFontDataInitWeak(BLFontDataCore* self, const(BLFontDataCore)* other);
version(BindBlend2D_Static) BLResult blFontDataDestroy(BLFontDataCore* self);
version(BindBlend2D_Static) BLResult blFontDataReset(BLFontDataCore* self);
version(BindBlend2D_Static) BLResult blFontDataAssignMove(BLFontDataCore* self, BLFontDataCore* other);
version(BindBlend2D_Static) BLResult blFontDataAssignWeak(BLFontDataCore* self, const(BLFontDataCore)* other);
version(BindBlend2D_Static) BLResult blFontDataCreateFromFile(BLFontDataCore* self, const(char)* fileName, BLFileReadFlags readFlags);
version(BindBlend2D_Static) BLResult blFontDataCreateFromDataArray(BLFontDataCore* self, const(BLArrayCore)* dataArray);
version(BindBlend2D_Static) BLResult blFontDataCreateFromData(BLFontDataCore* self, const(void)* data, size_t dataSize, BLDestroyExternalDataFunc destroyFunc, void* userData);
version(BindBlend2D_Static) bool blFontDataEquals(const(BLFontDataCore)* a, const(BLFontDataCore)* b);
version(BindBlend2D_Static) BLResult blFontDataListTags(const(BLFontDataCore)* self, uint faceIndex, BLArrayCore* dst);
version(BindBlend2D_Static) size_t blFontDataQueryTables(const(BLFontDataCore)* self, uint faceIndex, BLFontTable* dst, const(BLTag)* tags, size_t count);

struct BLFontDataCore
{
    BLObjectDetail _d;
}

struct BLFontDataVirt
{
    BLObjectVirtBase base;
    BLResult function(const(BLFontDataImpl)* impl, uint faceIndex, BLArrayCore* out_) listTags;
    size_t function(const(BLFontDataImpl)* impl, uint faceIndex, BLFontTable* dst, const(BLTag)* tags, size_t n) queryTables;
}

struct BLFontDataImpl
{
    const(BLFontDataVirt)* virt;
    ubyte faceType;
    uint faceCount;
    uint flags;
}

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
version(BindBlend2D_Static) BLResult blGlyphBufferSetText(BLGlyphBufferCore* self, const(void)* textData, size_t size, BLTextEncoding encoding);
version(BindBlend2D_Static) BLResult blGlyphBufferSetGlyphs(BLGlyphBufferCore* self, const(uint)* glyphData, size_t size);
version(BindBlend2D_Static) BLResult blGlyphBufferSetGlyphsFromStruct(BLGlyphBufferCore* self, const(void)* glyphData, size_t size, size_t glyphIdSize, intptr_t glyphIdAdvance);

enum BLPathCmd
{
    BL_PATH_CMD_MOVE = 0,
    BL_PATH_CMD_ON = 1,
    BL_PATH_CMD_QUAD = 2,
    BL_PATH_CMD_CUBIC = 3,
    BL_PATH_CMD_CLOSE = 4,
    BL_PATH_CMD_MAX_VALUE = 4,
    BL_PATH_CMD_FORCE_UINT = 0xFFFFFFFFu
}

enum BLPathCmdExtra
{
    BL_PATH_CMD_PRESERVE = 0xFFFFFFFFu
}

enum BLPathFlags
{
    BL_PATH_NO_FLAGS = 0u,
    BL_PATH_FLAG_EMPTY = 0x00000001u,
    BL_PATH_FLAG_MULTIPLE = 0x00000002u,
    BL_PATH_FLAG_QUADS = 0x00000004u,
    BL_PATH_FLAG_CUBICS = 0x00000008u,
    BL_PATH_FLAG_INVALID = 0x40000000u,
    BL_PATH_FLAG_DIRTY = 0x80000000u,
    BL_PATH_FLAG_FORCE_UINT = 0xFFFFFFFFu
}

enum BLPathReverseMode
{
    BL_PATH_REVERSE_MODE_COMPLETE = 0,
    BL_PATH_REVERSE_MODE_SEPARATE = 1,
    BL_PATH_REVERSE_MODE_MAX_VALUE = 1,
    BL_PATH_REVERSE_MODE_FORCE_UINT = 0xFFFFFFFFu
}

enum BLStrokeJoin
{
    BL_STROKE_JOIN_MITER_CLIP = 0,
    BL_STROKE_JOIN_MITER_BEVEL = 1,
    BL_STROKE_JOIN_MITER_ROUND = 2,
    BL_STROKE_JOIN_BEVEL = 3,
    BL_STROKE_JOIN_ROUND = 4,
    BL_STROKE_JOIN_MAX_VALUE = 4,
    BL_STROKE_JOIN_FORCE_UINT = 0xFFFFFFFFu
}

enum BLStrokeCapPosition
{
    BL_STROKE_CAP_POSITION_START = 0,
    BL_STROKE_CAP_POSITION_END = 1,
    BL_STROKE_CAP_POSITION_MAX_VALUE = 1,
    BL_STROKE_CAP_POSITION_FORCE_UINT = 0xFFFFFFFFu
}

enum BLStrokeCap
{
    BL_STROKE_CAP_BUTT = 0,
    BL_STROKE_CAP_SQUARE = 1,
    BL_STROKE_CAP_ROUND = 2,
    BL_STROKE_CAP_ROUND_REV = 3,
    BL_STROKE_CAP_TRIANGLE = 4,
    BL_STROKE_CAP_TRIANGLE_REV = 5,
    BL_STROKE_CAP_MAX_VALUE = 5,
    BL_STROKE_CAP_FORCE_UINT = 0xFFFFFFFFu
}

enum BLStrokeTransformOrder
{
    BL_STROKE_TRANSFORM_ORDER_AFTER = 0,
    BL_STROKE_TRANSFORM_ORDER_BEFORE = 1,
    BL_STROKE_TRANSFORM_ORDER_MAX_VALUE = 1,
    BL_STROKE_TRANSFORM_ORDER_FORCE_UINT = 0xFFFFFFFFu
}

enum BLFlattenMode
{
    BL_FLATTEN_MODE_DEFAULT = 0,
    BL_FLATTEN_MODE_RECURSIVE = 1,
    BL_FLATTEN_MODE_MAX_VALUE = 1,
    BL_FLATTEN_MODE_FORCE_UINT = 0xFFFFFFFFu
}

enum BLOffsetMode
{
    BL_OFFSET_MODE_DEFAULT = 0,
    BL_OFFSET_MODE_ITERATIVE = 1,
    BL_OFFSET_MODE_MAX_VALUE = 1,
    BL_OFFSET_MODE_FORCE_UINT = 0xFFFFFFFFu
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

struct BLPathView
{
    const(ubyte)* commandData;
    const(BLPoint)* vertexData;
    size_t size;
}

extern __gshared const BLApproximationOptions blDefaultApproximationOptions;

alias BLPathSinkFunc = uint function(BLPathCore* path, const(void)* info, void* closure);

version(BindBlend2D_Static) BLResult blPathInit(BLPathCore* self);
version(BindBlend2D_Static) BLResult blPathInitMove(BLPathCore* self, BLPathCore* other);
version(BindBlend2D_Static) BLResult blPathInitWeak(BLPathCore* self, const(BLPathCore)* other);
version(BindBlend2D_Static) BLResult blPathDestroy(BLPathCore* self);
version(BindBlend2D_Static) BLResult blPathReset(BLPathCore* self);
version(BindBlend2D_Static) size_t blPathGetSize(const(BLPathCore)* self);
version(BindBlend2D_Static) size_t blPathGetCapacity(const(BLPathCore)* self);
version(BindBlend2D_Static) const(ubyte)* blPathGetCommandData(const(BLPathCore)* self);
version(BindBlend2D_Static) const(BLPoint)* blPathGetVertexData(const(BLPathCore)* self);
version(BindBlend2D_Static) BLResult blPathClear(BLPathCore* self);
version(BindBlend2D_Static) BLResult blPathShrink(BLPathCore* self);
version(BindBlend2D_Static) BLResult blPathReserve(BLPathCore* self, size_t n);
version(BindBlend2D_Static) BLResult blPathModifyOp(BLPathCore* self, BLModifyOp op, size_t n, ubyte** cmdDataOut, BLPoint** vtxDataOut);
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
version(BindBlend2D_Static) BLResult blPathAddGeometry(BLPathCore* self, BLGeometryType geometryType, const(void)* geometryData, const(BLMatrix2D)* m, BLGeometryDirection dir);
version(BindBlend2D_Static) BLResult blPathAddBoxI(BLPathCore* self, const(BLBoxI)* box, BLGeometryDirection dir);
version(BindBlend2D_Static) BLResult blPathAddBoxD(BLPathCore* self, const(BLBox)* box, BLGeometryDirection dir);
version(BindBlend2D_Static) BLResult blPathAddRectI(BLPathCore* self, const(BLRectI)* rect, BLGeometryDirection dir);
version(BindBlend2D_Static) BLResult blPathAddRectD(BLPathCore* self, const(BLRect)* rect, BLGeometryDirection dir);
version(BindBlend2D_Static) BLResult blPathAddPath(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range);
version(BindBlend2D_Static) BLResult blPathAddTranslatedPath(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, const(BLPoint)* p);
version(BindBlend2D_Static) BLResult blPathAddTransformedPath(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, const(BLMatrix2D)* m);
version(BindBlend2D_Static) BLResult blPathAddReversedPath(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, BLPathReverseMode reverseMode);
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
version(BindBlend2D_Static) BLHitTest blPathHitTest(const(BLPathCore)* self, const(BLPoint)* p, BLFillRule fillRule);
version(BindBlend2D_Static) BLResult blStrokeOptionsInit(BLStrokeOptionsCore* self);
version(BindBlend2D_Static) BLResult blStrokeOptionsInitMove(BLStrokeOptionsCore* self, BLStrokeOptionsCore* other);
version(BindBlend2D_Static) BLResult blStrokeOptionsInitWeak(BLStrokeOptionsCore* self, const(BLStrokeOptionsCore)* other);
version(BindBlend2D_Static) BLResult blStrokeOptionsDestroy(BLStrokeOptionsCore* self);
version(BindBlend2D_Static) BLResult blStrokeOptionsReset(BLStrokeOptionsCore* self);
version(BindBlend2D_Static) BLResult blStrokeOptionsAssignMove(BLStrokeOptionsCore* self, BLStrokeOptionsCore* other);
version(BindBlend2D_Static) BLResult blStrokeOptionsAssignWeak(BLStrokeOptionsCore* self, const(BLStrokeOptionsCore)* other);

struct BLPathCore
{
    BLObjectDetail _d;
}

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

        ubyte[2] caps;
        ulong hints;
    }

    double width;
    double miterLimit;
    double dashOffset;
    BLArrayCore dashArray;
}

struct BLPathImpl
{
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

    size_t capacity;
    uint flags;
}

version(BindBlend2D_Static) BLResult blFontFaceInit(BLFontFaceCore* self);
version(BindBlend2D_Static) BLResult blFontFaceInitMove(BLFontFaceCore* self, BLFontFaceCore* other);
version(BindBlend2D_Static) BLResult blFontFaceInitWeak(BLFontFaceCore* self, const(BLFontFaceCore)* other);
version(BindBlend2D_Static) BLResult blFontFaceDestroy(BLFontFaceCore* self);
version(BindBlend2D_Static) BLResult blFontFaceReset(BLFontFaceCore* self);
version(BindBlend2D_Static) BLResult blFontFaceAssignMove(BLFontFaceCore* self, BLFontFaceCore* other);
version(BindBlend2D_Static) BLResult blFontFaceAssignWeak(BLFontFaceCore* self, const(BLFontFaceCore)* other);
version(BindBlend2D_Static) bool blFontFaceEquals(const(BLFontFaceCore)* a, const(BLFontFaceCore)* b);
version(BindBlend2D_Static) BLResult blFontFaceCreateFromFile(BLFontFaceCore* self, const(char)* fileName, BLFileReadFlags readFlags);
version(BindBlend2D_Static) BLResult blFontFaceCreateFromData(BLFontFaceCore* self, const(BLFontDataCore)* fontData, uint faceIndex);
version(BindBlend2D_Static) BLResult blFontFaceGetFaceInfo(const(BLFontFaceCore)* self, BLFontFaceInfo* out_);
version(BindBlend2D_Static) BLResult blFontFaceGetScriptTags(const(BLFontFaceCore)* self, BLArrayCore* out_);
version(BindBlend2D_Static) BLResult blFontFaceGetFeatureTags(const(BLFontFaceCore)* self, BLArrayCore* out_);
version(BindBlend2D_Static) BLResult blFontFaceGetDesignMetrics(const(BLFontFaceCore)* self, BLFontDesignMetrics* out_);
version(BindBlend2D_Static) BLResult blFontFaceGetUnicodeCoverage(const(BLFontFaceCore)* self, BLFontUnicodeCoverage* out_);
version(BindBlend2D_Static) BLResult blFontFaceGetCharacterCoverage(const(BLFontFaceCore)* self, BLBitSetCore* out_);

struct BLFontFaceCore
{
    BLObjectDetail _d;
}

struct BLFontFaceVirt
{
    BLObjectVirtBase base;
}

struct BLFontFaceImpl
{
    const(BLFontFaceVirt)* virt;
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
    BLArrayCore scriptTags;
    BLArrayCore featureTags;
    BLFontDesignMetrics designMetrics;
    BLFontUnicodeCoverage unicodeCoverage;
    BLFontPanose panose;
}

extern __gshared const uint BL_FONT_FEATURE_INVALID_VALUE;

struct BLFontFeatureSettingsView
{
    const(BLFontFeatureItem)* data;
    size_t size;
    BLFontFeatureItem[12] ssoData;
}

version(BindBlend2D_Static) BLResult blFontFeatureSettingsInit(BLFontFeatureSettingsCore* self);
version(BindBlend2D_Static) BLResult blFontFeatureSettingsInitMove(BLFontFeatureSettingsCore* self, BLFontFeatureSettingsCore* other);
version(BindBlend2D_Static) BLResult blFontFeatureSettingsInitWeak(BLFontFeatureSettingsCore* self, const(BLFontFeatureSettingsCore)* other);
version(BindBlend2D_Static) BLResult blFontFeatureSettingsDestroy(BLFontFeatureSettingsCore* self);
version(BindBlend2D_Static) BLResult blFontFeatureSettingsReset(BLFontFeatureSettingsCore* self);
version(BindBlend2D_Static) BLResult blFontFeatureSettingsClear(BLFontFeatureSettingsCore* self);
version(BindBlend2D_Static) BLResult blFontFeatureSettingsShrink(BLFontFeatureSettingsCore* self);
version(BindBlend2D_Static) BLResult blFontFeatureSettingsAssignMove(BLFontFeatureSettingsCore* self, BLFontFeatureSettingsCore* other);
version(BindBlend2D_Static) BLResult blFontFeatureSettingsAssignWeak(BLFontFeatureSettingsCore* self, const(BLFontFeatureSettingsCore)* other);
version(BindBlend2D_Static) size_t blFontFeatureSettingsGetSize(const(BLFontFeatureSettingsCore)* self);
version(BindBlend2D_Static) size_t blFontFeatureSettingsGetCapacity(const(BLFontFeatureSettingsCore)* self);
version(BindBlend2D_Static) BLResult blFontFeatureSettingsGetView(const(BLFontFeatureSettingsCore)* self, BLFontFeatureSettingsView* out_);
version(BindBlend2D_Static) bool blFontFeatureSettingsHasKey(const(BLFontFeatureSettingsCore)* self, BLTag key);
version(BindBlend2D_Static) uint blFontFeatureSettingsGetKey(const(BLFontFeatureSettingsCore)* self, BLTag key);
version(BindBlend2D_Static) BLResult blFontFeatureSettingsSetKey(BLFontFeatureSettingsCore* self, BLTag key, uint value);
version(BindBlend2D_Static) BLResult blFontFeatureSettingsRemoveKey(BLFontFeatureSettingsCore* self, BLTag key);
version(BindBlend2D_Static) bool blFontFeatureSettingsEquals(const(BLFontFeatureSettingsCore)* a, const(BLFontFeatureSettingsCore)* b);

struct BLFontFeatureSettingsCore
{
    BLObjectDetail _d;
}

struct BLFontFeatureSettingsImpl
{
    BLFontFeatureItem* data;
    size_t size;
    size_t capacity;
}

struct BLFontVariationSettingsView
{
    const(BLFontVariationItem)* data;
    size_t size;
    BLFontVariationItem[3] ssoData;
}

version(BindBlend2D_Static) BLResult blFontVariationSettingsInit(BLFontVariationSettingsCore* self);
version(BindBlend2D_Static) BLResult blFontVariationSettingsInitMove(BLFontVariationSettingsCore* self, BLFontVariationSettingsCore* other);
version(BindBlend2D_Static) BLResult blFontVariationSettingsInitWeak(BLFontVariationSettingsCore* self, const(BLFontVariationSettingsCore)* other);
version(BindBlend2D_Static) BLResult blFontVariationSettingsDestroy(BLFontVariationSettingsCore* self);
version(BindBlend2D_Static) BLResult blFontVariationSettingsReset(BLFontVariationSettingsCore* self);
version(BindBlend2D_Static) BLResult blFontVariationSettingsClear(BLFontVariationSettingsCore* self);
version(BindBlend2D_Static) BLResult blFontVariationSettingsShrink(BLFontVariationSettingsCore* self);
version(BindBlend2D_Static) BLResult blFontVariationSettingsAssignMove(BLFontVariationSettingsCore* self, BLFontVariationSettingsCore* other);
version(BindBlend2D_Static) BLResult blFontVariationSettingsAssignWeak(BLFontVariationSettingsCore* self, const(BLFontVariationSettingsCore)* other);
version(BindBlend2D_Static) size_t blFontVariationSettingsGetSize(const(BLFontVariationSettingsCore)* self);
version(BindBlend2D_Static) size_t blFontVariationSettingsGetCapacity(const(BLFontVariationSettingsCore)* self);
version(BindBlend2D_Static) BLResult blFontVariationSettingsGetView(const(BLFontVariationSettingsCore)* self, BLFontVariationSettingsView* out_);
version(BindBlend2D_Static) bool blFontVariationSettingsHasKey(const(BLFontVariationSettingsCore)* self, BLTag key);
version(BindBlend2D_Static) float blFontVariationSettingsGetKey(const(BLFontVariationSettingsCore)* self, BLTag key);
version(BindBlend2D_Static) BLResult blFontVariationSettingsSetKey(BLFontVariationSettingsCore* self, BLTag key, float value);
version(BindBlend2D_Static) BLResult blFontVariationSettingsRemoveKey(BLFontVariationSettingsCore* self, BLTag key);
version(BindBlend2D_Static) bool blFontVariationSettingsEquals(const(BLFontVariationSettingsCore)* a, const(BLFontVariationSettingsCore)* b);

struct BLFontVariationSettingsCore
{
    BLObjectDetail _d;
}

struct BLFontVariationSettingsImpl
{
    BLFontVariationItem* data;
    size_t size;
    size_t capacity;
}

version(BindBlend2D_Static) BLResult blFontInit(BLFontCore* self);
version(BindBlend2D_Static) BLResult blFontInitMove(BLFontCore* self, BLFontCore* other);
version(BindBlend2D_Static) BLResult blFontInitWeak(BLFontCore* self, const(BLFontCore)* other);
version(BindBlend2D_Static) BLResult blFontDestroy(BLFontCore* self);
version(BindBlend2D_Static) BLResult blFontReset(BLFontCore* self);
version(BindBlend2D_Static) BLResult blFontAssignMove(BLFontCore* self, BLFontCore* other);
version(BindBlend2D_Static) BLResult blFontAssignWeak(BLFontCore* self, const(BLFontCore)* other);
version(BindBlend2D_Static) bool blFontEquals(const(BLFontCore)* a, const(BLFontCore)* b);
version(BindBlend2D_Static) BLResult blFontCreateFromFace(BLFontCore* self, const(BLFontFaceCore)* face, float size);
version(BindBlend2D_Static) float blFontGetSize(const(BLFontCore)* self);
version(BindBlend2D_Static) BLResult blFontSetSize(BLFontCore* self, float size);
version(BindBlend2D_Static) BLResult blFontGetMetrics(const(BLFontCore)* self, BLFontMetrics* out_);
version(BindBlend2D_Static) BLResult blFontGetMatrix(const(BLFontCore)* self, BLFontMatrix* out_);
version(BindBlend2D_Static) BLResult blFontGetDesignMetrics(const(BLFontCore)* self, BLFontDesignMetrics* out_);
version(BindBlend2D_Static) BLResult blFontGetFeatureSettings(const(BLFontCore)* self, BLFontFeatureSettingsCore* out_);
version(BindBlend2D_Static) BLResult blFontSetFeatureSettings(BLFontCore* self, const(BLFontFeatureSettingsCore)* featureSettings);
version(BindBlend2D_Static) BLResult blFontResetFeatureSettings(BLFontCore* self);
version(BindBlend2D_Static) BLResult blFontShape(const(BLFontCore)* self, BLGlyphBufferCore* gb);
version(BindBlend2D_Static) BLResult blFontMapTextToGlyphs(const(BLFontCore)* self, BLGlyphBufferCore* gb, BLGlyphMappingState* stateOut);
version(BindBlend2D_Static) BLResult blFontPositionGlyphs(const(BLFontCore)* self, BLGlyphBufferCore* gb, uint positioningFlags);
version(BindBlend2D_Static) BLResult blFontApplyKerning(const(BLFontCore)* self, BLGlyphBufferCore* gb);
version(BindBlend2D_Static) BLResult blFontApplyGSub(const(BLFontCore)* self, BLGlyphBufferCore* gb, const(BLBitSetCore)* lookups);
version(BindBlend2D_Static) BLResult blFontApplyGPos(const(BLFontCore)* self, BLGlyphBufferCore* gb, const(BLBitSetCore)* lookups);
version(BindBlend2D_Static) BLResult blFontGetTextMetrics(const(BLFontCore)* self, BLGlyphBufferCore* gb, BLTextMetrics* out_);
version(BindBlend2D_Static) BLResult blFontGetGlyphBounds(const(BLFontCore)* self, const(uint)* glyphData, intptr_t glyphAdvance, BLBoxI* out_, size_t count);
version(BindBlend2D_Static) BLResult blFontGetGlyphAdvances(const(BLFontCore)* self, const(uint)* glyphData, intptr_t glyphAdvance, BLGlyphPlacement* out_, size_t count);
version(BindBlend2D_Static) BLResult blFontGetGlyphOutlines(const(BLFontCore)* self, uint glyphId, const(BLMatrix2D)* userMatrix, BLPathCore* out_, BLPathSinkFunc sink, void* closure);
version(BindBlend2D_Static) BLResult blFontGetGlyphRunOutlines(const(BLFontCore)* self, const(BLGlyphRun)* glyphRun, const(BLMatrix2D)* userMatrix, BLPathCore* out_, BLPathSinkFunc sink, void* closure);

struct BLFontCore
{
    BLObjectDetail _d;
}

struct BLFontImpl
{
    BLFontFaceCore face;
    ushort weight;
    ubyte stretch;
    ubyte style;
    uint reserved;
    BLFontMetrics metrics;
    BLFontMatrix matrix;
    BLFontFeatureSettingsCore featureSettings;
    BLFontVariationSettingsCore variationSettings;
}

enum BLFormat
{
    BL_FORMAT_NONE = 0,
    BL_FORMAT_PRGB32 = 1,
    BL_FORMAT_XRGB32 = 2,
    BL_FORMAT_A8 = 3,
    BL_FORMAT_MAX_VALUE = 3,
    BL_FORMAT_RESERVED_COUNT = 16,
    BL_FORMAT_FORCE_UINT = 0xFFFFFFFFu
}

enum BLFormatFlags
{
    BL_FORMAT_NO_FLAGS = 0u,
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
    BL_FORMAT_FLAG_LE = (1234 == 1234) ? cast(uint) 0 : cast(uint) BL_FORMAT_FLAG_BYTE_SWAP,
    BL_FORMAT_FLAG_BE = (1234 == 4321) ? cast(uint) 0 : cast(uint) BL_FORMAT_FLAG_BYTE_SWAP,
    BL_FORMAT_FLAG_FORCE_UINT = 0xFFFFFFFFu
}

version(BindBlend2D_Static) BLResult blFormatInfoQuery(BLFormatInfo* self, BLFormat format);
version(BindBlend2D_Static) BLResult blFormatInfoSanitize(BLFormatInfo* self);

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

enum BLImageCodecFeatures
{
    BL_IMAGE_CODEC_NO_FEATURES = 0u,
    BL_IMAGE_CODEC_FEATURE_READ = 0x00000001u,
    BL_IMAGE_CODEC_FEATURE_WRITE = 0x00000002u,
    BL_IMAGE_CODEC_FEATURE_LOSSLESS = 0x00000004u,
    BL_IMAGE_CODEC_FEATURE_LOSSY = 0x00000008u,
    BL_IMAGE_CODEC_FEATURE_MULTI_FRAME = 0x00000010u,
    BL_IMAGE_CODEC_FEATURE_IPTC = 0x10000000u,
    BL_IMAGE_CODEC_FEATURE_EXIF = 0x20000000u,
    BL_IMAGE_CODEC_FEATURE_XMP = 0x40000000u,
    BL_IMAGE_CODEC_FEATURE_FORCE_UINT = 0xFFFFFFFFu
}

version(BindBlend2D_Static) BLResult blImageCodecInit(BLImageCodecCore* self);
version(BindBlend2D_Static) BLResult blImageCodecInitMove(BLImageCodecCore* self, BLImageCodecCore* other);
version(BindBlend2D_Static) BLResult blImageCodecInitWeak(BLImageCodecCore* self, const(BLImageCodecCore)* other);
version(BindBlend2D_Static) BLResult blImageCodecInitByName(BLImageCodecCore* self, const(char)* name, size_t size, const(BLArrayCore)* codecs);
version(BindBlend2D_Static) BLResult blImageCodecDestroy(BLImageCodecCore* self);
version(BindBlend2D_Static) BLResult blImageCodecReset(BLImageCodecCore* self);
version(BindBlend2D_Static) BLResult blImageCodecAssignMove(BLImageCodecCore* self, BLImageCodecCore* other);
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

struct BLImageCodecCore
{
    BLObjectDetail _d;
}

struct BLImageCodecVirt
{
    BLObjectVirtBase base;
    uint function(const(BLImageCodecImpl)* impl, const(ubyte)* data, size_t size) inspectData;
    BLResult function(const(BLImageCodecImpl)* impl, BLImageDecoderCore* dst) createDecoder;
    BLResult function(const(BLImageCodecImpl)* impl, BLImageEncoderCore* dst) createEncoder;
}

struct BLImageCodecImpl
{
    const(BLImageCodecVirt)* virt;
    BLStringCore name;
    BLStringCore vendor;
    BLStringCore mimeType;
    BLStringCore extensions;
    uint features;
}

enum BLImageInfoFlags
{
    BL_IMAGE_INFO_FLAG_NO_FLAGS = 0u,
    BL_IMAGE_INFO_FLAG_PROGRESSIVE = 0x00000001u,
    BL_IMAGE_INFO_FLAG_FORCE_UINT = 0xFFFFFFFFu
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
    BL_IMAGE_SCALE_FILTER_MAX_VALUE = 14,
    BL_IMAGE_SCALE_FILTER_FORCE_UINT = 0xFFFFFFFFu
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

        struct _Anonymous_4
        {
            double b;
            double c;
        }

        _Anonymous_4 mitchell;
    }
}

version(BindBlend2D_Static) BLResult blImageInit(BLImageCore* self);
version(BindBlend2D_Static) BLResult blImageInitMove(BLImageCore* self, BLImageCore* other);
version(BindBlend2D_Static) BLResult blImageInitWeak(BLImageCore* self, const(BLImageCore)* other);
version(BindBlend2D_Static) BLResult blImageInitAs(BLImageCore* self, int w, int h, BLFormat format);
version(BindBlend2D_Static) BLResult blImageInitAsFromData(BLImageCore* self, int w, int h, BLFormat format, void* pixelData, intptr_t stride, BLDestroyExternalDataFunc destroyFunc, void* userData);
version(BindBlend2D_Static) BLResult blImageDestroy(BLImageCore* self);
version(BindBlend2D_Static) BLResult blImageReset(BLImageCore* self);
version(BindBlend2D_Static) BLResult blImageAssignMove(BLImageCore* self, BLImageCore* other);
version(BindBlend2D_Static) BLResult blImageAssignWeak(BLImageCore* self, const(BLImageCore)* other);
version(BindBlend2D_Static) BLResult blImageAssignDeep(BLImageCore* self, const(BLImageCore)* other);
version(BindBlend2D_Static) BLResult blImageCreate(BLImageCore* self, int w, int h, BLFormat format);
version(BindBlend2D_Static) BLResult blImageCreateFromData(BLImageCore* self, int w, int h, BLFormat format, void* pixelData, intptr_t stride, BLDestroyExternalDataFunc destroyFunc, void* userData);
version(BindBlend2D_Static) BLResult blImageGetData(const(BLImageCore)* self, BLImageData* dataOut);
version(BindBlend2D_Static) BLResult blImageMakeMutable(BLImageCore* self, BLImageData* dataOut);
version(BindBlend2D_Static) BLResult blImageConvert(BLImageCore* self, BLFormat format);
version(BindBlend2D_Static) bool blImageEquals(const(BLImageCore)* a, const(BLImageCore)* b);
version(BindBlend2D_Static) BLResult blImageScale(BLImageCore* dst, const(BLImageCore)* src, const(BLSizeI)* size, uint filter, const(BLImageScaleOptions)* options);
version(BindBlend2D_Static) BLResult blImageReadFromFile(BLImageCore* self, const(char)* fileName, const(BLArrayCore)* codecs);
version(BindBlend2D_Static) BLResult blImageReadFromData(BLImageCore* self, const(void)* data, size_t size, const(BLArrayCore)* codecs);
version(BindBlend2D_Static) BLResult blImageWriteToFile(const(BLImageCore)* self, const(char)* fileName, const(BLImageCodecCore)* codec);
version(BindBlend2D_Static) BLResult blImageWriteToData(const(BLImageCore)* self, BLArrayCore* dst, const(BLImageCodecCore)* codec);

struct BLImageCore
{
    BLObjectDetail _d;
}

struct BLImageImpl
{
    void* pixelData;
    intptr_t stride;
    BLSizeI size;
    ubyte format;
    ubyte flags;
    ushort depth;
    ubyte[4] reserved;
}

alias BLMapPointDArrayFunc = uint function(const(void)* ctx, BLPoint* dst, const(BLPoint)* src, size_t count);

enum BLMatrix2DType
{
    BL_MATRIX2D_TYPE_IDENTITY = 0,
    BL_MATRIX2D_TYPE_TRANSLATE = 1,
    BL_MATRIX2D_TYPE_SCALE = 2,
    BL_MATRIX2D_TYPE_SWAP = 3,
    BL_MATRIX2D_TYPE_AFFINE = 4,
    BL_MATRIX2D_TYPE_INVALID = 5,
    BL_MATRIX2D_TYPE_MAX_VALUE = 5,
    BL_MATRIX2D_TYPE_FORCE_UINT = 0xFFFFFFFFu
}

enum BLMatrix2DValue
{
    BL_MATRIX2D_VALUE_00 = 0,
    BL_MATRIX2D_VALUE_01 = 1,
    BL_MATRIX2D_VALUE_10 = 2,
    BL_MATRIX2D_VALUE_11 = 3,
    BL_MATRIX2D_VALUE_20 = 4,
    BL_MATRIX2D_VALUE_21 = 5,
    BL_MATRIX2D_VALUE_MAX_VALUE = 5,
    BL_MATRIX2D_VALUE_FORCE_UINT = 0xFFFFFFFFu
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
    BL_MATRIX2D_OP_MAX_VALUE = 13,
    BL_MATRIX2D_OP_FORCE_UINT = 0xFFFFFFFFu
}

version(BindBlend2D_Static) BLResult blMatrix2DSetIdentity(BLMatrix2D* self);
version(BindBlend2D_Static) BLResult blMatrix2DSetTranslation(BLMatrix2D* self, double x, double y);
version(BindBlend2D_Static) BLResult blMatrix2DSetScaling(BLMatrix2D* self, double x, double y);
version(BindBlend2D_Static) BLResult blMatrix2DSetSkewing(BLMatrix2D* self, double x, double y);
version(BindBlend2D_Static) BLResult blMatrix2DSetRotation(BLMatrix2D* self, double angle, double cx, double cy);
version(BindBlend2D_Static) BLResult blMatrix2DApplyOp(BLMatrix2D* self, BLMatrix2DOp opType, const(void)* opData);
version(BindBlend2D_Static) BLResult blMatrix2DInvert(BLMatrix2D* dst, const(BLMatrix2D)* src);
version(BindBlend2D_Static) BLMatrix2DType blMatrix2DGetType(const(BLMatrix2D)* self);
version(BindBlend2D_Static) BLResult blMatrix2DMapPointDArray(const(BLMatrix2D)* self, BLPoint* dst, const(BLPoint)* src, size_t count);
extern __gshared BLMapPointDArrayFunc[6] blMatrix2DMapPointDArrayFuncs;

struct BLMatrix2D
{
    union
    {
        double[6] m;

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

struct BLRgba32
{
    uint value;
}

struct BLRgba64
{
    ulong value;
}

struct BLRgba
{
    float r;
    float g;
    float b;
    float a;
}

struct BLVarCore
{
    BLObjectDetail _d;
}

version(BindBlend2D_Static) BLResult blVarInitType(BLUnknown* self, BLObjectType type);
version(BindBlend2D_Static) BLResult blVarInitNull(BLUnknown* self);
version(BindBlend2D_Static) BLResult blVarInitBool(BLUnknown* self, bool value);
version(BindBlend2D_Static) BLResult blVarInitInt32(BLUnknown* self, int value);
version(BindBlend2D_Static) BLResult blVarInitInt64(BLUnknown* self, long value);
version(BindBlend2D_Static) BLResult blVarInitUInt32(BLUnknown* self, uint value);
version(BindBlend2D_Static) BLResult blVarInitUInt64(BLUnknown* self, ulong value);
version(BindBlend2D_Static) BLResult blVarInitDouble(BLUnknown* self, double value);
version(BindBlend2D_Static) BLResult blVarInitRgba(BLUnknown* self, const(BLRgba)* rgba);
version(BindBlend2D_Static) BLResult blVarInitRgba32(BLUnknown* self, uint rgba32);
version(BindBlend2D_Static) BLResult blVarInitRgba64(BLUnknown* self, ulong rgba64);
version(BindBlend2D_Static) BLResult blVarInitMove(BLUnknown* self, BLUnknown* other);
version(BindBlend2D_Static) BLResult blVarInitWeak(BLUnknown* self, const(BLUnknown)* other);
version(BindBlend2D_Static) BLResult blVarDestroy(BLUnknown* self);
version(BindBlend2D_Static) BLResult blVarReset(BLUnknown* self);
version(BindBlend2D_Static) BLResult blVarAssignNull(BLUnknown* self);
version(BindBlend2D_Static) BLResult blVarAssignBool(BLUnknown* self, bool value);
version(BindBlend2D_Static) BLResult blVarAssignInt32(BLUnknown* self, int value);
version(BindBlend2D_Static) BLResult blVarAssignInt64(BLUnknown* self, long value);
version(BindBlend2D_Static) BLResult blVarAssignUInt32(BLUnknown* self, uint value);
version(BindBlend2D_Static) BLResult blVarAssignUInt64(BLUnknown* self, ulong value);
version(BindBlend2D_Static) BLResult blVarAssignDouble(BLUnknown* self, double value);
version(BindBlend2D_Static) BLResult blVarAssignRgba(BLUnknown* self, const(BLRgba)* rgba);
version(BindBlend2D_Static) BLResult blVarAssignRgba32(BLUnknown* self, uint rgba32);
version(BindBlend2D_Static) BLResult blVarAssignRgba64(BLUnknown* self, ulong rgba64);
version(BindBlend2D_Static) BLResult blVarAssignMove(BLUnknown* self, BLUnknown* other);
version(BindBlend2D_Static) BLResult blVarAssignWeak(BLUnknown* self, const(BLUnknown)* other);
version(BindBlend2D_Static) BLObjectType blVarGetType(const(BLUnknown)* self);
version(BindBlend2D_Static) BLResult blVarToBool(const(BLUnknown)* self, bool* out_);
version(BindBlend2D_Static) BLResult blVarToInt32(const(BLUnknown)* self, int* out_);
version(BindBlend2D_Static) BLResult blVarToInt64(const(BLUnknown)* self, long* out_);
version(BindBlend2D_Static) BLResult blVarToUInt32(const(BLUnknown)* self, uint* out_);
version(BindBlend2D_Static) BLResult blVarToUInt64(const(BLUnknown)* self, ulong* out_);
version(BindBlend2D_Static) BLResult blVarToDouble(const(BLUnknown)* self, double* out_);
version(BindBlend2D_Static) BLResult blVarToRgba(const(BLUnknown)* self, BLRgba* out_);
version(BindBlend2D_Static) BLResult blVarToRgba32(const(BLUnknown)* self, uint* out_);
version(BindBlend2D_Static) BLResult blVarToRgba64(const(BLUnknown)* self, ulong* out_);
version(BindBlend2D_Static) bool blVarEquals(const(BLUnknown)* a, const(BLUnknown)* b);
version(BindBlend2D_Static) bool blVarEqualsNull(const(BLUnknown)* self);
version(BindBlend2D_Static) bool blVarEqualsBool(const(BLUnknown)* self, bool value);
version(BindBlend2D_Static) bool blVarEqualsInt64(const(BLUnknown)* self, long value);
version(BindBlend2D_Static) bool blVarEqualsUInt64(const(BLUnknown)* self, ulong value);
version(BindBlend2D_Static) bool blVarEqualsDouble(const(BLUnknown)* self, double value);
version(BindBlend2D_Static) bool blVarStrictEquals(const(BLUnknown)* a, const(BLUnknown)* b);

enum BLContextType
{
    BL_CONTEXT_TYPE_NONE = 0,
    BL_CONTEXT_TYPE_DUMMY = 1,
    BL_CONTEXT_TYPE_RASTER = 3,
    BL_CONTEXT_TYPE_MAX_VALUE = 3,
    BL_CONTEXT_TYPE_FORCE_UINT = 0xFFFFFFFFu
}

enum BLContextHint
{
    BL_CONTEXT_HINT_RENDERING_QUALITY = 0,
    BL_CONTEXT_HINT_GRADIENT_QUALITY = 1,
    BL_CONTEXT_HINT_PATTERN_QUALITY = 2,
    BL_CONTEXT_HINT_MAX_VALUE = 7,
    BL_CONTEXT_HINT_FORCE_UINT = 0xFFFFFFFFu
}

enum BLContextOpType
{
    BL_CONTEXT_OP_TYPE_FILL = 0,
    BL_CONTEXT_OP_TYPE_STROKE = 1,
    BL_CONTEXT_OP_TYPE_MAX_VALUE = 1,
    BL_CONTEXT_OP_TYPE_FORCE_UINT = 0xFFFFFFFFu
}

enum BLContextFlushFlags
{
    BL_CONTEXT_FLUSH_NO_FLAGS = 0u,
    BL_CONTEXT_FLUSH_SYNC = 0x80000000u,
    BL_CONTEXT_FLUSH_FORCE_UINT = 0xFFFFFFFFu
}

enum BLContextCreateFlags
{
    BL_CONTEXT_CREATE_NO_FLAGS = 0u,
    BL_CONTEXT_CREATE_FLAG_DISABLE_JIT = 0x00000001u,
    BL_CONTEXT_CREATE_FLAG_FALLBACK_TO_SYNC = 0x00100000u,
    BL_CONTEXT_CREATE_FLAG_ISOLATED_THREAD_POOL = 0x01000000u,
    BL_CONTEXT_CREATE_FLAG_ISOLATED_JIT_RUNTIME = 0x02000000u,
    BL_CONTEXT_CREATE_FLAG_ISOLATED_JIT_LOGGING = 0x04000000u,
    BL_CONTEXT_CREATE_FLAG_OVERRIDE_CPU_FEATURES = 0x08000000u,
    BL_CONTEXT_CREATE_FLAG_FORCE_UINT = 0xFFFFFFFFu
}

enum BLContextErrorFlags
{
    BL_CONTEXT_ERROR_NO_FLAGS = 0u,
    BL_CONTEXT_ERROR_FLAG_INVALID_VALUE = 0x00000001u,
    BL_CONTEXT_ERROR_FLAG_INVALID_STATE = 0x00000002u,
    BL_CONTEXT_ERROR_FLAG_INVALID_GEOMETRY = 0x00000004u,
    BL_CONTEXT_ERROR_FLAG_INVALID_GLYPH = 0x00000008u,
    BL_CONTEXT_ERROR_FLAG_INVALID_FONT = 0x00000010u,
    BL_CONTEXT_ERROR_FLAG_THREAD_POOL_EXHAUSTED = 0x20000000u,
    BL_CONTEXT_ERROR_FLAG_OUT_OF_MEMORY = 0x40000000u,
    BL_CONTEXT_ERROR_FLAG_UNKNOWN_ERROR = 0x80000000u,
    BL_CONTEXT_ERROR_FLAG_FORCE_UINT = 0xFFFFFFFFu
}

enum BLClipMode
{
    BL_CLIP_MODE_ALIGNED_RECT = 0,
    BL_CLIP_MODE_UNALIGNED_RECT = 1,
    BL_CLIP_MODE_MASK = 2,
    BL_CLIP_MODE_COUNT = 3,
    BL_CLIP_MODE_FORCE_UINT = 0xFFFFFFFFu
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
    BL_COMP_OP_MAX_VALUE = 28,
    BL_COMP_OP_FORCE_UINT = 0xFFFFFFFFu
}

enum BLGradientQuality
{
    BL_GRADIENT_QUALITY_NEAREST = 0,
    BL_GRADIENT_QUALITY_MAX_VALUE = 0,
    BL_GRADIENT_QUALITY_FORCE_UINT = 0xFFFFFFFFu
}

enum BLPatternQuality
{
    BL_PATTERN_QUALITY_NEAREST = 0,
    BL_PATTERN_QUALITY_BILINEAR = 1,
    BL_PATTERN_QUALITY_MAX_VALUE = 1,
    BL_PATTERN_QUALITY_FORCE_UINT = 0xFFFFFFFFu
}

enum BLRenderingQuality
{
    BL_RENDERING_QUALITY_ANTIALIAS = 0,
    BL_RENDERING_QUALITY_MAX_VALUE = 0,
    BL_RENDERING_QUALITY_FORCE_UINT = 0xFFFFFFFFu
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

        ubyte[8] hints;
    }
}

struct BLContextCore
{
    BLObjectDetail _d;
}

version(BindBlend2D_Static) BLResult blContextInit(BLContextCore* self);
version(BindBlend2D_Static) BLResult blContextInitMove(BLContextCore* self, BLContextCore* other);
version(BindBlend2D_Static) BLResult blContextInitWeak(BLContextCore* self, const(BLContextCore)* other);
version(BindBlend2D_Static) BLResult blContextInitAs(BLContextCore* self, BLImageCore* image, const(BLContextCreateInfo)* cci);
version(BindBlend2D_Static) BLResult blContextDestroy(BLContextCore* self);
version(BindBlend2D_Static) BLResult blContextReset(BLContextCore* self);
version(BindBlend2D_Static) BLResult blContextAssignMove(BLContextCore* self, BLContextCore* other);
version(BindBlend2D_Static) BLResult blContextAssignWeak(BLContextCore* self, const(BLContextCore)* other);
version(BindBlend2D_Static) BLContextType blContextGetType(const(BLContextCore)* self);
version(BindBlend2D_Static) BLResult blContextGetTargetSize(const(BLContextCore)* self, BLSize* targetSizeOut);
version(BindBlend2D_Static) BLImageCore* blContextGetTargetImage(const(BLContextCore)* self);
version(BindBlend2D_Static) BLResult blContextBegin(BLContextCore* self, BLImageCore* image, const(BLContextCreateInfo)* cci);
version(BindBlend2D_Static) BLResult blContextEnd(BLContextCore* self);
version(BindBlend2D_Static) BLResult blContextFlush(BLContextCore* self, BLContextFlushFlags flags);
version(BindBlend2D_Static) BLResult blContextSave(BLContextCore* self, BLContextCookie* cookie);
version(BindBlend2D_Static) BLResult blContextRestore(BLContextCore* self, const(BLContextCookie)* cookie);
version(BindBlend2D_Static) BLResult blContextGetMetaMatrix(const(BLContextCore)* self, BLMatrix2D* m);
version(BindBlend2D_Static) BLResult blContextGetUserMatrix(const(BLContextCore)* self, BLMatrix2D* m);
version(BindBlend2D_Static) BLResult blContextUserToMeta(BLContextCore* self);
version(BindBlend2D_Static) BLResult blContextMatrixOp(BLContextCore* self, BLMatrix2DOp opType, const(void)* opData);
version(BindBlend2D_Static) uint blContextGetHint(const(BLContextCore)* self, BLContextHint hintType);
version(BindBlend2D_Static) BLResult blContextSetHint(BLContextCore* self, BLContextHint hintType, uint value);
version(BindBlend2D_Static) BLResult blContextGetHints(const(BLContextCore)* self, BLContextHints* hintsOut);
version(BindBlend2D_Static) BLResult blContextSetHints(BLContextCore* self, const(BLContextHints)* hints);
version(BindBlend2D_Static) BLResult blContextSetFlattenMode(BLContextCore* self, BLFlattenMode mode);
version(BindBlend2D_Static) BLResult blContextSetFlattenTolerance(BLContextCore* self, double tolerance);
version(BindBlend2D_Static) BLResult blContextSetApproximationOptions(BLContextCore* self, const(BLApproximationOptions)* options);
version(BindBlend2D_Static) BLCompOp blContextGetCompOp(const(BLContextCore)* self);
version(BindBlend2D_Static) BLResult blContextSetCompOp(BLContextCore* self, BLCompOp compOp);
version(BindBlend2D_Static) double blContextGetGlobalAlpha(const(BLContextCore)* self);
version(BindBlend2D_Static) BLResult blContextSetGlobalAlpha(BLContextCore* self, double alpha);
version(BindBlend2D_Static) double blContextGetFillAlpha(const(BLContextCore)* self);
version(BindBlend2D_Static) BLResult blContextSetFillAlpha(BLContextCore* self, double alpha);
version(BindBlend2D_Static) BLResult blContextGetFillStyle(const(BLContextCore)* self, BLVarCore* varOut);
version(BindBlend2D_Static) BLResult blContextSetFillStyle(BLContextCore* self, const(BLUnknown)* var);
version(BindBlend2D_Static) BLResult blContextSetFillStyleRgba(BLContextCore* self, const(BLRgba)* rgba);
version(BindBlend2D_Static) BLResult blContextSetFillStyleRgba32(BLContextCore* self, uint rgba32);
version(BindBlend2D_Static) BLResult blContextSetFillStyleRgba64(BLContextCore* self, ulong rgba64);
version(BindBlend2D_Static) BLFillRule blContextGetFillRule(const(BLContextCore)* self);
version(BindBlend2D_Static) BLResult blContextSetFillRule(BLContextCore* self, BLFillRule fillRule);
version(BindBlend2D_Static) double blContextGetStrokeAlpha(const(BLContextCore)* self);
version(BindBlend2D_Static) BLResult blContextSetStrokeAlpha(BLContextCore* self, double alpha);
version(BindBlend2D_Static) BLResult blContextGetStrokeStyle(const(BLContextCore)* self, BLVarCore* varOut);
version(BindBlend2D_Static) BLResult blContextSetStrokeStyle(BLContextCore* self, const(BLUnknown)* var);
version(BindBlend2D_Static) BLResult blContextSetStrokeStyleRgba(BLContextCore* self, const(BLRgba)* rgba);
version(BindBlend2D_Static) BLResult blContextSetStrokeStyleRgba32(BLContextCore* self, uint rgba32);
version(BindBlend2D_Static) BLResult blContextSetStrokeStyleRgba64(BLContextCore* self, ulong rgba64);
version(BindBlend2D_Static) double blContextGetStrokeWidth(const(BLContextCore)* self);
version(BindBlend2D_Static) BLResult blContextSetStrokeWidth(BLContextCore* self, double width);
version(BindBlend2D_Static) double blContextGetStrokeMiterLimit(const(BLContextCore)* self);
version(BindBlend2D_Static) BLResult blContextSetStrokeMiterLimit(BLContextCore* self, double miterLimit);
version(BindBlend2D_Static) BLStrokeCap blContextGetStrokeCap(const(BLContextCore)* self, BLStrokeCapPosition position);
version(BindBlend2D_Static) BLResult blContextSetStrokeCap(BLContextCore* self, BLStrokeCapPosition position, BLStrokeCap strokeCap);
version(BindBlend2D_Static) BLResult blContextSetStrokeCaps(BLContextCore* self, BLStrokeCap strokeCap);
version(BindBlend2D_Static) BLStrokeJoin blContextGetStrokeJoin(const(BLContextCore)* self);
version(BindBlend2D_Static) BLResult blContextSetStrokeJoin(BLContextCore* self, BLStrokeJoin strokeJoin);
version(BindBlend2D_Static) BLStrokeTransformOrder blContextGetStrokeTransformOrder(const(BLContextCore)* self);
version(BindBlend2D_Static) BLResult blContextSetStrokeTransformOrder(BLContextCore* self, BLStrokeTransformOrder transformOrder);
version(BindBlend2D_Static) double blContextGetStrokeDashOffset(const(BLContextCore)* self);
version(BindBlend2D_Static) BLResult blContextSetStrokeDashOffset(BLContextCore* self, double dashOffset);
version(BindBlend2D_Static) BLResult blContextGetStrokeDashArray(const(BLContextCore)* self, BLArrayCore* dashArrayOut);
version(BindBlend2D_Static) BLResult blContextSetStrokeDashArray(BLContextCore* self, const(BLArrayCore)* dashArray);
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
version(BindBlend2D_Static) BLResult blContextFillGeometry(BLContextCore* self, BLGeometryType geometryType, const(void)* geometryData);
version(BindBlend2D_Static) BLResult blContextFillTextI(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, BLTextEncoding encoding);
version(BindBlend2D_Static) BLResult blContextFillTextD(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, BLTextEncoding encoding);
version(BindBlend2D_Static) BLResult blContextFillGlyphRunI(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
version(BindBlend2D_Static) BLResult blContextFillGlyphRunD(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
version(BindBlend2D_Static) BLResult blContextFillMaskI(BLContextCore* self, const(BLPointI)* pt, const(BLImageCore)* mask, const(BLRectI)* maskArea);
version(BindBlend2D_Static) BLResult blContextFillMaskD(BLContextCore* self, const(BLPoint)* pt, const(BLImageCore)* mask, const(BLRectI)* maskArea);
version(BindBlend2D_Static) BLResult blContextStrokeRectI(BLContextCore* self, const(BLRectI)* rect);
version(BindBlend2D_Static) BLResult blContextStrokeRectD(BLContextCore* self, const(BLRect)* rect);
version(BindBlend2D_Static) BLResult blContextStrokePathD(BLContextCore* self, const(BLPathCore)* path);
version(BindBlend2D_Static) BLResult blContextStrokeGeometry(BLContextCore* self, BLGeometryType geometryType, const(void)* geometryData);
version(BindBlend2D_Static) BLResult blContextStrokeTextI(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, BLTextEncoding encoding);
version(BindBlend2D_Static) BLResult blContextStrokeTextD(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, BLTextEncoding encoding);
version(BindBlend2D_Static) BLResult blContextStrokeGlyphRunI(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
version(BindBlend2D_Static) BLResult blContextStrokeGlyphRunD(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
version(BindBlend2D_Static) BLResult blContextBlitImageI(BLContextCore* self, const(BLPointI)* pt, const(BLImageCore)* img, const(BLRectI)* imgArea);
version(BindBlend2D_Static) BLResult blContextBlitImageD(BLContextCore* self, const(BLPoint)* pt, const(BLImageCore)* img, const(BLRectI)* imgArea);
version(BindBlend2D_Static) BLResult blContextBlitScaledImageI(BLContextCore* self, const(BLRectI)* rect, const(BLImageCore)* img, const(BLRectI)* imgArea);
version(BindBlend2D_Static) BLResult blContextBlitScaledImageD(BLContextCore* self, const(BLRect)* rect, const(BLImageCore)* img, const(BLRectI)* imgArea);

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
    BLObjectVirtBase base;
    BLResult function(BLContextImpl* impl, BLContextFlushFlags flags) flush;
    BLResult function(BLContextImpl* impl, BLContextCookie* cookie) save;
    BLResult function(BLContextImpl* impl, const(BLContextCookie)* cookie) restore;
    BLResult function(BLContextImpl* impl, BLMatrix2DOp opType, const(void)* opData) matrixOp;
    BLResult function(BLContextImpl* impl) userToMeta;
    BLResult function(BLContextImpl* impl, BLContextHint hintType, uint value) setHint;
    BLResult function(BLContextImpl* impl, const(BLContextHints)* hints) setHints;
    BLResult function(BLContextImpl* impl, BLFlattenMode mode) setFlattenMode;
    BLResult function(BLContextImpl* impl, double tolerance) setFlattenTolerance;
    BLResult function(BLContextImpl* impl, const(BLApproximationOptions)* options) setApproximationOptions;
    BLResult function(BLContextImpl* impl, BLCompOp compOp) setCompOp;
    BLResult function(BLContextImpl* impl, double alpha) setGlobalAlpha;
    BLResult function(BLContextImpl* impl, double alpha)[2] setStyleAlpha;
    BLResult function(const(BLContextImpl)* impl, BLVarCore* out_)[2] getStyle;
    BLResult function(BLContextImpl* impl, const(BLUnknown)* var)[2] setStyle;
    BLResult function(BLContextImpl* impl, const(BLRgba)* rgba)[2] setStyleRgba;
    BLResult function(BLContextImpl* impl, uint rgba32)[2] setStyleRgba32;
    BLResult function(BLContextImpl* impl, ulong rgba64)[2] setStyleRgba64;
    BLResult function(BLContextImpl* impl, BLFillRule fillRule) setFillRule;
    BLResult function(BLContextImpl* impl, double width) setStrokeWidth;
    BLResult function(BLContextImpl* impl, double miterLimit) setStrokeMiterLimit;
    BLResult function(BLContextImpl* impl, BLStrokeCapPosition position, BLStrokeCap strokeCap) setStrokeCap;
    BLResult function(BLContextImpl* impl, BLStrokeCap strokeCap) setStrokeCaps;
    BLResult function(BLContextImpl* impl, BLStrokeJoin strokeJoin) setStrokeJoin;
    BLResult function(BLContextImpl* impl, double dashOffset) setStrokeDashOffset;
    BLResult function(BLContextImpl* impl, const(BLArrayCore)* dashArray) setStrokeDashArray;
    BLResult function(BLContextImpl* impl, BLStrokeTransformOrder transformOrder) setStrokeTransformOrder;
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
    BLResult function(BLContextImpl* impl, BLGeometryType geometryType, const(void)* geometryData) fillGeometry;
    BLResult function(BLContextImpl* impl, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, BLTextEncoding encoding) fillTextI;
    BLResult function(BLContextImpl* impl, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, BLTextEncoding encoding) fillTextD;
    BLResult function(BLContextImpl* impl, const(BLPointI)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun) fillGlyphRunI;
    BLResult function(BLContextImpl* impl, const(BLPoint)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun) fillGlyphRunD;
    BLResult function(BLContextImpl* impl, const(BLPointI)* pt, const(BLImageCore)* mask, const(BLRectI)* maskArea) fillMaskI;
    BLResult function(BLContextImpl* impl, const(BLPoint)* pt, const(BLImageCore)* mask, const(BLRectI)* maskArea) fillMaskD;
    BLResult function(BLContextImpl* impl, const(BLRectI)* rect) strokeRectI;
    BLResult function(BLContextImpl* impl, const(BLRect)* rect) strokeRectD;
    BLResult function(BLContextImpl* impl, const(BLPathCore)* path) strokePathD;
    BLResult function(BLContextImpl* impl, BLGeometryType geometryType, const(void)* geometryData) strokeGeometry;
    BLResult function(BLContextImpl* impl, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, BLTextEncoding encoding) strokeTextI;
    BLResult function(BLContextImpl* impl, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, BLTextEncoding encoding) strokeTextD;
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
    const(BLContextState)* state;
    uint contextType;
}

struct BLFontManagerCore
{
    BLObjectDetail _d;
}

version(BindBlend2D_Static) BLResult blFontManagerInit(BLFontManagerCore* self);
version(BindBlend2D_Static) BLResult blFontManagerInitMove(BLFontManagerCore* self, BLFontManagerCore* other);
version(BindBlend2D_Static) BLResult blFontManagerInitWeak(BLFontManagerCore* self, const(BLFontManagerCore)* other);
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

struct BLFontManagerVirt
{
    BLObjectVirtBase base;
}

struct BLFontManagerImpl
{
    const(BLFontManagerVirt)* virt;
}

enum BLGradientType
{
    BL_GRADIENT_TYPE_LINEAR = 0,
    BL_GRADIENT_TYPE_RADIAL = 1,
    BL_GRADIENT_TYPE_CONICAL = 2,
    BL_GRADIENT_TYPE_MAX_VALUE = 2,
    BL_GRADIENT_TYPE_FORCE_UINT = 0xFFFFFFFFu
}

enum BLGradientValue
{
    BL_GRADIENT_VALUE_COMMON_X0 = 0,
    BL_GRADIENT_VALUE_COMMON_Y0 = 1,
    BL_GRADIENT_VALUE_COMMON_X1 = 2,
    BL_GRADIENT_VALUE_COMMON_Y1 = 3,
    BL_GRADIENT_VALUE_RADIAL_R0 = 4,
    BL_GRADIENT_VALUE_CONICAL_ANGLE = 2,
    BL_GRADIENT_VALUE_MAX_VALUE = 5,
    BL_GRADIENT_VALUE_FORCE_UINT = 0xFFFFFFFFu
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

struct BLGradientCore
{
    BLObjectDetail _d;
}

version(BindBlend2D_Static) BLResult blGradientInit(BLGradientCore* self);
version(BindBlend2D_Static) BLResult blGradientInitMove(BLGradientCore* self, BLGradientCore* other);
version(BindBlend2D_Static) BLResult blGradientInitWeak(BLGradientCore* self, const(BLGradientCore)* other);
version(BindBlend2D_Static) BLResult blGradientInitAs(BLGradientCore* self, BLGradientType type, const(void)* values, BLExtendMode extendMode, const(BLGradientStop)* stops, size_t n, const(BLMatrix2D)* m);
version(BindBlend2D_Static) BLResult blGradientDestroy(BLGradientCore* self);
version(BindBlend2D_Static) BLResult blGradientReset(BLGradientCore* self);
version(BindBlend2D_Static) BLResult blGradientAssignMove(BLGradientCore* self, BLGradientCore* other);
version(BindBlend2D_Static) BLResult blGradientAssignWeak(BLGradientCore* self, const(BLGradientCore)* other);
version(BindBlend2D_Static) BLResult blGradientCreate(BLGradientCore* self, BLGradientType type, const(void)* values, BLExtendMode extendMode, const(BLGradientStop)* stops, size_t n, const(BLMatrix2D)* m);
version(BindBlend2D_Static) BLResult blGradientShrink(BLGradientCore* self);
version(BindBlend2D_Static) BLResult blGradientReserve(BLGradientCore* self, size_t n);
version(BindBlend2D_Static) BLGradientType blGradientGetType(const(BLGradientCore)* self);
version(BindBlend2D_Static) BLResult blGradientSetType(BLGradientCore* self, BLGradientType type);
version(BindBlend2D_Static) BLExtendMode blGradientGetExtendMode(const(BLGradientCore)* self);
version(BindBlend2D_Static) BLResult blGradientSetExtendMode(BLGradientCore* self, BLExtendMode extendMode);
version(BindBlend2D_Static) double blGradientGetValue(const(BLGradientCore)* self, size_t index);
version(BindBlend2D_Static) BLResult blGradientSetValue(BLGradientCore* self, size_t index, double value);
version(BindBlend2D_Static) BLResult blGradientSetValues(BLGradientCore* self, size_t index, const(double)* values, size_t n);
version(BindBlend2D_Static) size_t blGradientGetSize(const(BLGradientCore)* self);
version(BindBlend2D_Static) size_t blGradientGetCapacity(const(BLGradientCore)* self);
version(BindBlend2D_Static) const(BLGradientStop)* blGradientGetStops(const(BLGradientCore)* self);
version(BindBlend2D_Static) BLResult blGradientResetStops(BLGradientCore* self);
version(BindBlend2D_Static) BLResult blGradientAssignStops(BLGradientCore* self, const(BLGradientStop)* stops, size_t n);
version(BindBlend2D_Static) BLResult blGradientAddStopRgba32(BLGradientCore* self, double offset, uint argb32);
version(BindBlend2D_Static) BLResult blGradientAddStopRgba64(BLGradientCore* self, double offset, ulong argb64);
version(BindBlend2D_Static) BLResult blGradientRemoveStop(BLGradientCore* self, size_t index);
version(BindBlend2D_Static) BLResult blGradientRemoveStopByOffset(BLGradientCore* self, double offset, uint all);
version(BindBlend2D_Static) BLResult blGradientRemoveStopsByIndex(BLGradientCore* self, size_t rStart, size_t rEnd);
version(BindBlend2D_Static) BLResult blGradientRemoveStopsByOffset(BLGradientCore* self, double offsetMin, double offsetMax);
version(BindBlend2D_Static) BLResult blGradientReplaceStopRgba32(BLGradientCore* self, size_t index, double offset, uint rgba32);
version(BindBlend2D_Static) BLResult blGradientReplaceStopRgba64(BLGradientCore* self, size_t index, double offset, ulong rgba64);
version(BindBlend2D_Static) size_t blGradientIndexOfStop(const(BLGradientCore)* self, double offset);
version(BindBlend2D_Static) BLResult blGradientApplyMatrixOp(BLGradientCore* self, BLMatrix2DOp opType, const(void)* opData);
version(BindBlend2D_Static) bool blGradientEquals(const(BLGradientCore)* a, const(BLGradientCore)* b);

struct BLGradientImpl
{
    BLGradientStop* stops;
    size_t size;
    size_t capacity;
    ubyte gradientType;
    ubyte extendMode;
    ubyte matrixType;
    ubyte[1] reserved;
    BLMatrix2D matrix;

    union
    {
        double[6] values;
        BLLinearGradientValues linear;
        BLRadialGradientValues radial;
        BLConicalGradientValues conical;
    }
}

version(BindBlend2D_Static) BLResult blImageDecoderInit(BLImageDecoderCore* self);
version(BindBlend2D_Static) BLResult blImageDecoderInitMove(BLImageDecoderCore* self, BLImageDecoderCore* other);
version(BindBlend2D_Static) BLResult blImageDecoderInitWeak(BLImageDecoderCore* self, const(BLImageDecoderCore)* other);
version(BindBlend2D_Static) BLResult blImageDecoderDestroy(BLImageDecoderCore* self);
version(BindBlend2D_Static) BLResult blImageDecoderReset(BLImageDecoderCore* self);
version(BindBlend2D_Static) BLResult blImageDecoderAssignMove(BLImageDecoderCore* self, BLImageDecoderCore* other);
version(BindBlend2D_Static) BLResult blImageDecoderAssignWeak(BLImageDecoderCore* self, const(BLImageDecoderCore)* other);
version(BindBlend2D_Static) BLResult blImageDecoderRestart(BLImageDecoderCore* self);
version(BindBlend2D_Static) BLResult blImageDecoderReadInfo(BLImageDecoderCore* self, BLImageInfo* infoOut, const(ubyte)* data, size_t size);
version(BindBlend2D_Static) BLResult blImageDecoderReadFrame(BLImageDecoderCore* self, BLImageCore* imageOut, const(ubyte)* data, size_t size);

struct BLImageDecoderVirt
{
    BLObjectVirtBase base;
    BLResult function(BLImageDecoderImpl* impl) restart;
    BLResult function(BLImageDecoderImpl* impl, BLImageInfo* infoOut, const(ubyte)* data, size_t size) readInfo;
    BLResult function(BLImageDecoderImpl* impl, BLImageCore* imageOut, const(ubyte)* data, size_t size) readFrame;
}

struct BLImageDecoderImpl
{
    const(BLImageDecoderVirt)* virt;
    BLImageCodecCore codec;
    BLResult lastResult;
    void* handle;
    ulong frameIndex;
    size_t bufferIndex;
}

struct BLImageDecoderCore
{
    BLObjectDetail _d;
}

version(BindBlend2D_Static) BLResult blImageEncoderInit(BLImageEncoderCore* self);
version(BindBlend2D_Static) BLResult blImageEncoderInitMove(BLImageEncoderCore* self, BLImageEncoderCore* other);
version(BindBlend2D_Static) BLResult blImageEncoderInitWeak(BLImageEncoderCore* self, const(BLImageEncoderCore)* other);
version(BindBlend2D_Static) BLResult blImageEncoderDestroy(BLImageEncoderCore* self);
version(BindBlend2D_Static) BLResult blImageEncoderReset(BLImageEncoderCore* self);
version(BindBlend2D_Static) BLResult blImageEncoderAssignMove(BLImageEncoderCore* self, BLImageEncoderCore* other);
version(BindBlend2D_Static) BLResult blImageEncoderAssignWeak(BLImageEncoderCore* self, const(BLImageEncoderCore)* other);
version(BindBlend2D_Static) BLResult blImageEncoderRestart(BLImageEncoderCore* self);
version(BindBlend2D_Static) BLResult blImageEncoderWriteFrame(BLImageEncoderCore* self, BLArrayCore* dst, const(BLImageCore)* image);

struct BLImageEncoderVirt
{
    BLObjectVirtBase base;
    BLResult function(BLImageEncoderImpl* impl) restart;
    BLResult function(BLImageEncoderImpl* impl, BLArrayCore* dst, const(BLImageCore)* image) writeFrame;
}

struct BLImageEncoderImpl
{
    const(BLImageEncoderVirt)* virt;
    BLImageCodecCore codec;
    BLResult lastResult;
    void* handle;
    ulong frameIndex;
    size_t bufferIndex;
}

struct BLImageEncoderCore
{
    BLObjectDetail _d;
}

version(BindBlend2D_Static) BLResult blPatternInit(BLPatternCore* self);
version(BindBlend2D_Static) BLResult blPatternInitMove(BLPatternCore* self, BLPatternCore* other);
version(BindBlend2D_Static) BLResult blPatternInitWeak(BLPatternCore* self, const(BLPatternCore)* other);
version(BindBlend2D_Static) BLResult blPatternInitAs(BLPatternCore* self, const(BLImageCore)* image, const(BLRectI)* area, BLExtendMode extendMode, const(BLMatrix2D)* m);
version(BindBlend2D_Static) BLResult blPatternDestroy(BLPatternCore* self);
version(BindBlend2D_Static) BLResult blPatternReset(BLPatternCore* self);
version(BindBlend2D_Static) BLResult blPatternAssignMove(BLPatternCore* self, BLPatternCore* other);
version(BindBlend2D_Static) BLResult blPatternAssignWeak(BLPatternCore* self, const(BLPatternCore)* other);
version(BindBlend2D_Static) BLResult blPatternAssignDeep(BLPatternCore* self, const(BLPatternCore)* other);
version(BindBlend2D_Static) BLResult blPatternCreate(BLPatternCore* self, const(BLImageCore)* image, const(BLRectI)* area, BLExtendMode extendMode, const(BLMatrix2D)* m);
version(BindBlend2D_Static) BLResult blPatternGetImage(const(BLPatternCore)* self, BLImageCore* image);
version(BindBlend2D_Static) BLResult blPatternSetImage(BLPatternCore* self, const(BLImageCore)* image, const(BLRectI)* area);
version(BindBlend2D_Static) BLResult blPatternResetImage(BLPatternCore* self);
version(BindBlend2D_Static) BLResult blPatternGetArea(const(BLPatternCore)* self, BLRectI* areaOut);
version(BindBlend2D_Static) BLResult blPatternSetArea(BLPatternCore* self, const(BLRectI)* area);
version(BindBlend2D_Static) BLExtendMode blPatternGetExtendMode(const(BLPatternCore)* self);
version(BindBlend2D_Static) BLResult blPatternSetExtendMode(BLPatternCore* self, BLExtendMode extendMode);
version(BindBlend2D_Static) BLMatrix2DType blPatternGetMatrixType(const(BLPatternCore)* self);
version(BindBlend2D_Static) BLResult blPatternGetMatrix(const(BLPatternCore)* self, BLMatrix2D* matrixOut);
version(BindBlend2D_Static) BLResult blPatternApplyMatrixOp(BLPatternCore* self, BLMatrix2DOp opType, const(void)* opData);
version(BindBlend2D_Static) bool blPatternEquals(const(BLPatternCore)* a, const(BLPatternCore)* b);

struct BLPatternCore
{
    BLObjectDetail _d;
}

struct BLPatternImpl
{
    BLImageCore image;
    BLRectI area;
    BLMatrix2D matrix;
}

alias BLPixelConverterFunc = uint function(const(BLPixelConverterCore)* self, ubyte* dstData, intptr_t dstStride, const(ubyte)* srcData, intptr_t srcStride, uint w, uint h, const(BLPixelConverterOptions)* options);

enum BLPixelConverterCreateFlags
{
    BL_PIXEL_CONVERTER_CREATE_NO_FLAGS = 0u,
    BL_PIXEL_CONVERTER_CREATE_FLAG_DONT_COPY_PALETTE = 0x00000001u,
    BL_PIXEL_CONVERTER_CREATE_FLAG_ALTERABLE_PALETTE = 0x00000002u,
    BL_PIXEL_CONVERTER_CREATE_FLAG_NO_MULTI_STEP = 0x00000004u,
    BL_PIXEL_CONVERTER_CREATE_FLAG_FORCE_UINT = 0xFFFFFFFFu
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

version(BindBlend2D_Static) BLResult blPixelConverterInit(BLPixelConverterCore* self);
version(BindBlend2D_Static) BLResult blPixelConverterInitWeak(BLPixelConverterCore* self, const(BLPixelConverterCore)* other);
version(BindBlend2D_Static) BLResult blPixelConverterDestroy(BLPixelConverterCore* self);
version(BindBlend2D_Static) BLResult blPixelConverterReset(BLPixelConverterCore* self);
version(BindBlend2D_Static) BLResult blPixelConverterAssign(BLPixelConverterCore* self, const(BLPixelConverterCore)* other);
version(BindBlend2D_Static) BLResult blPixelConverterCreate(BLPixelConverterCore* self, const(BLFormatInfo)* dstInfo, const(BLFormatInfo)* srcInfo, BLPixelConverterCreateFlags createFlags);
version(BindBlend2D_Static) BLResult blPixelConverterConvert(const(BLPixelConverterCore)* self, void* dstData, intptr_t dstStride, const(void)* srcData, intptr_t srcStride, uint w, uint h, const(BLPixelConverterOptions)* options);

version(BindBlend2D_Static) BLResult blRandomReset(BLRandom* self, ulong seed);
version(BindBlend2D_Static) uint blRandomNextUInt32(BLRandom* self);
version(BindBlend2D_Static) ulong blRandomNextUInt64(BLRandom* self);
version(BindBlend2D_Static) double blRandomNextDouble(BLRandom* self);

struct BLRandom
{
    ulong[2] data;
}

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
    BL_RUNTIME_INFO_TYPE_MAX_VALUE = 2,
    BL_RUNTIME_INFO_TYPE_FORCE_UINT = 0xFFFFFFFFu
}

enum BLRuntimeBuildType
{
    BL_RUNTIME_BUILD_TYPE_DEBUG = 0,
    BL_RUNTIME_BUILD_TYPE_RELEASE = 1,
    BL_RUNTIME_BUILD_TYPE_FORCE_UINT = 0xFFFFFFFFu
}

enum BLRuntimeCpuArch
{
    BL_RUNTIME_CPU_ARCH_UNKNOWN = 0,
    BL_RUNTIME_CPU_ARCH_X86 = 1,
    BL_RUNTIME_CPU_ARCH_ARM = 2,
    BL_RUNTIME_CPU_ARCH_MIPS = 3,
    BL_RUNTIME_CPU_ARCH_FORCE_UINT = 0xFFFFFFFFu
}

enum BLRuntimeCpuFeatures
{
    BL_RUNTIME_CPU_FEATURE_X86_SSE2 = 0x00000001u,
    BL_RUNTIME_CPU_FEATURE_X86_SSE3 = 0x00000002u,
    BL_RUNTIME_CPU_FEATURE_X86_SSSE3 = 0x00000004u,
    BL_RUNTIME_CPU_FEATURE_X86_SSE4_1 = 0x00000008u,
    BL_RUNTIME_CPU_FEATURE_X86_SSE4_2 = 0x00000010u,
    BL_RUNTIME_CPU_FEATURE_X86_AVX = 0x00000020u,
    BL_RUNTIME_CPU_FEATURE_X86_AVX2 = 0x00000040u,
    BL_RUNTIME_CPU_FEATURE_FORCE_UINT = 0xFFFFFFFFu
}

enum BLRuntimeCleanupFlags
{
    BL_RUNTIME_CLEANUP_NO_FLAGS = 0u,
    BL_RUNTIME_CLEANUP_OBJECT_POOL = 0x00000001u,
    BL_RUNTIME_CLEANUP_ZEROED_POOL = 0x00000002u,
    BL_RUNTIME_CLEANUP_THREAD_POOL = 0x00000010u,
    BL_RUNTIME_CLEANUP_EVERYTHING = 0xFFFFFFFFu,
    BL_RUNTIME_CLEANUP_FLAG_FORCE_UINT = 0xFFFFFFFFu
}

struct BLRuntimeBuildInfo
{
    uint majorVersion;
    uint minorVersion;
    uint patchVersion;
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
    size_t[7] reserved;
}

version(BindBlend2D_Static) BLResult blRuntimeInit();
version(BindBlend2D_Static) BLResult blRuntimeShutdown();
version(BindBlend2D_Static) BLResult blRuntimeCleanup(BLRuntimeCleanupFlags cleanupFlags);
version(BindBlend2D_Static) BLResult blRuntimeQueryInfo(BLRuntimeInfoType infoType, void* infoOut);
version(BindBlend2D_Static) BLResult blRuntimeMessageOut(const(char)* msg);
version(BindBlend2D_Static) BLResult blRuntimeMessageFmt(const(char)* fmt, ...);
version(BindBlend2D_Static) BLResult blRuntimeMessageVFmt(const(char)* fmt, va_list ap);
//BLResult blResultFromWinError(uint e);

version(BindBlend2D_Static) version(Windows) BLResult blResultFromWinError(uint e);
version(BindBlend2D_Static) version(Posix) BLResult blResultFromPosixError(int e);