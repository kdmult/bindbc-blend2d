module bindbc.blend2d.binddynamic;

version(BindBlend2D_Static) {}
else version = BindBlend2D_Dynamic;

version(BindBlend2D_Dynamic):

import core.stdc.stdint;
import core.stdc.stdarg;

import bindbc.loader;
import bindbc.blend2d.types;
import bindbc.blend2d.bindstatic;

extern(C) @nogc nothrow alias pblDefaultApproximationOptions = const BLApproximationOptions;
__gshared pblDefaultApproximationOptions blDefaultApproximationOptions;

extern(C) @nogc nothrow alias pblFormatInfo = const(BLFormatInfo)[BL_FORMAT_RESERVED_COUNT];
__gshared pblFormatInfo blFormatInfo;

extern(C) @nogc nothrow alias pblMatrix2DMapPointDArrayFuncs = BLMapPointDArrayFunc[BL_MATRIX2D_TYPE_MAX_VALUE + 1];
__gshared pblMatrix2DMapPointDArrayFuncs blMatrix2DMapPointDArrayFuncs;

extern(C) @nogc nothrow alias pblPixelConverterConvert = BLResult function(const(BLPixelConverterCore)* self, void* dstData, intptr_t dstStride, const(void)* srcData, intptr_t srcStride, uint w, uint h, const(BLPixelConverterOptions)* options);
__gshared pblPixelConverterConvert blPixelConverterConvert;

version(Windows) {
    extern(C) @nogc nothrow alias pblResultFromWinError = BLResult function(uint e);
    __gshared pblResultFromWinError blResultFromWinError;
}
version(Posix) {
    extern(C) @nogc nothrow alias pblResultFromPosixError = BLResult function(int e);
    __gshared pblResultFromPosixError blResultFromPosixError;
}


extern(C) @nogc nothrow alias pblRuntimeAssertionFailure = void function(const(char)* file, int line, const(char)* msg);
__gshared pblRuntimeAssertionFailure blRuntimeAssertionFailure;

extern(C) @nogc nothrow alias pblObjectDetailAllocImpl = void* function(BLObjectDetail* d, uint info, size_t implSize, size_t* implSizeOut);
__gshared pblObjectDetailAllocImpl blObjectDetailAllocImpl;

extern(C) @nogc nothrow alias pblObjectDetailAllocImplExternal = void* function(BLObjectDetail* d, uint info, size_t implSize, BLObjectExternalInfo** externalInfoOut, void** externalOptDataOut);
__gshared pblObjectDetailAllocImplExternal blObjectDetailAllocImplExternal;

extern(C) @nogc nothrow alias pblObjectDetailFreeImpl = BLResult function(void* impl, uint info);
__gshared pblObjectDetailFreeImpl blObjectDetailFreeImpl;

extern(C) @nogc nothrow alias pblObjectInitMove = BLResult function(BLUnknown* self, BLUnknown* other);
__gshared pblObjectInitMove blObjectInitMove;

extern(C) @nogc nothrow alias pblObjectInitWeak = BLResult function(BLUnknown* self, const(BLUnknown)* other);
__gshared pblObjectInitWeak blObjectInitWeak;

extern(C) @nogc nothrow alias pblObjectReset = BLResult function(BLUnknown* self);
__gshared pblObjectReset blObjectReset;

extern(C) @nogc nothrow alias pblObjectAssignMove = BLResult function(BLUnknown* self, BLUnknown* other);
__gshared pblObjectAssignMove blObjectAssignMove;

extern(C) @nogc nothrow alias pblObjectAssignWeak = BLResult function(BLUnknown* self, const(BLUnknown)* other);
__gshared pblObjectAssignWeak blObjectAssignWeak;

extern(C) @nogc nothrow alias pblObjectGetProperty = BLResult function(const(BLUnknown)* self, const(char)* name, size_t nameSize, BLVarCore* valueOut);
__gshared pblObjectGetProperty blObjectGetProperty;

extern(C) @nogc nothrow alias pblObjectGetPropertyBool = BLResult function(const(BLUnknown)* self, const(char)* name, size_t nameSize, bool* valueOut);
__gshared pblObjectGetPropertyBool blObjectGetPropertyBool;

extern(C) @nogc nothrow alias pblObjectGetPropertyInt32 = BLResult function(const(BLUnknown)* self, const(char)* name, size_t nameSize, int* valueOut);
__gshared pblObjectGetPropertyInt32 blObjectGetPropertyInt32;

extern(C) @nogc nothrow alias pblObjectGetPropertyInt64 = BLResult function(const(BLUnknown)* self, const(char)* name, size_t nameSize, long* valueOut);
__gshared pblObjectGetPropertyInt64 blObjectGetPropertyInt64;

extern(C) @nogc nothrow alias pblObjectGetPropertyUInt32 = BLResult function(const(BLUnknown)* self, const(char)* name, size_t nameSize, uint* valueOut);
__gshared pblObjectGetPropertyUInt32 blObjectGetPropertyUInt32;

extern(C) @nogc nothrow alias pblObjectGetPropertyUInt64 = BLResult function(const(BLUnknown)* self, const(char)* name, size_t nameSize, ulong* valueOut);
__gshared pblObjectGetPropertyUInt64 blObjectGetPropertyUInt64;

extern(C) @nogc nothrow alias pblObjectGetPropertyDouble = BLResult function(const(BLUnknown)* self, const(char)* name, size_t nameSize, double* valueOut);
__gshared pblObjectGetPropertyDouble blObjectGetPropertyDouble;

extern(C) @nogc nothrow alias pblObjectSetProperty = BLResult function(BLUnknown* self, const(char)* name, size_t nameSize, const(BLUnknown)* value);
__gshared pblObjectSetProperty blObjectSetProperty;

extern(C) @nogc nothrow alias pblObjectSetPropertyBool = BLResult function(BLUnknown* self, const(char)* name, size_t nameSize, bool value);
__gshared pblObjectSetPropertyBool blObjectSetPropertyBool;

extern(C) @nogc nothrow alias pblObjectSetPropertyInt32 = BLResult function(BLUnknown* self, const(char)* name, size_t nameSize, int value);
__gshared pblObjectSetPropertyInt32 blObjectSetPropertyInt32;

extern(C) @nogc nothrow alias pblObjectSetPropertyInt64 = BLResult function(BLUnknown* self, const(char)* name, size_t nameSize, long value);
__gshared pblObjectSetPropertyInt64 blObjectSetPropertyInt64;

extern(C) @nogc nothrow alias pblObjectSetPropertyUInt32 = BLResult function(BLUnknown* self, const(char)* name, size_t nameSize, uint value);
__gshared pblObjectSetPropertyUInt32 blObjectSetPropertyUInt32;

extern(C) @nogc nothrow alias pblObjectSetPropertyUInt64 = BLResult function(BLUnknown* self, const(char)* name, size_t nameSize, ulong value);
__gshared pblObjectSetPropertyUInt64 blObjectSetPropertyUInt64;

extern(C) @nogc nothrow alias pblObjectSetPropertyDouble = BLResult function(BLUnknown* self, const(char)* name, size_t nameSize, double value);
__gshared pblObjectSetPropertyDouble blObjectSetPropertyDouble;

extern(C) @nogc nothrow alias pblArrayInit = BLResult function(BLArrayCore* self, BLObjectType arrayType);
__gshared pblArrayInit blArrayInit;

extern(C) @nogc nothrow alias pblArrayInitMove = BLResult function(BLArrayCore* self, BLArrayCore* other);
__gshared pblArrayInitMove blArrayInitMove;

extern(C) @nogc nothrow alias pblArrayInitWeak = BLResult function(BLArrayCore* self, const(BLArrayCore)* other);
__gshared pblArrayInitWeak blArrayInitWeak;

extern(C) @nogc nothrow alias pblArrayDestroy = BLResult function(BLArrayCore* self);
__gshared pblArrayDestroy blArrayDestroy;

extern(C) @nogc nothrow alias pblArrayReset = BLResult function(BLArrayCore* self);
__gshared pblArrayReset blArrayReset;

extern(C) @nogc nothrow alias pblArrayGetSize = size_t function(const(BLArrayCore)* self);
__gshared pblArrayGetSize blArrayGetSize;

extern(C) @nogc nothrow alias pblArrayGetCapacity = size_t function(const(BLArrayCore)* self);
__gshared pblArrayGetCapacity blArrayGetCapacity;

extern(C) @nogc nothrow alias pblArrayGetItemSize = size_t function(BLArrayCore* self);
__gshared pblArrayGetItemSize blArrayGetItemSize;

extern(C) @nogc nothrow alias pblArrayGetData = const(void)* function(const(BLArrayCore)* self);
__gshared pblArrayGetData blArrayGetData;

extern(C) @nogc nothrow alias pblArrayClear = BLResult function(BLArrayCore* self);
__gshared pblArrayClear blArrayClear;

extern(C) @nogc nothrow alias pblArrayShrink = BLResult function(BLArrayCore* self);
__gshared pblArrayShrink blArrayShrink;

extern(C) @nogc nothrow alias pblArrayReserve = BLResult function(BLArrayCore* self, size_t n);
__gshared pblArrayReserve blArrayReserve;

extern(C) @nogc nothrow alias pblArrayResize = BLResult function(BLArrayCore* self, size_t n, const(void)* fill);
__gshared pblArrayResize blArrayResize;

extern(C) @nogc nothrow alias pblArrayMakeMutable = BLResult function(BLArrayCore* self, void** dataOut);
__gshared pblArrayMakeMutable blArrayMakeMutable;

extern(C) @nogc nothrow alias pblArrayModifyOp = BLResult function(BLArrayCore* self, BLModifyOp op, size_t n, void** dataOut);
__gshared pblArrayModifyOp blArrayModifyOp;

extern(C) @nogc nothrow alias pblArrayInsertOp = BLResult function(BLArrayCore* self, size_t index, size_t n, void** dataOut);
__gshared pblArrayInsertOp blArrayInsertOp;

extern(C) @nogc nothrow alias pblArrayAssignMove = BLResult function(BLArrayCore* self, BLArrayCore* other);
__gshared pblArrayAssignMove blArrayAssignMove;

extern(C) @nogc nothrow alias pblArrayAssignWeak = BLResult function(BLArrayCore* self, const(BLArrayCore)* other);
__gshared pblArrayAssignWeak blArrayAssignWeak;

extern(C) @nogc nothrow alias pblArrayAssignDeep = BLResult function(BLArrayCore* self, const(BLArrayCore)* other);
__gshared pblArrayAssignDeep blArrayAssignDeep;

extern(C) @nogc nothrow alias pblArrayAssignData = BLResult function(BLArrayCore* self, const(void)* data, size_t n);
__gshared pblArrayAssignData blArrayAssignData;

extern(C) @nogc nothrow alias pblArrayAssignExternalData = BLResult function(BLArrayCore* self, void* data, size_t size, size_t capacity, BLDataAccessFlags dataAccessFlags, BLDestroyExternalDataFunc destroyFunc, void* userData);
__gshared pblArrayAssignExternalData blArrayAssignExternalData;

extern(C) @nogc nothrow alias pblArrayAppendU8 = BLResult function(BLArrayCore* self, ubyte value);
__gshared pblArrayAppendU8 blArrayAppendU8;

extern(C) @nogc nothrow alias pblArrayAppendU16 = BLResult function(BLArrayCore* self, ushort value);
__gshared pblArrayAppendU16 blArrayAppendU16;

extern(C) @nogc nothrow alias pblArrayAppendU32 = BLResult function(BLArrayCore* self, uint value);
__gshared pblArrayAppendU32 blArrayAppendU32;

extern(C) @nogc nothrow alias pblArrayAppendU64 = BLResult function(BLArrayCore* self, ulong value);
__gshared pblArrayAppendU64 blArrayAppendU64;

extern(C) @nogc nothrow alias pblArrayAppendF32 = BLResult function(BLArrayCore* self, float value);
__gshared pblArrayAppendF32 blArrayAppendF32;

extern(C) @nogc nothrow alias pblArrayAppendF64 = BLResult function(BLArrayCore* self, double value);
__gshared pblArrayAppendF64 blArrayAppendF64;

extern(C) @nogc nothrow alias pblArrayAppendItem = BLResult function(BLArrayCore* self, const(void)* item);
__gshared pblArrayAppendItem blArrayAppendItem;

extern(C) @nogc nothrow alias pblArrayAppendData = BLResult function(BLArrayCore* self, const(void)* data, size_t n);
__gshared pblArrayAppendData blArrayAppendData;

extern(C) @nogc nothrow alias pblArrayInsertU8 = BLResult function(BLArrayCore* self, size_t index, ubyte value);
__gshared pblArrayInsertU8 blArrayInsertU8;

extern(C) @nogc nothrow alias pblArrayInsertU16 = BLResult function(BLArrayCore* self, size_t index, ushort value);
__gshared pblArrayInsertU16 blArrayInsertU16;

extern(C) @nogc nothrow alias pblArrayInsertU32 = BLResult function(BLArrayCore* self, size_t index, uint value);
__gshared pblArrayInsertU32 blArrayInsertU32;

extern(C) @nogc nothrow alias pblArrayInsertU64 = BLResult function(BLArrayCore* self, size_t index, ulong value);
__gshared pblArrayInsertU64 blArrayInsertU64;

extern(C) @nogc nothrow alias pblArrayInsertF32 = BLResult function(BLArrayCore* self, size_t index, float value);
__gshared pblArrayInsertF32 blArrayInsertF32;

extern(C) @nogc nothrow alias pblArrayInsertF64 = BLResult function(BLArrayCore* self, size_t index, double value);
__gshared pblArrayInsertF64 blArrayInsertF64;

extern(C) @nogc nothrow alias pblArrayInsertItem = BLResult function(BLArrayCore* self, size_t index, const(void)* item);
__gshared pblArrayInsertItem blArrayInsertItem;

extern(C) @nogc nothrow alias pblArrayInsertData = BLResult function(BLArrayCore* self, size_t index, const(void)* data, size_t n);
__gshared pblArrayInsertData blArrayInsertData;

extern(C) @nogc nothrow alias pblArrayReplaceU8 = BLResult function(BLArrayCore* self, size_t index, ubyte value);
__gshared pblArrayReplaceU8 blArrayReplaceU8;

extern(C) @nogc nothrow alias pblArrayReplaceU16 = BLResult function(BLArrayCore* self, size_t index, ushort value);
__gshared pblArrayReplaceU16 blArrayReplaceU16;

extern(C) @nogc nothrow alias pblArrayReplaceU32 = BLResult function(BLArrayCore* self, size_t index, uint value);
__gshared pblArrayReplaceU32 blArrayReplaceU32;

extern(C) @nogc nothrow alias pblArrayReplaceU64 = BLResult function(BLArrayCore* self, size_t index, ulong value);
__gshared pblArrayReplaceU64 blArrayReplaceU64;

extern(C) @nogc nothrow alias pblArrayReplaceF32 = BLResult function(BLArrayCore* self, size_t index, float value);
__gshared pblArrayReplaceF32 blArrayReplaceF32;

extern(C) @nogc nothrow alias pblArrayReplaceF64 = BLResult function(BLArrayCore* self, size_t index, double value);
__gshared pblArrayReplaceF64 blArrayReplaceF64;

extern(C) @nogc nothrow alias pblArrayReplaceItem = BLResult function(BLArrayCore* self, size_t index, const(void)* item);
__gshared pblArrayReplaceItem blArrayReplaceItem;

extern(C) @nogc nothrow alias pblArrayReplaceData = BLResult function(BLArrayCore* self, size_t rStart, size_t rEnd, const(void)* data, size_t n);
__gshared pblArrayReplaceData blArrayReplaceData;

extern(C) @nogc nothrow alias pblArrayRemoveIndex = BLResult function(BLArrayCore* self, size_t index);
__gshared pblArrayRemoveIndex blArrayRemoveIndex;

extern(C) @nogc nothrow alias pblArrayRemoveRange = BLResult function(BLArrayCore* self, size_t rStart, size_t rEnd);
__gshared pblArrayRemoveRange blArrayRemoveRange;

extern(C) @nogc nothrow alias pblArrayEquals = bool function(const(BLArrayCore)* a, const(BLArrayCore)* b);
__gshared pblArrayEquals blArrayEquals;

extern(C) @nogc nothrow alias pblBitSetInit = BLResult function(BLBitSetCore* self);
__gshared pblBitSetInit blBitSetInit;

extern(C) @nogc nothrow alias pblBitSetInitMove = BLResult function(BLBitSetCore* self, BLBitSetCore* other);
__gshared pblBitSetInitMove blBitSetInitMove;

extern(C) @nogc nothrow alias pblBitSetInitWeak = BLResult function(BLBitSetCore* self, const(BLBitSetCore)* other);
__gshared pblBitSetInitWeak blBitSetInitWeak;

extern(C) @nogc nothrow alias pblBitSetInitRange = BLResult function(BLBitSetCore* self, uint startBit, uint endBit);
__gshared pblBitSetInitRange blBitSetInitRange;

extern(C) @nogc nothrow alias pblBitSetDestroy = BLResult function(BLBitSetCore* self);
__gshared pblBitSetDestroy blBitSetDestroy;

extern(C) @nogc nothrow alias pblBitSetReset = BLResult function(BLBitSetCore* self);
__gshared pblBitSetReset blBitSetReset;

extern(C) @nogc nothrow alias pblBitSetAssignMove = BLResult function(BLBitSetCore* self, BLBitSetCore* other);
__gshared pblBitSetAssignMove blBitSetAssignMove;

extern(C) @nogc nothrow alias pblBitSetAssignWeak = BLResult function(BLBitSetCore* self, const(BLBitSetCore)* other);
__gshared pblBitSetAssignWeak blBitSetAssignWeak;

extern(C) @nogc nothrow alias pblBitSetAssignDeep = BLResult function(BLBitSetCore* self, const(BLBitSetCore)* other);
__gshared pblBitSetAssignDeep blBitSetAssignDeep;

extern(C) @nogc nothrow alias pblBitSetAssignRange = BLResult function(BLBitSetCore* self, uint startBit, uint endBit);
__gshared pblBitSetAssignRange blBitSetAssignRange;

extern(C) @nogc nothrow alias pblBitSetAssignWords = BLResult function(BLBitSetCore* self, uint startWord, const(uint)* wordData, uint wordCount);
__gshared pblBitSetAssignWords blBitSetAssignWords;

extern(C) @nogc nothrow alias pblBitSetIsEmpty = bool function(const(BLBitSetCore)* self);
__gshared pblBitSetIsEmpty blBitSetIsEmpty;

extern(C) @nogc nothrow alias pblBitSetGetData = BLResult function(const(BLBitSetCore)* self, BLBitSetData* out_);
__gshared pblBitSetGetData blBitSetGetData;

extern(C) @nogc nothrow alias pblBitSetGetSegmentCount = uint function(const(BLBitSetCore)* self);
__gshared pblBitSetGetSegmentCount blBitSetGetSegmentCount;

extern(C) @nogc nothrow alias pblBitSetGetSegmentCapacity = uint function(const(BLBitSetCore)* self);
__gshared pblBitSetGetSegmentCapacity blBitSetGetSegmentCapacity;

extern(C) @nogc nothrow alias pblBitSetGetCardinality = uint function(const(BLBitSetCore)* self);
__gshared pblBitSetGetCardinality blBitSetGetCardinality;

extern(C) @nogc nothrow alias pblBitSetGetCardinalityInRange = uint function(const(BLBitSetCore)* self, uint startBit, uint endBit);
__gshared pblBitSetGetCardinalityInRange blBitSetGetCardinalityInRange;

extern(C) @nogc nothrow alias pblBitSetHasBit = bool function(const(BLBitSetCore)* self, uint bitIndex);
__gshared pblBitSetHasBit blBitSetHasBit;

extern(C) @nogc nothrow alias pblBitSetHasBitsInRange = bool function(const(BLBitSetCore)* self, uint startBit, uint endBit);
__gshared pblBitSetHasBitsInRange blBitSetHasBitsInRange;

extern(C) @nogc nothrow alias pblBitSetSubsumes = bool function(const(BLBitSetCore)* a, const(BLBitSetCore)* b);
__gshared pblBitSetSubsumes blBitSetSubsumes;

extern(C) @nogc nothrow alias pblBitSetIntersects = bool function(const(BLBitSetCore)* a, const(BLBitSetCore)* b);
__gshared pblBitSetIntersects blBitSetIntersects;

extern(C) @nogc nothrow alias pblBitSetGetRange = bool function(const(BLBitSetCore)* self, uint* startOut, uint* endOut);
__gshared pblBitSetGetRange blBitSetGetRange;

extern(C) @nogc nothrow alias pblBitSetEquals = bool function(const(BLBitSetCore)* a, const(BLBitSetCore)* b);
__gshared pblBitSetEquals blBitSetEquals;

extern(C) @nogc nothrow alias pblBitSetCompare = int function(const(BLBitSetCore)* a, const(BLBitSetCore)* b);
__gshared pblBitSetCompare blBitSetCompare;

extern(C) @nogc nothrow alias pblBitSetClear = BLResult function(BLBitSetCore* self);
__gshared pblBitSetClear blBitSetClear;

extern(C) @nogc nothrow alias pblBitSetShrink = BLResult function(BLBitSetCore* self);
__gshared pblBitSetShrink blBitSetShrink;

extern(C) @nogc nothrow alias pblBitSetOptimize = BLResult function(BLBitSetCore* self);
__gshared pblBitSetOptimize blBitSetOptimize;

extern(C) @nogc nothrow alias pblBitSetChop = BLResult function(BLBitSetCore* self, uint startBit, uint endBit);
__gshared pblBitSetChop blBitSetChop;

extern(C) @nogc nothrow alias pblBitSetAddBit = BLResult function(BLBitSetCore* self, uint bitIndex);
__gshared pblBitSetAddBit blBitSetAddBit;

extern(C) @nogc nothrow alias pblBitSetAddRange = BLResult function(BLBitSetCore* self, uint rangeStartBit, uint rangeEndBit);
__gshared pblBitSetAddRange blBitSetAddRange;

extern(C) @nogc nothrow alias pblBitSetAddWords = BLResult function(BLBitSetCore* self, uint startWord, const(uint)* wordData, uint wordCount);
__gshared pblBitSetAddWords blBitSetAddWords;

extern(C) @nogc nothrow alias pblBitSetClearBit = BLResult function(BLBitSetCore* self, uint bitIndex);
__gshared pblBitSetClearBit blBitSetClearBit;

extern(C) @nogc nothrow alias pblBitSetClearRange = BLResult function(BLBitSetCore* self, uint rangeStartBit, uint rangeEndBit);
__gshared pblBitSetClearRange blBitSetClearRange;

extern(C) @nogc nothrow alias pblBitSetBuilderCommit = BLResult function(BLBitSetCore* self, BLBitSetBuilderCore* builder, uint newAreaIndex);
__gshared pblBitSetBuilderCommit blBitSetBuilderCommit;

extern(C) @nogc nothrow alias pblBitSetBuilderAddRange = BLResult function(BLBitSetCore* self, BLBitSetBuilderCore* builder, uint startBit, uint endBit);
__gshared pblBitSetBuilderAddRange blBitSetBuilderAddRange;

