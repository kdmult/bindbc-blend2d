module gen_bindings;

import std;

alias writeText = std.file.write;

void main(string[] args)
{
    void writeUsage()
    {
        stdout.writefln("\nUsage: %s [options] <blend2d_repo_path>", args[0].baseName);
    }

    if (args.length < 2)
    {
        writeUsage;
        return;
    }

    string dirBlend2d = args[1];
    if (!dirBlend2d.exists || !dirBlend2d.isDir)
    {
        stderr.writeln("<blend2d_repo_path> is expected to be an existing directory: ", dirBlend2d);
        writeUsage;
        return;
    }

    auto gen = new GenBindings(dirBlend2d);
    gen.bindStatic;
    gen.bindDynamic;
    gen.save;
}

class GenBindings
{
    string dApi = "api.d";
    string versionStatic = "version(BindBlend2D_Static) ";
    string[] skipFnList = [
        "blDefaultApproximationOptions",
        "blFormatInfo",
        "blMatrix2DMapPointDArrayFuncs",
        "blPixelConverterConvert",
        "blRuntimeAllocImpl",
        "blRuntimeAllocAlignedImpl",
        "blRuntimeFreeImpl"
    ];

    string cwd;
    string dirBlend2dSrc;
    string dirBlend2dSrcBlend2d;
    string dFile;
    string[] symbols;
    string fileSymbols;
    string fileBindStatic;
    string fileBindDynamic;
    Appender!(string[]) bufBindStatic;
    Appender!(string[]) bufBindDynamic;
    Appender!(string[]) bufBindSymbol;

    this(string dirBlend2d)
    {
        cwd = getcwd();
        dirBlend2dSrc = absolutePath(chainPath(dirBlend2d, "src").array, cwd);
        dirBlend2dSrcBlend2d = absolutePath(chainPath(dirBlend2dSrc, "blend2d").array, cwd);
        fileSymbols = chainPath(cwd, "symbols.txt").array;
        string dirBindBC = chainPath(cwd, "../source/bindbc/blend2d").array;
        fileBindStatic = chainPath(dirBindBC, "bindstatic.d").array;
        fileBindDynamic = chainPath(dirBindBC, "binddynamic.d").array;

        bufBindStatic = appender!(string[]);
        bufBindDynamic = appender!(string[]);
        bufBindSymbol = appender!(string[]);

        initialize;
    }

    void initialize()
    {
        dFile = genDFile();
        symbols = readText(fileSymbols).splitLines;
    }

    string genDFile()
    {
        chdir(dirBlend2dSrc);
        scope(exit) chdir(cwd);

        auto tmpFile = chainPath(dirBlend2dSrcBlend2d, "blend2d-api.h").array;
        append(tmpFile, "// The file is generated automatically");
        scope(exit) tmpFile.remove;

        auto re = ctRegex!(`#include "(.+)"`);
        foreach (line; readText("blend2d.h").splitLines)
        {
            auto m = matchFirst(line, re);
            if (m.empty)
                continue;

            append(tmpFile, "\n\n//****** " ~ m[1] ~ " ******//\n\n");
            append(tmpFile, readText(m[1]));
        }

        chdir(dirBlend2dSrcBlend2d);

        auto preprocessedFile = "blend2d-api.c";
        auto gccOut = File(preprocessedFile, "w");
        auto pidGcc = spawnProcess(["gcc", "-E", "-P", tmpFile], std.stdio.stdin, gccOut);
        enforce(pidGcc.wait() == 0, "gcc preprocessor failed on " ~ tmpFile);
        gccOut.close();
        scope(exit) remove(preprocessedFile);

        string[] txt;
        txt ~= "#include <stdarg.h>";
        txt ~= "#include <stdint.h>";
        auto lines = readText(preprocessedFile).splitLines;
        foreach (i, line; lines)
        {
            if (indexOf(line, "typedef struct BL") != 0)
                continue;
            txt ~= lines[i..$];
            break;
        }
        writeText(preprocessedFile, txt.join("\n"));

        auto pidDStep = spawnProcess(["dstep",
            "--output=" ~ dApi,
            "--collision-action=ignore",
            "--single-line-function-signatures=true",
            "--space-after-function-name=false",
            "--comments=false",
            preprocessedFile]);
        enforce(pidDStep.wait() == 0, "dstep failed on " ~ preprocessedFile);
        scope(exit) remove(dApi);

        return readText(dApi);
    }

    void bindStatic()
    {
        bufBindStatic.put(q"EOL
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

EOL");

        string[] enums;
        auto re = ctRegex!(r"^enum ([^;{]+)$");
        foreach (line; dFile.splitLines)
        {
            auto m = matchFirst(line, re);
            if (!m.empty)
                enums ~= "mixin(expandEnum!" ~ m[1] ~ ");";
        }
        enums ~= "";
        bufBindStatic.put(enums.join("\n"));

        auto toBeCommentedOut = [
            ctRegex!(r"^(struct .+;)", "m"),
            ctRegex!(r"^(union .+;)", "m"),
            ctRegex!(r"^(.* _Pragma\(.+;)", "m"),
            ctRegex!(r"^(BLResult blResultFromWinError.+;)", "m"),
            ctRegex!(r"^(BLResult blResultFromPosixError.+;)", "m"),
        ];

        bufBindStatic.put("");
        bufBindStatic.put("//****** " ~ dApi ~ " ******//");
        bufBindStatic.put("");

        foreach (ref rx; toBeCommentedOut)
            dFile = replaceAll(dFile, rx, "//$&");

        foreach (ref fn; symbols)
            dFile = replaceAll(dFile, regex(r"^(.* " ~ fn ~ r"\()", "m"), versionStatic ~ "$&");
        bufBindStatic.put(dFile.splitLines);

        bufBindStatic.put("");
        bufBindStatic.put(versionStatic ~ "version(Windows) BLResult blResultFromWinError(uint e);");
        bufBindStatic.put(versionStatic ~ "version(Posix) BLResult blResultFromPosixError(int e);");
    }

    void bindDynamic()
    {
        bufBindDynamic.put(q"EOL
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

EOL");

        auto fns = symbols.filter!(a => skipFnList.find(a).empty);
        auto re_fns = regex(" (" ~ fns.join("|") ~ r")\(");
        foreach (line; bufBindStatic.data)
        {
            const m = line.matchFirst(re_fns);
            if (m.empty)
                continue;

            string fn = m[1];
            string fn_def = line.replaceFirst(fn, "function")[versionStatic.length .. $];
            bufBindDynamic.put("extern(C) @nogc nothrow alias p" ~ fn ~ " = " ~ fn_def);
            bufBindDynamic.put("__gshared p" ~ fn ~ " " ~ fn ~ ";");
            bufBindDynamic.put("");
            bufBindSymbol.put("    lib.bindSymbol_stdcall(" ~ fn ~ ", \"" ~ fn ~ "\");");
        }

        bufBindDynamic.put(q"EOL
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

EOL");

        bufBindDynamic.put(bufBindSymbol.data.join("\n"));

        bufBindDynamic.put(q"EOL

    if(errorCount() != errCount) return Blend2DSupport.badLibrary;
    else loadedVersion = Blend2DSupport.bl00;

    return loadedVersion;
}
EOL");

    }

    void save()
    {
        writeText(fileBindStatic, bufBindStatic.data.join("\n"));
        writeText(fileBindDynamic, bufBindDynamic.data.join("\n"));
    }
}
