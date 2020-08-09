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
        "blNone",
        "blPixelConverterConvert",
        "blRuntimeAllocImpl",
        "blRuntimeAllocAlignedImpl",
        "blRuntimeFreeImpl"
    ];

    string cwd;
    string dirBlend2dRepoSrc;
    string[string] dFiles;
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
        dirBlend2dRepoSrc = chainPath(dirBlend2d, "src/blend2d").array;
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
        dFiles = genDFiles;
        symbols = readText(fileSymbols).splitLines;
    }

    string[string] genDFiles()
    {
        chdir(dirBlend2dRepoSrc);
        scope(exit) chdir(cwd);

        auto hFiles = dirEntries("", SpanMode.breadth).filter!(
            f => f.name.endsWith(".h")
                && !f.name.endsWith("_p.h")
                && !f.name.endsWith("-impl.h")
            ).array;

        typeof(return) result;

        foreach (i, ref h; parallel(hFiles, 1))
        {
            auto pid = spawnProcess(["dstep",
                "--collision-action=ignore",
                "--space-after-function-name=false",
                "--comments=false",
                h.name]);
            enforce(pid.wait() == 0, "dstep failed on " ~ h.name);

            auto d = h.name.withExtension("d").array;
            result[d] = readText(d);
            remove(d);
        }

        return result;
    }

    void commentOutLines()
    {
        auto api = dFiles[dApi];
        auto toBeCommentedOut = [
            ctRegex!(r"^(struct .+;)", "m"),
            ctRegex!(r"^(.* _Pragma\(.+;)", "m"),
            ctRegex!(r"^(BLResult blResultFromWinError.+;)", "m"),
            ctRegex!(r"^(BLResult blResultFromPosixError.+;)", "m"),
        ];
        foreach (ref re; toBeCommentedOut)
            api = replaceAll(api, re, "//$&");
        dFiles[dApi] = api;
    }

    void addVersionStatic()
    {
        auto api = dFiles[dApi];
        foreach (ref fn; symbols)
            api = replaceAll(api, regex(r"^(.* " ~ fn ~ r"\()", "m"), versionStatic ~ "$&");
        api ~= "\n" ~ versionStatic ~ "version(Windows) BLResult blResultFromWinError(uint e);";
        api ~= "\n" ~ versionStatic ~ "version(Posix) BLResult blResultFromPosixError(int e);";
        dFiles[dApi] = api;
    }

    void bindStatic()
    {
        bufBindStatic.put(q"EOL
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

EOL");

        string[] enums;
        auto re = ctRegex!(r"^enum ([^;{]+)$");
        foreach (d; dFiles.keys.sort)
            foreach (line; dFiles[d].splitLines)
            {
                auto m = matchFirst(line, re);
                if (!m.empty)
                    enums ~= "mixin(expandEnum!" ~ m[1] ~ ");";
            }
        enums ~= "";
        bufBindStatic.put(enums.join("\n"));

        commentOutLines;
        addVersionStatic;

        foreach (d; dFiles.keys.sort)
        {
            bufBindStatic.put("");
            bufBindStatic.put("//****** " ~ d.baseName ~ " ******//");
            bufBindStatic.put("");
            bufBindStatic.put(dFiles[d].splitLines);
        }
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

extern(C) @nogc nothrow alias pblMatrix2DMapPointDArrayFuncs = BLMapPointDArrayFunc[BL_MATRIX2D_TYPE_COUNT];
__gshared pblMatrix2DMapPointDArrayFuncs blMatrix2DMapPointDArrayFuncs;

extern(C) @nogc nothrow alias pblNone = BLVariantCore[BL_IMPL_TYPE_COUNT];
__gshared pblNone blNone;

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
    lib.bindSymbol(cast(void**)&blNone, "blNone");

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