extern(C) @nogc nothrow alias pblFileInit = BLResult function(BLFileCore* self);
__gshared pblFileInit blFileInit;

extern(C) @nogc nothrow alias pblFileReset = BLResult function(BLFileCore* self);
__gshared pblFileReset blFileReset;

extern(C) @nogc nothrow alias pblFileOpen = BLResult function(BLFileCore* self, const(char)* fileName, BLFileOpenFlags openFlags);
__gshared pblFileOpen blFileOpen;

extern(C) @nogc nothrow alias pblFileClose = BLResult function(BLFileCore* self);
__gshared pblFileClose blFileClose;

extern(C) @nogc nothrow alias pblFileSeek = BLResult function(BLFileCore* self, long offset, BLFileSeekType seekType, long* positionOut);
__gshared pblFileSeek blFileSeek;

extern(C) @nogc nothrow alias pblFileRead = BLResult function(BLFileCore* self, void* buffer, size_t n, size_t* bytesReadOut);
__gshared pblFileRead blFileRead;

extern(C) @nogc nothrow alias pblFileWrite = BLResult function(BLFileCore* self, const(void)* buffer, size_t n, size_t* bytesWrittenOut);
__gshared pblFileWrite blFileWrite;

extern(C) @nogc nothrow alias pblFileTruncate = BLResult function(BLFileCore* self, long maxSize);
__gshared pblFileTruncate blFileTruncate;

extern(C) @nogc nothrow alias pblFileGetSize = BLResult function(BLFileCore* self, ulong* fileSizeOut);
__gshared pblFileGetSize blFileGetSize;

extern(C) @nogc nothrow alias pblFileSystemReadFile = BLResult function(const(char)* fileName, BLArrayCore* dst, size_t maxSize, BLFileReadFlags readFlags);
__gshared pblFileSystemReadFile blFileSystemReadFile;

extern(C) @nogc nothrow alias pblFileSystemWriteFile = BLResult function(const(char)* fileName, const(void)* data, size_t size, size_t* bytesWrittenOut);
__gshared pblFileSystemWriteFile blFileSystemWriteFile;

extern(C) @nogc nothrow alias pblStringInit = BLResult function(BLStringCore* self);
__gshared pblStringInit blStringInit;

extern(C) @nogc nothrow alias pblStringInitMove = BLResult function(BLStringCore* self, BLStringCore* other);
__gshared pblStringInitMove blStringInitMove;

extern(C) @nogc nothrow alias pblStringInitWeak = BLResult function(BLStringCore* self, const(BLStringCore)* other);
__gshared pblStringInitWeak blStringInitWeak;

extern(C) @nogc nothrow alias pblStringInitWithData = BLResult function(BLStringCore* self, const(char)* str, size_t size);
__gshared pblStringInitWithData blStringInitWithData;

extern(C) @nogc nothrow alias pblStringDestroy = BLResult function(BLStringCore* self);
__gshared pblStringDestroy blStringDestroy;

extern(C) @nogc nothrow alias pblStringReset = BLResult function(BLStringCore* self);
__gshared pblStringReset blStringReset;

extern(C) @nogc nothrow alias pblStringGetData = const(char)* function(const(BLStringCore)* self);
__gshared pblStringGetData blStringGetData;

extern(C) @nogc nothrow alias pblStringGetSize = size_t function(const(BLStringCore)* self);
__gshared pblStringGetSize blStringGetSize;

extern(C) @nogc nothrow alias pblStringGetCapacity = size_t function(const(BLStringCore)* self);
__gshared pblStringGetCapacity blStringGetCapacity;

extern(C) @nogc nothrow alias pblStringClear = BLResult function(BLStringCore* self);
__gshared pblStringClear blStringClear;

extern(C) @nogc nothrow alias pblStringShrink = BLResult function(BLStringCore* self);
__gshared pblStringShrink blStringShrink;

extern(C) @nogc nothrow alias pblStringReserve = BLResult function(BLStringCore* self, size_t n);
__gshared pblStringReserve blStringReserve;

extern(C) @nogc nothrow alias pblStringResize = BLResult function(BLStringCore* self, size_t n, char fill);
__gshared pblStringResize blStringResize;

extern(C) @nogc nothrow alias pblStringMakeMutable = BLResult function(BLStringCore* self, char** dataOut);
__gshared pblStringMakeMutable blStringMakeMutable;

extern(C) @nogc nothrow alias pblStringModifyOp = BLResult function(BLStringCore* self, BLModifyOp op, size_t n, char** dataOut);
__gshared pblStringModifyOp blStringModifyOp;

extern(C) @nogc nothrow alias pblStringInsertOp = BLResult function(BLStringCore* self, size_t index, size_t n, char** dataOut);
__gshared pblStringInsertOp blStringInsertOp;

extern(C) @nogc nothrow alias pblStringAssignMove = BLResult function(BLStringCore* self, BLStringCore* other);
__gshared pblStringAssignMove blStringAssignMove;

extern(C) @nogc nothrow alias pblStringAssignWeak = BLResult function(BLStringCore* self, const(BLStringCore)* other);
__gshared pblStringAssignWeak blStringAssignWeak;

extern(C) @nogc nothrow alias pblStringAssignDeep = BLResult function(BLStringCore* self, const(BLStringCore)* other);
__gshared pblStringAssignDeep blStringAssignDeep;

extern(C) @nogc nothrow alias pblStringAssignData = BLResult function(BLStringCore* self, const(char)* str, size_t n);
__gshared pblStringAssignData blStringAssignData;

extern(C) @nogc nothrow alias pblStringApplyOpChar = BLResult function(BLStringCore* self, BLModifyOp op, char c, size_t n);
__gshared pblStringApplyOpChar blStringApplyOpChar;

extern(C) @nogc nothrow alias pblStringApplyOpData = BLResult function(BLStringCore* self, BLModifyOp op, const(char)* str, size_t n);
__gshared pblStringApplyOpData blStringApplyOpData;

extern(C) @nogc nothrow alias pblStringApplyOpString = BLResult function(BLStringCore* self, BLModifyOp op, const(BLStringCore)* other);
__gshared pblStringApplyOpString blStringApplyOpString;

extern(C) @nogc nothrow alias pblStringApplyOpFormat = BLResult function(BLStringCore* self, BLModifyOp op, const(char)* fmt, ...);
__gshared pblStringApplyOpFormat blStringApplyOpFormat;

extern(C) @nogc nothrow alias pblStringApplyOpFormatV = BLResult function(BLStringCore* self, BLModifyOp op, const(char)* fmt, va_list ap);
__gshared pblStringApplyOpFormatV blStringApplyOpFormatV;

extern(C) @nogc nothrow alias pblStringInsertChar = BLResult function(BLStringCore* self, size_t index, char c, size_t n);
__gshared pblStringInsertChar blStringInsertChar;

extern(C) @nogc nothrow alias pblStringInsertData = BLResult function(BLStringCore* self, size_t index, const(char)* str, size_t n);
__gshared pblStringInsertData blStringInsertData;

extern(C) @nogc nothrow alias pblStringInsertString = BLResult function(BLStringCore* self, size_t index, const(BLStringCore)* other);
__gshared pblStringInsertString blStringInsertString;

extern(C) @nogc nothrow alias pblStringRemoveIndex = BLResult function(BLStringCore* self, size_t index);
__gshared pblStringRemoveIndex blStringRemoveIndex;

extern(C) @nogc nothrow alias pblStringRemoveRange = BLResult function(BLStringCore* self, size_t rStart, size_t rEnd);
__gshared pblStringRemoveRange blStringRemoveRange;

extern(C) @nogc nothrow alias pblStringEquals = bool function(const(BLStringCore)* a, const(BLStringCore)* b);
__gshared pblStringEquals blStringEquals;

extern(C) @nogc nothrow alias pblStringEqualsData = bool function(const(BLStringCore)* self, const(char)* str, size_t n);
__gshared pblStringEqualsData blStringEqualsData;

extern(C) @nogc nothrow alias pblStringCompare = int function(const(BLStringCore)* a, const(BLStringCore)* b);
__gshared pblStringCompare blStringCompare;

extern(C) @nogc nothrow alias pblStringCompareData = int function(const(BLStringCore)* self, const(char)* str, size_t n);
__gshared pblStringCompareData blStringCompareData;

extern(C) @nogc nothrow alias pblFontDataInit = BLResult function(BLFontDataCore* self);
__gshared pblFontDataInit blFontDataInit;

extern(C) @nogc nothrow alias pblFontDataInitMove = BLResult function(BLFontDataCore* self, BLFontDataCore* other);
__gshared pblFontDataInitMove blFontDataInitMove;

extern(C) @nogc nothrow alias pblFontDataInitWeak = BLResult function(BLFontDataCore* self, const(BLFontDataCore)* other);
__gshared pblFontDataInitWeak blFontDataInitWeak;

extern(C) @nogc nothrow alias pblFontDataDestroy = BLResult function(BLFontDataCore* self);
__gshared pblFontDataDestroy blFontDataDestroy;

extern(C) @nogc nothrow alias pblFontDataReset = BLResult function(BLFontDataCore* self);
__gshared pblFontDataReset blFontDataReset;

extern(C) @nogc nothrow alias pblFontDataAssignMove = BLResult function(BLFontDataCore* self, BLFontDataCore* other);
__gshared pblFontDataAssignMove blFontDataAssignMove;

extern(C) @nogc nothrow alias pblFontDataAssignWeak = BLResult function(BLFontDataCore* self, const(BLFontDataCore)* other);
__gshared pblFontDataAssignWeak blFontDataAssignWeak;

extern(C) @nogc nothrow alias pblFontDataCreateFromFile = BLResult function(BLFontDataCore* self, const(char)* fileName, BLFileReadFlags readFlags);
__gshared pblFontDataCreateFromFile blFontDataCreateFromFile;

extern(C) @nogc nothrow alias pblFontDataCreateFromDataArray = BLResult function(BLFontDataCore* self, const(BLArrayCore)* dataArray);
__gshared pblFontDataCreateFromDataArray blFontDataCreateFromDataArray;

extern(C) @nogc nothrow alias pblFontDataCreateFromData = BLResult function(BLFontDataCore* self, const(void)* data, size_t dataSize, BLDestroyExternalDataFunc destroyFunc, void* userData);
__gshared pblFontDataCreateFromData blFontDataCreateFromData;

extern(C) @nogc nothrow alias pblFontDataEquals = bool function(const(BLFontDataCore)* a, const(BLFontDataCore)* b);
__gshared pblFontDataEquals blFontDataEquals;

extern(C) @nogc nothrow alias pblFontDataListTags = BLResult function(const(BLFontDataCore)* self, uint faceIndex, BLArrayCore* dst);
__gshared pblFontDataListTags blFontDataListTags;

extern(C) @nogc nothrow alias pblFontDataQueryTables = size_t function(const(BLFontDataCore)* self, uint faceIndex, BLFontTable* dst, const(BLTag)* tags, size_t count);
__gshared pblFontDataQueryTables blFontDataQueryTables;

extern(C) @nogc nothrow alias pblGlyphBufferInit = BLResult function(BLGlyphBufferCore* self);
__gshared pblGlyphBufferInit blGlyphBufferInit;

extern(C) @nogc nothrow alias pblGlyphBufferInitMove = BLResult function(BLGlyphBufferCore* self, BLGlyphBufferCore* other);
__gshared pblGlyphBufferInitMove blGlyphBufferInitMove;

extern(C) @nogc nothrow alias pblGlyphBufferDestroy = BLResult function(BLGlyphBufferCore* self);
__gshared pblGlyphBufferDestroy blGlyphBufferDestroy;

extern(C) @nogc nothrow alias pblGlyphBufferReset = BLResult function(BLGlyphBufferCore* self);
__gshared pblGlyphBufferReset blGlyphBufferReset;

extern(C) @nogc nothrow alias pblGlyphBufferClear = BLResult function(BLGlyphBufferCore* self);
__gshared pblGlyphBufferClear blGlyphBufferClear;

extern(C) @nogc nothrow alias pblGlyphBufferGetSize = size_t function(const(BLGlyphBufferCore)* self);
__gshared pblGlyphBufferGetSize blGlyphBufferGetSize;

extern(C) @nogc nothrow alias pblGlyphBufferGetFlags = uint function(const(BLGlyphBufferCore)* self);
__gshared pblGlyphBufferGetFlags blGlyphBufferGetFlags;

extern(C) @nogc nothrow alias pblGlyphBufferGetGlyphRun = const(BLGlyphRun)* function(const(BLGlyphBufferCore)* self);
__gshared pblGlyphBufferGetGlyphRun blGlyphBufferGetGlyphRun;

extern(C) @nogc nothrow alias pblGlyphBufferGetContent = const(uint)* function(const(BLGlyphBufferCore)* self);
__gshared pblGlyphBufferGetContent blGlyphBufferGetContent;

extern(C) @nogc nothrow alias pblGlyphBufferGetInfoData = const(BLGlyphInfo)* function(const(BLGlyphBufferCore)* self);
__gshared pblGlyphBufferGetInfoData blGlyphBufferGetInfoData;

extern(C) @nogc nothrow alias pblGlyphBufferGetPlacementData = const(BLGlyphPlacement)* function(const(BLGlyphBufferCore)* self);
__gshared pblGlyphBufferGetPlacementData blGlyphBufferGetPlacementData;

extern(C) @nogc nothrow alias pblGlyphBufferSetText = BLResult function(BLGlyphBufferCore* self, const(void)* textData, size_t size, BLTextEncoding encoding);
__gshared pblGlyphBufferSetText blGlyphBufferSetText;

extern(C) @nogc nothrow alias pblGlyphBufferSetGlyphs = BLResult function(BLGlyphBufferCore* self, const(uint)* glyphData, size_t size);
__gshared pblGlyphBufferSetGlyphs blGlyphBufferSetGlyphs;

extern(C) @nogc nothrow alias pblGlyphBufferSetGlyphsFromStruct = BLResult function(BLGlyphBufferCore* self, const(void)* glyphData, size_t size, size_t glyphIdSize, intptr_t glyphIdAdvance);
__gshared pblGlyphBufferSetGlyphsFromStruct blGlyphBufferSetGlyphsFromStruct;

extern(C) @nogc nothrow alias pblPathInit = BLResult function(BLPathCore* self);
__gshared pblPathInit blPathInit;

extern(C) @nogc nothrow alias pblPathInitMove = BLResult function(BLPathCore* self, BLPathCore* other);
__gshared pblPathInitMove blPathInitMove;

extern(C) @nogc nothrow alias pblPathInitWeak = BLResult function(BLPathCore* self, const(BLPathCore)* other);
__gshared pblPathInitWeak blPathInitWeak;

extern(C) @nogc nothrow alias pblPathDestroy = BLResult function(BLPathCore* self);
__gshared pblPathDestroy blPathDestroy;

extern(C) @nogc nothrow alias pblPathReset = BLResult function(BLPathCore* self);
__gshared pblPathReset blPathReset;

extern(C) @nogc nothrow alias pblPathGetSize = size_t function(const(BLPathCore)* self);
__gshared pblPathGetSize blPathGetSize;

extern(C) @nogc nothrow alias pblPathGetCapacity = size_t function(const(BLPathCore)* self);
__gshared pblPathGetCapacity blPathGetCapacity;

extern(C) @nogc nothrow alias pblPathGetCommandData = const(ubyte)* function(const(BLPathCore)* self);
__gshared pblPathGetCommandData blPathGetCommandData;

extern(C) @nogc nothrow alias pblPathGetVertexData = const(BLPoint)* function(const(BLPathCore)* self);
__gshared pblPathGetVertexData blPathGetVertexData;

extern(C) @nogc nothrow alias pblPathClear = BLResult function(BLPathCore* self);
__gshared pblPathClear blPathClear;

extern(C) @nogc nothrow alias pblPathShrink = BLResult function(BLPathCore* self);
__gshared pblPathShrink blPathShrink;

extern(C) @nogc nothrow alias pblPathReserve = BLResult function(BLPathCore* self, size_t n);
__gshared pblPathReserve blPathReserve;

extern(C) @nogc nothrow alias pblPathModifyOp = BLResult function(BLPathCore* self, BLModifyOp op, size_t n, ubyte** cmdDataOut, BLPoint** vtxDataOut);
__gshared pblPathModifyOp blPathModifyOp;

extern(C) @nogc nothrow alias pblPathAssignMove = BLResult function(BLPathCore* self, BLPathCore* other);
__gshared pblPathAssignMove blPathAssignMove;

extern(C) @nogc nothrow alias pblPathAssignWeak = BLResult function(BLPathCore* self, const(BLPathCore)* other);
__gshared pblPathAssignWeak blPathAssignWeak;

extern(C) @nogc nothrow alias pblPathAssignDeep = BLResult function(BLPathCore* self, const(BLPathCore)* other);
__gshared pblPathAssignDeep blPathAssignDeep;

extern(C) @nogc nothrow alias pblPathSetVertexAt = BLResult function(BLPathCore* self, size_t index, uint cmd, double x, double y);
__gshared pblPathSetVertexAt blPathSetVertexAt;

extern(C) @nogc nothrow alias pblPathMoveTo = BLResult function(BLPathCore* self, double x0, double y0);
__gshared pblPathMoveTo blPathMoveTo;

extern(C) @nogc nothrow alias pblPathLineTo = BLResult function(BLPathCore* self, double x1, double y1);
__gshared pblPathLineTo blPathLineTo;

extern(C) @nogc nothrow alias pblPathPolyTo = BLResult function(BLPathCore* self, const(BLPoint)* poly, size_t count);
__gshared pblPathPolyTo blPathPolyTo;

extern(C) @nogc nothrow alias pblPathQuadTo = BLResult function(BLPathCore* self, double x1, double y1, double x2, double y2);
__gshared pblPathQuadTo blPathQuadTo;

extern(C) @nogc nothrow alias pblPathCubicTo = BLResult function(BLPathCore* self, double x1, double y1, double x2, double y2, double x3, double y3);
__gshared pblPathCubicTo blPathCubicTo;

extern(C) @nogc nothrow alias pblPathSmoothQuadTo = BLResult function(BLPathCore* self, double x2, double y2);
__gshared pblPathSmoothQuadTo blPathSmoothQuadTo;

extern(C) @nogc nothrow alias pblPathSmoothCubicTo = BLResult function(BLPathCore* self, double x2, double y2, double x3, double y3);
__gshared pblPathSmoothCubicTo blPathSmoothCubicTo;

extern(C) @nogc nothrow alias pblPathArcTo = BLResult function(BLPathCore* self, double x, double y, double rx, double ry, double start, double sweep, bool forceMoveTo);
__gshared pblPathArcTo blPathArcTo;

extern(C) @nogc nothrow alias pblPathArcQuadrantTo = BLResult function(BLPathCore* self, double x1, double y1, double x2, double y2);
__gshared pblPathArcQuadrantTo blPathArcQuadrantTo;

extern(C) @nogc nothrow alias pblPathEllipticArcTo = BLResult function(BLPathCore* self, double rx, double ry, double xAxisRotation, bool largeArcFlag, bool sweepFlag, double x1, double y1);
__gshared pblPathEllipticArcTo blPathEllipticArcTo;

extern(C) @nogc nothrow alias pblPathClose = BLResult function(BLPathCore* self);
__gshared pblPathClose blPathClose;

extern(C) @nogc nothrow alias pblPathAddGeometry = BLResult function(BLPathCore* self, BLGeometryType geometryType, const(void)* geometryData, const(BLMatrix2D)* m, BLGeometryDirection dir);
__gshared pblPathAddGeometry blPathAddGeometry;

extern(C) @nogc nothrow alias pblPathAddBoxI = BLResult function(BLPathCore* self, const(BLBoxI)* box, BLGeometryDirection dir);
__gshared pblPathAddBoxI blPathAddBoxI;

extern(C) @nogc nothrow alias pblPathAddBoxD = BLResult function(BLPathCore* self, const(BLBox)* box, BLGeometryDirection dir);
__gshared pblPathAddBoxD blPathAddBoxD;

extern(C) @nogc nothrow alias pblPathAddRectI = BLResult function(BLPathCore* self, const(BLRectI)* rect, BLGeometryDirection dir);
__gshared pblPathAddRectI blPathAddRectI;

extern(C) @nogc nothrow alias pblPathAddRectD = BLResult function(BLPathCore* self, const(BLRect)* rect, BLGeometryDirection dir);
__gshared pblPathAddRectD blPathAddRectD;

extern(C) @nogc nothrow alias pblPathAddPath = BLResult function(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range);
__gshared pblPathAddPath blPathAddPath;

extern(C) @nogc nothrow alias pblPathAddTranslatedPath = BLResult function(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, const(BLPoint)* p);
__gshared pblPathAddTranslatedPath blPathAddTranslatedPath;

extern(C) @nogc nothrow alias pblPathAddTransformedPath = BLResult function(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, const(BLMatrix2D)* m);
__gshared pblPathAddTransformedPath blPathAddTransformedPath;

extern(C) @nogc nothrow alias pblPathAddReversedPath = BLResult function(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, BLPathReverseMode reverseMode);
__gshared pblPathAddReversedPath blPathAddReversedPath;

extern(C) @nogc nothrow alias pblPathAddStrokedPath = BLResult function(BLPathCore* self, const(BLPathCore)* other, const(BLRange)* range, const(BLStrokeOptionsCore)* options, const(BLApproximationOptions)* approx);
__gshared pblPathAddStrokedPath blPathAddStrokedPath;

extern(C) @nogc nothrow alias pblPathRemoveRange = BLResult function(BLPathCore* self, const(BLRange)* range);
__gshared pblPathRemoveRange blPathRemoveRange;

extern(C) @nogc nothrow alias pblPathTranslate = BLResult function(BLPathCore* self, const(BLRange)* range, const(BLPoint)* p);
__gshared pblPathTranslate blPathTranslate;

extern(C) @nogc nothrow alias pblPathTransform = BLResult function(BLPathCore* self, const(BLRange)* range, const(BLMatrix2D)* m);
__gshared pblPathTransform blPathTransform;

extern(C) @nogc nothrow alias pblPathFitTo = BLResult function(BLPathCore* self, const(BLRange)* range, const(BLRect)* rect, uint fitFlags);
__gshared pblPathFitTo blPathFitTo;

extern(C) @nogc nothrow alias pblPathEquals = bool function(const(BLPathCore)* a, const(BLPathCore)* b);
__gshared pblPathEquals blPathEquals;

extern(C) @nogc nothrow alias pblPathGetInfoFlags = BLResult function(const(BLPathCore)* self, uint* flagsOut);
__gshared pblPathGetInfoFlags blPathGetInfoFlags;

extern(C) @nogc nothrow alias pblPathGetControlBox = BLResult function(const(BLPathCore)* self, BLBox* boxOut);
__gshared pblPathGetControlBox blPathGetControlBox;

extern(C) @nogc nothrow alias pblPathGetBoundingBox = BLResult function(const(BLPathCore)* self, BLBox* boxOut);
__gshared pblPathGetBoundingBox blPathGetBoundingBox;

