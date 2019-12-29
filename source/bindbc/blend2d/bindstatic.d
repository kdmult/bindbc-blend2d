module bindbc.blend2d.bindstatic;

version(BindBC_Static) version = BindBlend2D_Static;
version(BindBlend2D_Static):

extern(C) @nogc nothrow:

import bindbc.blend2d.types;

import core.stdc.stddef;
import core.stdc.string;
import core.stdc.stdint;
import core.stdc.stdarg;

//extern (System):

// ============================================================================
// [C Interface - Core]
// ============================================================================

//! \addtogroup blend2d_api_c_functions
//! \{

//! \name BLArray
//!
//! Array functionality is provided by \ref BLArrayCore in C-API and wrapped by
//! \ref BLArray template in C++ API.
//!
//! C API users must call either generic functions with `Item` suffix or correct
//! specialized functions in case of typed arrays. For example if you create a
//! `BLArray<uint32_t>` in C then you can only modify it through functions that
//! have either `U32` or `Item` suffix. Arrays of signed types are treated as
//! arrays of unsigned types at API level as there is no difference between them
//! from implementation perspective.
//!
//! \{
BLResult blArrayInit(BLArrayCore* self, uint arrayTypeId);
BLResult blArrayReset(BLArrayCore* self);
BLResult blArrayCreateFromData(BLArrayCore* self, void* data, size_t size, size_t capacity, uint dataAccessFlags, BLDestroyImplFunc destroyFunc, void* destroyData);
size_t blArrayGetSize(const(BLArrayCore)* self);
size_t blArrayGetCapacity(const(BLArrayCore)* self);
const(void)* blArrayGetData(const(BLArrayCore)* self);
BLResult blArrayClear(BLArrayCore* self);
BLResult blArrayShrink(BLArrayCore* self);
BLResult blArrayReserve(BLArrayCore* self, size_t n);
BLResult blArrayResize(BLArrayCore* self, size_t n, const(void)* fill);
BLResult blArrayMakeMutable(BLArrayCore* self, void** dataOut);
BLResult blArrayModifyOp(BLArrayCore* self, uint op, size_t n, void** dataOut);
BLResult blArrayInsertOp(BLArrayCore* self, size_t index, size_t n, void** dataOut);
BLResult blArrayAssignMove(BLArrayCore* self, BLArrayCore* other);
BLResult blArrayAssignWeak(BLArrayCore* self, const(BLArrayCore)* other);
BLResult blArrayAssignDeep(BLArrayCore* self, const(BLArrayCore)* other);
BLResult blArrayAssignView(BLArrayCore* self, const(void)* items, size_t n);
BLResult blArrayAppendU8(BLArrayCore* self, ubyte value);
BLResult blArrayAppendU16(BLArrayCore* self, ushort value);
BLResult blArrayAppendU32(BLArrayCore* self, uint value);
BLResult blArrayAppendU64(BLArrayCore* self, ulong value);
BLResult blArrayAppendF32(BLArrayCore* self, float value);
BLResult blArrayAppendF64(BLArrayCore* self, double value);
BLResult blArrayAppendItem(BLArrayCore* self, const(void)* item);
BLResult blArrayAppendView(BLArrayCore* self, const(void)* items, size_t n);
BLResult blArrayInsertU8(BLArrayCore* self, size_t index, ubyte value);
BLResult blArrayInsertU16(BLArrayCore* self, size_t index, ushort value);
BLResult blArrayInsertU32(BLArrayCore* self, size_t index, uint value);
BLResult blArrayInsertU64(BLArrayCore* self, size_t index, ulong value);
BLResult blArrayInsertF32(BLArrayCore* self, size_t index, float value);
BLResult blArrayInsertF64(BLArrayCore* self, size_t index, double value);
BLResult blArrayInsertItem(BLArrayCore* self, size_t index, const(void)* item);
BLResult blArrayInsertView(BLArrayCore* self, size_t index, const(void)* items, size_t n);
BLResult blArrayReplaceU8(BLArrayCore* self, size_t index, ubyte value);
BLResult blArrayReplaceU16(BLArrayCore* self, size_t index, ushort value);
BLResult blArrayReplaceU32(BLArrayCore* self, size_t index, uint value);
BLResult blArrayReplaceU64(BLArrayCore* self, size_t index, ulong value);
BLResult blArrayReplaceF32(BLArrayCore* self, size_t index, float value);
BLResult blArrayReplaceF64(BLArrayCore* self, size_t index, double value);
BLResult blArrayReplaceItem(BLArrayCore* self, size_t index, const(void)* item);
BLResult blArrayReplaceView(BLArrayCore* self, size_t rStart, size_t rEnd, const(void)* items, size_t n);
BLResult blArrayRemoveIndex(BLArrayCore* self, size_t index);
BLResult blArrayRemoveRange(BLArrayCore* self, size_t rStart, size_t rEnd);
bool blArrayEquals(const(BLArrayCore)* a, const(BLArrayCore)* b);
//! \}

