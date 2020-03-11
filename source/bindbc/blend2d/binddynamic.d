module bindbc.blend2d.binddynamic;

version(BindBlend2D_Static) {}
else version = BindBlend2D_Dynamic;

version(BindBlend2D_Dynamic):

import core.stdc.stdint;
import core.stdc.stdarg;

import bindbc.loader;
import bindbc.blend2d.types;
import bindbc.blend2d.bindstatic;

extern(C) alias pblDefaultApproximationOptions = const BLApproximationOptions;
__gshared pblDefaultApproximationOptions blDefaultApproximationOptions;

extern(C) alias pblFormatInfo = const(BLFormatInfo)[BL_FORMAT_RESERVED_COUNT];
__gshared pblFormatInfo blFormatInfo;

extern(C) alias pblMatrix2DMapPointDArrayFuncs = BLMapPointDArrayFunc[BL_MATRIX2D_TYPE_COUNT];
__gshared pblMatrix2DMapPointDArrayFuncs blMatrix2DMapPointDArrayFuncs;

extern(C) alias pblNone = BLVariantCore[BL_IMPL_TYPE_COUNT];
__gshared pblNone blNone;

extern(C) alias pblPixelConverterConvert = BLResult function(const(BLPixelConverterCore)* self, void* dstData, intptr_t dstStride, const(void)* srcData, intptr_t srcStride, uint w, uint h, const(BLPixelConverterOptions)* options);
__gshared pblPixelConverterConvert blPixelConverterConvert;


extern(C) alias pblArrayAppendF32 = BLResult function(BLArrayCore* self, float value);
__gshared pblArrayAppendF32 blArrayAppendF32;

extern(C) alias pblArrayAppendF64 = BLResult function(BLArrayCore* self, double value);
__gshared pblArrayAppendF64 blArrayAppendF64;

extern(C) alias pblArrayAppendItem = BLResult function(BLArrayCore* self, const(void)* item);
__gshared pblArrayAppendItem blArrayAppendItem;

extern(C) alias pblArrayAppendU8 = BLResult function(BLArrayCore* self, ubyte value);
__gshared pblArrayAppendU8 blArrayAppendU8;

extern(C) alias pblArrayAppendU16 = BLResult function(BLArrayCore* self, ushort value);
__gshared pblArrayAppendU16 blArrayAppendU16;

extern(C) alias pblArrayAppendU32 = BLResult function(BLArrayCore* self, uint value);
__gshared pblArrayAppendU32 blArrayAppendU32;

extern(C) alias pblArrayAppendU64 = BLResult function(BLArrayCore* self, ulong value);
__gshared pblArrayAppendU64 blArrayAppendU64;

extern(C) alias pblArrayAppendView = BLResult function(BLArrayCore* self, const(void)* items, size_t n);
__gshared pblArrayAppendView blArrayAppendView;

extern(C) alias pblArrayAssignDeep = BLResult function(BLArrayCore* self, const(BLArrayCore)* other);
__gshared pblArrayAssignDeep blArrayAssignDeep;

extern(C) alias pblArrayAssignMove = BLResult function(BLArrayCore* self, BLArrayCore* other);
__gshared pblArrayAssignMove blArrayAssignMove;

extern(C) alias pblArrayAssignView = BLResult function(BLArrayCore* self, const(void)* items, size_t n);
__gshared pblArrayAssignView blArrayAssignView;

extern(C) alias pblArrayAssignWeak = BLResult function(BLArrayCore* self, const(BLArrayCore)* other);
__gshared pblArrayAssignWeak blArrayAssignWeak;

extern(C) alias pblArrayClear = BLResult function(BLArrayCore* self);
__gshared pblArrayClear blArrayClear;

extern(C) alias pblArrayCreateFromData = BLResult function(BLArrayCore* self, void* data, size_t size, size_t capacity, uint dataAccessFlags, BLDestroyImplFunc destroyFunc, void* destroyData);
__gshared pblArrayCreateFromData blArrayCreateFromData;

extern(C) alias pblArrayEquals = bool function(const(BLArrayCore)* a, const(BLArrayCore)* b);
__gshared pblArrayEquals blArrayEquals;

extern(C) alias pblArrayGetCapacity = size_t function(const(BLArrayCore)* self);
__gshared pblArrayGetCapacity blArrayGetCapacity;

extern(C) alias pblArrayGetData = const(void)* function(const(BLArrayCore)* self);
__gshared pblArrayGetData blArrayGetData;

extern(C) alias pblArrayGetSize = size_t function(const(BLArrayCore)* self);
__gshared pblArrayGetSize blArrayGetSize;

extern(C) alias pblArrayInit = BLResult function(BLArrayCore* self, uint arrayTypeId);
__gshared pblArrayInit blArrayInit;

extern(C) alias pblArrayInsertF32 = BLResult function(BLArrayCore* self, size_t index, float value);
__gshared pblArrayInsertF32 blArrayInsertF32;

extern(C) alias pblArrayInsertF64 = BLResult function(BLArrayCore* self, size_t index, double value);
__gshared pblArrayInsertF64 blArrayInsertF64;

extern(C) alias pblArrayInsertItem = BLResult function(BLArrayCore* self, size_t index, const(void)* item);
__gshared pblArrayInsertItem blArrayInsertItem;

extern(C) alias pblArrayInsertOp = BLResult function(BLArrayCore* self, size_t index, size_t n, void** dataOut);
__gshared pblArrayInsertOp blArrayInsertOp;

extern(C) alias pblArrayInsertU8 = BLResult function(BLArrayCore* self, size_t index, ubyte value);
__gshared pblArrayInsertU8 blArrayInsertU8;

extern(C) alias pblArrayInsertU16 = BLResult function(BLArrayCore* self, size_t index, ushort value);
__gshared pblArrayInsertU16 blArrayInsertU16;

extern(C) alias pblArrayInsertU32 = BLResult function(BLArrayCore* self, size_t index, uint value);
__gshared pblArrayInsertU32 blArrayInsertU32;

extern(C) alias pblArrayInsertU64 = BLResult function(BLArrayCore* self, size_t index, ulong value);
__gshared pblArrayInsertU64 blArrayInsertU64;

extern(C) alias pblArrayInsertView = BLResult function(BLArrayCore* self, size_t index, const(void)* items, size_t n);
__gshared pblArrayInsertView blArrayInsertView;

extern(C) alias pblArrayMakeMutable = BLResult function(BLArrayCore* self, void** dataOut);
__gshared pblArrayMakeMutable blArrayMakeMutable;

extern(C) alias pblArrayModifyOp = BLResult function(BLArrayCore* self, uint op, size_t n, void** dataOut);
__gshared pblArrayModifyOp blArrayModifyOp;

extern(C) alias pblArrayRemoveIndex = BLResult function(BLArrayCore* self, size_t index);
__gshared pblArrayRemoveIndex blArrayRemoveIndex;

extern(C) alias pblArrayRemoveRange = BLResult function(BLArrayCore* self, size_t rStart, size_t rEnd);
__gshared pblArrayRemoveRange blArrayRemoveRange;

extern(C) alias pblArrayReplaceF32 = BLResult function(BLArrayCore* self, size_t index, float value);
__gshared pblArrayReplaceF32 blArrayReplaceF32;

extern(C) alias pblArrayReplaceF64 = BLResult function(BLArrayCore* self, size_t index, double value);
__gshared pblArrayReplaceF64 blArrayReplaceF64;

extern(C) alias pblArrayReplaceItem = BLResult function(BLArrayCore* self, size_t index, const(void)* item);
__gshared pblArrayReplaceItem blArrayReplaceItem;

extern(C) alias pblArrayReplaceU8 = BLResult function(BLArrayCore* self, size_t index, ubyte value);
__gshared pblArrayReplaceU8 blArrayReplaceU8;

extern(C) alias pblArrayReplaceU16 = BLResult function(BLArrayCore* self, size_t index, ushort value);
__gshared pblArrayReplaceU16 blArrayReplaceU16;

extern(C) alias pblArrayReplaceU32 = BLResult function(BLArrayCore* self, size_t index, uint value);
__gshared pblArrayReplaceU32 blArrayReplaceU32;

extern(C) alias pblArrayReplaceU64 = BLResult function(BLArrayCore* self, size_t index, ulong value);
__gshared pblArrayReplaceU64 blArrayReplaceU64;

extern(C) alias pblArrayReplaceView = BLResult function(BLArrayCore* self, size_t rStart, size_t rEnd, const(void)* items, size_t n);
__gshared pblArrayReplaceView blArrayReplaceView;

extern(C) alias pblArrayReserve = BLResult function(BLArrayCore* self, size_t n);
__gshared pblArrayReserve blArrayReserve;

extern(C) alias pblArrayReset = BLResult function(BLArrayCore* self);
__gshared pblArrayReset blArrayReset;

extern(C) alias pblArrayResize = BLResult function(BLArrayCore* self, size_t n, const(void)* fill);
__gshared pblArrayResize blArrayResize;

extern(C) alias pblArrayShrink = BLResult function(BLArrayCore* self);
__gshared pblArrayShrink blArrayShrink;

extern(C) alias pblContextAssignMove = BLResult function(BLContextCore* self, BLContextCore* other);
__gshared pblContextAssignMove blContextAssignMove;

extern(C) alias pblContextAssignWeak = BLResult function(BLContextCore* self, const(BLContextCore)* other);
__gshared pblContextAssignWeak blContextAssignWeak;

extern(C) alias pblContextBegin = BLResult function(BLContextCore* self, BLImageCore* image, const(BLContextCreateInfo)* options);
__gshared pblContextBegin blContextBegin;

extern(C) alias pblContextBlitImageD = BLResult function(BLContextCore* self, const(BLPoint)* pt, const(BLImageCore)* img, const(BLRectI)* imgArea);
__gshared pblContextBlitImageD blContextBlitImageD;

extern(C) alias pblContextBlitImageI = BLResult function(BLContextCore* self, const(BLPointI)* pt, const(BLImageCore)* img, const(BLRectI)* imgArea);
__gshared pblContextBlitImageI blContextBlitImageI;

extern(C) alias pblContextBlitScaledImageD = BLResult function(BLContextCore* self, const(BLRect)* rect, const(BLImageCore)* img, const(BLRectI)* imgArea);
__gshared pblContextBlitScaledImageD blContextBlitScaledImageD;

extern(C) alias pblContextBlitScaledImageI = BLResult function(BLContextCore* self, const(BLRectI)* rect, const(BLImageCore)* img, const(BLRectI)* imgArea);
__gshared pblContextBlitScaledImageI blContextBlitScaledImageI;

extern(C) alias pblContextClearAll = BLResult function(BLContextCore* self);
__gshared pblContextClearAll blContextClearAll;

extern(C) alias pblContextClearRectD = BLResult function(BLContextCore* self, const(BLRect)* rect);
__gshared pblContextClearRectD blContextClearRectD;

extern(C) alias pblContextClearRectI = BLResult function(BLContextCore* self, const(BLRectI)* rect);
__gshared pblContextClearRectI blContextClearRectI;

extern(C) alias pblContextClipToRectD = BLResult function(BLContextCore* self, const(BLRect)* rect);
__gshared pblContextClipToRectD blContextClipToRectD;

extern(C) alias pblContextClipToRectI = BLResult function(BLContextCore* self, const(BLRectI)* rect);
__gshared pblContextClipToRectI blContextClipToRectI;

extern(C) alias pblContextEnd = BLResult function(BLContextCore* self);
__gshared pblContextEnd blContextEnd;

extern(C) alias pblContextFillAll = BLResult function(BLContextCore* self);
__gshared pblContextFillAll blContextFillAll;

extern(C) alias pblContextFillGeometry = BLResult function(BLContextCore* self, uint geometryType, const(void)* geometryData);
__gshared pblContextFillGeometry blContextFillGeometry;