extern(C) @nogc nothrow alias pblPathGetFigureRange = BLResult function(const(BLPathCore)* self, size_t index, BLRange* rangeOut);
__gshared pblPathGetFigureRange blPathGetFigureRange;

extern(C) @nogc nothrow alias pblPathGetLastVertex = BLResult function(const(BLPathCore)* self, BLPoint* vtxOut);
__gshared pblPathGetLastVertex blPathGetLastVertex;

extern(C) @nogc nothrow alias pblPathGetClosestVertex = BLResult function(const(BLPathCore)* self, const(BLPoint)* p, double maxDistance, size_t* indexOut, double* distanceOut);
__gshared pblPathGetClosestVertex blPathGetClosestVertex;

extern(C) @nogc nothrow alias pblPathHitTest = BLHitTest function(const(BLPathCore)* self, const(BLPoint)* p, BLFillRule fillRule);
__gshared pblPathHitTest blPathHitTest;

extern(C) @nogc nothrow alias pblStrokeOptionsInit = BLResult function(BLStrokeOptionsCore* self);
__gshared pblStrokeOptionsInit blStrokeOptionsInit;

extern(C) @nogc nothrow alias pblStrokeOptionsInitMove = BLResult function(BLStrokeOptionsCore* self, BLStrokeOptionsCore* other);
__gshared pblStrokeOptionsInitMove blStrokeOptionsInitMove;

extern(C) @nogc nothrow alias pblStrokeOptionsInitWeak = BLResult function(BLStrokeOptionsCore* self, const(BLStrokeOptionsCore)* other);
__gshared pblStrokeOptionsInitWeak blStrokeOptionsInitWeak;

extern(C) @nogc nothrow alias pblStrokeOptionsDestroy = BLResult function(BLStrokeOptionsCore* self);
__gshared pblStrokeOptionsDestroy blStrokeOptionsDestroy;

extern(C) @nogc nothrow alias pblStrokeOptionsReset = BLResult function(BLStrokeOptionsCore* self);
__gshared pblStrokeOptionsReset blStrokeOptionsReset;

extern(C) @nogc nothrow alias pblStrokeOptionsAssignMove = BLResult function(BLStrokeOptionsCore* self, BLStrokeOptionsCore* other);
__gshared pblStrokeOptionsAssignMove blStrokeOptionsAssignMove;

extern(C) @nogc nothrow alias pblStrokeOptionsAssignWeak = BLResult function(BLStrokeOptionsCore* self, const(BLStrokeOptionsCore)* other);
__gshared pblStrokeOptionsAssignWeak blStrokeOptionsAssignWeak;

extern(C) @nogc nothrow alias pblFontFaceInit = BLResult function(BLFontFaceCore* self);
__gshared pblFontFaceInit blFontFaceInit;

extern(C) @nogc nothrow alias pblFontFaceInitMove = BLResult function(BLFontFaceCore* self, BLFontFaceCore* other);
__gshared pblFontFaceInitMove blFontFaceInitMove;

extern(C) @nogc nothrow alias pblFontFaceInitWeak = BLResult function(BLFontFaceCore* self, const(BLFontFaceCore)* other);
__gshared pblFontFaceInitWeak blFontFaceInitWeak;

extern(C) @nogc nothrow alias pblFontFaceDestroy = BLResult function(BLFontFaceCore* self);
__gshared pblFontFaceDestroy blFontFaceDestroy;

extern(C) @nogc nothrow alias pblFontFaceReset = BLResult function(BLFontFaceCore* self);
__gshared pblFontFaceReset blFontFaceReset;

extern(C) @nogc nothrow alias pblFontFaceAssignMove = BLResult function(BLFontFaceCore* self, BLFontFaceCore* other);
__gshared pblFontFaceAssignMove blFontFaceAssignMove;

extern(C) @nogc nothrow alias pblFontFaceAssignWeak = BLResult function(BLFontFaceCore* self, const(BLFontFaceCore)* other);
__gshared pblFontFaceAssignWeak blFontFaceAssignWeak;

extern(C) @nogc nothrow alias pblFontFaceEquals = bool function(const(BLFontFaceCore)* a, const(BLFontFaceCore)* b);
__gshared pblFontFaceEquals blFontFaceEquals;

extern(C) @nogc nothrow alias pblFontFaceCreateFromFile = BLResult function(BLFontFaceCore* self, const(char)* fileName, BLFileReadFlags readFlags);
__gshared pblFontFaceCreateFromFile blFontFaceCreateFromFile;

extern(C) @nogc nothrow alias pblFontFaceCreateFromData = BLResult function(BLFontFaceCore* self, const(BLFontDataCore)* fontData, uint faceIndex);
__gshared pblFontFaceCreateFromData blFontFaceCreateFromData;

extern(C) @nogc nothrow alias pblFontFaceGetFaceInfo = BLResult function(const(BLFontFaceCore)* self, BLFontFaceInfo* out_);
__gshared pblFontFaceGetFaceInfo blFontFaceGetFaceInfo;

extern(C) @nogc nothrow alias pblFontFaceGetScriptTags = BLResult function(const(BLFontFaceCore)* self, BLArrayCore* out_);
__gshared pblFontFaceGetScriptTags blFontFaceGetScriptTags;

extern(C) @nogc nothrow alias pblFontFaceGetFeatureTags = BLResult function(const(BLFontFaceCore)* self, BLArrayCore* out_);
__gshared pblFontFaceGetFeatureTags blFontFaceGetFeatureTags;

extern(C) @nogc nothrow alias pblFontFaceGetDesignMetrics = BLResult function(const(BLFontFaceCore)* self, BLFontDesignMetrics* out_);
__gshared pblFontFaceGetDesignMetrics blFontFaceGetDesignMetrics;

extern(C) @nogc nothrow alias pblFontFaceGetUnicodeCoverage = BLResult function(const(BLFontFaceCore)* self, BLFontUnicodeCoverage* out_);
__gshared pblFontFaceGetUnicodeCoverage blFontFaceGetUnicodeCoverage;

extern(C) @nogc nothrow alias pblFontFaceGetCharacterCoverage = BLResult function(const(BLFontFaceCore)* self, BLBitSetCore* out_);
__gshared pblFontFaceGetCharacterCoverage blFontFaceGetCharacterCoverage;

extern(C) @nogc nothrow alias pblFontFeatureSettingsInit = BLResult function(BLFontFeatureSettingsCore* self);
__gshared pblFontFeatureSettingsInit blFontFeatureSettingsInit;

extern(C) @nogc nothrow alias pblFontFeatureSettingsInitMove = BLResult function(BLFontFeatureSettingsCore* self, BLFontFeatureSettingsCore* other);
__gshared pblFontFeatureSettingsInitMove blFontFeatureSettingsInitMove;

extern(C) @nogc nothrow alias pblFontFeatureSettingsInitWeak = BLResult function(BLFontFeatureSettingsCore* self, const(BLFontFeatureSettingsCore)* other);
__gshared pblFontFeatureSettingsInitWeak blFontFeatureSettingsInitWeak;

extern(C) @nogc nothrow alias pblFontFeatureSettingsDestroy = BLResult function(BLFontFeatureSettingsCore* self);
__gshared pblFontFeatureSettingsDestroy blFontFeatureSettingsDestroy;

extern(C) @nogc nothrow alias pblFontFeatureSettingsReset = BLResult function(BLFontFeatureSettingsCore* self);
__gshared pblFontFeatureSettingsReset blFontFeatureSettingsReset;

extern(C) @nogc nothrow alias pblFontFeatureSettingsClear = BLResult function(BLFontFeatureSettingsCore* self);
__gshared pblFontFeatureSettingsClear blFontFeatureSettingsClear;

extern(C) @nogc nothrow alias pblFontFeatureSettingsShrink = BLResult function(BLFontFeatureSettingsCore* self);
__gshared pblFontFeatureSettingsShrink blFontFeatureSettingsShrink;

extern(C) @nogc nothrow alias pblFontFeatureSettingsAssignMove = BLResult function(BLFontFeatureSettingsCore* self, BLFontFeatureSettingsCore* other);
__gshared pblFontFeatureSettingsAssignMove blFontFeatureSettingsAssignMove;

extern(C) @nogc nothrow alias pblFontFeatureSettingsAssignWeak = BLResult function(BLFontFeatureSettingsCore* self, const(BLFontFeatureSettingsCore)* other);
__gshared pblFontFeatureSettingsAssignWeak blFontFeatureSettingsAssignWeak;

extern(C) @nogc nothrow alias pblFontFeatureSettingsGetSize = size_t function(const(BLFontFeatureSettingsCore)* self);
__gshared pblFontFeatureSettingsGetSize blFontFeatureSettingsGetSize;

extern(C) @nogc nothrow alias pblFontFeatureSettingsGetCapacity = size_t function(const(BLFontFeatureSettingsCore)* self);
__gshared pblFontFeatureSettingsGetCapacity blFontFeatureSettingsGetCapacity;

extern(C) @nogc nothrow alias pblFontFeatureSettingsGetView = BLResult function(const(BLFontFeatureSettingsCore)* self, BLFontFeatureSettingsView* out_);
__gshared pblFontFeatureSettingsGetView blFontFeatureSettingsGetView;

extern(C) @nogc nothrow alias pblFontFeatureSettingsHasKey = bool function(const(BLFontFeatureSettingsCore)* self, BLTag key);
__gshared pblFontFeatureSettingsHasKey blFontFeatureSettingsHasKey;

extern(C) @nogc nothrow alias pblFontFeatureSettingsGetKey = uint function(const(BLFontFeatureSettingsCore)* self, BLTag key);
__gshared pblFontFeatureSettingsGetKey blFontFeatureSettingsGetKey;

extern(C) @nogc nothrow alias pblFontFeatureSettingsSetKey = BLResult function(BLFontFeatureSettingsCore* self, BLTag key, uint value);
__gshared pblFontFeatureSettingsSetKey blFontFeatureSettingsSetKey;

extern(C) @nogc nothrow alias pblFontFeatureSettingsRemoveKey = BLResult function(BLFontFeatureSettingsCore* self, BLTag key);
__gshared pblFontFeatureSettingsRemoveKey blFontFeatureSettingsRemoveKey;

extern(C) @nogc nothrow alias pblFontFeatureSettingsEquals = bool function(const(BLFontFeatureSettingsCore)* a, const(BLFontFeatureSettingsCore)* b);
__gshared pblFontFeatureSettingsEquals blFontFeatureSettingsEquals;

extern(C) @nogc nothrow alias pblFontVariationSettingsInit = BLResult function(BLFontVariationSettingsCore* self);
__gshared pblFontVariationSettingsInit blFontVariationSettingsInit;

extern(C) @nogc nothrow alias pblFontVariationSettingsInitMove = BLResult function(BLFontVariationSettingsCore* self, BLFontVariationSettingsCore* other);
__gshared pblFontVariationSettingsInitMove blFontVariationSettingsInitMove;

extern(C) @nogc nothrow alias pblFontVariationSettingsInitWeak = BLResult function(BLFontVariationSettingsCore* self, const(BLFontVariationSettingsCore)* other);
__gshared pblFontVariationSettingsInitWeak blFontVariationSettingsInitWeak;

extern(C) @nogc nothrow alias pblFontVariationSettingsDestroy = BLResult function(BLFontVariationSettingsCore* self);
__gshared pblFontVariationSettingsDestroy blFontVariationSettingsDestroy;

extern(C) @nogc nothrow alias pblFontVariationSettingsReset = BLResult function(BLFontVariationSettingsCore* self);
__gshared pblFontVariationSettingsReset blFontVariationSettingsReset;

extern(C) @nogc nothrow alias pblFontVariationSettingsClear = BLResult function(BLFontVariationSettingsCore* self);
__gshared pblFontVariationSettingsClear blFontVariationSettingsClear;

extern(C) @nogc nothrow alias pblFontVariationSettingsShrink = BLResult function(BLFontVariationSettingsCore* self);
__gshared pblFontVariationSettingsShrink blFontVariationSettingsShrink;

extern(C) @nogc nothrow alias pblFontVariationSettingsAssignMove = BLResult function(BLFontVariationSettingsCore* self, BLFontVariationSettingsCore* other);
__gshared pblFontVariationSettingsAssignMove blFontVariationSettingsAssignMove;

extern(C) @nogc nothrow alias pblFontVariationSettingsAssignWeak = BLResult function(BLFontVariationSettingsCore* self, const(BLFontVariationSettingsCore)* other);
__gshared pblFontVariationSettingsAssignWeak blFontVariationSettingsAssignWeak;

extern(C) @nogc nothrow alias pblFontVariationSettingsGetSize = size_t function(const(BLFontVariationSettingsCore)* self);
__gshared pblFontVariationSettingsGetSize blFontVariationSettingsGetSize;

extern(C) @nogc nothrow alias pblFontVariationSettingsGetCapacity = size_t function(const(BLFontVariationSettingsCore)* self);
__gshared pblFontVariationSettingsGetCapacity blFontVariationSettingsGetCapacity;

extern(C) @nogc nothrow alias pblFontVariationSettingsGetView = BLResult function(const(BLFontVariationSettingsCore)* self, BLFontVariationSettingsView* out_);
__gshared pblFontVariationSettingsGetView blFontVariationSettingsGetView;

extern(C) @nogc nothrow alias pblFontVariationSettingsHasKey = bool function(const(BLFontVariationSettingsCore)* self, BLTag key);
__gshared pblFontVariationSettingsHasKey blFontVariationSettingsHasKey;

extern(C) @nogc nothrow alias pblFontVariationSettingsGetKey = float function(const(BLFontVariationSettingsCore)* self, BLTag key);
__gshared pblFontVariationSettingsGetKey blFontVariationSettingsGetKey;

extern(C) @nogc nothrow alias pblFontVariationSettingsSetKey = BLResult function(BLFontVariationSettingsCore* self, BLTag key, float value);
__gshared pblFontVariationSettingsSetKey blFontVariationSettingsSetKey;

extern(C) @nogc nothrow alias pblFontVariationSettingsRemoveKey = BLResult function(BLFontVariationSettingsCore* self, BLTag key);
__gshared pblFontVariationSettingsRemoveKey blFontVariationSettingsRemoveKey;

extern(C) @nogc nothrow alias pblFontVariationSettingsEquals = bool function(const(BLFontVariationSettingsCore)* a, const(BLFontVariationSettingsCore)* b);
__gshared pblFontVariationSettingsEquals blFontVariationSettingsEquals;

extern(C) @nogc nothrow alias pblFontInit = BLResult function(BLFontCore* self);
__gshared pblFontInit blFontInit;

extern(C) @nogc nothrow alias pblFontInitMove = BLResult function(BLFontCore* self, BLFontCore* other);
__gshared pblFontInitMove blFontInitMove;

extern(C) @nogc nothrow alias pblFontInitWeak = BLResult function(BLFontCore* self, const(BLFontCore)* other);
__gshared pblFontInitWeak blFontInitWeak;

extern(C) @nogc nothrow alias pblFontDestroy = BLResult function(BLFontCore* self);
__gshared pblFontDestroy blFontDestroy;

extern(C) @nogc nothrow alias pblFontReset = BLResult function(BLFontCore* self);
__gshared pblFontReset blFontReset;

extern(C) @nogc nothrow alias pblFontAssignMove = BLResult function(BLFontCore* self, BLFontCore* other);
__gshared pblFontAssignMove blFontAssignMove;

extern(C) @nogc nothrow alias pblFontAssignWeak = BLResult function(BLFontCore* self, const(BLFontCore)* other);
__gshared pblFontAssignWeak blFontAssignWeak;

extern(C) @nogc nothrow alias pblFontEquals = bool function(const(BLFontCore)* a, const(BLFontCore)* b);
__gshared pblFontEquals blFontEquals;

extern(C) @nogc nothrow alias pblFontCreateFromFace = BLResult function(BLFontCore* self, const(BLFontFaceCore)* face, float size);
__gshared pblFontCreateFromFace blFontCreateFromFace;

extern(C) @nogc nothrow alias pblFontGetSize = float function(const(BLFontCore)* self);
__gshared pblFontGetSize blFontGetSize;

extern(C) @nogc nothrow alias pblFontSetSize = BLResult function(BLFontCore* self, float size);
__gshared pblFontSetSize blFontSetSize;

extern(C) @nogc nothrow alias pblFontGetMetrics = BLResult function(const(BLFontCore)* self, BLFontMetrics* out_);
__gshared pblFontGetMetrics blFontGetMetrics;

extern(C) @nogc nothrow alias pblFontGetMatrix = BLResult function(const(BLFontCore)* self, BLFontMatrix* out_);
__gshared pblFontGetMatrix blFontGetMatrix;

extern(C) @nogc nothrow alias pblFontGetDesignMetrics = BLResult function(const(BLFontCore)* self, BLFontDesignMetrics* out_);
__gshared pblFontGetDesignMetrics blFontGetDesignMetrics;

extern(C) @nogc nothrow alias pblFontGetFeatureSettings = BLResult function(const(BLFontCore)* self, BLFontFeatureSettingsCore* out_);
__gshared pblFontGetFeatureSettings blFontGetFeatureSettings;

extern(C) @nogc nothrow alias pblFontSetFeatureSettings = BLResult function(BLFontCore* self, const(BLFontFeatureSettingsCore)* featureSettings);
__gshared pblFontSetFeatureSettings blFontSetFeatureSettings;

extern(C) @nogc nothrow alias pblFontResetFeatureSettings = BLResult function(BLFontCore* self);
__gshared pblFontResetFeatureSettings blFontResetFeatureSettings;

extern(C) @nogc nothrow alias pblFontShape = BLResult function(const(BLFontCore)* self, BLGlyphBufferCore* gb);
__gshared pblFontShape blFontShape;

extern(C) @nogc nothrow alias pblFontMapTextToGlyphs = BLResult function(const(BLFontCore)* self, BLGlyphBufferCore* gb, BLGlyphMappingState* stateOut);
__gshared pblFontMapTextToGlyphs blFontMapTextToGlyphs;

extern(C) @nogc nothrow alias pblFontPositionGlyphs = BLResult function(const(BLFontCore)* self, BLGlyphBufferCore* gb, uint positioningFlags);
__gshared pblFontPositionGlyphs blFontPositionGlyphs;

extern(C) @nogc nothrow alias pblFontApplyKerning = BLResult function(const(BLFontCore)* self, BLGlyphBufferCore* gb);
__gshared pblFontApplyKerning blFontApplyKerning;

extern(C) @nogc nothrow alias pblFontApplyGSub = BLResult function(const(BLFontCore)* self, BLGlyphBufferCore* gb, const(BLBitSetCore)* lookups);
__gshared pblFontApplyGSub blFontApplyGSub;

extern(C) @nogc nothrow alias pblFontApplyGPos = BLResult function(const(BLFontCore)* self, BLGlyphBufferCore* gb, const(BLBitSetCore)* lookups);
__gshared pblFontApplyGPos blFontApplyGPos;

extern(C) @nogc nothrow alias pblFontGetTextMetrics = BLResult function(const(BLFontCore)* self, BLGlyphBufferCore* gb, BLTextMetrics* out_);
__gshared pblFontGetTextMetrics blFontGetTextMetrics;

extern(C) @nogc nothrow alias pblFontGetGlyphBounds = BLResult function(const(BLFontCore)* self, const(uint)* glyphData, intptr_t glyphAdvance, BLBoxI* out_, size_t count);
__gshared pblFontGetGlyphBounds blFontGetGlyphBounds;

extern(C) @nogc nothrow alias pblFontGetGlyphAdvances = BLResult function(const(BLFontCore)* self, const(uint)* glyphData, intptr_t glyphAdvance, BLGlyphPlacement* out_, size_t count);
__gshared pblFontGetGlyphAdvances blFontGetGlyphAdvances;

extern(C) @nogc nothrow alias pblFontGetGlyphOutlines = BLResult function(const(BLFontCore)* self, uint glyphId, const(BLMatrix2D)* userMatrix, BLPathCore* out_, BLPathSinkFunc sink, void* closure);
__gshared pblFontGetGlyphOutlines blFontGetGlyphOutlines;

extern(C) @nogc nothrow alias pblFontGetGlyphRunOutlines = BLResult function(const(BLFontCore)* self, const(BLGlyphRun)* glyphRun, const(BLMatrix2D)* userMatrix, BLPathCore* out_, BLPathSinkFunc sink, void* closure);
__gshared pblFontGetGlyphRunOutlines blFontGetGlyphRunOutlines;

extern(C) @nogc nothrow alias pblFormatInfoQuery = BLResult function(BLFormatInfo* self, BLFormat format);
__gshared pblFormatInfoQuery blFormatInfoQuery;

extern(C) @nogc nothrow alias pblFormatInfoSanitize = BLResult function(BLFormatInfo* self);
__gshared pblFormatInfoSanitize blFormatInfoSanitize;

extern(C) @nogc nothrow alias pblImageCodecInit = BLResult function(BLImageCodecCore* self);
__gshared pblImageCodecInit blImageCodecInit;

extern(C) @nogc nothrow alias pblImageCodecInitMove = BLResult function(BLImageCodecCore* self, BLImageCodecCore* other);
__gshared pblImageCodecInitMove blImageCodecInitMove;

extern(C) @nogc nothrow alias pblImageCodecInitWeak = BLResult function(BLImageCodecCore* self, const(BLImageCodecCore)* other);
__gshared pblImageCodecInitWeak blImageCodecInitWeak;

extern(C) @nogc nothrow alias pblImageCodecInitByName = BLResult function(BLImageCodecCore* self, const(char)* name, size_t size, const(BLArrayCore)* codecs);
__gshared pblImageCodecInitByName blImageCodecInitByName;

extern(C) @nogc nothrow alias pblImageCodecDestroy = BLResult function(BLImageCodecCore* self);
__gshared pblImageCodecDestroy blImageCodecDestroy;

extern(C) @nogc nothrow alias pblImageCodecReset = BLResult function(BLImageCodecCore* self);
__gshared pblImageCodecReset blImageCodecReset;

extern(C) @nogc nothrow alias pblImageCodecAssignMove = BLResult function(BLImageCodecCore* self, BLImageCodecCore* other);
__gshared pblImageCodecAssignMove blImageCodecAssignMove;

extern(C) @nogc nothrow alias pblImageCodecAssignWeak = BLResult function(BLImageCodecCore* self, const(BLImageCodecCore)* other);
__gshared pblImageCodecAssignWeak blImageCodecAssignWeak;

extern(C) @nogc nothrow alias pblImageCodecFindByName = BLResult function(BLImageCodecCore* self, const(char)* name, size_t size, const(BLArrayCore)* codecs);
__gshared pblImageCodecFindByName blImageCodecFindByName;

extern(C) @nogc nothrow alias pblImageCodecFindByExtension = BLResult function(BLImageCodecCore* self, const(char)* name, size_t size, const(BLArrayCore)* codecs);
__gshared pblImageCodecFindByExtension blImageCodecFindByExtension;

