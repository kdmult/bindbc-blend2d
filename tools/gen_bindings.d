module tools.gen_bindings;

import std;

alias writeText = std.file.write;

void main(string[] args)
{
	bool quiet = false;
	getopt(args,
		std.getopt.config.bundling,
		"q|quiet", &quiet);

    void writeUsage()
    {
		stdout.writefln("\nUsage: %s [options] <blend2d_repo_path>", args[0].baseName);
		stdout.writeln("Options:");
		stdout.writeln(" -q  --quiet           No screen messages");
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
    const string[] skipList = [
        "blDefaultApproximationOptions",
        "blFormatInfo",
        "blMatrix2DMapPointDArrayFuncs",
        "blNone",
        "blPixelConverterConvert",
        "blRuntimeAllocImpl",
        "blRuntimeAllocAlignedImpl",
        "blRuntimeFreeImpl"
    ];

    Appender!string bufBindStatic;
    string cwd;
    string dirBlend2dRepoSrc;
    string fileSymbols;
    string fileBindStatic;
    string fileBindStaticLoad;
    string fileBindDynamic;

    this(string dirBlend2d)
    {
        bufBindStatic = appender!string;
        cwd = getcwd();
        dirBlend2dRepoSrc = chainPath(dirBlend2d, "src/blend2d").array;
        fileSymbols = chainPath(cwd, "symbols.txt").array;

        string dirBindBC = chainPath(cwd, "../source/bindbc/blend2d").array;
        fileBindStatic = chainPath(dirBindBC, "bindstatic.d").array;
        fileBindStaticLoad = chainPath(cwd, "bindstatic_load.d").array;
        fileBindDynamic = chainPath(dirBindBC, "binddynamic.d").array;
    }

    void bindStatic()
    {
        chdir(dirBlend2dRepoSrc);
        scope(exit) chdir(cwd);

        auto hFiles = dirEntries("", SpanMode.breadth).filter!(
            f => f.name.endsWith(".h")
                && !f.name.endsWith("_p.h")
                && !f.name.endsWith("-impl.h")
            ).array;

        string[string] dFiles;

        foreach (i, ref h; parallel(hFiles, 1))
        {
            auto pid = spawnProcess(["dstep",
                "--collision-action=ignore",
                "--space-after-function-name=false",
                "--comments=false",
                h.name]);
            enforce(pid.wait() == 0, "dstep failed on " ~ h.name);

            auto d = h.name.withExtension("d").array;
            dFiles[d] = readText(d);
            remove(d);
        }

        bufBindStatic.put(q"EOL
module bindbc.blend2d.bindstatic;

version(BindBC_Static) version = BindBlend2D_Static;

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

        string[] symbols = readText(fileSymbols).splitLines;
        string dApi = "api.d";
        auto api = dFiles[dApi];
        auto toBeCommentedOut = [
            ctRegex!(r"^(struct .+;)", "m"),
            ctRegex!(r"^(.* _Pragma\(.+;)", "m"),
            ctRegex!(r"^(BLResult blResultFromWinError.+;)", "m"),
            ctRegex!(r"^(BLResult blResultFromPosixError.+;)", "m"),
        ];
        foreach (ref re; toBeCommentedOut)
            api = replaceAll(api, re, "//$&");
        foreach (ref fn; symbols)
            api = replaceAll(api, regex(r"^(.* " ~ fn ~ r"\()", "m"), "version(BindBlend2D_Static) $&");
        dFiles[dApi] = api;

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

        foreach (d; dFiles.keys.sort)
            bufBindStatic.put("\n//****** " ~ d.baseName ~ " ******//\n" ~ dFiles[d]);

        bufBindStatic.put("\nversion(BindBlend2D_Static) version(Windows) BLResult blResultFromWinError(uint e);");
        bufBindStatic.put("\nversion(BindBlend2D_Static) version(Posix) BLResult blResultFromPosixError(int e);");
        bufBindStatic.put("\n");
    }

    void bindDynamic()
    {

    }

    void save()
    {
        writeText(fileBindStatic, bufBindStatic[]);
    }
}