extern(C) alias pblContextFillGlyphRunD = BLResult function(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
__gshared pblContextFillGlyphRunD blContextFillGlyphRunD;

extern(C) alias pblContextFillGlyphRunI = BLResult function(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
__gshared pblContextFillGlyphRunI blContextFillGlyphRunI;

extern(C) alias pblContextFillPathD = BLResult function(BLContextCore* self, const(BLPathCore)* path);
__gshared pblContextFillPathD blContextFillPathD;

extern(C) alias pblContextFillRectD = BLResult function(BLContextCore* self, const(BLRect)* rect);
__gshared pblContextFillRectD blContextFillRectD;

extern(C) alias pblContextFillRectI = BLResult function(BLContextCore* self, const(BLRectI)* rect);
__gshared pblContextFillRectI blContextFillRectI;

extern(C) alias pblContextFillTextD = BLResult function(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding);
__gshared pblContextFillTextD blContextFillTextD;

extern(C) alias pblContextFillTextI = BLResult function(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding);
__gshared pblContextFillTextI blContextFillTextI;

extern(C) alias pblContextFlush = BLResult function(BLContextCore* self, uint flags);
__gshared pblContextFlush blContextFlush;

extern(C) alias pblContextGetFillStyle = BLResult function(const(BLContextCore)* self, void* object);
__gshared pblContextGetFillStyle blContextGetFillStyle;

extern(C) alias pblContextGetFillStyleRgba32 = BLResult function(const(BLContextCore)* self, uint* rgba32);
__gshared pblContextGetFillStyleRgba32 blContextGetFillStyleRgba32;

extern(C) alias pblContextGetFillStyleRgba64 = BLResult function(const(BLContextCore)* self, ulong* rgba64);
__gshared pblContextGetFillStyleRgba64 blContextGetFillStyleRgba64;

extern(C) alias pblContextGetMetaMatrix = BLResult function(const(BLContextCore)* self, BLMatrix2D* m);
__gshared pblContextGetMetaMatrix blContextGetMetaMatrix;

extern(C) alias pblContextGetStrokeOptions = BLResult function(const(BLContextCore)* self, BLStrokeOptionsCore* options);
__gshared pblContextGetStrokeOptions blContextGetStrokeOptions;

extern(C) alias pblContextGetStrokeStyle = BLResult function(const(BLContextCore)* self, void* object);
__gshared pblContextGetStrokeStyle blContextGetStrokeStyle;

extern(C) alias pblContextGetStrokeStyleRgba32 = BLResult function(const(BLContextCore)* self, uint* rgba32);
__gshared pblContextGetStrokeStyleRgba32 blContextGetStrokeStyleRgba32;

extern(C) alias pblContextGetStrokeStyleRgba64 = BLResult function(const(BLContextCore)* self, ulong* rgba64);
__gshared pblContextGetStrokeStyleRgba64 blContextGetStrokeStyleRgba64;

extern(C) alias pblContextGetType = BLResult function(const(BLContextCore)* self);
__gshared pblContextGetType blContextGetType;

extern(C) alias pblContextGetUserMatrix = BLResult function(const(BLContextCore)* self, BLMatrix2D* m);
__gshared pblContextGetUserMatrix blContextGetUserMatrix;

extern(C) alias pblContextInit = BLResult function(BLContextCore* self);
__gshared pblContextInit blContextInit;

extern(C) alias pblContextInitAs = BLResult function(BLContextCore* self, BLImageCore* image, const(BLContextCreateInfo)* options);
__gshared pblContextInitAs blContextInitAs;

extern(C) alias pblContextMatrixOp = BLResult function(BLContextCore* self, uint opType, const(void)* opData);
__gshared pblContextMatrixOp blContextMatrixOp;

extern(C) alias pblContextReset = BLResult function(BLContextCore* self);
__gshared pblContextReset blContextReset;

extern(C) alias pblContextRestore = BLResult function(BLContextCore* self, const(BLContextCookie)* cookie);
__gshared pblContextRestore blContextRestore;

extern(C) alias pblContextRestoreClipping = BLResult function(BLContextCore* self);
__gshared pblContextRestoreClipping blContextRestoreClipping;

extern(C) alias pblContextSave = BLResult function(BLContextCore* self, BLContextCookie* cookie);
__gshared pblContextSave blContextSave;

extern(C) alias pblContextSetApproximationOptions = BLResult function(BLContextCore* self, const(BLApproximationOptions)* options);
__gshared pblContextSetApproximationOptions blContextSetApproximationOptions;

extern(C) alias pblContextSetCompOp = BLResult function(BLContextCore* self, uint compOp);
__gshared pblContextSetCompOp blContextSetCompOp;

extern(C) alias pblContextSetFillAlpha = BLResult function(BLContextCore* self, double alpha);
__gshared pblContextSetFillAlpha blContextSetFillAlpha;

extern(C) alias pblContextSetFillRule = BLResult function(BLContextCore* self, uint fillRule);
__gshared pblContextSetFillRule blContextSetFillRule;

extern(C) alias pblContextSetFillStyle = BLResult function(BLContextCore* self, const(void)* object);
__gshared pblContextSetFillStyle blContextSetFillStyle;

extern(C) alias pblContextSetFillStyleRgba32 = BLResult function(BLContextCore* self, uint rgba32);
__gshared pblContextSetFillStyleRgba32 blContextSetFillStyleRgba32;

extern(C) alias pblContextSetFillStyleRgba64 = BLResult function(BLContextCore* self, ulong rgba64);
__gshared pblContextSetFillStyleRgba64 blContextSetFillStyleRgba64;

extern(C) alias pblContextSetFlattenMode = BLResult function(BLContextCore* self, uint mode);
__gshared pblContextSetFlattenMode blContextSetFlattenMode;

extern(C) alias pblContextSetFlattenTolerance = BLResult function(BLContextCore* self, double tolerance);
__gshared pblContextSetFlattenTolerance blContextSetFlattenTolerance;

extern(C) alias pblContextSetGlobalAlpha = BLResult function(BLContextCore* self, double alpha);
__gshared pblContextSetGlobalAlpha blContextSetGlobalAlpha;

extern(C) alias pblContextSetHint = BLResult function(BLContextCore* self, uint hintType, uint value);
__gshared pblContextSetHint blContextSetHint;

extern(C) alias pblContextSetHints = BLResult function(BLContextCore* self, const(BLContextHints)* hints);
__gshared pblContextSetHints blContextSetHints;

extern(C) alias pblContextSetStrokeAlpha = BLResult function(BLContextCore* self, double alpha);
__gshared pblContextSetStrokeAlpha blContextSetStrokeAlpha;

extern(C) alias pblContextSetStrokeCap = BLResult function(BLContextCore* self, uint position, uint strokeCap);
__gshared pblContextSetStrokeCap blContextSetStrokeCap;

extern(C) alias pblContextSetStrokeCaps = BLResult function(BLContextCore* self, uint strokeCap);
__gshared pblContextSetStrokeCaps blContextSetStrokeCaps;

extern(C) alias pblContextSetStrokeDashArray = BLResult function(BLContextCore* self, const(BLArrayCore)* dashArray);
__gshared pblContextSetStrokeDashArray blContextSetStrokeDashArray;

extern(C) alias pblContextSetStrokeDashOffset = BLResult function(BLContextCore* self, double dashOffset);
__gshared pblContextSetStrokeDashOffset blContextSetStrokeDashOffset;

extern(C) alias pblContextSetStrokeJoin = BLResult function(BLContextCore* self, uint strokeJoin);
__gshared pblContextSetStrokeJoin blContextSetStrokeJoin;

extern(C) alias pblContextSetStrokeMiterLimit = BLResult function(BLContextCore* self, double miterLimit);
__gshared pblContextSetStrokeMiterLimit blContextSetStrokeMiterLimit;

extern(C) alias pblContextSetStrokeOptions = BLResult function(BLContextCore* self, const(BLStrokeOptionsCore)* options);
__gshared pblContextSetStrokeOptions blContextSetStrokeOptions;

extern(C) alias pblContextSetStrokeStyle = BLResult function(BLContextCore* self, const(void)* object);
__gshared pblContextSetStrokeStyle blContextSetStrokeStyle;

extern(C) alias pblContextSetStrokeStyleRgba32 = BLResult function(BLContextCore* self, uint rgba32);
__gshared pblContextSetStrokeStyleRgba32 blContextSetStrokeStyleRgba32;

extern(C) alias pblContextSetStrokeStyleRgba64 = BLResult function(BLContextCore* self, ulong rgba64);
__gshared pblContextSetStrokeStyleRgba64 blContextSetStrokeStyleRgba64;

extern(C) alias pblContextSetStrokeTransformOrder = BLResult function(BLContextCore* self, uint transformOrder);
__gshared pblContextSetStrokeTransformOrder blContextSetStrokeTransformOrder;

extern(C) alias pblContextSetStrokeWidth = BLResult function(BLContextCore* self, double width);
__gshared pblContextSetStrokeWidth blContextSetStrokeWidth;

extern(C) alias pblContextStrokeGeometry = BLResult function(BLContextCore* self, uint geometryType, const(void)* geometryData);
__gshared pblContextStrokeGeometry blContextStrokeGeometry;

extern(C) alias pblContextStrokeGlyphRunD = BLResult function(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
__gshared pblContextStrokeGlyphRunD blContextStrokeGlyphRunD;

extern(C) alias pblContextStrokeGlyphRunI = BLResult function(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
__gshared pblContextStrokeGlyphRunI blContextStrokeGlyphRunI;

extern(C) alias pblContextStrokePathD = BLResult function(BLContextCore* self, const(BLPathCore)* path);
__gshared pblContextStrokePathD blContextStrokePathD;

extern(C) alias pblContextStrokeRectD = BLResult function(BLContextCore* self, const(BLRect)* rect);
__gshared pblContextStrokeRectD blContextStrokeRectD;

extern(C) alias pblContextStrokeRectI = BLResult function(BLContextCore* self, const(BLRectI)* rect);
__gshared pblContextStrokeRectI blContextStrokeRectI;

extern(C) alias pblContextStrokeTextD = BLResult function(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding);
__gshared pblContextStrokeTextD blContextStrokeTextD;

extern(C) alias pblContextStrokeTextI = BLResult function(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, uint encoding);
__gshared pblContextStrokeTextI blContextStrokeTextI;

extern(C) alias pblContextUserToMeta = BLResult function(BLContextCore* self);
__gshared pblContextUserToMeta blContextUserToMeta;

extern(C) alias pblFileClose = BLResult function(BLFileCore* self);
__gshared pblFileClose blFileClose;

extern(C) alias pblFileGetSize = BLResult function(BLFileCore* self, ulong* fileSizeOut);
__gshared pblFileGetSize blFileGetSize;

extern(C) alias pblFileInit = BLResult function(BLFileCore* self);
__gshared pblFileInit blFileInit;

extern(C) alias pblFileOpen = BLResult function(BLFileCore* self, const(char)* fileName, uint openFlags);
__gshared pblFileOpen blFileOpen;

extern(C) alias pblFileRead = BLResult function(BLFileCore* self, void* buffer, size_t n, size_t* bytesReadOut);
__gshared pblFileRead blFileRead;

extern(C) alias pblFileReset = BLResult function(BLFileCore* self);
__gshared pblFileReset blFileReset;

extern(C) alias pblFileSeek = BLResult function(BLFileCore* self, long offset, uint seekType, long* positionOut);
__gshared pblFileSeek blFileSeek;

extern(C) alias pblFileSystemReadFile = BLResult function(const(char)* fileName, BLArrayCore* dst, size_t maxSize, uint readFlags);
__gshared pblFileSystemReadFile blFileSystemReadFile;

extern(C) alias pblFileSystemWriteFile = BLResult function(const(char)* fileName, const(void)* data, size_t size, size_t* bytesWrittenOut);
__gshared pblFileSystemWriteFile blFileSystemWriteFile;

extern(C) alias pblFileTruncate = BLResult function(BLFileCore* self, long maxSize);
__gshared pblFileTruncate blFileTruncate;

extern(C) alias pblFileWrite = BLResult function(BLFileCore* self, const(void)* buffer, size_t n, size_t* bytesWrittenOut);
__gshared pblFileWrite blFileWrite;

extern(C) alias pblFontApplyGPos = BLResult function(const(BLFontCore)* self, BLGlyphBufferCore* gb, size_t index, BLBitWord lookups);
__gshared pblFontApplyGPos blFontApplyGPos;

extern(C) alias pblFontApplyGSub = BLResult function(const(BLFontCore)* self, BLGlyphBufferCore* gb, size_t index, BLBitWord lookups);
__gshared pblFontApplyGSub blFontApplyGSub;

extern(C) alias pblFontApplyKerning = BLResult function(const(BLFontCore)* self, BLGlyphBufferCore* gb);
__gshared pblFontApplyKerning blFontApplyKerning;

extern(C) alias pblFontAssignMove = BLResult function(BLFontCore* self, BLFontCore* other);
__gshared pblFontAssignMove blFontAssignMove;

extern(C) alias pblFontAssignWeak = BLResult function(BLFontCore* self, const(BLFontCore)* other);
__gshared pblFontAssignWeak blFontAssignWeak;

extern(C) alias pblFontCreateFromFace = BLResult function(BLFontCore* self, const(BLFontFaceCore)* face, float size);
__gshared pblFontCreateFromFace blFontCreateFromFace;

extern(C) alias pblFontDataAssignMove = BLResult function(BLFontDataCore* self, BLFontDataCore* other);
__gshared pblFontDataAssignMove blFontDataAssignMove;

extern(C) alias pblFontDataAssignWeak = BLResult function(BLFontDataCore* self, const(BLFontDataCore)* other);
__gshared pblFontDataAssignWeak blFontDataAssignWeak;

extern(C) alias pblFontDataCreateFromData = BLResult function(BLFontDataCore* self, const(void)* data, size_t dataSize, BLDestroyImplFunc destroyFunc, void* destroyData);
__gshared pblFontDataCreateFromData blFontDataCreateFromData;

extern(C) alias pblFontDataCreateFromDataArray = BLResult function(BLFontDataCore* self, const(BLArrayCore)* dataArray);
__gshared pblFontDataCreateFromDataArray blFontDataCreateFromDataArray;

extern(C) alias pblFontDataCreateFromFile = BLResult function(BLFontDataCore* self, const(char)* fileName, uint readFlags);
__gshared pblFontDataCreateFromFile blFontDataCreateFromFile;

extern(C) alias pblFontDataEquals = bool function(const(BLFontDataCore)* a, const(BLFontDataCore)* b);
__gshared pblFontDataEquals blFontDataEquals;

extern(C) alias pblFontDataInit = BLResult function(BLFontDataCore* self);
__gshared pblFontDataInit blFontDataInit;

extern(C) alias pblFontDataListTags = BLResult function(const(BLFontDataCore)* self, uint faceIndex, BLArrayCore* dst);
__gshared pblFontDataListTags blFontDataListTags;

extern(C) alias pblFontDataQueryTables = size_t function(const(BLFontDataCore)* self, uint faceIndex, BLFontTable* dst, const(BLTag)* tags, size_t count);
__gshared pblFontDataQueryTables blFontDataQueryTables;

extern(C) alias pblFontDataReset = BLResult function(BLFontDataCore* self);
__gshared pblFontDataReset blFontDataReset;

extern(C) alias pblFontEquals = bool function(const(BLFontCore)* a, const(BLFontCore)* b);
__gshared pblFontEquals blFontEquals;

extern(C) alias pblFontFaceAssignMove = BLResult function(BLFontFaceCore* self, BLFontFaceCore* other);
__gshared pblFontFaceAssignMove blFontFaceAssignMove;

extern(C) alias pblFontFaceAssignWeak = BLResult function(BLFontFaceCore* self, const(BLFontFaceCore)* other);
__gshared pblFontFaceAssignWeak blFontFaceAssignWeak;

extern(C) alias pblFontFaceCreateFromData = BLResult function(BLFontFaceCore* self, const(BLFontDataCore)* fontData, uint faceIndex);
__gshared pblFontFaceCreateFromData blFontFaceCreateFromData;

extern(C) alias pblFontFaceCreateFromFile = BLResult function(BLFontFaceCore* self, const(char)* fileName, uint readFlags);
__gshared pblFontFaceCreateFromFile blFontFaceCreateFromFile;

extern(C) alias pblFontFaceEquals = bool function(const(BLFontFaceCore)* a, const(BLFontFaceCore)* b);
__gshared pblFontFaceEquals blFontFaceEquals;

extern(C) alias pblFontFaceGetDesignMetrics = BLResult function(const(BLFontFaceCore)* self, BLFontDesignMetrics* out_);
__gshared pblFontFaceGetDesignMetrics blFontFaceGetDesignMetrics;

extern(C) alias pblFontFaceGetFaceInfo = BLResult function(const(BLFontFaceCore)* self, BLFontFaceInfo* out_);
__gshared pblFontFaceGetFaceInfo blFontFaceGetFaceInfo;

extern(C) alias pblFontFaceGetUnicodeCoverage = BLResult function(const(BLFontFaceCore)* self, BLFontUnicodeCoverage* out_);
__gshared pblFontFaceGetUnicodeCoverage blFontFaceGetUnicodeCoverage;

extern(C) alias pblFontFaceInit = BLResult function(BLFontFaceCore* self);
__gshared pblFontFaceInit blFontFaceInit;

extern(C) alias pblFontFaceReset = BLResult function(BLFontFaceCore* self);
__gshared pblFontFaceReset blFontFaceReset;

extern(C) alias pblFontGetDesignMetrics = BLResult function(const(BLFontCore)* self, BLFontDesignMetrics* out_);
__gshared pblFontGetDesignMetrics blFontGetDesignMetrics;

extern(C) alias pblFontGetGlyphAdvances = BLResult function(const(BLFontCore)* self, const(uint)* glyphData, intptr_t glyphAdvance, BLGlyphPlacement* out_, size_t count);
__gshared pblFontGetGlyphAdvances blFontGetGlyphAdvances;

extern(C) alias pblFontGetGlyphBounds = BLResult function(const(BLFontCore)* self, const(uint)* glyphData, intptr_t glyphAdvance, BLBoxI* out_, size_t count);
__gshared pblFontGetGlyphBounds blFontGetGlyphBounds;

extern(C) alias pblFontGetGlyphOutlines = BLResult function(const(BLFontCore)* self, uint glyphId, const(BLMatrix2D)* userMatrix, BLPathCore* out_, BLPathSinkFunc sink, void* closure);
__gshared pblFontGetGlyphOutlines blFontGetGlyphOutlines;

extern(C) alias pblFontGetGlyphRunOutlines = BLResult function(const(BLFontCore)* self, const(BLGlyphRun)* glyphRun, const(BLMatrix2D)* userMatrix, BLPathCore* out_, BLPathSinkFunc sink, void* closure);
__gshared pblFontGetGlyphRunOutlines blFontGetGlyphRunOutlines;

extern(C) alias pblFontGetMatrix = BLResult function(const(BLFontCore)* self, BLFontMatrix* out_);
__gshared pblFontGetMatrix blFontGetMatrix;

extern(C) alias pblFontGetMetrics = BLResult function(const(BLFontCore)* self, BLFontMetrics* out_);
__gshared pblFontGetMetrics blFontGetMetrics;

extern(C) alias pblFontGetTextMetrics = BLResult function(const(BLFontCore)* self, BLGlyphBufferCore* gb, BLTextMetrics* out_);
__gshared pblFontGetTextMetrics blFontGetTextMetrics;

extern(C) alias pblFontInit = BLResult function(BLFontCore* self);
__gshared pblFontInit blFontInit;

extern(C) alias pblFontManagerAssignMove = BLResult function(BLFontManagerCore* self, BLFontManagerCore* other);
__gshared pblFontManagerAssignMove blFontManagerAssignMove;

extern(C) alias pblFontManagerAssignWeak = BLResult function(BLFontManagerCore* self, const(BLFontManagerCore)* other);
__gshared pblFontManagerAssignWeak blFontManagerAssignWeak;

extern(C) alias pblFontManagerEquals = bool function(const(BLFontManagerCore)* a, const(BLFontManagerCore)* b);
__gshared pblFontManagerEquals blFontManagerEquals;

extern(C) alias pblFontManagerInit = BLResult function(BLFontManagerCore* self);
__gshared pblFontManagerInit blFontManagerInit;

extern(C) alias pblFontManagerReset = BLResult function(BLFontManagerCore* self);
__gshared pblFontManagerReset blFontManagerReset;

extern(C) alias pblFontMapTextToGlyphs = BLResult function(const(BLFontCore)* self, BLGlyphBufferCore* gb, BLGlyphMappingState* stateOut);
__gshared pblFontMapTextToGlyphs blFontMapTextToGlyphs;

extern(C) alias pblFontPositionGlyphs = BLResult function(const(BLFontCore)* self, BLGlyphBufferCore* gb, uint positioningFlags);
__gshared pblFontPositionGlyphs blFontPositionGlyphs;

extern(C) alias pblFontReset = BLResult function(BLFontCore* self);
__gshared pblFontReset blFontReset;

extern(C) alias pblFontShape = BLResult function(const(BLFontCore)* self, BLGlyphBufferCore* gb);
__gshared pblFontShape blFontShape;

extern(C) alias pblFormatInfoQuery = BLResult function(BLFormatInfo* self, uint format);
__gshared pblFormatInfoQuery blFormatInfoQuery;

extern(C) alias pblFormatInfoSanitize = BLResult function(BLFormatInfo* self);
__gshared pblFormatInfoSanitize blFormatInfoSanitize;

extern(C) alias pblGlyphBufferClear = BLResult function(BLGlyphBufferCore* self);
__gshared pblGlyphBufferClear blGlyphBufferClear;

extern(C) alias pblGlyphBufferGetContent = const(uint)* function(const(BLGlyphBufferCore)* self);
__gshared pblGlyphBufferGetContent blGlyphBufferGetContent;

extern(C) alias pblGlyphBufferGetFlags = uint function(const(BLGlyphBufferCore)* self);
__gshared pblGlyphBufferGetFlags blGlyphBufferGetFlags;

extern(C) alias pblGlyphBufferGetGlyphRun = const(BLGlyphRun)* function(const(BLGlyphBufferCore)* self);
__gshared pblGlyphBufferGetGlyphRun blGlyphBufferGetGlyphRun;

extern(C) alias pblGlyphBufferGetInfoData = const(BLGlyphInfo)* function(const(BLGlyphBufferCore)* self);
__gshared pblGlyphBufferGetInfoData blGlyphBufferGetInfoData;

extern(C) alias pblGlyphBufferGetPlacementData = const(BLGlyphPlacement)* function(const(BLGlyphBufferCore)* self);
__gshared pblGlyphBufferGetPlacementData blGlyphBufferGetPlacementData;

extern(C) alias pblGlyphBufferGetSize = size_t function(const(BLGlyphBufferCore)* self);
__gshared pblGlyphBufferGetSize blGlyphBufferGetSize;

extern(C) alias pblGlyphBufferInit = BLResult function(BLGlyphBufferCore* self);
__gshared pblGlyphBufferInit blGlyphBufferInit;

extern(C) alias pblGlyphBufferInitMove = BLResult function(BLGlyphBufferCore* self, BLGlyphBufferCore* other);
__gshared pblGlyphBufferInitMove blGlyphBufferInitMove;

extern(C) alias pblGlyphBufferReset = BLResult function(BLGlyphBufferCore* self);
__gshared pblGlyphBufferReset blGlyphBufferReset;

extern(C) alias pblGlyphBufferSetGlyphs = BLResult function(BLGlyphBufferCore* self, const(uint)* glyphData, size_t size);
__gshared pblGlyphBufferSetGlyphs blGlyphBufferSetGlyphs;

extern(C) alias pblGlyphBufferSetGlyphsFromStruct = BLResult function(BLGlyphBufferCore* self, const(void)* glyphData, size_t size, size_t glyphIdSize, intptr_t glyphIdAdvance);
__gshared pblGlyphBufferSetGlyphsFromStruct blGlyphBufferSetGlyphsFromStruct;

extern(C) alias pblGlyphBufferSetText = BLResult function(BLGlyphBufferCore* self, const(void)* textData, size_t size, uint encoding);
__gshared pblGlyphBufferSetText blGlyphBufferSetText;

extern(C) alias pblGradientAddStopRgba32 = BLResult function(BLGradientCore* self, double offset, uint argb32);
__gshared pblGradientAddStopRgba32 blGradientAddStopRgba32;

extern(C) alias pblGradientAddStopRgba64 = BLResult function(BLGradientCore* self, double offset, ulong argb64);
__gshared pblGradientAddStopRgba64 blGradientAddStopRgba64;

extern(C) alias pblGradientApplyMatrixOp = BLResult function(BLGradientCore* self, uint opType, const(void)* opData);
__gshared pblGradientApplyMatrixOp blGradientApplyMatrixOp;

extern(C) alias pblGradientAssignMove = BLResult function(BLGradientCore* self, BLGradientCore* other);
__gshared pblGradientAssignMove blGradientAssignMove;

extern(C) alias pblGradientAssignStops = BLResult function(BLGradientCore* self, const(BLGradientStop)* stops, size_t n);
__gshared pblGradientAssignStops blGradientAssignStops;

extern(C) alias pblGradientAssignWeak = BLResult function(BLGradientCore* self, const(BLGradientCore)* other);
__gshared pblGradientAssignWeak blGradientAssignWeak;

extern(C) alias pblGradientCreate = BLResult function(BLGradientCore* self, uint type, const(void)* values, uint extendMode, const(BLGradientStop)* stops, size_t n, const(BLMatrix2D)* m);
__gshared pblGradientCreate blGradientCreate;

extern(C) alias pblGradientEquals = bool function(const(BLGradientCore)* a, const(BLGradientCore)* b);
__gshared pblGradientEquals blGradientEquals;

extern(C) alias pblGradientGetCapacity = size_t function(const(BLGradientCore)* self);
__gshared pblGradientGetCapacity blGradientGetCapacity;

extern(C) alias pblGradientGetExtendMode = uint function(BLGradientCore* self);
__gshared pblGradientGetExtendMode blGradientGetExtendMode;

extern(C) alias pblGradientGetSize = size_t function(const(BLGradientCore)* self);
__gshared pblGradientGetSize blGradientGetSize;

extern(C) alias pblGradientGetStops = const(BLGradientStop)* function(const(BLGradientCore)* self);
__gshared pblGradientGetStops blGradientGetStops;

extern(C) alias pblGradientGetType = uint function(const(BLGradientCore)* self);
__gshared pblGradientGetType blGradientGetType;

extern(C) alias pblGradientGetValue = double function(const(BLGradientCore)* self, size_t index);
__gshared pblGradientGetValue blGradientGetValue;

extern(C) alias pblGradientIndexOfStop = size_t function(const(BLGradientCore)* self, double offset);
__gshared pblGradientIndexOfStop blGradientIndexOfStop;

extern(C) alias pblGradientInit = BLResult function(BLGradientCore* self);
__gshared pblGradientInit blGradientInit;

extern(C) alias pblGradientInitAs = BLResult function(BLGradientCore* self, uint type, const(void)* values, uint extendMode, const(BLGradientStop)* stops, size_t n, const(BLMatrix2D)* m);
__gshared pblGradientInitAs blGradientInitAs;

extern(C) alias pblGradientRemoveStop = BLResult function(BLGradientCore* self, size_t index);
__gshared pblGradientRemoveStop blGradientRemoveStop;

extern(C) alias pblGradientRemoveStopByOffset = BLResult function(BLGradientCore* self, double offset, uint all);
__gshared pblGradientRemoveStopByOffset blGradientRemoveStopByOffset;

extern(C) alias pblGradientRemoveStops = BLResult function(BLGradientCore* self, size_t rStart, size_t rEnd);
__gshared pblGradientRemoveStops blGradientRemoveStops;

extern(C) alias pblGradientRemoveStopsFromTo = BLResult function(BLGradientCore* self, double offsetMin, double offsetMax);
__gshared pblGradientRemoveStopsFromTo blGradientRemoveStopsFromTo;

extern(C) alias pblGradientReplaceStopRgba32 = BLResult function(BLGradientCore* self, size_t index, double offset, uint rgba32);
__gshared pblGradientReplaceStopRgba32 blGradientReplaceStopRgba32;

extern(C) alias pblGradientReplaceStopRgba64 = BLResult function(BLGradientCore* self, size_t index, double offset, ulong rgba64);
__gshared pblGradientReplaceStopRgba64 blGradientReplaceStopRgba64;

extern(C) alias pblGradientReserve = BLResult function(BLGradientCore* self, size_t n);
__gshared pblGradientReserve blGradientReserve;

extern(C) alias pblGradientReset = BLResult function(BLGradientCore* self);
__gshared pblGradientReset blGradientReset;

extern(C) alias pblGradientResetStops = BLResult function(BLGradientCore* self);
__gshared pblGradientResetStops blGradientResetStops;

extern(C) alias pblGradientSetExtendMode = BLResult function(BLGradientCore* self, uint extendMode);
__gshared pblGradientSetExtendMode blGradientSetExtendMode;

extern(C) alias pblGradientSetType = BLResult function(BLGradientCore* self, uint type);
__gshared pblGradientSetType blGradientSetType;

extern(C) alias pblGradientSetValue = BLResult function(BLGradientCore* self, size_t index, double value);
__gshared pblGradientSetValue blGradientSetValue;

extern(C) alias pblGradientSetValues = BLResult function(BLGradientCore* self, size_t index, const(double)* values, size_t n);
__gshared pblGradientSetValues blGradientSetValues;

extern(C) alias pblGradientShrink = BLResult function(BLGradientCore* self);
__gshared pblGradientShrink blGradientShrink;

extern(C) alias pblImageAssignDeep = BLResult function(BLImageCore* self, const(BLImageCore)* other);
__gshared pblImageAssignDeep blImageAssignDeep;

extern(C) alias pblImageAssignMove = BLResult function(BLImageCore* self, BLImageCore* other);
__gshared pblImageAssignMove blImageAssignMove;

extern(C) alias pblImageAssignWeak = BLResult function(BLImageCore* self, const(BLImageCore)* other);
__gshared pblImageAssignWeak blImageAssignWeak;

extern(C) alias pblImageCodecAddToBuiltIn = BLResult function(const(BLImageCodecCore)* codec);
__gshared pblImageCodecAddToBuiltIn blImageCodecAddToBuiltIn;

extern(C) alias pblImageCodecArrayAssignBuiltInCodecs = BLResult function(BLArrayCore* self);
__gshared pblImageCodecArrayAssignBuiltInCodecs blImageCodecArrayAssignBuiltInCodecs;

extern(C) alias pblImageCodecArrayInitBuiltInCodecs = BLResult function(BLArrayCore* self);
__gshared pblImageCodecArrayInitBuiltInCodecs blImageCodecArrayInitBuiltInCodecs;

extern(C) alias pblImageCodecAssignWeak = BLResult function(BLImageCodecCore* self, const(BLImageCodecCore)* other);
__gshared pblImageCodecAssignWeak blImageCodecAssignWeak;

extern(C) alias pblImageCodecCreateDecoder = BLResult function(const(BLImageCodecCore)* self, BLImageDecoderCore* dst);
__gshared pblImageCodecCreateDecoder blImageCodecCreateDecoder;

extern(C) alias pblImageCodecCreateEncoder = BLResult function(const(BLImageCodecCore)* self, BLImageEncoderCore* dst);
__gshared pblImageCodecCreateEncoder blImageCodecCreateEncoder;

extern(C) alias pblImageCodecFindByData = BLResult function(BLImageCodecCore* self, const(void)* data, size_t size, const(BLArrayCore)* codecs);
__gshared pblImageCodecFindByData blImageCodecFindByData;

extern(C) alias pblImageCodecFindByName = BLResult function(BLImageCodecCore* self, const(char)* name, size_t size, const(BLArrayCore)* codecs);
__gshared pblImageCodecFindByName blImageCodecFindByName;

extern(C) alias pblImageCodecInit = BLResult function(BLImageCodecCore* self);
__gshared pblImageCodecInit blImageCodecInit;

extern(C) alias pblImageCodecInspectData = uint function(const(BLImageCodecCore)* self, const(void)* data, size_t size);
__gshared pblImageCodecInspectData blImageCodecInspectData;

extern(C) alias pblImageCodecRemoveFromBuiltIn = BLResult function(const(BLImageCodecCore)* codec);
__gshared pblImageCodecRemoveFromBuiltIn blImageCodecRemoveFromBuiltIn;

extern(C) alias pblImageCodecReset = BLResult function(BLImageCodecCore* self);
__gshared pblImageCodecReset blImageCodecReset;

extern(C) alias pblImageConvert = BLResult function(BLImageCore* self, uint format);
__gshared pblImageConvert blImageConvert;

extern(C) alias pblImageCreate = BLResult function(BLImageCore* self, int w, int h, uint format);
__gshared pblImageCreate blImageCreate;

extern(C) alias pblImageCreateFromData = BLResult function(BLImageCore* self, int w, int h, uint format, void* pixelData, intptr_t stride, BLDestroyImplFunc destroyFunc, void* destroyData);
__gshared pblImageCreateFromData blImageCreateFromData;

extern(C) alias pblImageDecoderAssignMove = BLResult function(BLImageDecoderCore* self, BLImageDecoderCore* other);
__gshared pblImageDecoderAssignMove blImageDecoderAssignMove;

extern(C) alias pblImageDecoderAssignWeak = BLResult function(BLImageDecoderCore* self, const(BLImageDecoderCore)* other);
__gshared pblImageDecoderAssignWeak blImageDecoderAssignWeak;

extern(C) alias pblImageDecoderInit = BLResult function(BLImageDecoderCore* self);
__gshared pblImageDecoderInit blImageDecoderInit;

extern(C) alias pblImageDecoderReadFrame = BLResult function(BLImageDecoderCore* self, BLImageCore* imageOut, const(ubyte)* data, size_t size);
__gshared pblImageDecoderReadFrame blImageDecoderReadFrame;

extern(C) alias pblImageDecoderReadInfo = BLResult function(BLImageDecoderCore* self, BLImageInfo* infoOut, const(ubyte)* data, size_t size);
__gshared pblImageDecoderReadInfo blImageDecoderReadInfo;

extern(C) alias pblImageDecoderReset = BLResult function(BLImageDecoderCore* self);
__gshared pblImageDecoderReset blImageDecoderReset;

extern(C) alias pblImageDecoderRestart = BLResult function(BLImageDecoderCore* self);
__gshared pblImageDecoderRestart blImageDecoderRestart;

extern(C) alias pblImageEncoderAssignMove = BLResult function(BLImageEncoderCore* self, BLImageEncoderCore* other);
__gshared pblImageEncoderAssignMove blImageEncoderAssignMove;

extern(C) alias pblImageEncoderAssignWeak = BLResult function(BLImageEncoderCore* self, const(BLImageEncoderCore)* other);
__gshared pblImageEncoderAssignWeak blImageEncoderAssignWeak;

extern(C) alias pblImageEncoderInit = BLResult function(BLImageEncoderCore* self);
__gshared pblImageEncoderInit blImageEncoderInit;

extern(C) alias pblImageEncoderReset = BLResult function(BLImageEncoderCore* self);
__gshared pblImageEncoderReset blImageEncoderReset;

extern(C) alias pblImageEncoderRestart = BLResult function(BLImageEncoderCore* self);
__gshared pblImageEncoderRestart blImageEncoderRestart;

extern(C) alias pblImageEncoderWriteFrame = BLResult function(BLImageEncoderCore* self, BLArrayCore* dst, const(BLImageCore)* image);
__gshared pblImageEncoderWriteFrame blImageEncoderWriteFrame;

extern(C) alias pblImageEquals = bool function(const(BLImageCore)* a, const(BLImageCore)* b);
__gshared pblImageEquals blImageEquals;

extern(C) alias pblImageGetData = BLResult function(const(BLImageCore)* self, BLImageData* dataOut);
__gshared pblImageGetData blImageGetData;

extern(C) alias pblImageInit = BLResult function(BLImageCore* self);
__gshared pblImageInit blImageInit;

extern(C) alias pblImageInitAs = BLResult function(BLImageCore* self, int w, int h, uint format);
__gshared pblImageInitAs blImageInitAs;

extern(C) alias pblImageInitAsFromData = BLResult function(BLImageCore* self, int w, int h, uint format, void* pixelData, intptr_t stride, BLDestroyImplFunc destroyFunc, void* destroyData);
__gshared pblImageInitAsFromData blImageInitAsFromData;

extern(C) alias pblImageMakeMutable = BLResult function(BLImageCore* self, BLImageData* dataOut);
__gshared pblImageMakeMutable blImageMakeMutable;

extern(C) alias pblImageReadFromData = BLResult function(BLImageCore* self, const(void)* data, size_t size, const(BLArrayCore)* codecs);
__gshared pblImageReadFromData blImageReadFromData;

extern(C) alias pblImageReadFromFile = BLResult function(BLImageCore* self, const(char)* fileName, const(BLArrayCore)* codecs);
__gshared pblImageReadFromFile blImageReadFromFile;

extern(C) alias pblImageReset = BLResult function(BLImageCore* self);
__gshared pblImageReset blImageReset;

extern(C) alias pblImageScale = BLResult function(BLImageCore* dst, const(BLImageCore)* src, const(BLSizeI)* size, uint filter, const(BLImageScaleOptions)* options);
__gshared pblImageScale blImageScale;

extern(C) alias pblImageWriteToData = BLResult function(const(BLImageCore)* self, BLArrayCore* dst, const(BLImageCodecCore)* codec);
__gshared pblImageWriteToData blImageWriteToData;

extern(C) alias pblImageWriteToFile = BLResult function(const(BLImageCore)* self, const(char)* fileName, const(BLImageCodecCore)* codec);
__gshared pblImageWriteToFile blImageWriteToFile;

extern(C) alias pblMatrix2DApplyOp = BLResult function(BLMatrix2D* self, uint opType, const(void)* opData);
__gshared pblMatrix2DApplyOp blMatrix2DApplyOp;

extern(C) alias pblMatrix2DGetType = uint function(const(BLMatrix2D)* self);
__gshared pblMatrix2DGetType blMatrix2DGetType;

extern(C) alias pblMatrix2DInvert = BLResult function(BLMatrix2D* dst, const(BLMatrix2D)* src);
__gshared pblMatrix2DInvert blMatrix2DInvert;

extern(C) alias pblMatrix2DMapPointDArray = BLResult function(const(BLMatrix2D)* self, BLPoint* dst, const(BLPoint)* src, size_t count);
__gshared pblMatrix2DMapPointDArray blMatrix2DMapPointDArray;

extern(C) alias pblMatrix2DSetIdentity = BLResult function(BLMatrix2D* self);
__gshared pblMatrix2DSetIdentity blMatrix2DSetIdentity;

extern(C) alias pblMatrix2DSetRotation = BLResult function(BLMatrix2D* self, double angle, double cx, double cy);
__gshared pblMatrix2DSetRotation blMatrix2DSetRotation;

extern(C) alias pblMatrix2DSetScaling = BLResult function(BLMatrix2D* self, double x, double y);
__gshared pblMatrix2DSetScaling blMatrix2DSetScaling;

extern(C) alias pblMatrix2DSetSkewing = BLResult function(BLMatrix2D* self, double x, double y);
__gshared pblMatrix2DSetSkewing blMatrix2DSetSkewing;

extern(C) alias pblMatrix2DSetTranslation = BLResult function(BLMatrix2D* self, double x, double y);
__gshared pblMatrix2DSetTranslation blMatrix2DSetTranslation;

extern(C) alias pblPathAddBoxD = BLResult function(BLPathCore* self, const(BLBox)* box, uint dir);
__gshared pblPathAddBoxD blPathAddBoxD;

extern(C) alias pblPathAddBoxI = BLResult function(BLPathCore* self, const(BLBoxI)* box, uint dir);
__gshared pblPathAddBoxI blPathAddBoxI;

extern(C) alias pblPathAddGeometry = BLResult function(BLPathCore* self, uint geometryType, const(void)* geometryData, const(BLMatrix2D)* m, uint dir);
__gshared pblPathAddGeometry blPathAddGeometry;

extern(C) alias pblPathAddPath = BLResult function(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range);
__gshared pblPathAddPath blPathAddPath;

extern(C) alias pblPathAddRectD = BLResult function(BLPathCore* self, const(BLRect)* rect, uint dir);
__gshared pblPathAddRectD blPathAddRectD;

extern(C) alias pblPathAddRectI = BLResult function(BLPathCore* self, const(BLRectI)* rect, uint dir);
__gshared pblPathAddRectI blPathAddRectI;

extern(C) alias pblPathAddReversedPath = BLResult function(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, uint reverseMode);
__gshared pblPathAddReversedPath blPathAddReversedPath;

extern(C) alias pblPathAddStrokedPath = BLResult function(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, const(BLStrokeOptionsCore)* options, const(BLApproximationOptions)* approx);
__gshared pblPathAddStrokedPath blPathAddStrokedPath;

extern(C) alias pblPathAddTransformedPath = BLResult function(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, const(BLMatrix2D)* m);
__gshared pblPathAddTransformedPath blPathAddTransformedPath;

extern(C) alias pblPathAddTranslatedPath = BLResult function(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, const(BLPoint)* p);
__gshared pblPathAddTranslatedPath blPathAddTranslatedPath;

extern(C) alias pblPathArcQuadrantTo = BLResult function(BLPathCore* self, double x1, double y1, double x2, double y2);
__gshared pblPathArcQuadrantTo blPathArcQuadrantTo;

extern(C) alias pblPathArcTo = BLResult function(BLPathCore* self, double x, double y, double rx, double ry, double start, double sweep, bool forceMoveTo);
__gshared pblPathArcTo blPathArcTo;

extern(C) alias pblPathAssignDeep = BLResult function(BLPathCore* self, const(BLPathCore)* other);
__gshared pblPathAssignDeep blPathAssignDeep;

extern(C) alias pblPathAssignMove = BLResult function(BLPathCore* self, BLPathCore* other);
__gshared pblPathAssignMove blPathAssignMove;

extern(C) alias pblPathAssignWeak = BLResult function(BLPathCore* self, const(BLPathCore)* other);
__gshared pblPathAssignWeak blPathAssignWeak;

extern(C) alias pblPathClear = BLResult function(BLPathCore* self);
__gshared pblPathClear blPathClear;

extern(C) alias pblPathClose = BLResult function(BLPathCore* self);
__gshared pblPathClose blPathClose;

extern(C) alias pblPathCubicTo = BLResult function(BLPathCore* self, double x1, double y1, double x2, double y2, double x3, double y3);
__gshared pblPathCubicTo blPathCubicTo;

extern(C) alias pblPathEllipticArcTo = BLResult function(BLPathCore* self, double rx, double ry, double xAxisRotation, bool largeArcFlag, bool sweepFlag, double x1, double y1);
__gshared pblPathEllipticArcTo blPathEllipticArcTo;

extern(C) alias pblPathEquals = bool function(const(BLPathCore)* a, const(BLPathCore)* b);
__gshared pblPathEquals blPathEquals;

extern(C) alias pblPathFitTo = BLResult function(BLPathCore* self, const(BLRange)* range, const(BLRect)* rect, uint fitFlags);
__gshared pblPathFitTo blPathFitTo;

extern(C) alias pblPathGetBoundingBox = BLResult function(const(BLPathCore)* self, BLBox* boxOut);
__gshared pblPathGetBoundingBox blPathGetBoundingBox;

extern(C) alias pblPathGetCapacity = size_t function(const(BLPathCore)* self);
__gshared pblPathGetCapacity blPathGetCapacity;

extern(C) alias pblPathGetClosestVertex = BLResult function(const(BLPathCore)* self, const(BLPoint)* p, double maxDistance, size_t* indexOut, double* distanceOut);
__gshared pblPathGetClosestVertex blPathGetClosestVertex;

extern(C) alias pblPathGetCommandData = const(ubyte)* function(const(BLPathCore)* self);
__gshared pblPathGetCommandData blPathGetCommandData;

extern(C) alias pblPathGetControlBox = BLResult function(const(BLPathCore)* self, BLBox* boxOut);
__gshared pblPathGetControlBox blPathGetControlBox;

extern(C) alias pblPathGetFigureRange = BLResult function(const(BLPathCore)* self, size_t index, BLRange* rangeOut);
__gshared pblPathGetFigureRange blPathGetFigureRange;

extern(C) alias pblPathGetInfoFlags = BLResult function(const(BLPathCore)* self, uint* flagsOut);
__gshared pblPathGetInfoFlags blPathGetInfoFlags;

extern(C) alias pblPathGetLastVertex = BLResult function(const(BLPathCore)* self, BLPoint* vtxOut);
__gshared pblPathGetLastVertex blPathGetLastVertex;

extern(C) alias pblPathGetSize = size_t function(const(BLPathCore)* self);
__gshared pblPathGetSize blPathGetSize;

extern(C) alias pblPathGetVertexData = const(BLPoint)* function(const(BLPathCore)* self);
__gshared pblPathGetVertexData blPathGetVertexData;

extern(C) alias pblPathHitTest = uint function(const(BLPathCore)* self, const(BLPoint)* p, uint fillRule);
__gshared pblPathHitTest blPathHitTest;

extern(C) alias pblPathInit = BLResult function(BLPathCore* self);
__gshared pblPathInit blPathInit;

extern(C) alias pblPathLineTo = BLResult function(BLPathCore* self, double x1, double y1);
__gshared pblPathLineTo blPathLineTo;

extern(C) alias pblPathModifyOp = BLResult function(BLPathCore* self, uint op, size_t n, ubyte** cmdDataOut, BLPoint** vtxDataOut);
__gshared pblPathModifyOp blPathModifyOp;

extern(C) alias pblPathMoveTo = BLResult function(BLPathCore* self, double x0, double y0);
__gshared pblPathMoveTo blPathMoveTo;

extern(C) alias pblPathPolyTo = BLResult function(BLPathCore* self, const(BLPoint)* poly, size_t count);
__gshared pblPathPolyTo blPathPolyTo;

extern(C) alias pblPathQuadTo = BLResult function(BLPathCore* self, double x1, double y1, double x2, double y2);
__gshared pblPathQuadTo blPathQuadTo;

extern(C) alias pblPathReserve = BLResult function(BLPathCore* self, size_t n);
__gshared pblPathReserve blPathReserve;

extern(C) alias pblPathReset = BLResult function(BLPathCore* self);
__gshared pblPathReset blPathReset;

extern(C) alias pblPathSetVertexAt = BLResult function(BLPathCore* self, size_t index, uint cmd, double x, double y);
__gshared pblPathSetVertexAt blPathSetVertexAt;

extern(C) alias pblPathShrink = BLResult function(BLPathCore* self);
__gshared pblPathShrink blPathShrink;

extern(C) alias pblPathSmoothCubicTo = BLResult function(BLPathCore* self, double x2, double y2, double x3, double y3);
__gshared pblPathSmoothCubicTo blPathSmoothCubicTo;

extern(C) alias pblPathSmoothQuadTo = BLResult function(BLPathCore* self, double x2, double y2);
__gshared pblPathSmoothQuadTo blPathSmoothQuadTo;

extern(C) alias pblPathTransform = BLResult function(BLPathCore* self, const(BLRange)* range, const(BLMatrix2D)* m);
__gshared pblPathTransform blPathTransform;

extern(C) alias pblPathTranslate = BLResult function(BLPathCore* self, const(BLRange)* range, const(BLPoint)* p);
__gshared pblPathTranslate blPathTranslate;

extern(C) alias pblPatternApplyMatrixOp = BLResult function(BLPatternCore* self, uint opType, const(void)* opData);
__gshared pblPatternApplyMatrixOp blPatternApplyMatrixOp;

extern(C) alias pblPatternAssignDeep = BLResult function(BLPatternCore* self, const(BLPatternCore)* other);
__gshared pblPatternAssignDeep blPatternAssignDeep;

extern(C) alias pblPatternAssignMove = BLResult function(BLPatternCore* self, BLPatternCore* other);
__gshared pblPatternAssignMove blPatternAssignMove;

extern(C) alias pblPatternAssignWeak = BLResult function(BLPatternCore* self, const(BLPatternCore)* other);
__gshared pblPatternAssignWeak blPatternAssignWeak;

extern(C) alias pblPatternCreate = BLResult function(BLPatternCore* self, const(BLImageCore)* image, const(BLRectI)* area, uint extendMode, const(BLMatrix2D)* m);
__gshared pblPatternCreate blPatternCreate;

extern(C) alias pblPatternEquals = bool function(const(BLPatternCore)* a, const(BLPatternCore)* b);
__gshared pblPatternEquals blPatternEquals;

extern(C) alias pblPatternInit = BLResult function(BLPatternCore* self);
__gshared pblPatternInit blPatternInit;

extern(C) alias pblPatternInitAs = BLResult function(BLPatternCore* self, const(BLImageCore)* image, const(BLRectI)* area, uint extendMode, const(BLMatrix2D)* m);
__gshared pblPatternInitAs blPatternInitAs;

extern(C) alias pblPatternReset = BLResult function(BLPatternCore* self);
__gshared pblPatternReset blPatternReset;

extern(C) alias pblPatternSetArea = BLResult function(BLPatternCore* self, const(BLRectI)* area);
__gshared pblPatternSetArea blPatternSetArea;

extern(C) alias pblPatternSetExtendMode = BLResult function(BLPatternCore* self, uint extendMode);
__gshared pblPatternSetExtendMode blPatternSetExtendMode;

extern(C) alias pblPatternSetImage = BLResult function(BLPatternCore* self, const(BLImageCore)* image, const(BLRectI)* area);
__gshared pblPatternSetImage blPatternSetImage;

extern(C) alias pblPixelConverterAssign = BLResult function(BLPixelConverterCore* self, const(BLPixelConverterCore)* other);
__gshared pblPixelConverterAssign blPixelConverterAssign;

extern(C) alias pblPixelConverterCreate = BLResult function(BLPixelConverterCore* self, const(BLFormatInfo)* dstInfo, const(BLFormatInfo)* srcInfo, uint createFlags);
__gshared pblPixelConverterCreate blPixelConverterCreate;

extern(C) alias pblPixelConverterInit = BLResult function(BLPixelConverterCore* self);
__gshared pblPixelConverterInit blPixelConverterInit;

extern(C) alias pblPixelConverterInitWeak = BLResult function(BLPixelConverterCore* self, const(BLPixelConverterCore)* other);
__gshared pblPixelConverterInitWeak blPixelConverterInitWeak;

extern(C) alias pblPixelConverterReset = BLResult function(BLPixelConverterCore* self);
__gshared pblPixelConverterReset blPixelConverterReset;

extern(C) alias pblRandomNextDouble = double function(BLRandom* self);
__gshared pblRandomNextDouble blRandomNextDouble;

extern(C) alias pblRandomNextUInt32 = uint function(BLRandom* self);
__gshared pblRandomNextUInt32 blRandomNextUInt32;

extern(C) alias pblRandomNextUInt64 = ulong function(BLRandom* self);
__gshared pblRandomNextUInt64 blRandomNextUInt64;

extern(C) alias pblRandomReset = BLResult function(BLRandom* self, ulong seed);
__gshared pblRandomReset blRandomReset;

extern(C) alias pblRegionAssignBoxI = BLResult function(BLRegionCore* self, const(BLBoxI)* src);
__gshared pblRegionAssignBoxI blRegionAssignBoxI;

extern(C) alias pblRegionAssignBoxIArray = BLResult function(BLRegionCore* self, const(BLBoxI)* data, size_t n);
__gshared pblRegionAssignBoxIArray blRegionAssignBoxIArray;

extern(C) alias pblRegionAssignDeep = BLResult function(BLRegionCore* self, const(BLRegionCore)* other);
__gshared pblRegionAssignDeep blRegionAssignDeep;

extern(C) alias pblRegionAssignMove = BLResult function(BLRegionCore* self, BLRegionCore* other);
__gshared pblRegionAssignMove blRegionAssignMove;

extern(C) alias pblRegionAssignRectI = BLResult function(BLRegionCore* self, const(BLRectI)* rect);
__gshared pblRegionAssignRectI blRegionAssignRectI;

extern(C) alias pblRegionAssignRectIArray = BLResult function(BLRegionCore* self, const(BLRectI)* data, size_t n);
__gshared pblRegionAssignRectIArray blRegionAssignRectIArray;

extern(C) alias pblRegionAssignWeak = BLResult function(BLRegionCore* self, const(BLRegionCore)* other);
__gshared pblRegionAssignWeak blRegionAssignWeak;

extern(C) alias pblRegionClear = BLResult function(BLRegionCore* self);
__gshared pblRegionClear blRegionClear;

extern(C) alias pblRegionCombine = BLResult function(BLRegionCore* self, const(BLRegionCore)* a, const(BLRegionCore)* b, uint booleanOp);
__gshared pblRegionCombine blRegionCombine;

extern(C) alias pblRegionCombineBB = BLResult function(BLRegionCore* self, const(BLBoxI)* a, const(BLBoxI)* b, uint booleanOp);
__gshared pblRegionCombineBB blRegionCombineBB;

extern(C) alias pblRegionCombineBR = BLResult function(BLRegionCore* self, const(BLBoxI)* a, const(BLRegionCore)* b, uint booleanOp);
__gshared pblRegionCombineBR blRegionCombineBR;

extern(C) alias pblRegionCombineRB = BLResult function(BLRegionCore* self, const(BLRegionCore)* a, const(BLBoxI)* b, uint booleanOp);
__gshared pblRegionCombineRB blRegionCombineRB;

extern(C) alias pblRegionEquals = bool function(const(BLRegionCore)* a, const(BLRegionCore)* b);
__gshared pblRegionEquals blRegionEquals;

extern(C) alias pblRegionGetCapacity = size_t function(const(BLRegionCore)* self);
__gshared pblRegionGetCapacity blRegionGetCapacity;

extern(C) alias pblRegionGetData = const(BLBoxI)* function(const(BLRegionCore)* self);
__gshared pblRegionGetData blRegionGetData;

extern(C) alias pblRegionGetSize = size_t function(const(BLRegionCore)* self);
__gshared pblRegionGetSize blRegionGetSize;

extern(C) alias pblRegionGetType = uint function(const(BLRegionCore)* self);
__gshared pblRegionGetType blRegionGetType;

extern(C) alias pblRegionHitTest = uint function(const(BLRegionCore)* self, const(BLPointI)* pt);
__gshared pblRegionHitTest blRegionHitTest;

extern(C) alias pblRegionHitTestBoxI = uint function(const(BLRegionCore)* self, const(BLBoxI)* box);
__gshared pblRegionHitTestBoxI blRegionHitTestBoxI;

extern(C) alias pblRegionInit = BLResult function(BLRegionCore* self);
__gshared pblRegionInit blRegionInit;

extern(C) alias pblRegionIntersectAndClip = BLResult function(BLRegionCore* self, const(BLRegionCore)* a, const(BLRegionCore)* b, const(BLBoxI)* clipBox);
__gshared pblRegionIntersectAndClip blRegionIntersectAndClip;

extern(C) alias pblRegionReserve = BLResult function(BLRegionCore* self, size_t n);
__gshared pblRegionReserve blRegionReserve;

extern(C) alias pblRegionReset = BLResult function(BLRegionCore* self);
__gshared pblRegionReset blRegionReset;

extern(C) alias pblRegionShrink = BLResult function(BLRegionCore* self);
__gshared pblRegionShrink blRegionShrink;

extern(C) alias pblRegionTranslate = BLResult function(BLRegionCore* self, const(BLRegionCore)* r, const(BLPointI)* pt);
__gshared pblRegionTranslate blRegionTranslate;

extern(C) alias pblRegionTranslateAndClip = BLResult function(BLRegionCore* self, const(BLRegionCore)* r, const(BLPointI)* pt, const(BLBoxI)* clipBox);
__gshared pblRegionTranslateAndClip blRegionTranslateAndClip;

extern(C) alias pblResultFromWinError = BLResult function(uint e);
__gshared pblResultFromWinError blResultFromWinError;

extern(C) alias pblRuntimeAssertionFailure = void function(const(char)* file, int line, const(char)* msg);
__gshared pblRuntimeAssertionFailure blRuntimeAssertionFailure;

extern(C) alias pblRuntimeCleanup = BLResult function(uint cleanupFlags);
__gshared pblRuntimeCleanup blRuntimeCleanup;

extern(C) alias pblRuntimeGetTickCount = uint function();
__gshared pblRuntimeGetTickCount blRuntimeGetTickCount;

extern(C) alias pblRuntimeInit = BLResult function();
__gshared pblRuntimeInit blRuntimeInit;

extern(C) alias pblRuntimeMessageFmt = BLResult function(const(char)* fmt, ...);
__gshared pblRuntimeMessageFmt blRuntimeMessageFmt;

extern(C) alias pblRuntimeMessageOut = BLResult function(const(char)* msg);
__gshared pblRuntimeMessageOut blRuntimeMessageOut;

extern(C) alias pblRuntimeMessageVFmt = BLResult function(const(char)* fmt, va_list ap);
__gshared pblRuntimeMessageVFmt blRuntimeMessageVFmt;

extern(C) alias pblRuntimeQueryInfo = BLResult function(uint infoType, void* infoOut);
__gshared pblRuntimeQueryInfo blRuntimeQueryInfo;

extern(C) alias pblRuntimeShutdown = BLResult function();
__gshared pblRuntimeShutdown blRuntimeShutdown;

extern(C) alias pblStringApplyOpChar = BLResult function(BLStringCore* self, uint op, char c, size_t n);
__gshared pblStringApplyOpChar blStringApplyOpChar;

extern(C) alias pblStringApplyOpData = BLResult function(BLStringCore* self, uint op, const(char)* str, size_t n);
__gshared pblStringApplyOpData blStringApplyOpData;

extern(C) alias pblStringApplyOpFormat = BLResult function(BLStringCore* self, uint op, const(char)* fmt, ...);
__gshared pblStringApplyOpFormat blStringApplyOpFormat;

extern(C) alias pblStringApplyOpFormatV = BLResult function(BLStringCore* self, uint op, const(char)* fmt, va_list ap);
__gshared pblStringApplyOpFormatV blStringApplyOpFormatV;

extern(C) alias pblStringApplyOpString = BLResult function(BLStringCore* self, uint op, const(BLStringCore)* other);
__gshared pblStringApplyOpString blStringApplyOpString;

extern(C) alias pblStringAssignData = BLResult function(BLStringCore* self, const(char)* str, size_t n);
__gshared pblStringAssignData blStringAssignData;

extern(C) alias pblStringAssignDeep = BLResult function(BLStringCore* self, const(BLStringCore)* other);
__gshared pblStringAssignDeep blStringAssignDeep;

extern(C) alias pblStringAssignMove = BLResult function(BLStringCore* self, BLStringCore* other);
__gshared pblStringAssignMove blStringAssignMove;

extern(C) alias pblStringAssignWeak = BLResult function(BLStringCore* self, const(BLStringCore)* other);
__gshared pblStringAssignWeak blStringAssignWeak;

extern(C) alias pblStringClear = BLResult function(BLStringCore* self);
__gshared pblStringClear blStringClear;

extern(C) alias pblStringCompare = int function(const(BLStringCore)* self, const(BLStringCore)* other);
__gshared pblStringCompare blStringCompare;

extern(C) alias pblStringCompareData = int function(const(BLStringCore)* self, const(char)* str, size_t n);
__gshared pblStringCompareData blStringCompareData;

extern(C) alias pblStringEquals = bool function(const(BLStringCore)* self, const(BLStringCore)* other);
__gshared pblStringEquals blStringEquals;

extern(C) alias pblStringEqualsData = bool function(const(BLStringCore)* self, const(char)* str, size_t n);
__gshared pblStringEqualsData blStringEqualsData;

extern(C) alias pblStringGetCapacity = size_t function(const(BLStringCore)* self);
__gshared pblStringGetCapacity blStringGetCapacity;

extern(C) alias pblStringGetData = const(char)* function(const(BLStringCore)* self);
__gshared pblStringGetData blStringGetData;

extern(C) alias pblStringGetSize = size_t function(const(BLStringCore)* self);
__gshared pblStringGetSize blStringGetSize;

extern(C) alias pblStringInit = BLResult function(BLStringCore* self);
__gshared pblStringInit blStringInit;

extern(C) alias pblStringInsertChar = BLResult function(BLStringCore* self, size_t index, char c, size_t n);
__gshared pblStringInsertChar blStringInsertChar;

extern(C) alias pblStringInsertData = BLResult function(BLStringCore* self, size_t index, const(char)* str, size_t n);
__gshared pblStringInsertData blStringInsertData;

extern(C) alias pblStringInsertOp = BLResult function(BLStringCore* self, size_t index, size_t n, char** dataOut);
__gshared pblStringInsertOp blStringInsertOp;

extern(C) alias pblStringInsertString = BLResult function(BLStringCore* self, size_t index, const(BLStringCore)* other);
__gshared pblStringInsertString blStringInsertString;

extern(C) alias pblStringMakeMutable = BLResult function(BLStringCore* self, char** dataOut);
__gshared pblStringMakeMutable blStringMakeMutable;

extern(C) alias pblStringModifyOp = BLResult function(BLStringCore* self, uint op, size_t n, char** dataOut);
__gshared pblStringModifyOp blStringModifyOp;

extern(C) alias pblStringRemoveRange = BLResult function(BLStringCore* self, size_t rStart, size_t rEnd);
__gshared pblStringRemoveRange blStringRemoveRange;

extern(C) alias pblStringReserve = BLResult function(BLStringCore* self, size_t n);
__gshared pblStringReserve blStringReserve;

extern(C) alias pblStringReset = BLResult function(BLStringCore* self);
__gshared pblStringReset blStringReset;

extern(C) alias pblStringResize = BLResult function(BLStringCore* self, size_t n, char fill);
__gshared pblStringResize blStringResize;

extern(C) alias pblStringShrink = BLResult function(BLStringCore* self);
__gshared pblStringShrink blStringShrink;

extern(C) alias pblStrokeOptionsAssignMove = BLResult function(BLStrokeOptionsCore* self, BLStrokeOptionsCore* other);
__gshared pblStrokeOptionsAssignMove blStrokeOptionsAssignMove;

extern(C) alias pblStrokeOptionsAssignWeak = BLResult function(BLStrokeOptionsCore* self, const(BLStrokeOptionsCore)* other);
__gshared pblStrokeOptionsAssignWeak blStrokeOptionsAssignWeak;

extern(C) alias pblStrokeOptionsInit = BLResult function(BLStrokeOptionsCore* self);
__gshared pblStrokeOptionsInit blStrokeOptionsInit;

extern(C) alias pblStrokeOptionsInitMove = BLResult function(BLStrokeOptionsCore* self, BLStrokeOptionsCore* other);
__gshared pblStrokeOptionsInitMove blStrokeOptionsInitMove;

extern(C) alias pblStrokeOptionsInitWeak = BLResult function(BLStrokeOptionsCore* self, const(BLStrokeOptionsCore)* other);
__gshared pblStrokeOptionsInitWeak blStrokeOptionsInitWeak;

extern(C) alias pblStrokeOptionsReset = BLResult function(BLStrokeOptionsCore* self);
__gshared pblStrokeOptionsReset blStrokeOptionsReset;

extern(C) alias pblVariantAssignMove = BLResult function(void* self, void* other);
__gshared pblVariantAssignMove blVariantAssignMove;

extern(C) alias pblVariantAssignWeak = BLResult function(void* self, const(void)* other);
__gshared pblVariantAssignWeak blVariantAssignWeak;

extern(C) alias pblVariantEquals = bool function(const(void)* a, const(void)* b);
__gshared pblVariantEquals blVariantEquals;

extern(C) alias pblVariantGetImplType = uint function(const(void)* self);
__gshared pblVariantGetImplType blVariantGetImplType;

extern(C) alias pblVariantInit = BLResult function(void* self);
__gshared pblVariantInit blVariantInit;

extern(C) alias pblVariantInitMove = BLResult function(void* self, void* other);
__gshared pblVariantInitMove blVariantInitMove;

extern(C) alias pblVariantInitWeak = BLResult function(void* self, const(void)* other);
__gshared pblVariantInitWeak blVariantInitWeak;

extern(C) alias pblVariantReset = BLResult function(void* self);
__gshared pblVariantReset blVariantReset;

private {
    SharedLib lib;
    Blend2DSupport loadedVersion;
}

@nogc nothrow:

void unloadGLFW()
{
    if(lib != invalidHandle) {
        lib.unload();
    }
}

Blend2DSupport loadedBlend2DVersion() @safe
{
    return loadedVersion;
}

bool isBlend2DLoaded() @safe
{
    return lib != invalidHandle;
}

Blend2DSupport loadBlend2D()
{
    version(Windows) {
        const(char)[][1] libNames = ["blend2d.dll"];
    }
    else version(OSX) {
        const(char)[][1] libNames = [
            "blend2d.dylib"
        ];
    }
    else version(Posix) {
        const(char)[][1] libNames = [
            "blend2d.so"
        ];
    }
    else static assert(0, "bindbc-blend2d is not yet supported on this platform.");

    Blend2DSupport ret;
    foreach(name; libNames) {
        ret = loadBlend2D(name.ptr);
        if(ret != Blend2DSupport.noLibrary) break;
    }
    return ret;
}

Blend2DSupport loadBlend2D(const(char)* libName)
{
    lib = load(libName);
    if(lib == invalidHandle) {
        return Blend2DSupport.noLibrary;
    }

    auto errCount = errorCount();
    loadedVersion = Blend2DSupport.badLibrary;

    lib.bindSymbol(cast(void**)&blDefaultApproximationOptions, "blDefaultApproximationOptions");
    lib.bindSymbol(cast(void**)&blFormatInfo, "blFormatInfo");
    lib.bindSymbol(cast(void**)&blMatrix2DMapPointDArrayFuncs, "blMatrix2DMapPointDArrayFuncs");
    lib.bindSymbol(cast(void**)&blNone, "blNone");

    lib.bindSymbol_stdcall(blPixelConverterConvert, "blPixelConverterConvert");

    lib.bindSymbol_stdcall(blArrayAppendF32, "blArrayAppendF32");
    lib.bindSymbol_stdcall(blArrayAppendF64, "blArrayAppendF64");
    lib.bindSymbol_stdcall(blArrayAppendItem, "blArrayAppendItem");
    lib.bindSymbol_stdcall(blArrayAppendU8, "blArrayAppendU8");
    lib.bindSymbol_stdcall(blArrayAppendU16, "blArrayAppendU16");
    lib.bindSymbol_stdcall(blArrayAppendU32, "blArrayAppendU32");
    lib.bindSymbol_stdcall(blArrayAppendU64, "blArrayAppendU64");
    lib.bindSymbol_stdcall(blArrayAppendView, "blArrayAppendView");
    lib.bindSymbol_stdcall(blArrayAssignDeep, "blArrayAssignDeep");
    lib.bindSymbol_stdcall(blArrayAssignMove, "blArrayAssignMove");
    lib.bindSymbol_stdcall(blArrayAssignView, "blArrayAssignView");
    lib.bindSymbol_stdcall(blArrayAssignWeak, "blArrayAssignWeak");
    lib.bindSymbol_stdcall(blArrayClear, "blArrayClear");
    lib.bindSymbol_stdcall(blArrayCreateFromData, "blArrayCreateFromData");
    lib.bindSymbol_stdcall(blArrayEquals, "blArrayEquals");
    lib.bindSymbol_stdcall(blArrayGetCapacity, "blArrayGetCapacity");
    lib.bindSymbol_stdcall(blArrayGetData, "blArrayGetData");
    lib.bindSymbol_stdcall(blArrayGetSize, "blArrayGetSize");
    lib.bindSymbol_stdcall(blArrayInit, "blArrayInit");
    lib.bindSymbol_stdcall(blArrayInsertF32, "blArrayInsertF32");
    lib.bindSymbol_stdcall(blArrayInsertF64, "blArrayInsertF64");
    lib.bindSymbol_stdcall(blArrayInsertItem, "blArrayInsertItem");
    lib.bindSymbol_stdcall(blArrayInsertOp, "blArrayInsertOp");
    lib.bindSymbol_stdcall(blArrayInsertU8, "blArrayInsertU8");
    lib.bindSymbol_stdcall(blArrayInsertU16, "blArrayInsertU16");
    lib.bindSymbol_stdcall(blArrayInsertU32, "blArrayInsertU32");
    lib.bindSymbol_stdcall(blArrayInsertU64, "blArrayInsertU64");
    lib.bindSymbol_stdcall(blArrayInsertView, "blArrayInsertView");
    lib.bindSymbol_stdcall(blArrayMakeMutable, "blArrayMakeMutable");
    lib.bindSymbol_stdcall(blArrayModifyOp, "blArrayModifyOp");
    lib.bindSymbol_stdcall(blArrayRemoveIndex, "blArrayRemoveIndex");
    lib.bindSymbol_stdcall(blArrayRemoveRange, "blArrayRemoveRange");
    lib.bindSymbol_stdcall(blArrayReplaceF32, "blArrayReplaceF32");
    lib.bindSymbol_stdcall(blArrayReplaceF64, "blArrayReplaceF64");
    lib.bindSymbol_stdcall(blArrayReplaceItem, "blArrayReplaceItem");
    lib.bindSymbol_stdcall(blArrayReplaceU8, "blArrayReplaceU8");
    lib.bindSymbol_stdcall(blArrayReplaceU16, "blArrayReplaceU16");
    lib.bindSymbol_stdcall(blArrayReplaceU32, "blArrayReplaceU32");
    lib.bindSymbol_stdcall(blArrayReplaceU64, "blArrayReplaceU64");
    lib.bindSymbol_stdcall(blArrayReplaceView, "blArrayReplaceView");
    lib.bindSymbol_stdcall(blArrayReserve, "blArrayReserve");
    lib.bindSymbol_stdcall(blArrayReset, "blArrayReset");
    lib.bindSymbol_stdcall(blArrayResize, "blArrayResize");
    lib.bindSymbol_stdcall(blArrayShrink, "blArrayShrink");
    lib.bindSymbol_stdcall(blContextAssignMove, "blContextAssignMove");
    lib.bindSymbol_stdcall(blContextAssignWeak, "blContextAssignWeak");
    lib.bindSymbol_stdcall(blContextBegin, "blContextBegin");
    lib.bindSymbol_stdcall(blContextBlitImageD, "blContextBlitImageD");
    lib.bindSymbol_stdcall(blContextBlitImageI, "blContextBlitImageI");
    lib.bindSymbol_stdcall(blContextBlitScaledImageD, "blContextBlitScaledImageD");
    lib.bindSymbol_stdcall(blContextBlitScaledImageI, "blContextBlitScaledImageI");
    lib.bindSymbol_stdcall(blContextClearAll, "blContextClearAll");
    lib.bindSymbol_stdcall(blContextClearRectD, "blContextClearRectD");
    lib.bindSymbol_stdcall(blContextClearRectI, "blContextClearRectI");
    lib.bindSymbol_stdcall(blContextClipToRectD, "blContextClipToRectD");
    lib.bindSymbol_stdcall(blContextClipToRectI, "blContextClipToRectI");
    lib.bindSymbol_stdcall(blContextEnd, "blContextEnd");
    lib.bindSymbol_stdcall(blContextFillAll, "blContextFillAll");
    lib.bindSymbol_stdcall(blContextFillGeometry, "blContextFillGeometry");
    lib.bindSymbol_stdcall(blContextFillGlyphRunD, "blContextFillGlyphRunD");
    lib.bindSymbol_stdcall(blContextFillGlyphRunI, "blContextFillGlyphRunI");
    lib.bindSymbol_stdcall(blContextFillPathD, "blContextFillPathD");
    lib.bindSymbol_stdcall(blContextFillRectD, "blContextFillRectD");
    lib.bindSymbol_stdcall(blContextFillRectI, "blContextFillRectI");
    lib.bindSymbol_stdcall(blContextFillTextD, "blContextFillTextD");
    lib.bindSymbol_stdcall(blContextFillTextI, "blContextFillTextI");
    lib.bindSymbol_stdcall(blContextFlush, "blContextFlush");
    lib.bindSymbol_stdcall(blContextGetFillStyle, "blContextGetFillStyle");
    lib.bindSymbol_stdcall(blContextGetFillStyleRgba32, "blContextGetFillStyleRgba32");
    lib.bindSymbol_stdcall(blContextGetFillStyleRgba64, "blContextGetFillStyleRgba64");
    lib.bindSymbol_stdcall(blContextGetMetaMatrix, "blContextGetMetaMatrix");
    lib.bindSymbol_stdcall(blContextGetStrokeOptions, "blContextGetStrokeOptions");
    lib.bindSymbol_stdcall(blContextGetStrokeStyle, "blContextGetStrokeStyle");
    lib.bindSymbol_stdcall(blContextGetStrokeStyleRgba32, "blContextGetStrokeStyleRgba32");
    lib.bindSymbol_stdcall(blContextGetStrokeStyleRgba64, "blContextGetStrokeStyleRgba64");
    lib.bindSymbol_stdcall(blContextGetType, "blContextGetType");
    lib.bindSymbol_stdcall(blContextGetUserMatrix, "blContextGetUserMatrix");
    lib.bindSymbol_stdcall(blContextInit, "blContextInit");
    lib.bindSymbol_stdcall(blContextInitAs, "blContextInitAs");
    lib.bindSymbol_stdcall(blContextMatrixOp, "blContextMatrixOp");
    lib.bindSymbol_stdcall(blContextReset, "blContextReset");
    lib.bindSymbol_stdcall(blContextRestore, "blContextRestore");
    lib.bindSymbol_stdcall(blContextRestoreClipping, "blContextRestoreClipping");
    lib.bindSymbol_stdcall(blContextSave, "blContextSave");
    lib.bindSymbol_stdcall(blContextSetApproximationOptions, "blContextSetApproximationOptions");
    lib.bindSymbol_stdcall(blContextSetCompOp, "blContextSetCompOp");
    lib.bindSymbol_stdcall(blContextSetFillAlpha, "blContextSetFillAlpha");
    lib.bindSymbol_stdcall(blContextSetFillRule, "blContextSetFillRule");
    lib.bindSymbol_stdcall(blContextSetFillStyle, "blContextSetFillStyle");
    lib.bindSymbol_stdcall(blContextSetFillStyleRgba32, "blContextSetFillStyleRgba32");
    lib.bindSymbol_stdcall(blContextSetFillStyleRgba64, "blContextSetFillStyleRgba64");
    lib.bindSymbol_stdcall(blContextSetFlattenMode, "blContextSetFlattenMode");
    lib.bindSymbol_stdcall(blContextSetFlattenTolerance, "blContextSetFlattenTolerance");
    lib.bindSymbol_stdcall(blContextSetGlobalAlpha, "blContextSetGlobalAlpha");
    lib.bindSymbol_stdcall(blContextSetHint, "blContextSetHint");
    lib.bindSymbol_stdcall(blContextSetHints, "blContextSetHints");
    lib.bindSymbol_stdcall(blContextSetStrokeAlpha, "blContextSetStrokeAlpha");
    lib.bindSymbol_stdcall(blContextSetStrokeCap, "blContextSetStrokeCap");
    lib.bindSymbol_stdcall(blContextSetStrokeCaps, "blContextSetStrokeCaps");
    lib.bindSymbol_stdcall(blContextSetStrokeDashArray, "blContextSetStrokeDashArray");
    lib.bindSymbol_stdcall(blContextSetStrokeDashOffset, "blContextSetStrokeDashOffset");
    lib.bindSymbol_stdcall(blContextSetStrokeJoin, "blContextSetStrokeJoin");
    lib.bindSymbol_stdcall(blContextSetStrokeMiterLimit, "blContextSetStrokeMiterLimit");
    lib.bindSymbol_stdcall(blContextSetStrokeOptions, "blContextSetStrokeOptions");
    lib.bindSymbol_stdcall(blContextSetStrokeStyle, "blContextSetStrokeStyle");
    lib.bindSymbol_stdcall(blContextSetStrokeStyleRgba32, "blContextSetStrokeStyleRgba32");
    lib.bindSymbol_stdcall(blContextSetStrokeStyleRgba64, "blContextSetStrokeStyleRgba64");
    lib.bindSymbol_stdcall(blContextSetStrokeTransformOrder, "blContextSetStrokeTransformOrder");
    lib.bindSymbol_stdcall(blContextSetStrokeWidth, "blContextSetStrokeWidth");
    lib.bindSymbol_stdcall(blContextStrokeGeometry, "blContextStrokeGeometry");
    lib.bindSymbol_stdcall(blContextStrokeGlyphRunD, "blContextStrokeGlyphRunD");
    lib.bindSymbol_stdcall(blContextStrokeGlyphRunI, "blContextStrokeGlyphRunI");
    lib.bindSymbol_stdcall(blContextStrokePathD, "blContextStrokePathD");
    lib.bindSymbol_stdcall(blContextStrokeRectD, "blContextStrokeRectD");
    lib.bindSymbol_stdcall(blContextStrokeRectI, "blContextStrokeRectI");
    lib.bindSymbol_stdcall(blContextStrokeTextD, "blContextStrokeTextD");
    lib.bindSymbol_stdcall(blContextStrokeTextI, "blContextStrokeTextI");
    lib.bindSymbol_stdcall(blContextUserToMeta, "blContextUserToMeta");
    lib.bindSymbol_stdcall(blFileClose, "blFileClose");
    lib.bindSymbol_stdcall(blFileGetSize, "blFileGetSize");
    lib.bindSymbol_stdcall(blFileInit, "blFileInit");
    lib.bindSymbol_stdcall(blFileOpen, "blFileOpen");
    lib.bindSymbol_stdcall(blFileRead, "blFileRead");
    lib.bindSymbol_stdcall(blFileReset, "blFileReset");
    lib.bindSymbol_stdcall(blFileSeek, "blFileSeek");
    lib.bindSymbol_stdcall(blFileSystemReadFile, "blFileSystemReadFile");
    lib.bindSymbol_stdcall(blFileSystemWriteFile, "blFileSystemWriteFile");
    lib.bindSymbol_stdcall(blFileTruncate, "blFileTruncate");
    lib.bindSymbol_stdcall(blFileWrite, "blFileWrite");
    lib.bindSymbol_stdcall(blFontApplyGPos, "blFontApplyGPos");
    lib.bindSymbol_stdcall(blFontApplyGSub, "blFontApplyGSub");
    lib.bindSymbol_stdcall(blFontApplyKerning, "blFontApplyKerning");
    lib.bindSymbol_stdcall(blFontAssignMove, "blFontAssignMove");
    lib.bindSymbol_stdcall(blFontAssignWeak, "blFontAssignWeak");
    lib.bindSymbol_stdcall(blFontCreateFromFace, "blFontCreateFromFace");
    lib.bindSymbol_stdcall(blFontDataAssignMove, "blFontDataAssignMove");
    lib.bindSymbol_stdcall(blFontDataAssignWeak, "blFontDataAssignWeak");
    lib.bindSymbol_stdcall(blFontDataCreateFromData, "blFontDataCreateFromData");
    lib.bindSymbol_stdcall(blFontDataCreateFromDataArray, "blFontDataCreateFromDataArray");
    lib.bindSymbol_stdcall(blFontDataCreateFromFile, "blFontDataCreateFromFile");
    lib.bindSymbol_stdcall(blFontDataEquals, "blFontDataEquals");
    lib.bindSymbol_stdcall(blFontDataInit, "blFontDataInit");
    lib.bindSymbol_stdcall(blFontDataListTags, "blFontDataListTags");
    lib.bindSymbol_stdcall(blFontDataQueryTables, "blFontDataQueryTables");
    lib.bindSymbol_stdcall(blFontDataReset, "blFontDataReset");
    lib.bindSymbol_stdcall(blFontEquals, "blFontEquals");
    lib.bindSymbol_stdcall(blFontFaceAssignMove, "blFontFaceAssignMove");
    lib.bindSymbol_stdcall(blFontFaceAssignWeak, "blFontFaceAssignWeak");
    lib.bindSymbol_stdcall(blFontFaceCreateFromData, "blFontFaceCreateFromData");
    lib.bindSymbol_stdcall(blFontFaceCreateFromFile, "blFontFaceCreateFromFile");
    lib.bindSymbol_stdcall(blFontFaceEquals, "blFontFaceEquals");
    lib.bindSymbol_stdcall(blFontFaceGetDesignMetrics, "blFontFaceGetDesignMetrics");
    lib.bindSymbol_stdcall(blFontFaceGetFaceInfo, "blFontFaceGetFaceInfo");
    lib.bindSymbol_stdcall(blFontFaceGetUnicodeCoverage, "blFontFaceGetUnicodeCoverage");
    lib.bindSymbol_stdcall(blFontFaceInit, "blFontFaceInit");
    lib.bindSymbol_stdcall(blFontFaceReset, "blFontFaceReset");
    lib.bindSymbol_stdcall(blFontGetDesignMetrics, "blFontGetDesignMetrics");
    lib.bindSymbol_stdcall(blFontGetGlyphAdvances, "blFontGetGlyphAdvances");
    lib.bindSymbol_stdcall(blFontGetGlyphBounds, "blFontGetGlyphBounds");
    lib.bindSymbol_stdcall(blFontGetGlyphOutlines, "blFontGetGlyphOutlines");
    lib.bindSymbol_stdcall(blFontGetGlyphRunOutlines, "blFontGetGlyphRunOutlines");
    lib.bindSymbol_stdcall(blFontGetMatrix, "blFontGetMatrix");
    lib.bindSymbol_stdcall(blFontGetMetrics, "blFontGetMetrics");
    lib.bindSymbol_stdcall(blFontGetTextMetrics, "blFontGetTextMetrics");
    lib.bindSymbol_stdcall(blFontInit, "blFontInit");
    lib.bindSymbol_stdcall(blFontManagerAssignMove, "blFontManagerAssignMove");
    lib.bindSymbol_stdcall(blFontManagerAssignWeak, "blFontManagerAssignWeak");
    lib.bindSymbol_stdcall(blFontManagerEquals, "blFontManagerEquals");
    lib.bindSymbol_stdcall(blFontManagerInit, "blFontManagerInit");
    lib.bindSymbol_stdcall(blFontManagerReset, "blFontManagerReset");
    lib.bindSymbol_stdcall(blFontMapTextToGlyphs, "blFontMapTextToGlyphs");
    lib.bindSymbol_stdcall(blFontPositionGlyphs, "blFontPositionGlyphs");
    lib.bindSymbol_stdcall(blFontReset, "blFontReset");
    lib.bindSymbol_stdcall(blFontShape, "blFontShape");
    lib.bindSymbol_stdcall(blFormatInfoQuery, "blFormatInfoQuery");
    lib.bindSymbol_stdcall(blFormatInfoSanitize, "blFormatInfoSanitize");
    lib.bindSymbol_stdcall(blGlyphBufferClear, "blGlyphBufferClear");
    lib.bindSymbol_stdcall(blGlyphBufferGetContent, "blGlyphBufferGetContent");
    lib.bindSymbol_stdcall(blGlyphBufferGetFlags, "blGlyphBufferGetFlags");
    lib.bindSymbol_stdcall(blGlyphBufferGetGlyphRun, "blGlyphBufferGetGlyphRun");
    lib.bindSymbol_stdcall(blGlyphBufferGetInfoData, "blGlyphBufferGetInfoData");
    lib.bindSymbol_stdcall(blGlyphBufferGetPlacementData, "blGlyphBufferGetPlacementData");
    lib.bindSymbol_stdcall(blGlyphBufferGetSize, "blGlyphBufferGetSize");
    lib.bindSymbol_stdcall(blGlyphBufferInit, "blGlyphBufferInit");
    lib.bindSymbol_stdcall(blGlyphBufferInitMove, "blGlyphBufferInitMove");
    lib.bindSymbol_stdcall(blGlyphBufferReset, "blGlyphBufferReset");
    lib.bindSymbol_stdcall(blGlyphBufferSetGlyphs, "blGlyphBufferSetGlyphs");
    lib.bindSymbol_stdcall(blGlyphBufferSetGlyphsFromStruct, "blGlyphBufferSetGlyphsFromStruct");
    lib.bindSymbol_stdcall(blGlyphBufferSetText, "blGlyphBufferSetText");
    lib.bindSymbol_stdcall(blGradientAddStopRgba32, "blGradientAddStopRgba32");
    lib.bindSymbol_stdcall(blGradientAddStopRgba64, "blGradientAddStopRgba64");
    lib.bindSymbol_stdcall(blGradientApplyMatrixOp, "blGradientApplyMatrixOp");
    lib.bindSymbol_stdcall(blGradientAssignMove, "blGradientAssignMove");
    lib.bindSymbol_stdcall(blGradientAssignStops, "blGradientAssignStops");
    lib.bindSymbol_stdcall(blGradientAssignWeak, "blGradientAssignWeak");
    lib.bindSymbol_stdcall(blGradientCreate, "blGradientCreate");
    lib.bindSymbol_stdcall(blGradientEquals, "blGradientEquals");
    lib.bindSymbol_stdcall(blGradientGetCapacity, "blGradientGetCapacity");
    lib.bindSymbol_stdcall(blGradientGetExtendMode, "blGradientGetExtendMode");
    lib.bindSymbol_stdcall(blGradientGetSize, "blGradientGetSize");
    lib.bindSymbol_stdcall(blGradientGetStops, "blGradientGetStops");
    lib.bindSymbol_stdcall(blGradientGetType, "blGradientGetType");
    lib.bindSymbol_stdcall(blGradientGetValue, "blGradientGetValue");
    lib.bindSymbol_stdcall(blGradientIndexOfStop, "blGradientIndexOfStop");
    lib.bindSymbol_stdcall(blGradientInit, "blGradientInit");
    lib.bindSymbol_stdcall(blGradientInitAs, "blGradientInitAs");
    lib.bindSymbol_stdcall(blGradientRemoveStop, "blGradientRemoveStop");
    lib.bindSymbol_stdcall(blGradientRemoveStopByOffset, "blGradientRemoveStopByOffset");
    lib.bindSymbol_stdcall(blGradientRemoveStops, "blGradientRemoveStops");
    lib.bindSymbol_stdcall(blGradientRemoveStopsFromTo, "blGradientRemoveStopsFromTo");
    lib.bindSymbol_stdcall(blGradientReplaceStopRgba32, "blGradientReplaceStopRgba32");
    lib.bindSymbol_stdcall(blGradientReplaceStopRgba64, "blGradientReplaceStopRgba64");
    lib.bindSymbol_stdcall(blGradientReserve, "blGradientReserve");
    lib.bindSymbol_stdcall(blGradientReset, "blGradientReset");
    lib.bindSymbol_stdcall(blGradientResetStops, "blGradientResetStops");
    lib.bindSymbol_stdcall(blGradientSetExtendMode, "blGradientSetExtendMode");
    lib.bindSymbol_stdcall(blGradientSetType, "blGradientSetType");
    lib.bindSymbol_stdcall(blGradientSetValue, "blGradientSetValue");
    lib.bindSymbol_stdcall(blGradientSetValues, "blGradientSetValues");
    lib.bindSymbol_stdcall(blGradientShrink, "blGradientShrink");
    lib.bindSymbol_stdcall(blImageAssignDeep, "blImageAssignDeep");
    lib.bindSymbol_stdcall(blImageAssignMove, "blImageAssignMove");
    lib.bindSymbol_stdcall(blImageAssignWeak, "blImageAssignWeak");
    lib.bindSymbol_stdcall(blImageCodecAddToBuiltIn, "blImageCodecAddToBuiltIn");
    lib.bindSymbol_stdcall(blImageCodecArrayAssignBuiltInCodecs, "blImageCodecArrayAssignBuiltInCodecs");
    lib.bindSymbol_stdcall(blImageCodecArrayInitBuiltInCodecs, "blImageCodecArrayInitBuiltInCodecs");
    lib.bindSymbol_stdcall(blImageCodecAssignWeak, "blImageCodecAssignWeak");
    lib.bindSymbol_stdcall(blImageCodecCreateDecoder, "blImageCodecCreateDecoder");
    lib.bindSymbol_stdcall(blImageCodecCreateEncoder, "blImageCodecCreateEncoder");
    lib.bindSymbol_stdcall(blImageCodecFindByData, "blImageCodecFindByData");
    lib.bindSymbol_stdcall(blImageCodecFindByName, "blImageCodecFindByName");
    lib.bindSymbol_stdcall(blImageCodecInit, "blImageCodecInit");
    lib.bindSymbol_stdcall(blImageCodecInspectData, "blImageCodecInspectData");
    lib.bindSymbol_stdcall(blImageCodecRemoveFromBuiltIn, "blImageCodecRemoveFromBuiltIn");
    lib.bindSymbol_stdcall(blImageCodecReset, "blImageCodecReset");
    lib.bindSymbol_stdcall(blImageConvert, "blImageConvert");
    lib.bindSymbol_stdcall(blImageCreate, "blImageCreate");
    lib.bindSymbol_stdcall(blImageCreateFromData, "blImageCreateFromData");
    lib.bindSymbol_stdcall(blImageDecoderAssignMove, "blImageDecoderAssignMove");
    lib.bindSymbol_stdcall(blImageDecoderAssignWeak, "blImageDecoderAssignWeak");
    lib.bindSymbol_stdcall(blImageDecoderInit, "blImageDecoderInit");
    lib.bindSymbol_stdcall(blImageDecoderReadFrame, "blImageDecoderReadFrame");
    lib.bindSymbol_stdcall(blImageDecoderReadInfo, "blImageDecoderReadInfo");
    lib.bindSymbol_stdcall(blImageDecoderReset, "blImageDecoderReset");
    lib.bindSymbol_stdcall(blImageDecoderRestart, "blImageDecoderRestart");
    lib.bindSymbol_stdcall(blImageEncoderAssignMove, "blImageEncoderAssignMove");
    lib.bindSymbol_stdcall(blImageEncoderAssignWeak, "blImageEncoderAssignWeak");
    lib.bindSymbol_stdcall(blImageEncoderInit, "blImageEncoderInit");
    lib.bindSymbol_stdcall(blImageEncoderReset, "blImageEncoderReset");
    lib.bindSymbol_stdcall(blImageEncoderRestart, "blImageEncoderRestart");
    lib.bindSymbol_stdcall(blImageEncoderWriteFrame, "blImageEncoderWriteFrame");
    lib.bindSymbol_stdcall(blImageEquals, "blImageEquals");
    lib.bindSymbol_stdcall(blImageGetData, "blImageGetData");
    lib.bindSymbol_stdcall(blImageInit, "blImageInit");
    lib.bindSymbol_stdcall(blImageInitAs, "blImageInitAs");
    lib.bindSymbol_stdcall(blImageInitAsFromData, "blImageInitAsFromData");
    lib.bindSymbol_stdcall(blImageMakeMutable, "blImageMakeMutable");
    lib.bindSymbol_stdcall(blImageReadFromData, "blImageReadFromData");
    lib.bindSymbol_stdcall(blImageReadFromFile, "blImageReadFromFile");
    lib.bindSymbol_stdcall(blImageReset, "blImageReset");
    lib.bindSymbol_stdcall(blImageScale, "blImageScale");
    lib.bindSymbol_stdcall(blImageWriteToData, "blImageWriteToData");
    lib.bindSymbol_stdcall(blImageWriteToFile, "blImageWriteToFile");
    lib.bindSymbol_stdcall(blMatrix2DApplyOp, "blMatrix2DApplyOp");
    lib.bindSymbol_stdcall(blMatrix2DGetType, "blMatrix2DGetType");
    lib.bindSymbol_stdcall(blMatrix2DInvert, "blMatrix2DInvert");
    lib.bindSymbol_stdcall(blMatrix2DMapPointDArray, "blMatrix2DMapPointDArray");
    lib.bindSymbol_stdcall(blMatrix2DSetIdentity, "blMatrix2DSetIdentity");
    lib.bindSymbol_stdcall(blMatrix2DSetRotation, "blMatrix2DSetRotation");
    lib.bindSymbol_stdcall(blMatrix2DSetScaling, "blMatrix2DSetScaling");
    lib.bindSymbol_stdcall(blMatrix2DSetSkewing, "blMatrix2DSetSkewing");
    lib.bindSymbol_stdcall(blMatrix2DSetTranslation, "blMatrix2DSetTranslation");
    lib.bindSymbol_stdcall(blPathAddBoxD, "blPathAddBoxD");
    lib.bindSymbol_stdcall(blPathAddBoxI, "blPathAddBoxI");
    lib.bindSymbol_stdcall(blPathAddGeometry, "blPathAddGeometry");
    lib.bindSymbol_stdcall(blPathAddPath, "blPathAddPath");
    lib.bindSymbol_stdcall(blPathAddRectD, "blPathAddRectD");
    lib.bindSymbol_stdcall(blPathAddRectI, "blPathAddRectI");
    lib.bindSymbol_stdcall(blPathAddReversedPath, "blPathAddReversedPath");
    lib.bindSymbol_stdcall(blPathAddStrokedPath, "blPathAddStrokedPath");
    lib.bindSymbol_stdcall(blPathAddTransformedPath, "blPathAddTransformedPath");
    lib.bindSymbol_stdcall(blPathAddTranslatedPath, "blPathAddTranslatedPath");
    lib.bindSymbol_stdcall(blPathArcQuadrantTo, "blPathArcQuadrantTo");
    lib.bindSymbol_stdcall(blPathArcTo, "blPathArcTo");
    lib.bindSymbol_stdcall(blPathAssignDeep, "blPathAssignDeep");
    lib.bindSymbol_stdcall(blPathAssignMove, "blPathAssignMove");
    lib.bindSymbol_stdcall(blPathAssignWeak, "blPathAssignWeak");
    lib.bindSymbol_stdcall(blPathClear, "blPathClear");
    lib.bindSymbol_stdcall(blPathClose, "blPathClose");
    lib.bindSymbol_stdcall(blPathCubicTo, "blPathCubicTo");
    lib.bindSymbol_stdcall(blPathEllipticArcTo, "blPathEllipticArcTo");
    lib.bindSymbol_stdcall(blPathEquals, "blPathEquals");
    lib.bindSymbol_stdcall(blPathFitTo, "blPathFitTo");
    lib.bindSymbol_stdcall(blPathGetBoundingBox, "blPathGetBoundingBox");
    lib.bindSymbol_stdcall(blPathGetCapacity, "blPathGetCapacity");
    lib.bindSymbol_stdcall(blPathGetClosestVertex, "blPathGetClosestVertex");
    lib.bindSymbol_stdcall(blPathGetCommandData, "blPathGetCommandData");
    lib.bindSymbol_stdcall(blPathGetControlBox, "blPathGetControlBox");
    lib.bindSymbol_stdcall(blPathGetFigureRange, "blPathGetFigureRange");
    lib.bindSymbol_stdcall(blPathGetInfoFlags, "blPathGetInfoFlags");
    lib.bindSymbol_stdcall(blPathGetLastVertex, "blPathGetLastVertex");
    lib.bindSymbol_stdcall(blPathGetSize, "blPathGetSize");
    lib.bindSymbol_stdcall(blPathGetVertexData, "blPathGetVertexData");
    lib.bindSymbol_stdcall(blPathHitTest, "blPathHitTest");
    lib.bindSymbol_stdcall(blPathInit, "blPathInit");
    lib.bindSymbol_stdcall(blPathLineTo, "blPathLineTo");
    lib.bindSymbol_stdcall(blPathModifyOp, "blPathModifyOp");
    lib.bindSymbol_stdcall(blPathMoveTo, "blPathMoveTo");
    lib.bindSymbol_stdcall(blPathPolyTo, "blPathPolyTo");
    lib.bindSymbol_stdcall(blPathQuadTo, "blPathQuadTo");
    lib.bindSymbol_stdcall(blPathReserve, "blPathReserve");
    lib.bindSymbol_stdcall(blPathReset, "blPathReset");
    lib.bindSymbol_stdcall(blPathSetVertexAt, "blPathSetVertexAt");
    lib.bindSymbol_stdcall(blPathShrink, "blPathShrink");
    lib.bindSymbol_stdcall(blPathSmoothCubicTo, "blPathSmoothCubicTo");
    lib.bindSymbol_stdcall(blPathSmoothQuadTo, "blPathSmoothQuadTo");
    lib.bindSymbol_stdcall(blPathTransform, "blPathTransform");
    lib.bindSymbol_stdcall(blPathTranslate, "blPathTranslate");
    lib.bindSymbol_stdcall(blPatternApplyMatrixOp, "blPatternApplyMatrixOp");
    lib.bindSymbol_stdcall(blPatternAssignDeep, "blPatternAssignDeep");
    lib.bindSymbol_stdcall(blPatternAssignMove, "blPatternAssignMove");
    lib.bindSymbol_stdcall(blPatternAssignWeak, "blPatternAssignWeak");
    lib.bindSymbol_stdcall(blPatternCreate, "blPatternCreate");
    lib.bindSymbol_stdcall(blPatternEquals, "blPatternEquals");
    lib.bindSymbol_stdcall(blPatternInit, "blPatternInit");
    lib.bindSymbol_stdcall(blPatternInitAs, "blPatternInitAs");
    lib.bindSymbol_stdcall(blPatternReset, "blPatternReset");
    lib.bindSymbol_stdcall(blPatternSetArea, "blPatternSetArea");
    lib.bindSymbol_stdcall(blPatternSetExtendMode, "blPatternSetExtendMode");
    lib.bindSymbol_stdcall(blPatternSetImage, "blPatternSetImage");
    lib.bindSymbol_stdcall(blPixelConverterAssign, "blPixelConverterAssign");
    lib.bindSymbol_stdcall(blPixelConverterCreate, "blPixelConverterCreate");
    lib.bindSymbol_stdcall(blPixelConverterInit, "blPixelConverterInit");
    lib.bindSymbol_stdcall(blPixelConverterInitWeak, "blPixelConverterInitWeak");
    lib.bindSymbol_stdcall(blPixelConverterReset, "blPixelConverterReset");
    lib.bindSymbol_stdcall(blRandomNextDouble, "blRandomNextDouble");
    lib.bindSymbol_stdcall(blRandomNextUInt32, "blRandomNextUInt32");
    lib.bindSymbol_stdcall(blRandomNextUInt64, "blRandomNextUInt64");
    lib.bindSymbol_stdcall(blRandomReset, "blRandomReset");
    lib.bindSymbol_stdcall(blRegionAssignBoxI, "blRegionAssignBoxI");
    lib.bindSymbol_stdcall(blRegionAssignBoxIArray, "blRegionAssignBoxIArray");
    lib.bindSymbol_stdcall(blRegionAssignDeep, "blRegionAssignDeep");
    lib.bindSymbol_stdcall(blRegionAssignMove, "blRegionAssignMove");
    lib.bindSymbol_stdcall(blRegionAssignRectI, "blRegionAssignRectI");
    lib.bindSymbol_stdcall(blRegionAssignRectIArray, "blRegionAssignRectIArray");
    lib.bindSymbol_stdcall(blRegionAssignWeak, "blRegionAssignWeak");
    lib.bindSymbol_stdcall(blRegionClear, "blRegionClear");
    lib.bindSymbol_stdcall(blRegionCombine, "blRegionCombine");
    lib.bindSymbol_stdcall(blRegionCombineBB, "blRegionCombineBB");
    lib.bindSymbol_stdcall(blRegionCombineBR, "blRegionCombineBR");
    lib.bindSymbol_stdcall(blRegionCombineRB, "blRegionCombineRB");
    lib.bindSymbol_stdcall(blRegionEquals, "blRegionEquals");
    lib.bindSymbol_stdcall(blRegionGetCapacity, "blRegionGetCapacity");
    lib.bindSymbol_stdcall(blRegionGetData, "blRegionGetData");
    lib.bindSymbol_stdcall(blRegionGetSize, "blRegionGetSize");
    lib.bindSymbol_stdcall(blRegionGetType, "blRegionGetType");
    lib.bindSymbol_stdcall(blRegionHitTest, "blRegionHitTest");
    lib.bindSymbol_stdcall(blRegionHitTestBoxI, "blRegionHitTestBoxI");
    lib.bindSymbol_stdcall(blRegionInit, "blRegionInit");
    lib.bindSymbol_stdcall(blRegionIntersectAndClip, "blRegionIntersectAndClip");
    lib.bindSymbol_stdcall(blRegionReserve, "blRegionReserve");
    lib.bindSymbol_stdcall(blRegionReset, "blRegionReset");
    lib.bindSymbol_stdcall(blRegionShrink, "blRegionShrink");
    lib.bindSymbol_stdcall(blRegionTranslate, "blRegionTranslate");
    lib.bindSymbol_stdcall(blRegionTranslateAndClip, "blRegionTranslateAndClip");
    lib.bindSymbol_stdcall(blResultFromWinError, "blResultFromWinError");
    lib.bindSymbol_stdcall(blRuntimeAssertionFailure, "blRuntimeAssertionFailure");
    lib.bindSymbol_stdcall(blRuntimeCleanup, "blRuntimeCleanup");
    lib.bindSymbol_stdcall(blRuntimeGetTickCount, "blRuntimeGetTickCount");
    lib.bindSymbol_stdcall(blRuntimeInit, "blRuntimeInit");
    lib.bindSymbol_stdcall(blRuntimeMessageFmt, "blRuntimeMessageFmt");
    lib.bindSymbol_stdcall(blRuntimeMessageOut, "blRuntimeMessageOut");
    lib.bindSymbol_stdcall(blRuntimeMessageVFmt, "blRuntimeMessageVFmt");
    lib.bindSymbol_stdcall(blRuntimeQueryInfo, "blRuntimeQueryInfo");
    lib.bindSymbol_stdcall(blRuntimeShutdown, "blRuntimeShutdown");
    lib.bindSymbol_stdcall(blStringApplyOpChar, "blStringApplyOpChar");
    lib.bindSymbol_stdcall(blStringApplyOpData, "blStringApplyOpData");
    lib.bindSymbol_stdcall(blStringApplyOpFormat, "blStringApplyOpFormat");
    lib.bindSymbol_stdcall(blStringApplyOpFormatV, "blStringApplyOpFormatV");
    lib.bindSymbol_stdcall(blStringApplyOpString, "blStringApplyOpString");
    lib.bindSymbol_stdcall(blStringAssignData, "blStringAssignData");
    lib.bindSymbol_stdcall(blStringAssignDeep, "blStringAssignDeep");
    lib.bindSymbol_stdcall(blStringAssignMove, "blStringAssignMove");
    lib.bindSymbol_stdcall(blStringAssignWeak, "blStringAssignWeak");
    lib.bindSymbol_stdcall(blStringClear, "blStringClear");
    lib.bindSymbol_stdcall(blStringCompare, "blStringCompare");
    lib.bindSymbol_stdcall(blStringCompareData, "blStringCompareData");
    lib.bindSymbol_stdcall(blStringEquals, "blStringEquals");
    lib.bindSymbol_stdcall(blStringEqualsData, "blStringEqualsData");
    lib.bindSymbol_stdcall(blStringGetCapacity, "blStringGetCapacity");
    lib.bindSymbol_stdcall(blStringGetData, "blStringGetData");
    lib.bindSymbol_stdcall(blStringGetSize, "blStringGetSize");
    lib.bindSymbol_stdcall(blStringInit, "blStringInit");
    lib.bindSymbol_stdcall(blStringInsertChar, "blStringInsertChar");
    lib.bindSymbol_stdcall(blStringInsertData, "blStringInsertData");
    lib.bindSymbol_stdcall(blStringInsertOp, "blStringInsertOp");
    lib.bindSymbol_stdcall(blStringInsertString, "blStringInsertString");
    lib.bindSymbol_stdcall(blStringMakeMutable, "blStringMakeMutable");
    lib.bindSymbol_stdcall(blStringModifyOp, "blStringModifyOp");
    lib.bindSymbol_stdcall(blStringRemoveRange, "blStringRemoveRange");
    lib.bindSymbol_stdcall(blStringReserve, "blStringReserve");
    lib.bindSymbol_stdcall(blStringReset, "blStringReset");
    lib.bindSymbol_stdcall(blStringResize, "blStringResize");
    lib.bindSymbol_stdcall(blStringShrink, "blStringShrink");
    lib.bindSymbol_stdcall(blStrokeOptionsAssignMove, "blStrokeOptionsAssignMove");
    lib.bindSymbol_stdcall(blStrokeOptionsAssignWeak, "blStrokeOptionsAssignWeak");
    lib.bindSymbol_stdcall(blStrokeOptionsInit, "blStrokeOptionsInit");
    lib.bindSymbol_stdcall(blStrokeOptionsInitMove, "blStrokeOptionsInitMove");
    lib.bindSymbol_stdcall(blStrokeOptionsInitWeak, "blStrokeOptionsInitWeak");
    lib.bindSymbol_stdcall(blStrokeOptionsReset, "blStrokeOptionsReset");
    lib.bindSymbol_stdcall(blVariantAssignMove, "blVariantAssignMove");
    lib.bindSymbol_stdcall(blVariantAssignWeak, "blVariantAssignWeak");
    lib.bindSymbol_stdcall(blVariantEquals, "blVariantEquals");
    lib.bindSymbol_stdcall(blVariantGetImplType, "blVariantGetImplType");
    lib.bindSymbol_stdcall(blVariantInit, "blVariantInit");
    lib.bindSymbol_stdcall(blVariantInitMove, "blVariantInitMove");
    lib.bindSymbol_stdcall(blVariantInitWeak, "blVariantInitWeak");
    lib.bindSymbol_stdcall(blVariantReset, "blVariantReset");

    if(errorCount() != errCount) return Blend2DSupport.badLibrary;
    else loadedVersion = Blend2DSupport.bl00;

    return loadedVersion;
}