extern(C) @nogc nothrow alias pblImageCodecFindByData = BLResult function(BLImageCodecCore* self, const(void)* data, size_t size, const(BLArrayCore)* codecs);
__gshared pblImageCodecFindByData blImageCodecFindByData;

extern(C) @nogc nothrow alias pblImageCodecInspectData = uint function(const(BLImageCodecCore)* self, const(void)* data, size_t size);
__gshared pblImageCodecInspectData blImageCodecInspectData;

extern(C) @nogc nothrow alias pblImageCodecCreateDecoder = BLResult function(const(BLImageCodecCore)* self, BLImageDecoderCore* dst);
__gshared pblImageCodecCreateDecoder blImageCodecCreateDecoder;

extern(C) @nogc nothrow alias pblImageCodecCreateEncoder = BLResult function(const(BLImageCodecCore)* self, BLImageEncoderCore* dst);
__gshared pblImageCodecCreateEncoder blImageCodecCreateEncoder;

extern(C) @nogc nothrow alias pblImageCodecArrayInitBuiltInCodecs = BLResult function(BLArrayCore* self);
__gshared pblImageCodecArrayInitBuiltInCodecs blImageCodecArrayInitBuiltInCodecs;

extern(C) @nogc nothrow alias pblImageCodecArrayAssignBuiltInCodecs = BLResult function(BLArrayCore* self);
__gshared pblImageCodecArrayAssignBuiltInCodecs blImageCodecArrayAssignBuiltInCodecs;

extern(C) @nogc nothrow alias pblImageCodecAddToBuiltIn = BLResult function(const(BLImageCodecCore)* codec);
__gshared pblImageCodecAddToBuiltIn blImageCodecAddToBuiltIn;

extern(C) @nogc nothrow alias pblImageCodecRemoveFromBuiltIn = BLResult function(const(BLImageCodecCore)* codec);
__gshared pblImageCodecRemoveFromBuiltIn blImageCodecRemoveFromBuiltIn;

extern(C) @nogc nothrow alias pblImageInit = BLResult function(BLImageCore* self);
__gshared pblImageInit blImageInit;

extern(C) @nogc nothrow alias pblImageInitMove = BLResult function(BLImageCore* self, BLImageCore* other);
__gshared pblImageInitMove blImageInitMove;

extern(C) @nogc nothrow alias pblImageInitWeak = BLResult function(BLImageCore* self, const(BLImageCore)* other);
__gshared pblImageInitWeak blImageInitWeak;

extern(C) @nogc nothrow alias pblImageInitAs = BLResult function(BLImageCore* self, int w, int h, BLFormat format);
__gshared pblImageInitAs blImageInitAs;

extern(C) @nogc nothrow alias pblImageInitAsFromData = BLResult function(BLImageCore* self, int w, int h, BLFormat format, void* pixelData, intptr_t stride, BLDestroyExternalDataFunc destroyFunc, void* userData);
__gshared pblImageInitAsFromData blImageInitAsFromData;

extern(C) @nogc nothrow alias pblImageDestroy = BLResult function(BLImageCore* self);
__gshared pblImageDestroy blImageDestroy;

extern(C) @nogc nothrow alias pblImageReset = BLResult function(BLImageCore* self);
__gshared pblImageReset blImageReset;

extern(C) @nogc nothrow alias pblImageAssignMove = BLResult function(BLImageCore* self, BLImageCore* other);
__gshared pblImageAssignMove blImageAssignMove;

extern(C) @nogc nothrow alias pblImageAssignWeak = BLResult function(BLImageCore* self, const(BLImageCore)* other);
__gshared pblImageAssignWeak blImageAssignWeak;

extern(C) @nogc nothrow alias pblImageAssignDeep = BLResult function(BLImageCore* self, const(BLImageCore)* other);
__gshared pblImageAssignDeep blImageAssignDeep;

extern(C) @nogc nothrow alias pblImageCreate = BLResult function(BLImageCore* self, int w, int h, BLFormat format);
__gshared pblImageCreate blImageCreate;

extern(C) @nogc nothrow alias pblImageCreateFromData = BLResult function(BLImageCore* self, int w, int h, BLFormat format, void* pixelData, intptr_t stride, BLDestroyExternalDataFunc destroyFunc, void* userData);
__gshared pblImageCreateFromData blImageCreateFromData;

extern(C) @nogc nothrow alias pblImageGetData = BLResult function(const(BLImageCore)* self, BLImageData* dataOut);
__gshared pblImageGetData blImageGetData;

extern(C) @nogc nothrow alias pblImageMakeMutable = BLResult function(BLImageCore* self, BLImageData* dataOut);
__gshared pblImageMakeMutable blImageMakeMutable;

extern(C) @nogc nothrow alias pblImageConvert = BLResult function(BLImageCore* self, BLFormat format);
__gshared pblImageConvert blImageConvert;

extern(C) @nogc nothrow alias pblImageEquals = bool function(const(BLImageCore)* a, const(BLImageCore)* b);
__gshared pblImageEquals blImageEquals;

extern(C) @nogc nothrow alias pblImageScale = BLResult function(BLImageCore* dst, const(BLImageCore)* src, const(BLSizeI)* size, uint filter, const(BLImageScaleOptions)* options);
__gshared pblImageScale blImageScale;

extern(C) @nogc nothrow alias pblImageReadFromFile = BLResult function(BLImageCore* self, const(char)* fileName, const(BLArrayCore)* codecs);
__gshared pblImageReadFromFile blImageReadFromFile;

extern(C) @nogc nothrow alias pblImageReadFromData = BLResult function(BLImageCore* self, const(void)* data, size_t size, const(BLArrayCore)* codecs);
__gshared pblImageReadFromData blImageReadFromData;

extern(C) @nogc nothrow alias pblImageWriteToFile = BLResult function(const(BLImageCore)* self, const(char)* fileName, const(BLImageCodecCore)* codec);
__gshared pblImageWriteToFile blImageWriteToFile;

extern(C) @nogc nothrow alias pblImageWriteToData = BLResult function(const(BLImageCore)* self, BLArrayCore* dst, const(BLImageCodecCore)* codec);
__gshared pblImageWriteToData blImageWriteToData;

extern(C) @nogc nothrow alias pblMatrix2DSetIdentity = BLResult function(BLMatrix2D* self);
__gshared pblMatrix2DSetIdentity blMatrix2DSetIdentity;

extern(C) @nogc nothrow alias pblMatrix2DSetTranslation = BLResult function(BLMatrix2D* self, double x, double y);
__gshared pblMatrix2DSetTranslation blMatrix2DSetTranslation;

extern(C) @nogc nothrow alias pblMatrix2DSetScaling = BLResult function(BLMatrix2D* self, double x, double y);
__gshared pblMatrix2DSetScaling blMatrix2DSetScaling;

extern(C) @nogc nothrow alias pblMatrix2DSetSkewing = BLResult function(BLMatrix2D* self, double x, double y);
__gshared pblMatrix2DSetSkewing blMatrix2DSetSkewing;

extern(C) @nogc nothrow alias pblMatrix2DSetRotation = BLResult function(BLMatrix2D* self, double angle, double cx, double cy);
__gshared pblMatrix2DSetRotation blMatrix2DSetRotation;

extern(C) @nogc nothrow alias pblMatrix2DApplyOp = BLResult function(BLMatrix2D* self, BLMatrix2DOp opType, const(void)* opData);
__gshared pblMatrix2DApplyOp blMatrix2DApplyOp;

extern(C) @nogc nothrow alias pblMatrix2DInvert = BLResult function(BLMatrix2D* dst, const(BLMatrix2D)* src);
__gshared pblMatrix2DInvert blMatrix2DInvert;

extern(C) @nogc nothrow alias pblMatrix2DGetType = BLMatrix2DType function(const(BLMatrix2D)* self);
__gshared pblMatrix2DGetType blMatrix2DGetType;

extern(C) @nogc nothrow alias pblMatrix2DMapPointDArray = BLResult function(const(BLMatrix2D)* self, BLPoint* dst, const(BLPoint)* src, size_t count);
__gshared pblMatrix2DMapPointDArray blMatrix2DMapPointDArray;

extern(C) @nogc nothrow alias pblVarInitType = BLResult function(BLUnknown* self, BLObjectType type);
__gshared pblVarInitType blVarInitType;

extern(C) @nogc nothrow alias pblVarInitNull = BLResult function(BLUnknown* self);
__gshared pblVarInitNull blVarInitNull;

extern(C) @nogc nothrow alias pblVarInitBool = BLResult function(BLUnknown* self, bool value);
__gshared pblVarInitBool blVarInitBool;

extern(C) @nogc nothrow alias pblVarInitInt32 = BLResult function(BLUnknown* self, int value);
__gshared pblVarInitInt32 blVarInitInt32;

extern(C) @nogc nothrow alias pblVarInitInt64 = BLResult function(BLUnknown* self, long value);
__gshared pblVarInitInt64 blVarInitInt64;

extern(C) @nogc nothrow alias pblVarInitUInt32 = BLResult function(BLUnknown* self, uint value);
__gshared pblVarInitUInt32 blVarInitUInt32;

extern(C) @nogc nothrow alias pblVarInitUInt64 = BLResult function(BLUnknown* self, ulong value);
__gshared pblVarInitUInt64 blVarInitUInt64;

extern(C) @nogc nothrow alias pblVarInitDouble = BLResult function(BLUnknown* self, double value);
__gshared pblVarInitDouble blVarInitDouble;

extern(C) @nogc nothrow alias pblVarInitRgba = BLResult function(BLUnknown* self, const(BLRgba)* rgba);
__gshared pblVarInitRgba blVarInitRgba;

extern(C) @nogc nothrow alias pblVarInitRgba32 = BLResult function(BLUnknown* self, uint rgba32);
__gshared pblVarInitRgba32 blVarInitRgba32;

extern(C) @nogc nothrow alias pblVarInitRgba64 = BLResult function(BLUnknown* self, ulong rgba64);
__gshared pblVarInitRgba64 blVarInitRgba64;

extern(C) @nogc nothrow alias pblVarInitMove = BLResult function(BLUnknown* self, BLUnknown* other);
__gshared pblVarInitMove blVarInitMove;

extern(C) @nogc nothrow alias pblVarInitWeak = BLResult function(BLUnknown* self, const(BLUnknown)* other);
__gshared pblVarInitWeak blVarInitWeak;

extern(C) @nogc nothrow alias pblVarDestroy = BLResult function(BLUnknown* self);
__gshared pblVarDestroy blVarDestroy;

extern(C) @nogc nothrow alias pblVarReset = BLResult function(BLUnknown* self);
__gshared pblVarReset blVarReset;

extern(C) @nogc nothrow alias pblVarAssignNull = BLResult function(BLUnknown* self);
__gshared pblVarAssignNull blVarAssignNull;

extern(C) @nogc nothrow alias pblVarAssignBool = BLResult function(BLUnknown* self, bool value);
__gshared pblVarAssignBool blVarAssignBool;

extern(C) @nogc nothrow alias pblVarAssignInt32 = BLResult function(BLUnknown* self, int value);
__gshared pblVarAssignInt32 blVarAssignInt32;

extern(C) @nogc nothrow alias pblVarAssignInt64 = BLResult function(BLUnknown* self, long value);
__gshared pblVarAssignInt64 blVarAssignInt64;

extern(C) @nogc nothrow alias pblVarAssignUInt32 = BLResult function(BLUnknown* self, uint value);
__gshared pblVarAssignUInt32 blVarAssignUInt32;

extern(C) @nogc nothrow alias pblVarAssignUInt64 = BLResult function(BLUnknown* self, ulong value);
__gshared pblVarAssignUInt64 blVarAssignUInt64;

extern(C) @nogc nothrow alias pblVarAssignDouble = BLResult function(BLUnknown* self, double value);
__gshared pblVarAssignDouble blVarAssignDouble;

extern(C) @nogc nothrow alias pblVarAssignRgba = BLResult function(BLUnknown* self, const(BLRgba)* rgba);
__gshared pblVarAssignRgba blVarAssignRgba;

extern(C) @nogc nothrow alias pblVarAssignRgba32 = BLResult function(BLUnknown* self, uint rgba32);
__gshared pblVarAssignRgba32 blVarAssignRgba32;

extern(C) @nogc nothrow alias pblVarAssignRgba64 = BLResult function(BLUnknown* self, ulong rgba64);
__gshared pblVarAssignRgba64 blVarAssignRgba64;

extern(C) @nogc nothrow alias pblVarAssignMove = BLResult function(BLUnknown* self, BLUnknown* other);
__gshared pblVarAssignMove blVarAssignMove;

extern(C) @nogc nothrow alias pblVarAssignWeak = BLResult function(BLUnknown* self, const(BLUnknown)* other);
__gshared pblVarAssignWeak blVarAssignWeak;

extern(C) @nogc nothrow alias pblVarGetType = BLObjectType function(const(BLUnknown)* self);
__gshared pblVarGetType blVarGetType;

extern(C) @nogc nothrow alias pblVarToBool = BLResult function(const(BLUnknown)* self, bool* out_);
__gshared pblVarToBool blVarToBool;

extern(C) @nogc nothrow alias pblVarToInt32 = BLResult function(const(BLUnknown)* self, int* out_);
__gshared pblVarToInt32 blVarToInt32;

extern(C) @nogc nothrow alias pblVarToInt64 = BLResult function(const(BLUnknown)* self, long* out_);
__gshared pblVarToInt64 blVarToInt64;

extern(C) @nogc nothrow alias pblVarToUInt32 = BLResult function(const(BLUnknown)* self, uint* out_);
__gshared pblVarToUInt32 blVarToUInt32;

extern(C) @nogc nothrow alias pblVarToUInt64 = BLResult function(const(BLUnknown)* self, ulong* out_);
__gshared pblVarToUInt64 blVarToUInt64;

extern(C) @nogc nothrow alias pblVarToDouble = BLResult function(const(BLUnknown)* self, double* out_);
__gshared pblVarToDouble blVarToDouble;

extern(C) @nogc nothrow alias pblVarToRgba = BLResult function(const(BLUnknown)* self, BLRgba* out_);
__gshared pblVarToRgba blVarToRgba;

extern(C) @nogc nothrow alias pblVarToRgba32 = BLResult function(const(BLUnknown)* self, uint* out_);
__gshared pblVarToRgba32 blVarToRgba32;

extern(C) @nogc nothrow alias pblVarToRgba64 = BLResult function(const(BLUnknown)* self, ulong* out_);
__gshared pblVarToRgba64 blVarToRgba64;

extern(C) @nogc nothrow alias pblVarEquals = bool function(const(BLUnknown)* a, const(BLUnknown)* b);
__gshared pblVarEquals blVarEquals;

extern(C) @nogc nothrow alias pblVarEqualsNull = bool function(const(BLUnknown)* self);
__gshared pblVarEqualsNull blVarEqualsNull;

extern(C) @nogc nothrow alias pblVarEqualsBool = bool function(const(BLUnknown)* self, bool value);
__gshared pblVarEqualsBool blVarEqualsBool;

extern(C) @nogc nothrow alias pblVarEqualsInt64 = bool function(const(BLUnknown)* self, long value);
__gshared pblVarEqualsInt64 blVarEqualsInt64;

extern(C) @nogc nothrow alias pblVarEqualsUInt64 = bool function(const(BLUnknown)* self, ulong value);
__gshared pblVarEqualsUInt64 blVarEqualsUInt64;

extern(C) @nogc nothrow alias pblVarEqualsDouble = bool function(const(BLUnknown)* self, double value);
__gshared pblVarEqualsDouble blVarEqualsDouble;

extern(C) @nogc nothrow alias pblVarStrictEquals = bool function(const(BLUnknown)* a, const(BLUnknown)* b);
__gshared pblVarStrictEquals blVarStrictEquals;

extern(C) @nogc nothrow alias pblContextInit = BLResult function(BLContextCore* self);
__gshared pblContextInit blContextInit;

extern(C) @nogc nothrow alias pblContextInitMove = BLResult function(BLContextCore* self, BLContextCore* other);
__gshared pblContextInitMove blContextInitMove;

extern(C) @nogc nothrow alias pblContextInitWeak = BLResult function(BLContextCore* self, const(BLContextCore)* other);
__gshared pblContextInitWeak blContextInitWeak;

extern(C) @nogc nothrow alias pblContextInitAs = BLResult function(BLContextCore* self, BLImageCore* image, const(BLContextCreateInfo)* cci);
__gshared pblContextInitAs blContextInitAs;

extern(C) @nogc nothrow alias pblContextDestroy = BLResult function(BLContextCore* self);
__gshared pblContextDestroy blContextDestroy;

extern(C) @nogc nothrow alias pblContextReset = BLResult function(BLContextCore* self);
__gshared pblContextReset blContextReset;

extern(C) @nogc nothrow alias pblContextAssignMove = BLResult function(BLContextCore* self, BLContextCore* other);
__gshared pblContextAssignMove blContextAssignMove;

extern(C) @nogc nothrow alias pblContextAssignWeak = BLResult function(BLContextCore* self, const(BLContextCore)* other);
__gshared pblContextAssignWeak blContextAssignWeak;

extern(C) @nogc nothrow alias pblContextGetType = BLContextType function(const(BLContextCore)* self);
__gshared pblContextGetType blContextGetType;

extern(C) @nogc nothrow alias pblContextGetTargetSize = BLResult function(const(BLContextCore)* self, BLSize* targetSizeOut);
__gshared pblContextGetTargetSize blContextGetTargetSize;

extern(C) @nogc nothrow alias pblContextGetTargetImage = BLImageCore* function(const(BLContextCore)* self);
__gshared pblContextGetTargetImage blContextGetTargetImage;

extern(C) @nogc nothrow alias pblContextBegin = BLResult function(BLContextCore* self, BLImageCore* image, const(BLContextCreateInfo)* cci);
__gshared pblContextBegin blContextBegin;

extern(C) @nogc nothrow alias pblContextEnd = BLResult function(BLContextCore* self);
__gshared pblContextEnd blContextEnd;

extern(C) @nogc nothrow alias pblContextFlush = BLResult function(BLContextCore* self, BLContextFlushFlags flags);
__gshared pblContextFlush blContextFlush;

extern(C) @nogc nothrow alias pblContextSave = BLResult function(BLContextCore* self, BLContextCookie* cookie);
__gshared pblContextSave blContextSave;

extern(C) @nogc nothrow alias pblContextRestore = BLResult function(BLContextCore* self, const(BLContextCookie)* cookie);
__gshared pblContextRestore blContextRestore;

extern(C) @nogc nothrow alias pblContextGetMetaMatrix = BLResult function(const(BLContextCore)* self, BLMatrix2D* m);
__gshared pblContextGetMetaMatrix blContextGetMetaMatrix;

extern(C) @nogc nothrow alias pblContextGetUserMatrix = BLResult function(const(BLContextCore)* self, BLMatrix2D* m);
__gshared pblContextGetUserMatrix blContextGetUserMatrix;

extern(C) @nogc nothrow alias pblContextUserToMeta = BLResult function(BLContextCore* self);
__gshared pblContextUserToMeta blContextUserToMeta;

extern(C) @nogc nothrow alias pblContextMatrixOp = BLResult function(BLContextCore* self, BLMatrix2DOp opType, const(void)* opData);
__gshared pblContextMatrixOp blContextMatrixOp;

extern(C) @nogc nothrow alias pblContextGetHint = uint function(const(BLContextCore)* self, BLContextHint hintType);
__gshared pblContextGetHint blContextGetHint;

extern(C) @nogc nothrow alias pblContextSetHint = BLResult function(BLContextCore* self, BLContextHint hintType, uint value);
__gshared pblContextSetHint blContextSetHint;

extern(C) @nogc nothrow alias pblContextGetHints = BLResult function(const(BLContextCore)* self, BLContextHints* hintsOut);
__gshared pblContextGetHints blContextGetHints;

extern(C) @nogc nothrow alias pblContextSetHints = BLResult function(BLContextCore* self, const(BLContextHints)* hints);
__gshared pblContextSetHints blContextSetHints;

extern(C) @nogc nothrow alias pblContextSetFlattenMode = BLResult function(BLContextCore* self, BLFlattenMode mode);
__gshared pblContextSetFlattenMode blContextSetFlattenMode;

extern(C) @nogc nothrow alias pblContextSetFlattenTolerance = BLResult function(BLContextCore* self, double tolerance);
__gshared pblContextSetFlattenTolerance blContextSetFlattenTolerance;

extern(C) @nogc nothrow alias pblContextSetApproximationOptions = BLResult function(BLContextCore* self, const(BLApproximationOptions)* options);
__gshared pblContextSetApproximationOptions blContextSetApproximationOptions;

extern(C) @nogc nothrow alias pblContextGetCompOp = BLCompOp function(const(BLContextCore)* self);
__gshared pblContextGetCompOp blContextGetCompOp;

extern(C) @nogc nothrow alias pblContextSetCompOp = BLResult function(BLContextCore* self, BLCompOp compOp);
__gshared pblContextSetCompOp blContextSetCompOp;

extern(C) @nogc nothrow alias pblContextGetGlobalAlpha = double function(const(BLContextCore)* self);
__gshared pblContextGetGlobalAlpha blContextGetGlobalAlpha;

extern(C) @nogc nothrow alias pblContextSetGlobalAlpha = BLResult function(BLContextCore* self, double alpha);
__gshared pblContextSetGlobalAlpha blContextSetGlobalAlpha;

extern(C) @nogc nothrow alias pblContextGetFillAlpha = double function(const(BLContextCore)* self);
__gshared pblContextGetFillAlpha blContextGetFillAlpha;

extern(C) @nogc nothrow alias pblContextSetFillAlpha = BLResult function(BLContextCore* self, double alpha);
__gshared pblContextSetFillAlpha blContextSetFillAlpha;

extern(C) @nogc nothrow alias pblContextGetFillStyle = BLResult function(const(BLContextCore)* self, BLVarCore* varOut);
__gshared pblContextGetFillStyle blContextGetFillStyle;

extern(C) @nogc nothrow alias pblContextSetFillStyle = BLResult function(BLContextCore* self, const(BLUnknown)* var);
__gshared pblContextSetFillStyle blContextSetFillStyle;

extern(C) @nogc nothrow alias pblContextSetFillStyleRgba = BLResult function(BLContextCore* self, const(BLRgba)* rgba);
__gshared pblContextSetFillStyleRgba blContextSetFillStyleRgba;

extern(C) @nogc nothrow alias pblContextSetFillStyleRgba32 = BLResult function(BLContextCore* self, uint rgba32);
__gshared pblContextSetFillStyleRgba32 blContextSetFillStyleRgba32;

extern(C) @nogc nothrow alias pblContextSetFillStyleRgba64 = BLResult function(BLContextCore* self, ulong rgba64);
__gshared pblContextSetFillStyleRgba64 blContextSetFillStyleRgba64;

extern(C) @nogc nothrow alias pblContextGetFillRule = BLFillRule function(const(BLContextCore)* self);
__gshared pblContextGetFillRule blContextGetFillRule;

extern(C) @nogc nothrow alias pblContextSetFillRule = BLResult function(BLContextCore* self, BLFillRule fillRule);
__gshared pblContextSetFillRule blContextSetFillRule;