//! \name BLContext
//!
//! Rendering functionality is provided by \ref BLContextCore in C-API and
//! wrapped by \ref BLContext in C++ API.
//!
//! \{
BLResult blContextInit(BLContextCore* self);
BLResult blContextInitAs(BLContextCore* self, BLImageCore* image, const(BLContextCreateInfo)* options);
BLResult blContextReset(BLContextCore* self);
BLResult blContextAssignMove(BLContextCore* self, BLContextCore* other);
BLResult blContextAssignWeak(BLContextCore* self, const(BLContextCore)* other);
BLResult blContextGetType(const(BLContextCore)* self);
BLResult blContextBegin(BLContextCore* self, BLImageCore* image, const(BLContextCreateInfo)* options);
BLResult blContextEnd(BLContextCore* self);
BLResult blContextFlush(BLContextCore* self, uint flags);
BLResult blContextSave(BLContextCore* self, BLContextCookie* cookie);
BLResult blContextRestore(BLContextCore* self, const(BLContextCookie)* cookie);
BLResult blContextGetMetaMatrix(const(BLContextCore)* self, BLMatrix2D* m);
BLResult blContextGetUserMatrix(const(BLContextCore)* self, BLMatrix2D* m);
BLResult blContextUserToMeta(BLContextCore* self);
BLResult blContextMatrixOp(BLContextCore* self, uint opType, const(void)* opData);
BLResult blContextSetHint(BLContextCore* self, uint hintType, uint value);
BLResult blContextSetHints(BLContextCore* self, const(BLContextHints)* hints);
BLResult blContextSetFlattenMode(BLContextCore* self, uint mode);
BLResult blContextSetFlattenTolerance(BLContextCore* self, double tolerance);
BLResult blContextSetApproximationOptions(BLContextCore* self, const(BLApproximationOptions)* options);
BLResult blContextSetCompOp(BLContextCore* self, uint compOp);
BLResult blContextSetGlobalAlpha(BLContextCore* self, double alpha);
BLResult blContextSetFillAlpha(BLContextCore* self, double alpha);
BLResult blContextGetFillStyle(const(BLContextCore)* self, void* object);
BLResult blContextGetFillStyleRgba32(const(BLContextCore)* self, uint* rgba32);
BLResult blContextGetFillStyleRgba64(const(BLContextCore)* self, ulong* rgba64);
BLResult blContextSetFillStyle(BLContextCore* self, const(void)* object);
BLResult blContextSetFillStyleRgba32(BLContextCore* self, uint rgba32);
BLResult blContextSetFillStyleRgba64(BLContextCore* self, ulong rgba64);
BLResult blContextSetFillRule(BLContextCore* self, uint fillRule);
BLResult blContextSetStrokeAlpha(BLContextCore* self, double alpha);
BLResult blContextGetStrokeStyle(const(BLContextCore)* self, void* object);
BLResult blContextGetStrokeStyleRgba32(const(BLContextCore)* self, uint* rgba32);
BLResult blContextGetStrokeStyleRgba64(const(BLContextCore)* self, ulong* rgba64);
BLResult blContextSetStrokeStyle(BLContextCore* self, const(void)* object);
BLResult blContextSetStrokeStyleRgba32(BLContextCore* self, uint rgba32);
BLResult blContextSetStrokeStyleRgba64(BLContextCore* self, ulong rgba64);
BLResult blContextSetStrokeWidth(BLContextCore* self, double width);
BLResult blContextSetStrokeMiterLimit(BLContextCore* self, double miterLimit);
BLResult blContextSetStrokeCap(BLContextCore* self, uint position, uint strokeCap);
BLResult blContextSetStrokeCaps(BLContextCore* self, uint strokeCap);
BLResult blContextSetStrokeJoin(BLContextCore* self, uint strokeJoin);
BLResult blContextSetStrokeDashOffset(BLContextCore* self, double dashOffset);
BLResult blContextSetStrokeDashArray(BLContextCore* self, const(BLArrayCore)* dashArray);
BLResult blContextSetStrokeTransformOrder(BLContextCore* self, uint transformOrder);
BLResult blContextGetStrokeOptions(const(BLContextCore)* self, BLStrokeOptionsCore* options);
BLResult blContextSetStrokeOptions(BLContextCore* self, const(BLStrokeOptionsCore)* options);
BLResult blContextClipToRectI(BLContextCore* self, const(BLRectI)* rect);
BLResult blContextClipToRectD(BLContextCore* self, const(BLRect)* rect);
BLResult blContextRestoreClipping(BLContextCore* self);
BLResult blContextClearAll(BLContextCore* self);
BLResult blContextClearRectI(BLContextCore* self, const(BLRectI)* rect);
BLResult blContextClearRectD(BLContextCore* self, const(BLRect)* rect);
BLResult blContextFillAll(BLContextCore* self);
BLResult blContextFillRectI(BLContextCore* self, const(BLRectI)* rect);
BLResult blContextFillRectD(BLContextCore* self, const(BLRect)* rect);
BLResult blContextFillPathD(BLContextCore* self, const(BLPathCore)* path);
BLResult blContextFillGeometry(BLContextCore* self, uint geometryType, const(void)* geometryData);
BLResult blContextFillTextI(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding);
BLResult blContextFillTextD(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding);
BLResult blContextFillGlyphRunI(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
BLResult blContextFillGlyphRunD(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
BLResult blContextStrokeRectI(BLContextCore* self, const(BLRectI)* rect);
BLResult blContextStrokeRectD(BLContextCore* self, const(BLRect)* rect);
BLResult blContextStrokePathD(BLContextCore* self, const(BLPathCore)* path);
BLResult blContextStrokeGeometry(BLContextCore* self, uint geometryType, const(void)* geometryData);
BLResult blContextStrokeTextI(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding);
BLResult blContextStrokeTextD(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding);
BLResult blContextStrokeGlyphRunI(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
BLResult blContextStrokeGlyphRunD(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
BLResult blContextBlitImageI(BLContextCore* self, const(BLPointI)* pt, const(BLImageCore)* img, const(BLRectI)* imgArea);
BLResult blContextBlitImageD(BLContextCore* self, const(BLPoint)* pt, const(BLImageCore)* img, const(BLRectI)* imgArea);
BLResult blContextBlitScaledImageI(BLContextCore* self, const(BLRectI)* rect, const(BLImageCore)* img, const(BLRectI)* imgArea);
BLResult blContextBlitScaledImageD(BLContextCore* self, const(BLRect)* rect, const(BLImageCore)* img, const(BLRectI)* imgArea);
//! \}

//! \name BLFile
//!
//! File read/write functionality is provided by \ref BLFileCore in C-API and
//! wrapped by \ref BLFile in C++ API.
//!
//! \{
BLResult blFileInit(BLFileCore* self);
BLResult blFileReset(BLFileCore* self);
BLResult blFileOpen(BLFileCore* self, const(char)* fileName, uint openFlags);
BLResult blFileClose(BLFileCore* self);
BLResult blFileSeek(BLFileCore* self, long offset, uint seekType, long* positionOut);
BLResult blFileRead(BLFileCore* self, void* buffer, size_t n, size_t* bytesReadOut);
BLResult blFileWrite(BLFileCore* self, const(void)* buffer, size_t n, size_t* bytesWrittenOut);
BLResult blFileTruncate(BLFileCore* self, long maxSize);
BLResult blFileGetSize(BLFileCore* self, ulong* fileSizeOut);
//! \}

//! \name BLFileSystem
//!
//! Filesystem API is provided by functions prefixed with `blFileSystem` and
//! wrapped by \ref BLFileSystem namespace in C++ API.
//!
//! \{
BLResult blFileSystemReadFile(const(char)* fileName, BLArrayCore* dst, size_t maxSize, uint readFlags);
BLResult blFileSystemWriteFile(const(char)* fileName, const(void)* data, size_t size, size_t* bytesWrittenOut);
//! \}

//! \name BLFont
//!
//! Font functionality is provided by \ref BLFontCore in C-API and wrapped by
//! \ref BLFont in C++ API.
//!
//! \{
BLResult blFontInit(BLFontCore* self);
BLResult blFontReset(BLFontCore* self);
BLResult blFontAssignMove(BLFontCore* self, BLFontCore* other);
BLResult blFontAssignWeak(BLFontCore* self, const(BLFontCore)* other);
bool blFontEquals(const(BLFontCore)* a, const(BLFontCore)* b);
BLResult blFontCreateFromFace(BLFontCore* self, const(BLFontFaceCore)* face, float size);
BLResult blFontShape(const(BLFontCore)* self, BLGlyphBufferCore* gb);
BLResult blFontMapTextToGlyphs(const(BLFontCore)* self, BLGlyphBufferCore* gb, BLGlyphMappingState* stateOut);
BLResult blFontPositionGlyphs(const(BLFontCore)* self, BLGlyphBufferCore* gb, uint positioningFlags);
BLResult blFontApplyKerning(const(BLFontCore)* self, BLGlyphBufferCore* gb);
BLResult blFontApplyGSub(const(BLFontCore)* self, BLGlyphBufferCore* gb, size_t index, BLBitWord lookups);
BLResult blFontApplyGPos(const(BLFontCore)* self, BLGlyphBufferCore* gb, size_t index, BLBitWord lookups);
BLResult blFontGetMatrix(const(BLFontCore)* self, BLFontMatrix* out_);
BLResult blFontGetMetrics(const(BLFontCore)* self, BLFontMetrics* out_);
BLResult blFontGetDesignMetrics(const(BLFontCore)* self, BLFontDesignMetrics* out_);
BLResult blFontGetTextMetrics(const(BLFontCore)* self, BLGlyphBufferCore* gb, BLTextMetrics* out_);
BLResult blFontGetGlyphBounds(const(BLFontCore)* self, const(void)* glyphIdData, intptr_t glyphIdAdvance, BLBoxI* out_, size_t count);
BLResult blFontGetGlyphAdvances(const(BLFontCore)* self, const(void)* glyphIdData, intptr_t glyphIdAdvance, BLGlyphPlacement* out_, size_t count);
BLResult blFontGetGlyphOutlines(const(BLFontCore)* self, uint glyphId, const(BLMatrix2D)* userMatrix, BLPathCore* out_, BLPathSinkFunc sink, void* closure);
BLResult blFontGetGlyphRunOutlines(const(BLFontCore)* self, const(BLGlyphRun)* glyphRun, const(BLMatrix2D)* userMatrix, BLPathCore* out_, BLPathSinkFunc sink, void* closure);
//! \}

//! \name BLFontData
//!
//! Font-data functionality is provided by \ref BLFontDataCore in C-API and
//! wrapped by \ref BLFontData in C++ API.
//!
//! \{
BLResult blFontDataInit(BLFontDataCore* self);
BLResult blFontDataReset(BLFontDataCore* self);
BLResult blFontDataAssignMove(BLFontDataCore* self, BLFontDataCore* other);
BLResult blFontDataAssignWeak(BLFontDataCore* self, const(BLFontDataCore)* other);
BLResult blFontDataCreateFromFile(BLFontDataCore* self, const(char)* fileName, uint readFlags);
BLResult blFontDataCreateFromDataArray(BLFontDataCore* self, const(BLArrayCore)* dataArray);
BLResult blFontDataCreateFromData(BLFontDataCore* self, const(void)* data, size_t dataSize, BLDestroyImplFunc destroyFunc, void* destroyData);

bool blFontDataEquals(const(BLFontDataCore)* a, const(BLFontDataCore)* b);
BLResult blFontDataListTags(const(BLFontDataCore)* self, uint faceIndex, BLArrayCore* dst);
size_t blFontDataQueryTables(const(BLFontDataCore)* self, uint faceIndex, BLFontTable* dst, const(BLTag)* tags, size_t count);
//! \}

//! \name BLFontFace
//!
//! Font-face functionality is provided by \ref BLFontFaceCore in C-API and
//! wrapped by \ref BLFontFace in C++ API.
//!
//! \{
BLResult blFontFaceInit(BLFontFaceCore* self);
BLResult blFontFaceReset(BLFontFaceCore* self);
BLResult blFontFaceAssignMove(BLFontFaceCore* self, BLFontFaceCore* other);
BLResult blFontFaceAssignWeak(BLFontFaceCore* self, const(BLFontFaceCore)* other);
bool blFontFaceEquals(const(BLFontFaceCore)* a, const(BLFontFaceCore)* b);
BLResult blFontFaceCreateFromFile(BLFontFaceCore* self, const(char)* fileName, uint readFlags);
BLResult blFontFaceCreateFromData(BLFontFaceCore* self, const(BLFontDataCore)* fontData, uint faceIndex);
BLResult blFontFaceGetFaceInfo(const(BLFontFaceCore)* self, BLFontFaceInfo* out_);
BLResult blFontFaceGetDesignMetrics(const(BLFontFaceCore)* self, BLFontDesignMetrics* out_);
BLResult blFontFaceGetUnicodeCoverage(const(BLFontFaceCore)* self, BLFontUnicodeCoverage* out_);
//! \}

//! \name BLFontManager
//!
//! Font management functionality is provided by \ref BLFontManagerCore in C-API
//! and wrapped by \ref BLFontManager in C++ API.
//!
//! \{
BLResult blFontManagerInit(BLFontManagerCore* self);
BLResult blFontManagerReset(BLFontManagerCore* self);
BLResult blFontManagerAssignMove(BLFontManagerCore* self, BLFontManagerCore* other);
BLResult blFontManagerAssignWeak(BLFontManagerCore* self, const(BLFontManagerCore)* other);
bool blFontManagerEquals(const BLFontManagerCore* a, const(BLFontManagerCore)* b);
//! \}

//! \name BLFormat
//! \{
BLResult blFormatInfoSanitize(BLFormatInfo* self);
//! \}

//! \name BLGlyphBuffer
//!
//! Glyph-buffer functionality is provided by \ref BLGlyphBufferCore in C-API
//! and wrapped by \ref BLGlyphBuffer in C++ API.
//!
//! \{
BLResult blGlyphBufferInit(BLGlyphBufferCore* self);
BLResult blGlyphBufferInitMove(BLGlyphBufferCore* self, BLGlyphBufferCore* other);
BLResult blGlyphBufferReset(BLGlyphBufferCore* self);
BLResult blGlyphBufferClear(BLGlyphBufferCore* self);
size_t blGlyphBufferGetSize(const(BLGlyphBufferCore)* self);
uint blGlyphBufferGetFlags(const(BLGlyphBufferCore)* self);
const(BLGlyphRun)* blGlyphBufferGetGlyphRun(const(BLGlyphBufferCore)* self);
BLResult blGlyphBufferSetText(BLGlyphBufferCore* self, const(void)* data, size_t size, uint encoding);
BLResult blGlyphBufferSetGlyphIds(BLGlyphBufferCore* self, const(void)* data, intptr_t advance, size_t size);
//! \}

//! \name BLGradient
//!
//! Gradient container is provided by \ref BLGradientCore in C-API and wrapped
//! by \ref BLGradient in C++ API.
//!
//! \{
BLResult blGradientInit(BLGradientCore* self);
BLResult blGradientInitAs(BLGradientCore* self, uint type, const(void)* values, uint extendMode, const(BLGradientStop)* stops, size_t n, const(BLMatrix2D)* m);
BLResult blGradientReset(BLGradientCore* self);
BLResult blGradientAssignMove(BLGradientCore* self, BLGradientCore* other);
BLResult blGradientAssignWeak(BLGradientCore* self, const(BLGradientCore)* other);
BLResult blGradientCreate(BLGradientCore* self, uint type, const(void)* values, uint extendMode, const(BLGradientStop)* stops, size_t n, const(BLMatrix2D)* m);
BLResult blGradientShrink(BLGradientCore* self);
BLResult blGradientReserve(BLGradientCore* self, size_t n);
uint blGradientGetType(const(BLGradientCore)* self);
BLResult blGradientSetType(BLGradientCore* self, uint type);
double blGradientGetValue(const(BLGradientCore)* self, size_t index);
BLResult blGradientSetValue(BLGradientCore* self, size_t index, double value);
BLResult blGradientSetValues(BLGradientCore* self, size_t index, const(double)* values, size_t n);
uint blGradientGetExtendMode(BLGradientCore* self);
BLResult blGradientSetExtendMode(BLGradientCore* self, uint extendMode);
size_t blGradientGetSize(const(BLGradientCore)* self);
size_t blGradientGetCapacity(const(BLGradientCore)* self);
const(BLGradientStop)* blGradientGetStops(const(BLGradientCore)* self);
BLResult blGradientResetStops(BLGradientCore* self);
BLResult blGradientAssignStops(BLGradientCore* self, const(BLGradientStop)* stops, size_t n);
BLResult blGradientAddStopRgba32(BLGradientCore* self, double offset, uint argb32);
BLResult blGradientAddStopRgba64(BLGradientCore* self, double offset, ulong argb64);
BLResult blGradientRemoveStop(BLGradientCore* self, size_t index);
BLResult blGradientRemoveStopByOffset(BLGradientCore* self, double offset, uint all);
BLResult blGradientRemoveStops(BLGradientCore* self, size_t rStart, size_t rEnd);
BLResult blGradientRemoveStopsFromTo(BLGradientCore* self, double offsetMin, double offsetMax);
BLResult blGradientReplaceStopRgba32(BLGradientCore* self, size_t index, double offset, uint rgba32);
BLResult blGradientReplaceStopRgba64(BLGradientCore* self, size_t index, double offset, ulong rgba64);
size_t blGradientIndexOfStop(const(BLGradientCore)* self, double offset);
BLResult blGradientApplyMatrixOp(BLGradientCore* self, uint opType, const(void)* opData);
bool blGradientEquals(const(BLGradientCore)* a, const(BLGradientCore)* b);
//! \}

//! \name BLImage
//!
//! Image container is provided by \ref BLImageCore in C-API and wrapped by
//! \ref BLImage in C++ API.
//!
//! \{
BLResult blImageInit(BLImageCore* self);
BLResult blImageInitAs(BLImageCore* self, int w, int h, uint format);
BLResult blImageInitAsFromData(BLImageCore* self, int w, int h, uint format, void* pixelData, intptr_t stride, BLDestroyImplFunc destroyFunc, void* destroyData);
BLResult blImageReset(BLImageCore* self);
BLResult blImageAssignMove(BLImageCore* self, BLImageCore* other);
BLResult blImageAssignWeak(BLImageCore* self, const(BLImageCore)* other);
BLResult blImageAssignDeep(BLImageCore* self, const(BLImageCore)* other);
BLResult blImageCreate(BLImageCore* self, int w, int h, uint format);
BLResult blImageCreateFromData(BLImageCore* self, int w, int h, uint format, void* pixelData, intptr_t stride, BLDestroyImplFunc destroyFunc, void* destroyData);
BLResult blImageGetData(const(BLImageCore)* self, BLImageData* dataOut);
BLResult blImageMakeMutable(BLImageCore* self, BLImageData* dataOut);
BLResult blImageConvert(BLImageCore* self, uint format);
bool blImageEquals(const(BLImageCore)* a, const(BLImageCore)* b);
BLResult blImageScale(BLImageCore* dst, const(BLImageCore)* src, const(BLSizeI)* size, uint filter, const(BLImageScaleOptions)* options);
BLResult blImageReadFromFile(BLImageCore* self, const(char)* fileName, const(BLArrayCore)* codecs);
BLResult blImageReadFromData(BLImageCore* self, const(void)* data, size_t size, const(BLArrayCore)* codecs);
BLResult blImageWriteToFile(const(BLImageCore)* self, const(char)* fileName, const(BLImageCodecCore)* codec);
BLResult blImageWriteToData(const(BLImageCore)* self, BLArrayCore* dst, const(BLImageCodecCore)* codec);
//! \}

//! \name BLImageCodec
//!
//! Image codec functionality is provided by \ref BLImageCodecCore in C-API and
//! wrapped by \ref BLImageCodec in C++ API.
//!
//! \{
BLResult blImageCodecInit(BLImageCodecCore* self);
BLResult blImageCodecReset(BLImageCodecCore* self);
BLResult blImageCodecAssignWeak(BLImageCodecCore* self, const(BLImageCodecCore)* other);
BLResult blImageCodecFindByName(BLImageCodecCore* self, const(char)* name, size_t size, const(BLArrayCore)* codecs);
BLResult blImageCodecFindByData(BLImageCodecCore* self, const(void)* data, size_t size, const(BLArrayCore)* codecs);
uint blImageCodecInspectData(const(BLImageCodecCore)* self, const(void)* data, size_t size);
BLResult blImageCodecCreateDecoder(const(BLImageCodecCore)* self, BLImageDecoderCore* dst);
BLResult blImageCodecCreateEncoder(const(BLImageCodecCore)* self, BLImageEncoderCore* dst);

BLResult blImageCodecArrayInitBuiltInCodecs(BLArrayCore* self);
BLResult blImageCodecArrayAssignBuiltInCodecs(BLArrayCore* self);
BLResult blImageCodecAddToBuiltIn(const(BLImageCodecCore)* codec);
BLResult blImageCodecRemoveFromBuiltIn(const(BLImageCodecCore)* codec);
//! \}

//! \name BLImageDecoder
//!
//! Image decoder functionality is provided by \ref BLImageDecoderCore in C-API
//! and wrapped by \ref BLImageDecoder in C++ API.
//!
//! \{
BLResult blImageDecoderInit(BLImageDecoderCore* self);
BLResult blImageDecoderReset(BLImageDecoderCore* self);
BLResult blImageDecoderAssignMove(BLImageDecoderCore* self, BLImageDecoderCore* other);
BLResult blImageDecoderAssignWeak(BLImageDecoderCore* self, const(BLImageDecoderCore)* other);
BLResult blImageDecoderRestart(BLImageDecoderCore* self);
BLResult blImageDecoderReadInfo(BLImageDecoderCore* self, BLImageInfo* infoOut, const(ubyte)* data, size_t size);
BLResult blImageDecoderReadFrame(BLImageDecoderCore* self, BLImageCore* imageOut, const(ubyte)* data, size_t size);
//! \}

//! \name BLImageEncoder
//!
//! Image encoder functionality is provided by \ref BLImageEncoderCore in C-API
//! and wrapped by \ref BLImageEncoder in C++ API.
//!
//! \{
BLResult blImageEncoderInit(BLImageEncoderCore* self);
BLResult blImageEncoderReset(BLImageEncoderCore* self);
BLResult blImageEncoderAssignMove(BLImageEncoderCore* self, BLImageEncoderCore* other);
BLResult blImageEncoderAssignWeak(BLImageEncoderCore* self, const(BLImageEncoderCore)* other);
BLResult blImageEncoderRestart(BLImageEncoderCore* self);
BLResult blImageEncoderWriteFrame(BLImageEncoderCore* self, BLArrayCore* dst, const(BLImageCore)* image);
//! \}

//! \name BLMatrix2D
//!
//! Matrix functionality is provided by \ref BLMatrix2D, C++ API adds methods to
//! the struct when compiling in C++ mode.
//!
//! \{
BLResult blMatrix2DSetIdentity(BLMatrix2D* self);
BLResult blMatrix2DSetTranslation(BLMatrix2D* self, double x, double y);
BLResult blMatrix2DSetScaling(BLMatrix2D* self, double x, double y);
BLResult blMatrix2DSetSkewing(BLMatrix2D* self, double x, double y);
BLResult blMatrix2DSetRotation(BLMatrix2D* self, double angle, double cx, double cy);
BLResult blMatrix2DApplyOp(BLMatrix2D* self, uint opType, const(void)* opData);
BLResult blMatrix2DInvert(BLMatrix2D* dst, const(BLMatrix2D)* src);
uint blMatrix2DGetType(const(BLMatrix2D)* self);
BLResult blMatrix2DMapPointDArray(const(BLMatrix2D)* self, BLPoint* dst, const(BLPoint)* src, size_t count);
//! \}

//! \name BLPath
//!
//! 2D path functionality is provided by \ref BLPathCore in C-API and wrapped
//! by \ref BLPath in C++ API.
//!
//! \{
BLResult blPathInit(BLPathCore* self);
BLResult blPathReset(BLPathCore* self);
size_t blPathGetSize(const(BLPathCore)* self);
size_t blPathGetCapacity(const(BLPathCore)* self);
const(ubyte)* blPathGetCommandData(const(BLPathCore)* self);
const(BLPoint)* blPathGetVertexData(const(BLPathCore)* self);
BLResult blPathClear(BLPathCore* self);
BLResult blPathShrink(BLPathCore* self);
BLResult blPathReserve(BLPathCore* self, size_t n);
BLResult blPathModifyOp(BLPathCore* self, uint op, size_t n, ubyte** cmdDataOut, BLPoint** vtxDataOut);
BLResult blPathAssignMove(BLPathCore* self, BLPathCore* other);
BLResult blPathAssignWeak(BLPathCore* self, const(BLPathCore)* other);
BLResult blPathAssignDeep(BLPathCore* self, const(BLPathCore)* other);
BLResult blPathSetVertexAt(BLPathCore* self, size_t index, uint cmd, double x, double y);
BLResult blPathMoveTo(BLPathCore* self, double x0, double y0);
BLResult blPathLineTo(BLPathCore* self, double x1, double y1);
BLResult blPathPolyTo(BLPathCore* self, const(BLPoint)* poly, size_t count);
BLResult blPathQuadTo(BLPathCore* self, double x1, double y1, double x2, double y2);
BLResult blPathCubicTo(BLPathCore* self, double x1, double y1, double x2, double y2, double x3, double y3);
BLResult blPathSmoothQuadTo(BLPathCore* self, double x2, double y2);
BLResult blPathSmoothCubicTo(BLPathCore* self, double x2, double y2, double x3, double y3);
BLResult blPathArcTo(BLPathCore* self, double x, double y, double rx, double ry, double start, double sweep, bool forceMoveTo);
BLResult blPathArcQuadrantTo(BLPathCore* self, double x1, double y1, double x2, double y2);
BLResult blPathEllipticArcTo(BLPathCore* self, double rx, double ry, double xAxisRotation, bool largeArcFlag, bool sweepFlag, double x1, double y1);
BLResult blPathClose(BLPathCore* self);
BLResult blPathAddGeometry(BLPathCore* self, uint geometryType, const(void)* geometryData, const(BLMatrix2D)* m, uint dir);
BLResult blPathAddBoxI(BLPathCore* self, const(BLBoxI)* box, uint dir);
BLResult blPathAddBoxD(BLPathCore* self, const(BLBox)* box, uint dir);
BLResult blPathAddRectI(BLPathCore* self, const(BLRectI)* rect, uint dir);
BLResult blPathAddRectD(BLPathCore* self, const(BLRect)* rect, uint dir);
BLResult blPathAddPath(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range);
BLResult blPathAddTranslatedPath(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, const(BLPoint)* p);
BLResult blPathAddTransformedPath(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, const(BLMatrix2D)* m);
BLResult blPathAddReversedPath(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, uint reverseMode);
BLResult blPathAddStrokedPath(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, const(BLStrokeOptionsCore)* options, const(BLApproximationOptions)* approx);
BLResult blPathTranslate(BLPathCore* self, const(BLRange)* range, const(BLPoint)* p);
BLResult blPathTransform(BLPathCore* self, const(BLRange)* range, const(BLMatrix2D)* m);
BLResult blPathFitTo(BLPathCore* self, const(BLRange)* range, const(BLRect)* rect, uint fitFlags);
bool blPathEquals(const(BLPathCore)* a, const(BLPathCore)* b);
BLResult blPathGetInfoFlags(const(BLPathCore)* self, uint* flagsOut);
BLResult blPathGetControlBox(const(BLPathCore)* self, BLBox* boxOut);
BLResult blPathGetBoundingBox(const(BLPathCore)* self, BLBox* boxOut);
BLResult blPathGetFigureRange(const(BLPathCore)* self, size_t index, BLRange* rangeOut);
BLResult blPathGetLastVertex(const(BLPathCore)* self, BLPoint* vtxOut);
BLResult blPathGetClosestVertex(const(BLPathCore)* self, const(BLPoint)* p, double maxDistance, size_t* indexOut, double* distanceOut);
uint blPathHitTest(const(BLPathCore)* self, const(BLPoint)* p, uint fillRule);
//! \}

//! \name BLPattern
//!
//! Pattern functionality is provided by \ref BLPatternCore in C-API and
//! wrapped by \ref BLPattern in C++ API.
//!
//! \{
BLResult blPatternInit(BLPatternCore* self);
BLResult blPatternInitAs(BLPatternCore* self, const(BLImageCore)* image, const(BLRectI)* area, uint extendMode, const(BLMatrix2D)* m);
BLResult blPatternReset(BLPatternCore* self);
BLResult blPatternAssignMove(BLPatternCore* self, BLPatternCore* other);
BLResult blPatternAssignWeak(BLPatternCore* self, const(BLPatternCore)* other);
BLResult blPatternAssignDeep(BLPatternCore* self, const(BLPatternCore)* other);
BLResult blPatternCreate(BLPatternCore* self, const(BLImageCore)* image, const(BLRectI)* area, uint extendMode, const(BLMatrix2D)* m);
BLResult blPatternSetImage(BLPatternCore* self, const(BLImageCore)* image, const(BLRectI)* area);
BLResult blPatternSetArea(BLPatternCore* self, const(BLRectI)* area);
BLResult blPatternSetExtendMode(BLPatternCore* self, uint extendMode);
BLResult blPatternApplyMatrixOp(BLPatternCore* self, uint opType, const(void)* opData);
bool blPatternEquals(const(BLPatternCore)* a, const(BLPatternCore)* b);
//! \}

//! \name BLPixelConverter
//!
//! Pixel conversion functionality is provided by \ref BLPixelConverterCore
//! in C-API and wrapped by \ref BLPixelConverter in C++ API.
//!
//! \{
BLResult blPixelConverterInit(BLPixelConverterCore* self);
BLResult blPixelConverterInitWeak(BLPixelConverterCore* self, const(BLPixelConverterCore)* other);
BLResult blPixelConverterReset(BLPixelConverterCore* self);
BLResult blPixelConverterAssign(BLPixelConverterCore* self, const(BLPixelConverterCore)* other);
BLResult blPixelConverterCreate(BLPixelConverterCore* self, const(BLFormatInfo)* dstInfo, const(BLFormatInfo)* srcInfo, uint createFlags);

BLResult blPixelConverterConvert(const(BLPixelConverterCore)* self, void* dstData, intptr_t dstStride, const(void)* srcData, intptr_t srcStride, uint w, uint h, const(BLPixelConverterOptions)* options);
//! \}

//! \name BLRandom
//! \{
BLResult blRandomReset(BLRandom* self, ulong seed);
uint blRandomNextUInt32(BLRandom* self);
ulong blRandomNextUInt64(BLRandom* self);
double blRandomNextDouble(BLRandom* self);
//! \}

//! \name BLRegion
//!
//! 2D region functionality is provided by \ref BLRegionCore in C-API and
//! wrapped by \ref BLRegion in C++ API.
//!
//! \{
BLResult blRegionInit(BLRegionCore* self);
BLResult blRegionReset(BLRegionCore* self);
size_t blRegionGetSize(const(BLRegionCore)* self);
size_t blRegionGetCapacity(const(BLRegionCore)* self);
const(BLBoxI)* blRegionGetData(const(BLRegionCore)* self);
BLResult blRegionClear(BLRegionCore* self);
BLResult blRegionShrink(BLRegionCore* self);
BLResult blRegionReserve(BLRegionCore* self, size_t n);
BLResult blRegionAssignMove(BLRegionCore* self, BLRegionCore* other);
BLResult blRegionAssignWeak(BLRegionCore* self, const(BLRegionCore)* other);
BLResult blRegionAssignDeep(BLRegionCore* self, const(BLRegionCore)* other);
BLResult blRegionAssignBoxI(BLRegionCore* self, const(BLBoxI)* src);
BLResult blRegionAssignBoxIArray(BLRegionCore* self, const(BLBoxI)* data, size_t n);
BLResult blRegionAssignRectI(BLRegionCore* self, const(BLRectI)* rect);
BLResult blRegionAssignRectIArray(BLRegionCore* self, const(BLRectI)* data, size_t n);
BLResult blRegionCombine(BLRegionCore* self, const(BLRegionCore)* a, const(BLRegionCore)* b, uint booleanOp);
BLResult blRegionCombineRB(BLRegionCore* self, const(BLRegionCore)* a, const(BLBoxI)* b, uint booleanOp);
BLResult blRegionCombineBR(BLRegionCore* self, const(BLBoxI)* a, const(BLRegionCore)* b, uint booleanOp);
BLResult blRegionCombineBB(BLRegionCore* self, const(BLBoxI)* a, const(BLBoxI)* b, uint booleanOp);
BLResult blRegionTranslate(BLRegionCore* self, const(BLRegionCore)* r, const(BLPointI)* pt);
BLResult blRegionTranslateAndClip(BLRegionCore* self, const(BLRegionCore)* r, const(BLPointI)* pt, const(BLBoxI)* clipBox);
BLResult blRegionIntersectAndClip(BLRegionCore* self, const(BLRegionCore)* a, const(BLRegionCore)* b, const(BLBoxI)* clipBox);
bool blRegionEquals(const(BLRegionCore)* a, const(BLRegionCore)* b);
uint blRegionGetType(const(BLRegionCore)* self);
uint blRegionHitTest(const(BLRegionCore)* self, const(BLPointI)* pt);
uint blRegionHitTestBoxI(const(BLRegionCore)* self, const(BLBoxI)* box);
//! \}

//! \name BLRuntime
//!
//! Blend2D runtime functions are provided either as a C-API or wrapped by
//! \ref BLRuntime namespace in C++ API.
//!
//! \{
BLResult blRuntimeInit();
BLResult blRuntimeShutdown();
BLResult blRuntimeCleanup(uint cleanupFlags);
BLResult blRuntimeQueryInfo(uint infoType, void* infoOut);
BLResult blRuntimeMessageOut(const(char)* msg);
BLResult blRuntimeMessageFmt(const(char)* fmt, ...);
BLResult blRuntimeMessageVFmt(const(char)* fmt, va_list ap);
uint blRuntimeGetTickCount();

void blRuntimeAssertionFailure(const(char)* file, int line, const(char)* msg);

BLResult blResultFromWinError(uint e);

//! \}

//! \name BLString
//!
//! String contanter is provided by \ref BLStringCore in C-API and wrapped by
//! \ref BLString in C++ API.
//!
//! \{
BLResult blStringInit(BLStringCore* self);
BLResult blStringReset(BLStringCore* self);
size_t blStringGetSize(const(BLStringCore)* self);
size_t blStringGetCapacity(const(BLStringCore)* self);
const(char)* blStringGetData(const(BLStringCore)* self);
BLResult blStringClear(BLStringCore* self);
BLResult blStringShrink(BLStringCore* self);
BLResult blStringReserve(BLStringCore* self, size_t n);
BLResult blStringResize(BLStringCore* self, size_t n, char fill);
BLResult blStringMakeMutable(BLStringCore* self, char** dataOut);
BLResult blStringModifyOp(BLStringCore* self, uint op, size_t n, char** dataOut);
BLResult blStringInsertOp(BLStringCore* self, size_t index, size_t n, char** dataOut);
BLResult blStringAssignMove(BLStringCore* self, BLStringCore* other);
BLResult blStringAssignWeak(BLStringCore* self, const(BLStringCore)* other);
BLResult blStringAssignDeep(BLStringCore* self, const(BLStringCore)* other);
BLResult blStringAssignData(BLStringCore* self, const(char)* str, size_t n);
BLResult blStringApplyOpChar(BLStringCore* self, uint op, char c, size_t n);
BLResult blStringApplyOpData(BLStringCore* self, uint op, const(char)* str, size_t n);
BLResult blStringApplyOpString(BLStringCore* self, uint op, const(BLStringCore)* other);
BLResult blStringApplyOpFormat(BLStringCore* self, uint op, const(char)* fmt, ...);
BLResult blStringApplyOpFormatV(BLStringCore* self, uint op, const(char)* fmt, va_list ap);
BLResult blStringInsertChar(BLStringCore* self, size_t index, char c, size_t n);
BLResult blStringInsertData(BLStringCore* self, size_t index, const(char)* str, size_t n);
BLResult blStringInsertString(BLStringCore* self, size_t index, const(BLStringCore)* other);
BLResult blStringRemoveRange(BLStringCore* self, size_t rStart, size_t rEnd);
bool blStringEquals(const(BLStringCore)* self, const(BLStringCore)* other);
bool blStringEqualsData(const(BLStringCore)* self, const(char)* str, size_t n);
int blStringCompare(const(BLStringCore)* self, const(BLStringCore)* other);
int blStringCompareData(const(BLStringCore)* self, const(char)* str, size_t n);
//! \}

//! \name BLStrokeOptions
//!
//! Stroke options are provided by \ref BLStrokeOptionsCore in C-API and
//! wrapped by \ref BLStrokeOptions in C++ API.
//!
//! \{
BLResult blStrokeOptionsInit(BLStrokeOptionsCore* self);
BLResult blStrokeOptionsInitMove(BLStrokeOptionsCore* self, BLStrokeOptionsCore* other);
BLResult blStrokeOptionsInitWeak(BLStrokeOptionsCore* self, const(BLStrokeOptionsCore)* other);
BLResult blStrokeOptionsReset(BLStrokeOptionsCore* self);
BLResult blStrokeOptionsAssignMove(BLStrokeOptionsCore* self, BLStrokeOptionsCore* other);
BLResult blStrokeOptionsAssignWeak(BLStrokeOptionsCore* self, const(BLStrokeOptionsCore)* other);
//! \}

//! \name BLVariant
//!
//! Variant C-API can be used on any object compatible with Blend2D Impl, at
//! the moment only \ref BLStrokeOptionsCore and \ref BLGlyphBufferCore are
//! not compatible, all others are.
//!
//! \{
BLResult blVariantInit(void* self);
BLResult blVariantInitMove(void* self, void* other);
BLResult blVariantInitWeak(void* self, const(void)* other);
BLResult blVariantReset(void* self);
uint blVariantGetImplType(const(void)* self);
BLResult blVariantAssignMove(void* self, void* other);
BLResult blVariantAssignWeak(void* self, const(void)* other);
bool blVariantEquals(const(void)* a, const(void)* b);
//! \}

//! \}