extern(C) @nogc nothrow alias pblContextGetStrokeAlpha = double function(const(BLContextCore)* self);
__gshared pblContextGetStrokeAlpha blContextGetStrokeAlpha;

extern(C) @nogc nothrow alias pblContextSetStrokeAlpha = BLResult function(BLContextCore* self, double alpha);
__gshared pblContextSetStrokeAlpha blContextSetStrokeAlpha;

extern(C) @nogc nothrow alias pblContextGetStrokeStyle = BLResult function(const(BLContextCore)* self, BLVarCore* varOut);
__gshared pblContextGetStrokeStyle blContextGetStrokeStyle;

extern(C) @nogc nothrow alias pblContextSetStrokeStyle = BLResult function(BLContextCore* self, const(BLUnknown)* var);
__gshared pblContextSetStrokeStyle blContextSetStrokeStyle;

extern(C) @nogc nothrow alias pblContextSetStrokeStyleRgba = BLResult function(BLContextCore* self, const(BLRgba)* rgba);
__gshared pblContextSetStrokeStyleRgba blContextSetStrokeStyleRgba;

extern(C) @nogc nothrow alias pblContextSetStrokeStyleRgba32 = BLResult function(BLContextCore* self, uint rgba32);
__gshared pblContextSetStrokeStyleRgba32 blContextSetStrokeStyleRgba32;

extern(C) @nogc nothrow alias pblContextSetStrokeStyleRgba64 = BLResult function(BLContextCore* self, ulong rgba64);
__gshared pblContextSetStrokeStyleRgba64 blContextSetStrokeStyleRgba64;

extern(C) @nogc nothrow alias pblContextGetStrokeWidth = double function(const(BLContextCore)* self);
__gshared pblContextGetStrokeWidth blContextGetStrokeWidth;

extern(C) @nogc nothrow alias pblContextSetStrokeWidth = BLResult function(BLContextCore* self, double width);
__gshared pblContextSetStrokeWidth blContextSetStrokeWidth;

extern(C) @nogc nothrow alias pblContextGetStrokeMiterLimit = double function(const(BLContextCore)* self);
__gshared pblContextGetStrokeMiterLimit blContextGetStrokeMiterLimit;

extern(C) @nogc nothrow alias pblContextSetStrokeMiterLimit = BLResult function(BLContextCore* self, double miterLimit);
__gshared pblContextSetStrokeMiterLimit blContextSetStrokeMiterLimit;

extern(C) @nogc nothrow alias pblContextGetStrokeCap = BLStrokeCap function(const(BLContextCore)* self, BLStrokeCapPosition position);
__gshared pblContextGetStrokeCap blContextGetStrokeCap;

extern(C) @nogc nothrow alias pblContextSetStrokeCap = BLResult function(BLContextCore* self, BLStrokeCapPosition position, BLStrokeCap strokeCap);
__gshared pblContextSetStrokeCap blContextSetStrokeCap;

extern(C) @nogc nothrow alias pblContextSetStrokeCaps = BLResult function(BLContextCore* self, BLStrokeCap strokeCap);
__gshared pblContextSetStrokeCaps blContextSetStrokeCaps;

extern(C) @nogc nothrow alias pblContextGetStrokeJoin = BLStrokeJoin function(const(BLContextCore)* self);
__gshared pblContextGetStrokeJoin blContextGetStrokeJoin;

extern(C) @nogc nothrow alias pblContextSetStrokeJoin = BLResult function(BLContextCore* self, BLStrokeJoin strokeJoin);
__gshared pblContextSetStrokeJoin blContextSetStrokeJoin;

extern(C) @nogc nothrow alias pblContextGetStrokeTransformOrder = BLStrokeTransformOrder function(const(BLContextCore)* self);
__gshared pblContextGetStrokeTransformOrder blContextGetStrokeTransformOrder;

extern(C) @nogc nothrow alias pblContextSetStrokeTransformOrder = BLResult function(BLContextCore* self, BLStrokeTransformOrder transformOrder);
__gshared pblContextSetStrokeTransformOrder blContextSetStrokeTransformOrder;

extern(C) @nogc nothrow alias pblContextGetStrokeDashOffset = double function(const(BLContextCore)* self);
__gshared pblContextGetStrokeDashOffset blContextGetStrokeDashOffset;

extern(C) @nogc nothrow alias pblContextSetStrokeDashOffset = BLResult function(BLContextCore* self, double dashOffset);
__gshared pblContextSetStrokeDashOffset blContextSetStrokeDashOffset;

extern(C) @nogc nothrow alias pblContextGetStrokeDashArray = BLResult function(const(BLContextCore)* self, BLArrayCore* dashArrayOut);
__gshared pblContextGetStrokeDashArray blContextGetStrokeDashArray;

extern(C) @nogc nothrow alias pblContextSetStrokeDashArray = BLResult function(BLContextCore* self, const(BLArrayCore)* dashArray);
__gshared pblContextSetStrokeDashArray blContextSetStrokeDashArray;

extern(C) @nogc nothrow alias pblContextGetStrokeOptions = BLResult function(const(BLContextCore)* self, BLStrokeOptionsCore* options);
__gshared pblContextGetStrokeOptions blContextGetStrokeOptions;

extern(C) @nogc nothrow alias pblContextSetStrokeOptions = BLResult function(BLContextCore* self, const(BLStrokeOptionsCore)* options);
__gshared pblContextSetStrokeOptions blContextSetStrokeOptions;

extern(C) @nogc nothrow alias pblContextClipToRectI = BLResult function(BLContextCore* self, const(BLRectI)* rect);
__gshared pblContextClipToRectI blContextClipToRectI;

extern(C) @nogc nothrow alias pblContextClipToRectD = BLResult function(BLContextCore* self, const(BLRect)* rect);
__gshared pblContextClipToRectD blContextClipToRectD;

extern(C) @nogc nothrow alias pblContextRestoreClipping = BLResult function(BLContextCore* self);
__gshared pblContextRestoreClipping blContextRestoreClipping;

extern(C) @nogc nothrow alias pblContextClearAll = BLResult function(BLContextCore* self);
__gshared pblContextClearAll blContextClearAll;

extern(C) @nogc nothrow alias pblContextClearRectI = BLResult function(BLContextCore* self, const(BLRectI)* rect);
__gshared pblContextClearRectI blContextClearRectI;

extern(C) @nogc nothrow alias pblContextClearRectD = BLResult function(BLContextCore* self, const(BLRect)* rect);
__gshared pblContextClearRectD blContextClearRectD;

extern(C) @nogc nothrow alias pblContextFillAll = BLResult function(BLContextCore* self);
__gshared pblContextFillAll blContextFillAll;

extern(C) @nogc nothrow alias pblContextFillRectI = BLResult function(BLContextCore* self, const(BLRectI)* rect);
__gshared pblContextFillRectI blContextFillRectI;

extern(C) @nogc nothrow alias pblContextFillRectD = BLResult function(BLContextCore* self, const(BLRect)* rect);
__gshared pblContextFillRectD blContextFillRectD;

extern(C) @nogc nothrow alias pblContextFillPathD = BLResult function(BLContextCore* self, const(BLPathCore)* path);
__gshared pblContextFillPathD blContextFillPathD;

extern(C) @nogc nothrow alias pblContextFillGeometry = BLResult function(BLContextCore* self, BLGeometryType geometryType, const(void)* geometryData);
__gshared pblContextFillGeometry blContextFillGeometry;

extern(C) @nogc nothrow alias pblContextFillTextI = BLResult function(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, BLTextEncoding encoding);
__gshared pblContextFillTextI blContextFillTextI;

extern(C) @nogc nothrow alias pblContextFillTextD = BLResult function(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, BLTextEncoding encoding);
__gshared pblContextFillTextD blContextFillTextD;

extern(C) @nogc nothrow alias pblContextFillGlyphRunI = BLResult function(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
__gshared pblContextFillGlyphRunI blContextFillGlyphRunI;

extern(C) @nogc nothrow alias pblContextFillGlyphRunD = BLResult function(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
__gshared pblContextFillGlyphRunD blContextFillGlyphRunD;

extern(C) @nogc nothrow alias pblContextFillMaskI = BLResult function(BLContextCore* self, const(BLPointI)* pt, const(BLImageCore)* mask, const(BLRectI)* maskArea);
__gshared pblContextFillMaskI blContextFillMaskI;

extern(C) @nogc nothrow alias pblContextFillMaskD = BLResult function(BLContextCore* self, const(BLPoint)* pt, const(BLImageCore)* mask, const(BLRectI)* maskArea);
__gshared pblContextFillMaskD blContextFillMaskD;

extern(C) @nogc nothrow alias pblContextStrokeRectI = BLResult function(BLContextCore* self, const(BLRectI)* rect);
__gshared pblContextStrokeRectI blContextStrokeRectI;

extern(C) @nogc nothrow alias pblContextStrokeRectD = BLResult function(BLContextCore* self, const(BLRect)* rect);
__gshared pblContextStrokeRectD blContextStrokeRectD;

extern(C) @nogc nothrow alias pblContextStrokePathD = BLResult function(BLContextCore* self, const(BLPathCore)* path);
__gshared pblContextStrokePathD blContextStrokePathD;

extern(C) @nogc nothrow alias pblContextStrokeGeometry = BLResult function(BLContextCore* self, BLGeometryType geometryType, const(void)* geometryData);
__gshared pblContextStrokeGeometry blContextStrokeGeometry;

extern(C) @nogc nothrow alias pblContextStrokeTextI = BLResult function(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(void)* text, size_t size, BLTextEncoding encoding);
__gshared pblContextStrokeTextI blContextStrokeTextI;

extern(C) @nogc nothrow alias pblContextStrokeTextD = BLResult function(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(void)* text, size_t size, BLTextEncoding encoding);
__gshared pblContextStrokeTextD blContextStrokeTextD;

extern(C) @nogc nothrow alias pblContextStrokeGlyphRunI = BLResult function(BLContextCore* self, const(BLPointI)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
__gshared pblContextStrokeGlyphRunI blContextStrokeGlyphRunI;

extern(C) @nogc nothrow alias pblContextStrokeGlyphRunD = BLResult function(BLContextCore* self, const(BLPoint)* pt, const(BLFontCore)* font, const(BLGlyphRun)* glyphRun);
__gshared pblContextStrokeGlyphRunD blContextStrokeGlyphRunD;

extern(C) @nogc nothrow alias pblContextBlitImageI = BLResult function(BLContextCore* self, const(BLPointI)* pt, const(BLImageCore)* img, const(BLRectI)* imgArea);
__gshared pblContextBlitImageI blContextBlitImageI;

extern(C) @nogc nothrow alias pblContextBlitImageD = BLResult function(BLContextCore* self, const(BLPoint)* pt, const(BLImageCore)* img, const(BLRectI)* imgArea);
__gshared pblContextBlitImageD blContextBlitImageD;

extern(C) @nogc nothrow alias pblContextBlitScaledImageI = BLResult function(BLContextCore* self, const(BLRectI)* rect, const(BLImageCore)* img, const(BLRectI)* imgArea);
__gshared pblContextBlitScaledImageI blContextBlitScaledImageI;

extern(C) @nogc nothrow alias pblContextBlitScaledImageD = BLResult function(BLContextCore* self, const(BLRect)* rect, const(BLImageCore)* img, const(BLRectI)* imgArea);
__gshared pblContextBlitScaledImageD blContextBlitScaledImageD;

extern(C) @nogc nothrow alias pblFontManagerInit = BLResult function(BLFontManagerCore* self);
__gshared pblFontManagerInit blFontManagerInit;

extern(C) @nogc nothrow alias pblFontManagerInitMove = BLResult function(BLFontManagerCore* self, BLFontManagerCore* other);
__gshared pblFontManagerInitMove blFontManagerInitMove;

extern(C) @nogc nothrow alias pblFontManagerInitWeak = BLResult function(BLFontManagerCore* self, const(BLFontManagerCore)* other);
__gshared pblFontManagerInitWeak blFontManagerInitWeak;

extern(C) @nogc nothrow alias pblFontManagerInitNew = BLResult function(BLFontManagerCore* self);
__gshared pblFontManagerInitNew blFontManagerInitNew;

extern(C) @nogc nothrow alias pblFontManagerDestroy = BLResult function(BLFontManagerCore* self);
__gshared pblFontManagerDestroy blFontManagerDestroy;

extern(C) @nogc nothrow alias pblFontManagerReset = BLResult function(BLFontManagerCore* self);
__gshared pblFontManagerReset blFontManagerReset;

extern(C) @nogc nothrow alias pblFontManagerAssignMove = BLResult function(BLFontManagerCore* self, BLFontManagerCore* other);
__gshared pblFontManagerAssignMove blFontManagerAssignMove;

extern(C) @nogc nothrow alias pblFontManagerAssignWeak = BLResult function(BLFontManagerCore* self, const(BLFontManagerCore)* other);
__gshared pblFontManagerAssignWeak blFontManagerAssignWeak;

extern(C) @nogc nothrow alias pblFontManagerCreate = BLResult function(BLFontManagerCore* self);
__gshared pblFontManagerCreate blFontManagerCreate;

extern(C) @nogc nothrow alias pblFontManagerGetFaceCount = size_t function(const(BLFontManagerCore)* self);
__gshared pblFontManagerGetFaceCount blFontManagerGetFaceCount;

extern(C) @nogc nothrow alias pblFontManagerGetFamilyCount = size_t function(const(BLFontManagerCore)* self);
__gshared pblFontManagerGetFamilyCount blFontManagerGetFamilyCount;

extern(C) @nogc nothrow alias pblFontManagerHasFace = bool function(const(BLFontManagerCore)* self, const(BLFontFaceCore)* face);
__gshared pblFontManagerHasFace blFontManagerHasFace;

extern(C) @nogc nothrow alias pblFontManagerAddFace = BLResult function(BLFontManagerCore* self, const(BLFontFaceCore)* face);
__gshared pblFontManagerAddFace blFontManagerAddFace;

extern(C) @nogc nothrow alias pblFontManagerQueryFace = BLResult function(const(BLFontManagerCore)* self, const(char)* name, size_t nameSize, const(BLFontQueryProperties)* properties, BLFontFaceCore* out_);
__gshared pblFontManagerQueryFace blFontManagerQueryFace;

extern(C) @nogc nothrow alias pblFontManagerQueryFacesByFamilyName = BLResult function(const(BLFontManagerCore)* self, const(char)* name, size_t nameSize, BLArrayCore* out_);
__gshared pblFontManagerQueryFacesByFamilyName blFontManagerQueryFacesByFamilyName;

extern(C) @nogc nothrow alias pblFontManagerEquals = bool function(const(BLFontManagerCore)* a, const(BLFontManagerCore)* b);
__gshared pblFontManagerEquals blFontManagerEquals;

extern(C) @nogc nothrow alias pblGradientInit = BLResult function(BLGradientCore* self);
__gshared pblGradientInit blGradientInit;

extern(C) @nogc nothrow alias pblGradientInitMove = BLResult function(BLGradientCore* self, BLGradientCore* other);
__gshared pblGradientInitMove blGradientInitMove;

extern(C) @nogc nothrow alias pblGradientInitWeak = BLResult function(BLGradientCore* self, const(BLGradientCore)* other);
__gshared pblGradientInitWeak blGradientInitWeak;

extern(C) @nogc nothrow alias pblGradientInitAs = BLResult function(BLGradientCore* self, BLGradientType type, const(void)* values, BLExtendMode extendMode, const(BLGradientStop)* stops, size_t n, const(BLMatrix2D)* m);
__gshared pblGradientInitAs blGradientInitAs;

extern(C) @nogc nothrow alias pblGradientDestroy = BLResult function(BLGradientCore* self);
__gshared pblGradientDestroy blGradientDestroy;

extern(C) @nogc nothrow alias pblGradientReset = BLResult function(BLGradientCore* self);
__gshared pblGradientReset blGradientReset;

extern(C) @nogc nothrow alias pblGradientAssignMove = BLResult function(BLGradientCore* self, BLGradientCore* other);
__gshared pblGradientAssignMove blGradientAssignMove;

extern(C) @nogc nothrow alias pblGradientAssignWeak = BLResult function(BLGradientCore* self, const(BLGradientCore)* other);
__gshared pblGradientAssignWeak blGradientAssignWeak;

extern(C) @nogc nothrow alias pblGradientCreate = BLResult function(BLGradientCore* self, BLGradientType type, const(void)* values, BLExtendMode extendMode, const(BLGradientStop)* stops, size_t n, const(BLMatrix2D)* m);
__gshared pblGradientCreate blGradientCreate;

extern(C) @nogc nothrow alias pblGradientShrink = BLResult function(BLGradientCore* self);
__gshared pblGradientShrink blGradientShrink;

extern(C) @nogc nothrow alias pblGradientReserve = BLResult function(BLGradientCore* self, size_t n);
__gshared pblGradientReserve blGradientReserve;

extern(C) @nogc nothrow alias pblGradientGetType = BLGradientType function(const(BLGradientCore)* self);
__gshared pblGradientGetType blGradientGetType;

extern(C) @nogc nothrow alias pblGradientSetType = BLResult function(BLGradientCore* self, BLGradientType type);
__gshared pblGradientSetType blGradientSetType;

extern(C) @nogc nothrow alias pblGradientGetExtendMode = BLExtendMode function(const(BLGradientCore)* self);
__gshared pblGradientGetExtendMode blGradientGetExtendMode;

extern(C) @nogc nothrow alias pblGradientSetExtendMode = BLResult function(BLGradientCore* self, BLExtendMode extendMode);
__gshared pblGradientSetExtendMode blGradientSetExtendMode;

extern(C) @nogc nothrow alias pblGradientGetValue = double function(const(BLGradientCore)* self, size_t index);
__gshared pblGradientGetValue blGradientGetValue;

extern(C) @nogc nothrow alias pblGradientSetValue = BLResult function(BLGradientCore* self, size_t index, double value);
__gshared pblGradientSetValue blGradientSetValue;

extern(C) @nogc nothrow alias pblGradientSetValues = BLResult function(BLGradientCore* self, size_t index, const(double)* values, size_t n);
__gshared pblGradientSetValues blGradientSetValues;

extern(C) @nogc nothrow alias pblGradientGetSize = size_t function(const(BLGradientCore)* self);
__gshared pblGradientGetSize blGradientGetSize;

extern(C) @nogc nothrow alias pblGradientGetCapacity = size_t function(const(BLGradientCore)* self);
__gshared pblGradientGetCapacity blGradientGetCapacity;

extern(C) @nogc nothrow alias pblGradientGetStops = const(BLGradientStop)* function(const(BLGradientCore)* self);
__gshared pblGradientGetStops blGradientGetStops;

extern(C) @nogc nothrow alias pblGradientResetStops = BLResult function(BLGradientCore* self);
__gshared pblGradientResetStops blGradientResetStops;

extern(C) @nogc nothrow alias pblGradientAssignStops = BLResult function(BLGradientCore* self, const(BLGradientStop)* stops, size_t n);
__gshared pblGradientAssignStops blGradientAssignStops;

extern(C) @nogc nothrow alias pblGradientAddStopRgba32 = BLResult function(BLGradientCore* self, double offset, uint argb32);
__gshared pblGradientAddStopRgba32 blGradientAddStopRgba32;

extern(C) @nogc nothrow alias pblGradientAddStopRgba64 = BLResult function(BLGradientCore* self, double offset, ulong argb64);
__gshared pblGradientAddStopRgba64 blGradientAddStopRgba64;

extern(C) @nogc nothrow alias pblGradientRemoveStop = BLResult function(BLGradientCore* self, size_t index);
__gshared pblGradientRemoveStop blGradientRemoveStop;

extern(C) @nogc nothrow alias pblGradientRemoveStopByOffset = BLResult function(BLGradientCore* self, double offset, uint all);
__gshared pblGradientRemoveStopByOffset blGradientRemoveStopByOffset;

extern(C) @nogc nothrow alias pblGradientRemoveStopsByIndex = BLResult function(BLGradientCore* self, size_t rStart, size_t rEnd);
__gshared pblGradientRemoveStopsByIndex blGradientRemoveStopsByIndex;

extern(C) @nogc nothrow alias pblGradientRemoveStopsByOffset = BLResult function(BLGradientCore* self, double offsetMin, double offsetMax);
__gshared pblGradientRemoveStopsByOffset blGradientRemoveStopsByOffset;

extern(C) @nogc nothrow alias pblGradientReplaceStopRgba32 = BLResult function(BLGradientCore* self, size_t index, double offset, uint rgba32);
__gshared pblGradientReplaceStopRgba32 blGradientReplaceStopRgba32;

extern(C) @nogc nothrow alias pblGradientReplaceStopRgba64 = BLResult function(BLGradientCore* self, size_t index, double offset, ulong rgba64);
__gshared pblGradientReplaceStopRgba64 blGradientReplaceStopRgba64;

extern(C) @nogc nothrow alias pblGradientIndexOfStop = size_t function(const(BLGradientCore)* self, double offset);
__gshared pblGradientIndexOfStop blGradientIndexOfStop;

extern(C) @nogc nothrow alias pblGradientApplyMatrixOp = BLResult function(BLGradientCore* self, BLMatrix2DOp opType, const(void)* opData);
__gshared pblGradientApplyMatrixOp blGradientApplyMatrixOp;

extern(C) @nogc nothrow alias pblGradientEquals = bool function(const(BLGradientCore)* a, const(BLGradientCore)* b);
__gshared pblGradientEquals blGradientEquals;

extern(C) @nogc nothrow alias pblImageDecoderInit = BLResult function(BLImageDecoderCore* self);
__gshared pblImageDecoderInit blImageDecoderInit;

extern(C) @nogc nothrow alias pblImageDecoderInitMove = BLResult function(BLImageDecoderCore* self, BLImageDecoderCore* other);
__gshared pblImageDecoderInitMove blImageDecoderInitMove;

extern(C) @nogc nothrow alias pblImageDecoderInitWeak = BLResult function(BLImageDecoderCore* self, const(BLImageDecoderCore)* other);
__gshared pblImageDecoderInitWeak blImageDecoderInitWeak;

extern(C) @nogc nothrow alias pblImageDecoderDestroy = BLResult function(BLImageDecoderCore* self);
__gshared pblImageDecoderDestroy blImageDecoderDestroy;

extern(C) @nogc nothrow alias pblImageDecoderReset = BLResult function(BLImageDecoderCore* self);
__gshared pblImageDecoderReset blImageDecoderReset;

extern(C) @nogc nothrow alias pblImageDecoderAssignMove = BLResult function(BLImageDecoderCore* self, BLImageDecoderCore* other);
__gshared pblImageDecoderAssignMove blImageDecoderAssignMove;

extern(C) @nogc nothrow alias pblImageDecoderAssignWeak = BLResult function(BLImageDecoderCore* self, const(BLImageDecoderCore)* other);
__gshared pblImageDecoderAssignWeak blImageDecoderAssignWeak;

extern(C) @nogc nothrow alias pblImageDecoderRestart = BLResult function(BLImageDecoderCore* self);
__gshared pblImageDecoderRestart blImageDecoderRestart;

extern(C) @nogc nothrow alias pblImageDecoderReadInfo = BLResult function(BLImageDecoderCore* self, BLImageInfo* infoOut, const(ubyte)* data, size_t size);
__gshared pblImageDecoderReadInfo blImageDecoderReadInfo;

extern(C) @nogc nothrow alias pblImageDecoderReadFrame = BLResult function(BLImageDecoderCore* self, BLImageCore* imageOut, const(ubyte)* data, size_t size);
__gshared pblImageDecoderReadFrame blImageDecoderReadFrame;

extern(C) @nogc nothrow alias pblImageEncoderInit = BLResult function(BLImageEncoderCore* self);
__gshared pblImageEncoderInit blImageEncoderInit;

extern(C) @nogc nothrow alias pblImageEncoderInitMove = BLResult function(BLImageEncoderCore* self, BLImageEncoderCore* other);
__gshared pblImageEncoderInitMove blImageEncoderInitMove;

extern(C) @nogc nothrow alias pblImageEncoderInitWeak = BLResult function(BLImageEncoderCore* self, const(BLImageEncoderCore)* other);
__gshared pblImageEncoderInitWeak blImageEncoderInitWeak;

extern(C) @nogc nothrow alias pblImageEncoderDestroy = BLResult function(BLImageEncoderCore* self);
__gshared pblImageEncoderDestroy blImageEncoderDestroy;

extern(C) @nogc nothrow alias pblImageEncoderReset = BLResult function(BLImageEncoderCore* self);
__gshared pblImageEncoderReset blImageEncoderReset;

extern(C) @nogc nothrow alias pblImageEncoderAssignMove = BLResult function(BLImageEncoderCore* self, BLImageEncoderCore* other);
__gshared pblImageEncoderAssignMove blImageEncoderAssignMove;

extern(C) @nogc nothrow alias pblImageEncoderAssignWeak = BLResult function(BLImageEncoderCore* self, const(BLImageEncoderCore)* other);
__gshared pblImageEncoderAssignWeak blImageEncoderAssignWeak;

extern(C) @nogc nothrow alias pblImageEncoderRestart = BLResult function(BLImageEncoderCore* self);
__gshared pblImageEncoderRestart blImageEncoderRestart;

extern(C) @nogc nothrow alias pblImageEncoderWriteFrame = BLResult function(BLImageEncoderCore* self, BLArrayCore* dst, const(BLImageCore)* image);
__gshared pblImageEncoderWriteFrame blImageEncoderWriteFrame;

extern(C) @nogc nothrow alias pblPatternInit = BLResult function(BLPatternCore* self);
__gshared pblPatternInit blPatternInit;

extern(C) @nogc nothrow alias pblPatternInitMove = BLResult function(BLPatternCore* self, BLPatternCore* other);
__gshared pblPatternInitMove blPatternInitMove;

extern(C) @nogc nothrow alias pblPatternInitWeak = BLResult function(BLPatternCore* self, const(BLPatternCore)* other);
__gshared pblPatternInitWeak blPatternInitWeak;

extern(C) @nogc nothrow alias pblPatternInitAs = BLResult function(BLPatternCore* self, const(BLImageCore)* image, const(BLRectI)* area, BLExtendMode extendMode, const(BLMatrix2D)* m);
__gshared pblPatternInitAs blPatternInitAs;

extern(C) @nogc nothrow alias pblPatternDestroy = BLResult function(BLPatternCore* self);
__gshared pblPatternDestroy blPatternDestroy;

extern(C) @nogc nothrow alias pblPatternReset = BLResult function(BLPatternCore* self);
__gshared pblPatternReset blPatternReset;

extern(C) @nogc nothrow alias pblPatternAssignMove = BLResult function(BLPatternCore* self, BLPatternCore* other);
__gshared pblPatternAssignMove blPatternAssignMove;

extern(C) @nogc nothrow alias pblPatternAssignWeak = BLResult function(BLPatternCore* self, const(BLPatternCore)* other);
__gshared pblPatternAssignWeak blPatternAssignWeak;

extern(C) @nogc nothrow alias pblPatternAssignDeep = BLResult function(BLPatternCore* self, const(BLPatternCore)* other);
__gshared pblPatternAssignDeep blPatternAssignDeep;

extern(C) @nogc nothrow alias pblPatternCreate = BLResult function(BLPatternCore* self, const(BLImageCore)* image, const(BLRectI)* area, BLExtendMode extendMode, const(BLMatrix2D)* m);
__gshared pblPatternCreate blPatternCreate;

extern(C) @nogc nothrow alias pblPatternGetImage = BLResult function(const(BLPatternCore)* self, BLImageCore* image);
__gshared pblPatternGetImage blPatternGetImage;

extern(C) @nogc nothrow alias pblPatternSetImage = BLResult function(BLPatternCore* self, const(BLImageCore)* image, const(BLRectI)* area);
__gshared pblPatternSetImage blPatternSetImage;

extern(C) @nogc nothrow alias pblPatternResetImage = BLResult function(BLPatternCore* self);
__gshared pblPatternResetImage blPatternResetImage;

extern(C) @nogc nothrow alias pblPatternGetArea = BLResult function(const(BLPatternCore)* self, BLRectI* areaOut);
__gshared pblPatternGetArea blPatternGetArea;

extern(C) @nogc nothrow alias pblPatternSetArea = BLResult function(BLPatternCore* self, const(BLRectI)* area);
__gshared pblPatternSetArea blPatternSetArea;

extern(C) @nogc nothrow alias pblPatternGetExtendMode = BLExtendMode function(const(BLPatternCore)* self);
__gshared pblPatternGetExtendMode blPatternGetExtendMode;

extern(C) @nogc nothrow alias pblPatternSetExtendMode = BLResult function(BLPatternCore* self, BLExtendMode extendMode);
__gshared pblPatternSetExtendMode blPatternSetExtendMode;

extern(C) @nogc nothrow alias pblPatternGetMatrixType = BLMatrix2DType function(const(BLPatternCore)* self);
__gshared pblPatternGetMatrixType blPatternGetMatrixType;

extern(C) @nogc nothrow alias pblPatternGetMatrix = BLResult function(const(BLPatternCore)* self, BLMatrix2D* matrixOut);
__gshared pblPatternGetMatrix blPatternGetMatrix;

extern(C) @nogc nothrow alias pblPatternApplyMatrixOp = BLResult function(BLPatternCore* self, BLMatrix2DOp opType, const(void)* opData);
__gshared pblPatternApplyMatrixOp blPatternApplyMatrixOp;

extern(C) @nogc nothrow alias pblPatternEquals = bool function(const(BLPatternCore)* a, const(BLPatternCore)* b);
__gshared pblPatternEquals blPatternEquals;

extern(C) @nogc nothrow alias pblPixelConverterInit = BLResult function(BLPixelConverterCore* self);
__gshared pblPixelConverterInit blPixelConverterInit;

extern(C) @nogc nothrow alias pblPixelConverterInitWeak = BLResult function(BLPixelConverterCore* self, const(BLPixelConverterCore)* other);
__gshared pblPixelConverterInitWeak blPixelConverterInitWeak;

extern(C) @nogc nothrow alias pblPixelConverterDestroy = BLResult function(BLPixelConverterCore* self);
__gshared pblPixelConverterDestroy blPixelConverterDestroy;

extern(C) @nogc nothrow alias pblPixelConverterReset = BLResult function(BLPixelConverterCore* self);
__gshared pblPixelConverterReset blPixelConverterReset;

extern(C) @nogc nothrow alias pblPixelConverterAssign = BLResult function(BLPixelConverterCore* self, const(BLPixelConverterCore)* other);
__gshared pblPixelConverterAssign blPixelConverterAssign;

extern(C) @nogc nothrow alias pblPixelConverterCreate = BLResult function(BLPixelConverterCore* self, const(BLFormatInfo)* dstInfo, const(BLFormatInfo)* srcInfo, BLPixelConverterCreateFlags createFlags);
__gshared pblPixelConverterCreate blPixelConverterCreate;

extern(C) @nogc nothrow alias pblRandomReset = BLResult function(BLRandom* self, ulong seed);
__gshared pblRandomReset blRandomReset;

extern(C) @nogc nothrow alias pblRandomNextUInt32 = uint function(BLRandom* self);
__gshared pblRandomNextUInt32 blRandomNextUInt32;

extern(C) @nogc nothrow alias pblRandomNextUInt64 = ulong function(BLRandom* self);
__gshared pblRandomNextUInt64 blRandomNextUInt64;

extern(C) @nogc nothrow alias pblRandomNextDouble = double function(BLRandom* self);
__gshared pblRandomNextDouble blRandomNextDouble;

extern(C) @nogc nothrow alias pblRuntimeInit = BLResult function();
__gshared pblRuntimeInit blRuntimeInit;

extern(C) @nogc nothrow alias pblRuntimeShutdown = BLResult function();
__gshared pblRuntimeShutdown blRuntimeShutdown;

extern(C) @nogc nothrow alias pblRuntimeCleanup = BLResult function(BLRuntimeCleanupFlags cleanupFlags);
__gshared pblRuntimeCleanup blRuntimeCleanup;

extern(C) @nogc nothrow alias pblRuntimeQueryInfo = BLResult function(BLRuntimeInfoType infoType, void* infoOut);
__gshared pblRuntimeQueryInfo blRuntimeQueryInfo;

extern(C) @nogc nothrow alias pblRuntimeMessageOut = BLResult function(const(char)* msg);
__gshared pblRuntimeMessageOut blRuntimeMessageOut;

extern(C) @nogc nothrow alias pblRuntimeMessageFmt = BLResult function(const(char)* fmt, ...);
__gshared pblRuntimeMessageFmt blRuntimeMessageFmt;

extern(C) @nogc nothrow alias pblRuntimeMessageVFmt = BLResult function(const(char)* fmt, va_list ap);
__gshared pblRuntimeMessageVFmt blRuntimeMessageVFmt;

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

    lib.bindSymbol_stdcall(blPixelConverterConvert, "blPixelConverterConvert");

    version(Windows) lib.bindSymbol_stdcall(blResultFromWinError, "blResultFromWinError");
    version(Posix) lib.bindSymbol_stdcall(blResultFromPosixError, "blResultFromPosixError");


    lib.bindSymbol_stdcall(blRuntimeAssertionFailure, "blRuntimeAssertionFailure");
    lib.bindSymbol_stdcall(blObjectDetailAllocImpl, "blObjectDetailAllocImpl");
    lib.bindSymbol_stdcall(blObjectDetailAllocImplExternal, "blObjectDetailAllocImplExternal");
    lib.bindSymbol_stdcall(blObjectDetailFreeImpl, "blObjectDetailFreeImpl");
    lib.bindSymbol_stdcall(blObjectInitMove, "blObjectInitMove");
    lib.bindSymbol_stdcall(blObjectInitWeak, "blObjectInitWeak");
    lib.bindSymbol_stdcall(blObjectReset, "blObjectReset");
    lib.bindSymbol_stdcall(blObjectAssignMove, "blObjectAssignMove");
    lib.bindSymbol_stdcall(blObjectAssignWeak, "blObjectAssignWeak");
    lib.bindSymbol_stdcall(blObjectGetProperty, "blObjectGetProperty");
    lib.bindSymbol_stdcall(blObjectGetPropertyBool, "blObjectGetPropertyBool");
    lib.bindSymbol_stdcall(blObjectGetPropertyInt32, "blObjectGetPropertyInt32");
    lib.bindSymbol_stdcall(blObjectGetPropertyInt64, "blObjectGetPropertyInt64");
    lib.bindSymbol_stdcall(blObjectGetPropertyUInt32, "blObjectGetPropertyUInt32");
    lib.bindSymbol_stdcall(blObjectGetPropertyUInt64, "blObjectGetPropertyUInt64");
    lib.bindSymbol_stdcall(blObjectGetPropertyDouble, "blObjectGetPropertyDouble");
    lib.bindSymbol_stdcall(blObjectSetProperty, "blObjectSetProperty");
    lib.bindSymbol_stdcall(blObjectSetPropertyBool, "blObjectSetPropertyBool");
    lib.bindSymbol_stdcall(blObjectSetPropertyInt32, "blObjectSetPropertyInt32");
    lib.bindSymbol_stdcall(blObjectSetPropertyInt64, "blObjectSetPropertyInt64");
    lib.bindSymbol_stdcall(blObjectSetPropertyUInt32, "blObjectSetPropertyUInt32");
    lib.bindSymbol_stdcall(blObjectSetPropertyUInt64, "blObjectSetPropertyUInt64");
    lib.bindSymbol_stdcall(blObjectSetPropertyDouble, "blObjectSetPropertyDouble");
    lib.bindSymbol_stdcall(blArrayInit, "blArrayInit");
    lib.bindSymbol_stdcall(blArrayInitMove, "blArrayInitMove");
    lib.bindSymbol_stdcall(blArrayInitWeak, "blArrayInitWeak");
    lib.bindSymbol_stdcall(blArrayDestroy, "blArrayDestroy");
    lib.bindSymbol_stdcall(blArrayReset, "blArrayReset");
    lib.bindSymbol_stdcall(blArrayGetSize, "blArrayGetSize");
    lib.bindSymbol_stdcall(blArrayGetCapacity, "blArrayGetCapacity");
    lib.bindSymbol_stdcall(blArrayGetItemSize, "blArrayGetItemSize");
    lib.bindSymbol_stdcall(blArrayGetData, "blArrayGetData");
    lib.bindSymbol_stdcall(blArrayClear, "blArrayClear");
    lib.bindSymbol_stdcall(blArrayShrink, "blArrayShrink");
    lib.bindSymbol_stdcall(blArrayReserve, "blArrayReserve");
    lib.bindSymbol_stdcall(blArrayResize, "blArrayResize");
    lib.bindSymbol_stdcall(blArrayMakeMutable, "blArrayMakeMutable");
    lib.bindSymbol_stdcall(blArrayModifyOp, "blArrayModifyOp");
    lib.bindSymbol_stdcall(blArrayInsertOp, "blArrayInsertOp");
    lib.bindSymbol_stdcall(blArrayAssignMove, "blArrayAssignMove");
    lib.bindSymbol_stdcall(blArrayAssignWeak, "blArrayAssignWeak");
    lib.bindSymbol_stdcall(blArrayAssignDeep, "blArrayAssignDeep");
    lib.bindSymbol_stdcall(blArrayAssignData, "blArrayAssignData");
    lib.bindSymbol_stdcall(blArrayAssignExternalData, "blArrayAssignExternalData");
    lib.bindSymbol_stdcall(blArrayAppendU8, "blArrayAppendU8");
    lib.bindSymbol_stdcall(blArrayAppendU16, "blArrayAppendU16");
    lib.bindSymbol_stdcall(blArrayAppendU32, "blArrayAppendU32");
    lib.bindSymbol_stdcall(blArrayAppendU64, "blArrayAppendU64");
    lib.bindSymbol_stdcall(blArrayAppendF32, "blArrayAppendF32");
    lib.bindSymbol_stdcall(blArrayAppendF64, "blArrayAppendF64");
    lib.bindSymbol_stdcall(blArrayAppendItem, "blArrayAppendItem");
    lib.bindSymbol_stdcall(blArrayAppendData, "blArrayAppendData");
    lib.bindSymbol_stdcall(blArrayInsertU8, "blArrayInsertU8");
    lib.bindSymbol_stdcall(blArrayInsertU16, "blArrayInsertU16");
    lib.bindSymbol_stdcall(blArrayInsertU32, "blArrayInsertU32");
    lib.bindSymbol_stdcall(blArrayInsertU64, "blArrayInsertU64");
    lib.bindSymbol_stdcall(blArrayInsertF32, "blArrayInsertF32");
    lib.bindSymbol_stdcall(blArrayInsertF64, "blArrayInsertF64");
    lib.bindSymbol_stdcall(blArrayInsertItem, "blArrayInsertItem");
    lib.bindSymbol_stdcall(blArrayInsertData, "blArrayInsertData");
    lib.bindSymbol_stdcall(blArrayReplaceU8, "blArrayReplaceU8");
    lib.bindSymbol_stdcall(blArrayReplaceU16, "blArrayReplaceU16");
    lib.bindSymbol_stdcall(blArrayReplaceU32, "blArrayReplaceU32");
    lib.bindSymbol_stdcall(blArrayReplaceU64, "blArrayReplaceU64");
    lib.bindSymbol_stdcall(blArrayReplaceF32, "blArrayReplaceF32");
    lib.bindSymbol_stdcall(blArrayReplaceF64, "blArrayReplaceF64");
    lib.bindSymbol_stdcall(blArrayReplaceItem, "blArrayReplaceItem");
    lib.bindSymbol_stdcall(blArrayReplaceData, "blArrayReplaceData");
    lib.bindSymbol_stdcall(blArrayRemoveIndex, "blArrayRemoveIndex");
    lib.bindSymbol_stdcall(blArrayRemoveRange, "blArrayRemoveRange");
    lib.bindSymbol_stdcall(blArrayEquals, "blArrayEquals");
    lib.bindSymbol_stdcall(blBitSetInit, "blBitSetInit");
    lib.bindSymbol_stdcall(blBitSetInitMove, "blBitSetInitMove");
    lib.bindSymbol_stdcall(blBitSetInitWeak, "blBitSetInitWeak");
    lib.bindSymbol_stdcall(blBitSetInitRange, "blBitSetInitRange");
    lib.bindSymbol_stdcall(blBitSetDestroy, "blBitSetDestroy");
    lib.bindSymbol_stdcall(blBitSetReset, "blBitSetReset");
    lib.bindSymbol_stdcall(blBitSetAssignMove, "blBitSetAssignMove");
    lib.bindSymbol_stdcall(blBitSetAssignWeak, "blBitSetAssignWeak");
    lib.bindSymbol_stdcall(blBitSetAssignDeep, "blBitSetAssignDeep");
    lib.bindSymbol_stdcall(blBitSetAssignRange, "blBitSetAssignRange");
    lib.bindSymbol_stdcall(blBitSetAssignWords, "blBitSetAssignWords");
    lib.bindSymbol_stdcall(blBitSetIsEmpty, "blBitSetIsEmpty");
    lib.bindSymbol_stdcall(blBitSetGetData, "blBitSetGetData");
    lib.bindSymbol_stdcall(blBitSetGetSegmentCount, "blBitSetGetSegmentCount");
    lib.bindSymbol_stdcall(blBitSetGetSegmentCapacity, "blBitSetGetSegmentCapacity");
    lib.bindSymbol_stdcall(blBitSetGetCardinality, "blBitSetGetCardinality");
    lib.bindSymbol_stdcall(blBitSetGetCardinalityInRange, "blBitSetGetCardinalityInRange");
    lib.bindSymbol_stdcall(blBitSetHasBit, "blBitSetHasBit");
    lib.bindSymbol_stdcall(blBitSetHasBitsInRange, "blBitSetHasBitsInRange");
    lib.bindSymbol_stdcall(blBitSetSubsumes, "blBitSetSubsumes");
    lib.bindSymbol_stdcall(blBitSetIntersects, "blBitSetIntersects");
    lib.bindSymbol_stdcall(blBitSetGetRange, "blBitSetGetRange");
    lib.bindSymbol_stdcall(blBitSetEquals, "blBitSetEquals");
    lib.bindSymbol_stdcall(blBitSetCompare, "blBitSetCompare");
    lib.bindSymbol_stdcall(blBitSetClear, "blBitSetClear");
    lib.bindSymbol_stdcall(blBitSetShrink, "blBitSetShrink");
    lib.bindSymbol_stdcall(blBitSetOptimize, "blBitSetOptimize");
    lib.bindSymbol_stdcall(blBitSetChop, "blBitSetChop");
    lib.bindSymbol_stdcall(blBitSetAddBit, "blBitSetAddBit");
    lib.bindSymbol_stdcall(blBitSetAddRange, "blBitSetAddRange");
    lib.bindSymbol_stdcall(blBitSetAddWords, "blBitSetAddWords");
    lib.bindSymbol_stdcall(blBitSetClearBit, "blBitSetClearBit");
    lib.bindSymbol_stdcall(blBitSetClearRange, "blBitSetClearRange");
    lib.bindSymbol_stdcall(blBitSetBuilderCommit, "blBitSetBuilderCommit");
    lib.bindSymbol_stdcall(blBitSetBuilderAddRange, "blBitSetBuilderAddRange");
    lib.bindSymbol_stdcall(blFileInit, "blFileInit");
    lib.bindSymbol_stdcall(blFileReset, "blFileReset");
    lib.bindSymbol_stdcall(blFileOpen, "blFileOpen");
    lib.bindSymbol_stdcall(blFileClose, "blFileClose");
    lib.bindSymbol_stdcall(blFileSeek, "blFileSeek");
    lib.bindSymbol_stdcall(blFileRead, "blFileRead");
    lib.bindSymbol_stdcall(blFileWrite, "blFileWrite");
    lib.bindSymbol_stdcall(blFileTruncate, "blFileTruncate");
    lib.bindSymbol_stdcall(blFileGetSize, "blFileGetSize");
    lib.bindSymbol_stdcall(blFileSystemReadFile, "blFileSystemReadFile");
    lib.bindSymbol_stdcall(blFileSystemWriteFile, "blFileSystemWriteFile");
    lib.bindSymbol_stdcall(blStringInit, "blStringInit");
    lib.bindSymbol_stdcall(blStringInitMove, "blStringInitMove");
    lib.bindSymbol_stdcall(blStringInitWeak, "blStringInitWeak");
    lib.bindSymbol_stdcall(blStringInitWithData, "blStringInitWithData");
    lib.bindSymbol_stdcall(blStringDestroy, "blStringDestroy");
    lib.bindSymbol_stdcall(blStringReset, "blStringReset");
    lib.bindSymbol_stdcall(blStringGetData, "blStringGetData");
    lib.bindSymbol_stdcall(blStringGetSize, "blStringGetSize");
    lib.bindSymbol_stdcall(blStringGetCapacity, "blStringGetCapacity");
    lib.bindSymbol_stdcall(blStringClear, "blStringClear");
    lib.bindSymbol_stdcall(blStringShrink, "blStringShrink");
    lib.bindSymbol_stdcall(blStringReserve, "blStringReserve");
    lib.bindSymbol_stdcall(blStringResize, "blStringResize");
    lib.bindSymbol_stdcall(blStringMakeMutable, "blStringMakeMutable");
    lib.bindSymbol_stdcall(blStringModifyOp, "blStringModifyOp");
    lib.bindSymbol_stdcall(blStringInsertOp, "blStringInsertOp");
    lib.bindSymbol_stdcall(blStringAssignMove, "blStringAssignMove");
    lib.bindSymbol_stdcall(blStringAssignWeak, "blStringAssignWeak");
    lib.bindSymbol_stdcall(blStringAssignDeep, "blStringAssignDeep");
    lib.bindSymbol_stdcall(blStringAssignData, "blStringAssignData");
    lib.bindSymbol_stdcall(blStringApplyOpChar, "blStringApplyOpChar");
    lib.bindSymbol_stdcall(blStringApplyOpData, "blStringApplyOpData");
    lib.bindSymbol_stdcall(blStringApplyOpString, "blStringApplyOpString");
    lib.bindSymbol_stdcall(blStringApplyOpFormat, "blStringApplyOpFormat");
    lib.bindSymbol_stdcall(blStringApplyOpFormatV, "blStringApplyOpFormatV");
    lib.bindSymbol_stdcall(blStringInsertChar, "blStringInsertChar");
    lib.bindSymbol_stdcall(blStringInsertData, "blStringInsertData");
    lib.bindSymbol_stdcall(blStringInsertString, "blStringInsertString");
    lib.bindSymbol_stdcall(blStringRemoveIndex, "blStringRemoveIndex");
    lib.bindSymbol_stdcall(blStringRemoveRange, "blStringRemoveRange");
    lib.bindSymbol_stdcall(blStringEquals, "blStringEquals");
    lib.bindSymbol_stdcall(blStringEqualsData, "blStringEqualsData");
    lib.bindSymbol_stdcall(blStringCompare, "blStringCompare");
    lib.bindSymbol_stdcall(blStringCompareData, "blStringCompareData");
    lib.bindSymbol_stdcall(blFontDataInit, "blFontDataInit");
    lib.bindSymbol_stdcall(blFontDataInitMove, "blFontDataInitMove");
    lib.bindSymbol_stdcall(blFontDataInitWeak, "blFontDataInitWeak");
    lib.bindSymbol_stdcall(blFontDataDestroy, "blFontDataDestroy");
    lib.bindSymbol_stdcall(blFontDataReset, "blFontDataReset");
    lib.bindSymbol_stdcall(blFontDataAssignMove, "blFontDataAssignMove");
    lib.bindSymbol_stdcall(blFontDataAssignWeak, "blFontDataAssignWeak");
    lib.bindSymbol_stdcall(blFontDataCreateFromFile, "blFontDataCreateFromFile");
    lib.bindSymbol_stdcall(blFontDataCreateFromDataArray, "blFontDataCreateFromDataArray");
    lib.bindSymbol_stdcall(blFontDataCreateFromData, "blFontDataCreateFromData");
    lib.bindSymbol_stdcall(blFontDataEquals, "blFontDataEquals");
    lib.bindSymbol_stdcall(blFontDataListTags, "blFontDataListTags");
    lib.bindSymbol_stdcall(blFontDataQueryTables, "blFontDataQueryTables");
    lib.bindSymbol_stdcall(blGlyphBufferInit, "blGlyphBufferInit");
    lib.bindSymbol_stdcall(blGlyphBufferInitMove, "blGlyphBufferInitMove");
    lib.bindSymbol_stdcall(blGlyphBufferDestroy, "blGlyphBufferDestroy");
    lib.bindSymbol_stdcall(blGlyphBufferReset, "blGlyphBufferReset");
    lib.bindSymbol_stdcall(blGlyphBufferClear, "blGlyphBufferClear");
    lib.bindSymbol_stdcall(blGlyphBufferGetSize, "blGlyphBufferGetSize");
    lib.bindSymbol_stdcall(blGlyphBufferGetFlags, "blGlyphBufferGetFlags");
    lib.bindSymbol_stdcall(blGlyphBufferGetGlyphRun, "blGlyphBufferGetGlyphRun");
    lib.bindSymbol_stdcall(blGlyphBufferGetContent, "blGlyphBufferGetContent");
    lib.bindSymbol_stdcall(blGlyphBufferGetInfoData, "blGlyphBufferGetInfoData");
    lib.bindSymbol_stdcall(blGlyphBufferGetPlacementData, "blGlyphBufferGetPlacementData");
    lib.bindSymbol_stdcall(blGlyphBufferSetText, "blGlyphBufferSetText");
    lib.bindSymbol_stdcall(blGlyphBufferSetGlyphs, "blGlyphBufferSetGlyphs");
    lib.bindSymbol_stdcall(blGlyphBufferSetGlyphsFromStruct, "blGlyphBufferSetGlyphsFromStruct");
    lib.bindSymbol_stdcall(blPathInit, "blPathInit");
    lib.bindSymbol_stdcall(blPathInitMove, "blPathInitMove");
    lib.bindSymbol_stdcall(blPathInitWeak, "blPathInitWeak");
    lib.bindSymbol_stdcall(blPathDestroy, "blPathDestroy");
    lib.bindSymbol_stdcall(blPathReset, "blPathReset");
    lib.bindSymbol_stdcall(blPathGetSize, "blPathGetSize");
    lib.bindSymbol_stdcall(blPathGetCapacity, "blPathGetCapacity");
    lib.bindSymbol_stdcall(blPathGetCommandData, "blPathGetCommandData");
    lib.bindSymbol_stdcall(blPathGetVertexData, "blPathGetVertexData");
    lib.bindSymbol_stdcall(blPathClear, "blPathClear");
    lib.bindSymbol_stdcall(blPathShrink, "blPathShrink");
    lib.bindSymbol_stdcall(blPathReserve, "blPathReserve");
    lib.bindSymbol_stdcall(blPathModifyOp, "blPathModifyOp");
    lib.bindSymbol_stdcall(blPathAssignMove, "blPathAssignMove");
    lib.bindSymbol_stdcall(blPathAssignWeak, "blPathAssignWeak");
    lib.bindSymbol_stdcall(blPathAssignDeep, "blPathAssignDeep");
    lib.bindSymbol_stdcall(blPathSetVertexAt, "blPathSetVertexAt");
    lib.bindSymbol_stdcall(blPathMoveTo, "blPathMoveTo");
    lib.bindSymbol_stdcall(blPathLineTo, "blPathLineTo");
    lib.bindSymbol_stdcall(blPathPolyTo, "blPathPolyTo");
    lib.bindSymbol_stdcall(blPathQuadTo, "blPathQuadTo");
    lib.bindSymbol_stdcall(blPathCubicTo, "blPathCubicTo");
    lib.bindSymbol_stdcall(blPathSmoothQuadTo, "blPathSmoothQuadTo");
    lib.bindSymbol_stdcall(blPathSmoothCubicTo, "blPathSmoothCubicTo");
    lib.bindSymbol_stdcall(blPathArcTo, "blPathArcTo");
    lib.bindSymbol_stdcall(blPathArcQuadrantTo, "blPathArcQuadrantTo");
    lib.bindSymbol_stdcall(blPathEllipticArcTo, "blPathEllipticArcTo");
    lib.bindSymbol_stdcall(blPathClose, "blPathClose");
    lib.bindSymbol_stdcall(blPathAddGeometry, "blPathAddGeometry");
    lib.bindSymbol_stdcall(blPathAddBoxI, "blPathAddBoxI");
    lib.bindSymbol_stdcall(blPathAddBoxD, "blPathAddBoxD");
    lib.bindSymbol_stdcall(blPathAddRectI, "blPathAddRectI");
    lib.bindSymbol_stdcall(blPathAddRectD, "blPathAddRectD");
    lib.bindSymbol_stdcall(blPathAddPath, "blPathAddPath");
    lib.bindSymbol_stdcall(blPathAddTranslatedPath, "blPathAddTranslatedPath");
    lib.bindSymbol_stdcall(blPathAddTransformedPath, "blPathAddTransformedPath");
    lib.bindSymbol_stdcall(blPathAddReversedPath, "blPathAddReversedPath");
    lib.bindSymbol_stdcall(blPathAddStrokedPath, "blPathAddStrokedPath");
    lib.bindSymbol_stdcall(blPathRemoveRange, "blPathRemoveRange");
    lib.bindSymbol_stdcall(blPathTranslate, "blPathTranslate");
    lib.bindSymbol_stdcall(blPathTransform, "blPathTransform");
    lib.bindSymbol_stdcall(blPathFitTo, "blPathFitTo");
    lib.bindSymbol_stdcall(blPathEquals, "blPathEquals");
    lib.bindSymbol_stdcall(blPathGetInfoFlags, "blPathGetInfoFlags");
    lib.bindSymbol_stdcall(blPathGetControlBox, "blPathGetControlBox");
    lib.bindSymbol_stdcall(blPathGetBoundingBox, "blPathGetBoundingBox");
    lib.bindSymbol_stdcall(blPathGetFigureRange, "blPathGetFigureRange");
    lib.bindSymbol_stdcall(blPathGetLastVertex, "blPathGetLastVertex");
    lib.bindSymbol_stdcall(blPathGetClosestVertex, "blPathGetClosestVertex");
    lib.bindSymbol_stdcall(blPathHitTest, "blPathHitTest");
    lib.bindSymbol_stdcall(blStrokeOptionsInit, "blStrokeOptionsInit");
    lib.bindSymbol_stdcall(blStrokeOptionsInitMove, "blStrokeOptionsInitMove");
    lib.bindSymbol_stdcall(blStrokeOptionsInitWeak, "blStrokeOptionsInitWeak");
    lib.bindSymbol_stdcall(blStrokeOptionsDestroy, "blStrokeOptionsDestroy");
    lib.bindSymbol_stdcall(blStrokeOptionsReset, "blStrokeOptionsReset");
    lib.bindSymbol_stdcall(blStrokeOptionsAssignMove, "blStrokeOptionsAssignMove");
    lib.bindSymbol_stdcall(blStrokeOptionsAssignWeak, "blStrokeOptionsAssignWeak");
    lib.bindSymbol_stdcall(blFontFaceInit, "blFontFaceInit");
    lib.bindSymbol_stdcall(blFontFaceInitMove, "blFontFaceInitMove");
    lib.bindSymbol_stdcall(blFontFaceInitWeak, "blFontFaceInitWeak");
    lib.bindSymbol_stdcall(blFontFaceDestroy, "blFontFaceDestroy");
    lib.bindSymbol_stdcall(blFontFaceReset, "blFontFaceReset");
    lib.bindSymbol_stdcall(blFontFaceAssignMove, "blFontFaceAssignMove");
    lib.bindSymbol_stdcall(blFontFaceAssignWeak, "blFontFaceAssignWeak");
    lib.bindSymbol_stdcall(blFontFaceEquals, "blFontFaceEquals");
    lib.bindSymbol_stdcall(blFontFaceCreateFromFile, "blFontFaceCreateFromFile");
    lib.bindSymbol_stdcall(blFontFaceCreateFromData, "blFontFaceCreateFromData");
    lib.bindSymbol_stdcall(blFontFaceGetFaceInfo, "blFontFaceGetFaceInfo");
    lib.bindSymbol_stdcall(blFontFaceGetScriptTags, "blFontFaceGetScriptTags");
    lib.bindSymbol_stdcall(blFontFaceGetFeatureTags, "blFontFaceGetFeatureTags");
    lib.bindSymbol_stdcall(blFontFaceGetDesignMetrics, "blFontFaceGetDesignMetrics");
    lib.bindSymbol_stdcall(blFontFaceGetUnicodeCoverage, "blFontFaceGetUnicodeCoverage");
    lib.bindSymbol_stdcall(blFontFaceGetCharacterCoverage, "blFontFaceGetCharacterCoverage");
    lib.bindSymbol_stdcall(blFontFeatureSettingsInit, "blFontFeatureSettingsInit");
    lib.bindSymbol_stdcall(blFontFeatureSettingsInitMove, "blFontFeatureSettingsInitMove");
    lib.bindSymbol_stdcall(blFontFeatureSettingsInitWeak, "blFontFeatureSettingsInitWeak");
    lib.bindSymbol_stdcall(blFontFeatureSettingsDestroy, "blFontFeatureSettingsDestroy");
    lib.bindSymbol_stdcall(blFontFeatureSettingsReset, "blFontFeatureSettingsReset");
    lib.bindSymbol_stdcall(blFontFeatureSettingsClear, "blFontFeatureSettingsClear");
    lib.bindSymbol_stdcall(blFontFeatureSettingsShrink, "blFontFeatureSettingsShrink");
    lib.bindSymbol_stdcall(blFontFeatureSettingsAssignMove, "blFontFeatureSettingsAssignMove");
    lib.bindSymbol_stdcall(blFontFeatureSettingsAssignWeak, "blFontFeatureSettingsAssignWeak");
    lib.bindSymbol_stdcall(blFontFeatureSettingsGetSize, "blFontFeatureSettingsGetSize");
    lib.bindSymbol_stdcall(blFontFeatureSettingsGetCapacity, "blFontFeatureSettingsGetCapacity");
    lib.bindSymbol_stdcall(blFontFeatureSettingsGetView, "blFontFeatureSettingsGetView");
    lib.bindSymbol_stdcall(blFontFeatureSettingsHasKey, "blFontFeatureSettingsHasKey");
    lib.bindSymbol_stdcall(blFontFeatureSettingsGetKey, "blFontFeatureSettingsGetKey");
    lib.bindSymbol_stdcall(blFontFeatureSettingsSetKey, "blFontFeatureSettingsSetKey");
    lib.bindSymbol_stdcall(blFontFeatureSettingsRemoveKey, "blFontFeatureSettingsRemoveKey");
    lib.bindSymbol_stdcall(blFontFeatureSettingsEquals, "blFontFeatureSettingsEquals");
    lib.bindSymbol_stdcall(blFontVariationSettingsInit, "blFontVariationSettingsInit");
    lib.bindSymbol_stdcall(blFontVariationSettingsInitMove, "blFontVariationSettingsInitMove");
    lib.bindSymbol_stdcall(blFontVariationSettingsInitWeak, "blFontVariationSettingsInitWeak");
    lib.bindSymbol_stdcall(blFontVariationSettingsDestroy, "blFontVariationSettingsDestroy");
    lib.bindSymbol_stdcall(blFontVariationSettingsReset, "blFontVariationSettingsReset");
    lib.bindSymbol_stdcall(blFontVariationSettingsClear, "blFontVariationSettingsClear");
    lib.bindSymbol_stdcall(blFontVariationSettingsShrink, "blFontVariationSettingsShrink");
    lib.bindSymbol_stdcall(blFontVariationSettingsAssignMove, "blFontVariationSettingsAssignMove");
    lib.bindSymbol_stdcall(blFontVariationSettingsAssignWeak, "blFontVariationSettingsAssignWeak");
    lib.bindSymbol_stdcall(blFontVariationSettingsGetSize, "blFontVariationSettingsGetSize");
    lib.bindSymbol_stdcall(blFontVariationSettingsGetCapacity, "blFontVariationSettingsGetCapacity");
    lib.bindSymbol_stdcall(blFontVariationSettingsGetView, "blFontVariationSettingsGetView");
    lib.bindSymbol_stdcall(blFontVariationSettingsHasKey, "blFontVariationSettingsHasKey");
    lib.bindSymbol_stdcall(blFontVariationSettingsGetKey, "blFontVariationSettingsGetKey");
    lib.bindSymbol_stdcall(blFontVariationSettingsSetKey, "blFontVariationSettingsSetKey");
    lib.bindSymbol_stdcall(blFontVariationSettingsRemoveKey, "blFontVariationSettingsRemoveKey");
    lib.bindSymbol_stdcall(blFontVariationSettingsEquals, "blFontVariationSettingsEquals");
    lib.bindSymbol_stdcall(blFontInit, "blFontInit");
    lib.bindSymbol_stdcall(blFontInitMove, "blFontInitMove");
    lib.bindSymbol_stdcall(blFontInitWeak, "blFontInitWeak");
    lib.bindSymbol_stdcall(blFontDestroy, "blFontDestroy");
    lib.bindSymbol_stdcall(blFontReset, "blFontReset");
    lib.bindSymbol_stdcall(blFontAssignMove, "blFontAssignMove");
    lib.bindSymbol_stdcall(blFontAssignWeak, "blFontAssignWeak");
    lib.bindSymbol_stdcall(blFontEquals, "blFontEquals");
    lib.bindSymbol_stdcall(blFontCreateFromFace, "blFontCreateFromFace");
    lib.bindSymbol_stdcall(blFontGetSize, "blFontGetSize");
    lib.bindSymbol_stdcall(blFontSetSize, "blFontSetSize");
    lib.bindSymbol_stdcall(blFontGetMetrics, "blFontGetMetrics");
    lib.bindSymbol_stdcall(blFontGetMatrix, "blFontGetMatrix");
    lib.bindSymbol_stdcall(blFontGetDesignMetrics, "blFontGetDesignMetrics");
    lib.bindSymbol_stdcall(blFontGetFeatureSettings, "blFontGetFeatureSettings");
    lib.bindSymbol_stdcall(blFontSetFeatureSettings, "blFontSetFeatureSettings");
    lib.bindSymbol_stdcall(blFontResetFeatureSettings, "blFontResetFeatureSettings");
    lib.bindSymbol_stdcall(blFontShape, "blFontShape");
    lib.bindSymbol_stdcall(blFontMapTextToGlyphs, "blFontMapTextToGlyphs");
    lib.bindSymbol_stdcall(blFontPositionGlyphs, "blFontPositionGlyphs");
    lib.bindSymbol_stdcall(blFontApplyKerning, "blFontApplyKerning");
    lib.bindSymbol_stdcall(blFontApplyGSub, "blFontApplyGSub");
    lib.bindSymbol_stdcall(blFontApplyGPos, "blFontApplyGPos");
    lib.bindSymbol_stdcall(blFontGetTextMetrics, "blFontGetTextMetrics");
    lib.bindSymbol_stdcall(blFontGetGlyphBounds, "blFontGetGlyphBounds");
    lib.bindSymbol_stdcall(blFontGetGlyphAdvances, "blFontGetGlyphAdvances");
    lib.bindSymbol_stdcall(blFontGetGlyphOutlines, "blFontGetGlyphOutlines");
    lib.bindSymbol_stdcall(blFontGetGlyphRunOutlines, "blFontGetGlyphRunOutlines");
    lib.bindSymbol_stdcall(blFormatInfoQuery, "blFormatInfoQuery");
    lib.bindSymbol_stdcall(blFormatInfoSanitize, "blFormatInfoSanitize");
    lib.bindSymbol_stdcall(blImageCodecInit, "blImageCodecInit");
    lib.bindSymbol_stdcall(blImageCodecInitMove, "blImageCodecInitMove");
    lib.bindSymbol_stdcall(blImageCodecInitWeak, "blImageCodecInitWeak");
    lib.bindSymbol_stdcall(blImageCodecInitByName, "blImageCodecInitByName");
    lib.bindSymbol_stdcall(blImageCodecDestroy, "blImageCodecDestroy");
    lib.bindSymbol_stdcall(blImageCodecReset, "blImageCodecReset");
    lib.bindSymbol_stdcall(blImageCodecAssignMove, "blImageCodecAssignMove");
    lib.bindSymbol_stdcall(blImageCodecAssignWeak, "blImageCodecAssignWeak");
    lib.bindSymbol_stdcall(blImageCodecFindByName, "blImageCodecFindByName");
    lib.bindSymbol_stdcall(blImageCodecFindByExtension, "blImageCodecFindByExtension");
    lib.bindSymbol_stdcall(blImageCodecFindByData, "blImageCodecFindByData");
    lib.bindSymbol_stdcall(blImageCodecInspectData, "blImageCodecInspectData");
    lib.bindSymbol_stdcall(blImageCodecCreateDecoder, "blImageCodecCreateDecoder");
    lib.bindSymbol_stdcall(blImageCodecCreateEncoder, "blImageCodecCreateEncoder");
    lib.bindSymbol_stdcall(blImageCodecArrayInitBuiltInCodecs, "blImageCodecArrayInitBuiltInCodecs");
    lib.bindSymbol_stdcall(blImageCodecArrayAssignBuiltInCodecs, "blImageCodecArrayAssignBuiltInCodecs");
    lib.bindSymbol_stdcall(blImageCodecAddToBuiltIn, "blImageCodecAddToBuiltIn");
    lib.bindSymbol_stdcall(blImageCodecRemoveFromBuiltIn, "blImageCodecRemoveFromBuiltIn");
    lib.bindSymbol_stdcall(blImageInit, "blImageInit");
    lib.bindSymbol_stdcall(blImageInitMove, "blImageInitMove");
    lib.bindSymbol_stdcall(blImageInitWeak, "blImageInitWeak");
    lib.bindSymbol_stdcall(blImageInitAs, "blImageInitAs");
    lib.bindSymbol_stdcall(blImageInitAsFromData, "blImageInitAsFromData");
    lib.bindSymbol_stdcall(blImageDestroy, "blImageDestroy");
    lib.bindSymbol_stdcall(blImageReset, "blImageReset");
    lib.bindSymbol_stdcall(blImageAssignMove, "blImageAssignMove");
    lib.bindSymbol_stdcall(blImageAssignWeak, "blImageAssignWeak");
    lib.bindSymbol_stdcall(blImageAssignDeep, "blImageAssignDeep");
    lib.bindSymbol_stdcall(blImageCreate, "blImageCreate");
    lib.bindSymbol_stdcall(blImageCreateFromData, "blImageCreateFromData");
    lib.bindSymbol_stdcall(blImageGetData, "blImageGetData");
    lib.bindSymbol_stdcall(blImageMakeMutable, "blImageMakeMutable");
    lib.bindSymbol_stdcall(blImageConvert, "blImageConvert");
    lib.bindSymbol_stdcall(blImageEquals, "blImageEquals");
    lib.bindSymbol_stdcall(blImageScale, "blImageScale");
    lib.bindSymbol_stdcall(blImageReadFromFile, "blImageReadFromFile");
    lib.bindSymbol_stdcall(blImageReadFromData, "blImageReadFromData");
    lib.bindSymbol_stdcall(blImageWriteToFile, "blImageWriteToFile");
    lib.bindSymbol_stdcall(blImageWriteToData, "blImageWriteToData");
    lib.bindSymbol_stdcall(blMatrix2DSetIdentity, "blMatrix2DSetIdentity");
    lib.bindSymbol_stdcall(blMatrix2DSetTranslation, "blMatrix2DSetTranslation");
    lib.bindSymbol_stdcall(blMatrix2DSetScaling, "blMatrix2DSetScaling");
    lib.bindSymbol_stdcall(blMatrix2DSetSkewing, "blMatrix2DSetSkewing");
    lib.bindSymbol_stdcall(blMatrix2DSetRotation, "blMatrix2DSetRotation");
    lib.bindSymbol_stdcall(blMatrix2DApplyOp, "blMatrix2DApplyOp");
    lib.bindSymbol_stdcall(blMatrix2DInvert, "blMatrix2DInvert");
    lib.bindSymbol_stdcall(blMatrix2DGetType, "blMatrix2DGetType");
    lib.bindSymbol_stdcall(blMatrix2DMapPointDArray, "blMatrix2DMapPointDArray");
    lib.bindSymbol_stdcall(blVarInitType, "blVarInitType");
    lib.bindSymbol_stdcall(blVarInitNull, "blVarInitNull");
    lib.bindSymbol_stdcall(blVarInitBool, "blVarInitBool");
    lib.bindSymbol_stdcall(blVarInitInt32, "blVarInitInt32");
    lib.bindSymbol_stdcall(blVarInitInt64, "blVarInitInt64");
    lib.bindSymbol_stdcall(blVarInitUInt32, "blVarInitUInt32");
    lib.bindSymbol_stdcall(blVarInitUInt64, "blVarInitUInt64");
    lib.bindSymbol_stdcall(blVarInitDouble, "blVarInitDouble");
    lib.bindSymbol_stdcall(blVarInitRgba, "blVarInitRgba");
    lib.bindSymbol_stdcall(blVarInitRgba32, "blVarInitRgba32");
    lib.bindSymbol_stdcall(blVarInitRgba64, "blVarInitRgba64");
    lib.bindSymbol_stdcall(blVarInitMove, "blVarInitMove");
    lib.bindSymbol_stdcall(blVarInitWeak, "blVarInitWeak");
    lib.bindSymbol_stdcall(blVarDestroy, "blVarDestroy");
    lib.bindSymbol_stdcall(blVarReset, "blVarReset");
    lib.bindSymbol_stdcall(blVarAssignNull, "blVarAssignNull");
    lib.bindSymbol_stdcall(blVarAssignBool, "blVarAssignBool");
    lib.bindSymbol_stdcall(blVarAssignInt32, "blVarAssignInt32");
    lib.bindSymbol_stdcall(blVarAssignInt64, "blVarAssignInt64");
    lib.bindSymbol_stdcall(blVarAssignUInt32, "blVarAssignUInt32");
    lib.bindSymbol_stdcall(blVarAssignUInt64, "blVarAssignUInt64");
    lib.bindSymbol_stdcall(blVarAssignDouble, "blVarAssignDouble");
    lib.bindSymbol_stdcall(blVarAssignRgba, "blVarAssignRgba");
    lib.bindSymbol_stdcall(blVarAssignRgba32, "blVarAssignRgba32");
    lib.bindSymbol_stdcall(blVarAssignRgba64, "blVarAssignRgba64");
    lib.bindSymbol_stdcall(blVarAssignMove, "blVarAssignMove");
    lib.bindSymbol_stdcall(blVarAssignWeak, "blVarAssignWeak");
    lib.bindSymbol_stdcall(blVarGetType, "blVarGetType");
    lib.bindSymbol_stdcall(blVarToBool, "blVarToBool");
    lib.bindSymbol_stdcall(blVarToInt32, "blVarToInt32");
    lib.bindSymbol_stdcall(blVarToInt64, "blVarToInt64");
    lib.bindSymbol_stdcall(blVarToUInt32, "blVarToUInt32");
    lib.bindSymbol_stdcall(blVarToUInt64, "blVarToUInt64");
    lib.bindSymbol_stdcall(blVarToDouble, "blVarToDouble");
    lib.bindSymbol_stdcall(blVarToRgba, "blVarToRgba");
    lib.bindSymbol_stdcall(blVarToRgba32, "blVarToRgba32");
    lib.bindSymbol_stdcall(blVarToRgba64, "blVarToRgba64");
    lib.bindSymbol_stdcall(blVarEquals, "blVarEquals");
    lib.bindSymbol_stdcall(blVarEqualsNull, "blVarEqualsNull");
    lib.bindSymbol_stdcall(blVarEqualsBool, "blVarEqualsBool");
    lib.bindSymbol_stdcall(blVarEqualsInt64, "blVarEqualsInt64");
    lib.bindSymbol_stdcall(blVarEqualsUInt64, "blVarEqualsUInt64");
    lib.bindSymbol_stdcall(blVarEqualsDouble, "blVarEqualsDouble");
    lib.bindSymbol_stdcall(blVarStrictEquals, "blVarStrictEquals");
    lib.bindSymbol_stdcall(blContextInit, "blContextInit");
    lib.bindSymbol_stdcall(blContextInitMove, "blContextInitMove");
    lib.bindSymbol_stdcall(blContextInitWeak, "blContextInitWeak");
    lib.bindSymbol_stdcall(blContextInitAs, "blContextInitAs");
    lib.bindSymbol_stdcall(blContextDestroy, "blContextDestroy");
    lib.bindSymbol_stdcall(blContextReset, "blContextReset");
    lib.bindSymbol_stdcall(blContextAssignMove, "blContextAssignMove");
    lib.bindSymbol_stdcall(blContextAssignWeak, "blContextAssignWeak");
    lib.bindSymbol_stdcall(blContextGetType, "blContextGetType");
    lib.bindSymbol_stdcall(blContextGetTargetSize, "blContextGetTargetSize");
    lib.bindSymbol_stdcall(blContextGetTargetImage, "blContextGetTargetImage");
    lib.bindSymbol_stdcall(blContextBegin, "blContextBegin");
    lib.bindSymbol_stdcall(blContextEnd, "blContextEnd");
    lib.bindSymbol_stdcall(blContextFlush, "blContextFlush");
    lib.bindSymbol_stdcall(blContextSave, "blContextSave");
    lib.bindSymbol_stdcall(blContextRestore, "blContextRestore");
    lib.bindSymbol_stdcall(blContextGetMetaMatrix, "blContextGetMetaMatrix");
    lib.bindSymbol_stdcall(blContextGetUserMatrix, "blContextGetUserMatrix");
    lib.bindSymbol_stdcall(blContextUserToMeta, "blContextUserToMeta");
    lib.bindSymbol_stdcall(blContextMatrixOp, "blContextMatrixOp");
    lib.bindSymbol_stdcall(blContextGetHint, "blContextGetHint");
    lib.bindSymbol_stdcall(blContextSetHint, "blContextSetHint");
    lib.bindSymbol_stdcall(blContextGetHints, "blContextGetHints");
    lib.bindSymbol_stdcall(blContextSetHints, "blContextSetHints");
    lib.bindSymbol_stdcall(blContextSetFlattenMode, "blContextSetFlattenMode");
    lib.bindSymbol_stdcall(blContextSetFlattenTolerance, "blContextSetFlattenTolerance");
    lib.bindSymbol_stdcall(blContextSetApproximationOptions, "blContextSetApproximationOptions");
    lib.bindSymbol_stdcall(blContextGetCompOp, "blContextGetCompOp");
    lib.bindSymbol_stdcall(blContextSetCompOp, "blContextSetCompOp");
    lib.bindSymbol_stdcall(blContextGetGlobalAlpha, "blContextGetGlobalAlpha");
    lib.bindSymbol_stdcall(blContextSetGlobalAlpha, "blContextSetGlobalAlpha");
    lib.bindSymbol_stdcall(blContextGetFillAlpha, "blContextGetFillAlpha");
    lib.bindSymbol_stdcall(blContextSetFillAlpha, "blContextSetFillAlpha");
    lib.bindSymbol_stdcall(blContextGetFillStyle, "blContextGetFillStyle");
    lib.bindSymbol_stdcall(blContextSetFillStyle, "blContextSetFillStyle");
    lib.bindSymbol_stdcall(blContextSetFillStyleRgba, "blContextSetFillStyleRgba");
    lib.bindSymbol_stdcall(blContextSetFillStyleRgba32, "blContextSetFillStyleRgba32");
    lib.bindSymbol_stdcall(blContextSetFillStyleRgba64, "blContextSetFillStyleRgba64");
    lib.bindSymbol_stdcall(blContextGetFillRule, "blContextGetFillRule");
    lib.bindSymbol_stdcall(blContextSetFillRule, "blContextSetFillRule");
    lib.bindSymbol_stdcall(blContextGetStrokeAlpha, "blContextGetStrokeAlpha");
    lib.bindSymbol_stdcall(blContextSetStrokeAlpha, "blContextSetStrokeAlpha");
    lib.bindSymbol_stdcall(blContextGetStrokeStyle, "blContextGetStrokeStyle");
    lib.bindSymbol_stdcall(blContextSetStrokeStyle, "blContextSetStrokeStyle");
    lib.bindSymbol_stdcall(blContextSetStrokeStyleRgba, "blContextSetStrokeStyleRgba");
    lib.bindSymbol_stdcall(blContextSetStrokeStyleRgba32, "blContextSetStrokeStyleRgba32");
    lib.bindSymbol_stdcall(blContextSetStrokeStyleRgba64, "blContextSetStrokeStyleRgba64");
    lib.bindSymbol_stdcall(blContextGetStrokeWidth, "blContextGetStrokeWidth");
    lib.bindSymbol_stdcall(blContextSetStrokeWidth, "blContextSetStrokeWidth");
    lib.bindSymbol_stdcall(blContextGetStrokeMiterLimit, "blContextGetStrokeMiterLimit");
    lib.bindSymbol_stdcall(blContextSetStrokeMiterLimit, "blContextSetStrokeMiterLimit");
    lib.bindSymbol_stdcall(blContextGetStrokeCap, "blContextGetStrokeCap");
    lib.bindSymbol_stdcall(blContextSetStrokeCap, "blContextSetStrokeCap");
    lib.bindSymbol_stdcall(blContextSetStrokeCaps, "blContextSetStrokeCaps");
    lib.bindSymbol_stdcall(blContextGetStrokeJoin, "blContextGetStrokeJoin");
    lib.bindSymbol_stdcall(blContextSetStrokeJoin, "blContextSetStrokeJoin");
    lib.bindSymbol_stdcall(blContextGetStrokeTransformOrder, "blContextGetStrokeTransformOrder");
    lib.bindSymbol_stdcall(blContextSetStrokeTransformOrder, "blContextSetStrokeTransformOrder");
    lib.bindSymbol_stdcall(blContextGetStrokeDashOffset, "blContextGetStrokeDashOffset");
    lib.bindSymbol_stdcall(blContextSetStrokeDashOffset, "blContextSetStrokeDashOffset");
    lib.bindSymbol_stdcall(blContextGetStrokeDashArray, "blContextGetStrokeDashArray");
    lib.bindSymbol_stdcall(blContextSetStrokeDashArray, "blContextSetStrokeDashArray");
    lib.bindSymbol_stdcall(blContextGetStrokeOptions, "blContextGetStrokeOptions");
    lib.bindSymbol_stdcall(blContextSetStrokeOptions, "blContextSetStrokeOptions");
    lib.bindSymbol_stdcall(blContextClipToRectI, "blContextClipToRectI");
    lib.bindSymbol_stdcall(blContextClipToRectD, "blContextClipToRectD");
    lib.bindSymbol_stdcall(blContextRestoreClipping, "blContextRestoreClipping");
    lib.bindSymbol_stdcall(blContextClearAll, "blContextClearAll");
    lib.bindSymbol_stdcall(blContextClearRectI, "blContextClearRectI");
    lib.bindSymbol_stdcall(blContextClearRectD, "blContextClearRectD");
    lib.bindSymbol_stdcall(blContextFillAll, "blContextFillAll");
    lib.bindSymbol_stdcall(blContextFillRectI, "blContextFillRectI");
    lib.bindSymbol_stdcall(blContextFillRectD, "blContextFillRectD");
    lib.bindSymbol_stdcall(blContextFillPathD, "blContextFillPathD");
    lib.bindSymbol_stdcall(blContextFillGeometry, "blContextFillGeometry");
    lib.bindSymbol_stdcall(blContextFillTextI, "blContextFillTextI");
    lib.bindSymbol_stdcall(blContextFillTextD, "blContextFillTextD");
    lib.bindSymbol_stdcall(blContextFillGlyphRunI, "blContextFillGlyphRunI");
    lib.bindSymbol_stdcall(blContextFillGlyphRunD, "blContextFillGlyphRunD");
    lib.bindSymbol_stdcall(blContextFillMaskI, "blContextFillMaskI");
    lib.bindSymbol_stdcall(blContextFillMaskD, "blContextFillMaskD");
    lib.bindSymbol_stdcall(blContextStrokeRectI, "blContextStrokeRectI");
    lib.bindSymbol_stdcall(blContextStrokeRectD, "blContextStrokeRectD");
    lib.bindSymbol_stdcall(blContextStrokePathD, "blContextStrokePathD");
    lib.bindSymbol_stdcall(blContextStrokeGeometry, "blContextStrokeGeometry");
    lib.bindSymbol_stdcall(blContextStrokeTextI, "blContextStrokeTextI");
    lib.bindSymbol_stdcall(blContextStrokeTextD, "blContextStrokeTextD");
    lib.bindSymbol_stdcall(blContextStrokeGlyphRunI, "blContextStrokeGlyphRunI");
    lib.bindSymbol_stdcall(blContextStrokeGlyphRunD, "blContextStrokeGlyphRunD");
    lib.bindSymbol_stdcall(blContextBlitImageI, "blContextBlitImageI");
    lib.bindSymbol_stdcall(blContextBlitImageD, "blContextBlitImageD");
    lib.bindSymbol_stdcall(blContextBlitScaledImageI, "blContextBlitScaledImageI");
    lib.bindSymbol_stdcall(blContextBlitScaledImageD, "blContextBlitScaledImageD");
    lib.bindSymbol_stdcall(blFontManagerInit, "blFontManagerInit");
    lib.bindSymbol_stdcall(blFontManagerInitMove, "blFontManagerInitMove");
    lib.bindSymbol_stdcall(blFontManagerInitWeak, "blFontManagerInitWeak");
    lib.bindSymbol_stdcall(blFontManagerInitNew, "blFontManagerInitNew");
    lib.bindSymbol_stdcall(blFontManagerDestroy, "blFontManagerDestroy");
    lib.bindSymbol_stdcall(blFontManagerReset, "blFontManagerReset");
    lib.bindSymbol_stdcall(blFontManagerAssignMove, "blFontManagerAssignMove");
    lib.bindSymbol_stdcall(blFontManagerAssignWeak, "blFontManagerAssignWeak");
    lib.bindSymbol_stdcall(blFontManagerCreate, "blFontManagerCreate");
    lib.bindSymbol_stdcall(blFontManagerGetFaceCount, "blFontManagerGetFaceCount");
    lib.bindSymbol_stdcall(blFontManagerGetFamilyCount, "blFontManagerGetFamilyCount");
    lib.bindSymbol_stdcall(blFontManagerHasFace, "blFontManagerHasFace");
    lib.bindSymbol_stdcall(blFontManagerAddFace, "blFontManagerAddFace");
    lib.bindSymbol_stdcall(blFontManagerQueryFace, "blFontManagerQueryFace");
    lib.bindSymbol_stdcall(blFontManagerQueryFacesByFamilyName, "blFontManagerQueryFacesByFamilyName");
    lib.bindSymbol_stdcall(blFontManagerEquals, "blFontManagerEquals");
    lib.bindSymbol_stdcall(blGradientInit, "blGradientInit");
    lib.bindSymbol_stdcall(blGradientInitMove, "blGradientInitMove");
    lib.bindSymbol_stdcall(blGradientInitWeak, "blGradientInitWeak");
    lib.bindSymbol_stdcall(blGradientInitAs, "blGradientInitAs");
    lib.bindSymbol_stdcall(blGradientDestroy, "blGradientDestroy");
    lib.bindSymbol_stdcall(blGradientReset, "blGradientReset");
    lib.bindSymbol_stdcall(blGradientAssignMove, "blGradientAssignMove");
    lib.bindSymbol_stdcall(blGradientAssignWeak, "blGradientAssignWeak");
    lib.bindSymbol_stdcall(blGradientCreate, "blGradientCreate");
    lib.bindSymbol_stdcall(blGradientShrink, "blGradientShrink");
    lib.bindSymbol_stdcall(blGradientReserve, "blGradientReserve");
    lib.bindSymbol_stdcall(blGradientGetType, "blGradientGetType");
    lib.bindSymbol_stdcall(blGradientSetType, "blGradientSetType");
    lib.bindSymbol_stdcall(blGradientGetExtendMode, "blGradientGetExtendMode");
    lib.bindSymbol_stdcall(blGradientSetExtendMode, "blGradientSetExtendMode");
    lib.bindSymbol_stdcall(blGradientGetValue, "blGradientGetValue");
    lib.bindSymbol_stdcall(blGradientSetValue, "blGradientSetValue");
    lib.bindSymbol_stdcall(blGradientSetValues, "blGradientSetValues");
    lib.bindSymbol_stdcall(blGradientGetSize, "blGradientGetSize");
    lib.bindSymbol_stdcall(blGradientGetCapacity, "blGradientGetCapacity");
    lib.bindSymbol_stdcall(blGradientGetStops, "blGradientGetStops");
    lib.bindSymbol_stdcall(blGradientResetStops, "blGradientResetStops");
    lib.bindSymbol_stdcall(blGradientAssignStops, "blGradientAssignStops");
    lib.bindSymbol_stdcall(blGradientAddStopRgba32, "blGradientAddStopRgba32");
    lib.bindSymbol_stdcall(blGradientAddStopRgba64, "blGradientAddStopRgba64");
    lib.bindSymbol_stdcall(blGradientRemoveStop, "blGradientRemoveStop");
    lib.bindSymbol_stdcall(blGradientRemoveStopByOffset, "blGradientRemoveStopByOffset");
    lib.bindSymbol_stdcall(blGradientRemoveStopsByIndex, "blGradientRemoveStopsByIndex");
    lib.bindSymbol_stdcall(blGradientRemoveStopsByOffset, "blGradientRemoveStopsByOffset");
    lib.bindSymbol_stdcall(blGradientReplaceStopRgba32, "blGradientReplaceStopRgba32");
    lib.bindSymbol_stdcall(blGradientReplaceStopRgba64, "blGradientReplaceStopRgba64");
    lib.bindSymbol_stdcall(blGradientIndexOfStop, "blGradientIndexOfStop");
    lib.bindSymbol_stdcall(blGradientApplyMatrixOp, "blGradientApplyMatrixOp");
    lib.bindSymbol_stdcall(blGradientEquals, "blGradientEquals");
    lib.bindSymbol_stdcall(blImageDecoderInit, "blImageDecoderInit");
    lib.bindSymbol_stdcall(blImageDecoderInitMove, "blImageDecoderInitMove");
    lib.bindSymbol_stdcall(blImageDecoderInitWeak, "blImageDecoderInitWeak");
    lib.bindSymbol_stdcall(blImageDecoderDestroy, "blImageDecoderDestroy");
    lib.bindSymbol_stdcall(blImageDecoderReset, "blImageDecoderReset");
    lib.bindSymbol_stdcall(blImageDecoderAssignMove, "blImageDecoderAssignMove");
    lib.bindSymbol_stdcall(blImageDecoderAssignWeak, "blImageDecoderAssignWeak");
    lib.bindSymbol_stdcall(blImageDecoderRestart, "blImageDecoderRestart");
    lib.bindSymbol_stdcall(blImageDecoderReadInfo, "blImageDecoderReadInfo");
    lib.bindSymbol_stdcall(blImageDecoderReadFrame, "blImageDecoderReadFrame");
    lib.bindSymbol_stdcall(blImageEncoderInit, "blImageEncoderInit");
    lib.bindSymbol_stdcall(blImageEncoderInitMove, "blImageEncoderInitMove");
    lib.bindSymbol_stdcall(blImageEncoderInitWeak, "blImageEncoderInitWeak");
    lib.bindSymbol_stdcall(blImageEncoderDestroy, "blImageEncoderDestroy");
    lib.bindSymbol_stdcall(blImageEncoderReset, "blImageEncoderReset");
    lib.bindSymbol_stdcall(blImageEncoderAssignMove, "blImageEncoderAssignMove");
    lib.bindSymbol_stdcall(blImageEncoderAssignWeak, "blImageEncoderAssignWeak");
    lib.bindSymbol_stdcall(blImageEncoderRestart, "blImageEncoderRestart");
    lib.bindSymbol_stdcall(blImageEncoderWriteFrame, "blImageEncoderWriteFrame");
    lib.bindSymbol_stdcall(blPatternInit, "blPatternInit");
    lib.bindSymbol_stdcall(blPatternInitMove, "blPatternInitMove");
    lib.bindSymbol_stdcall(blPatternInitWeak, "blPatternInitWeak");
    lib.bindSymbol_stdcall(blPatternInitAs, "blPatternInitAs");
    lib.bindSymbol_stdcall(blPatternDestroy, "blPatternDestroy");
    lib.bindSymbol_stdcall(blPatternReset, "blPatternReset");
    lib.bindSymbol_stdcall(blPatternAssignMove, "blPatternAssignMove");
    lib.bindSymbol_stdcall(blPatternAssignWeak, "blPatternAssignWeak");
    lib.bindSymbol_stdcall(blPatternAssignDeep, "blPatternAssignDeep");
    lib.bindSymbol_stdcall(blPatternCreate, "blPatternCreate");
    lib.bindSymbol_stdcall(blPatternGetImage, "blPatternGetImage");
    lib.bindSymbol_stdcall(blPatternSetImage, "blPatternSetImage");
    lib.bindSymbol_stdcall(blPatternResetImage, "blPatternResetImage");
    lib.bindSymbol_stdcall(blPatternGetArea, "blPatternGetArea");
    lib.bindSymbol_stdcall(blPatternSetArea, "blPatternSetArea");
    lib.bindSymbol_stdcall(blPatternGetExtendMode, "blPatternGetExtendMode");
    lib.bindSymbol_stdcall(blPatternSetExtendMode, "blPatternSetExtendMode");
    lib.bindSymbol_stdcall(blPatternGetMatrixType, "blPatternGetMatrixType");
    lib.bindSymbol_stdcall(blPatternGetMatrix, "blPatternGetMatrix");
    lib.bindSymbol_stdcall(blPatternApplyMatrixOp, "blPatternApplyMatrixOp");
    lib.bindSymbol_stdcall(blPatternEquals, "blPatternEquals");
    lib.bindSymbol_stdcall(blPixelConverterInit, "blPixelConverterInit");
    lib.bindSymbol_stdcall(blPixelConverterInitWeak, "blPixelConverterInitWeak");
    lib.bindSymbol_stdcall(blPixelConverterDestroy, "blPixelConverterDestroy");
    lib.bindSymbol_stdcall(blPixelConverterReset, "blPixelConverterReset");
    lib.bindSymbol_stdcall(blPixelConverterAssign, "blPixelConverterAssign");
    lib.bindSymbol_stdcall(blPixelConverterCreate, "blPixelConverterCreate");
    lib.bindSymbol_stdcall(blRandomReset, "blRandomReset");
    lib.bindSymbol_stdcall(blRandomNextUInt32, "blRandomNextUInt32");
    lib.bindSymbol_stdcall(blRandomNextUInt64, "blRandomNextUInt64");
    lib.bindSymbol_stdcall(blRandomNextDouble, "blRandomNextDouble");
    lib.bindSymbol_stdcall(blRuntimeInit, "blRuntimeInit");
    lib.bindSymbol_stdcall(blRuntimeShutdown, "blRuntimeShutdown");
    lib.bindSymbol_stdcall(blRuntimeCleanup, "blRuntimeCleanup");
    lib.bindSymbol_stdcall(blRuntimeQueryInfo, "blRuntimeQueryInfo");
    lib.bindSymbol_stdcall(blRuntimeMessageOut, "blRuntimeMessageOut");
    lib.bindSymbol_stdcall(blRuntimeMessageFmt, "blRuntimeMessageFmt");
    lib.bindSymbol_stdcall(blRuntimeMessageVFmt, "blRuntimeMessageVFmt");

    if(errorCount() != errCount) return Blend2DSupport.badLibrary;
    else loadedVersion = Blend2DSupport.bl00;

    return loadedVersion;
}
