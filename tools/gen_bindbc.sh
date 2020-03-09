#!/bin/bash

blend2d_dir=$1
if [ -z "${blend2d_dir}" ]; then
  echo "Usage: `basename $0` blend2d_repo_path"
  exit 1
fi

bindbc_blend2d_dir=`pwd`/../source/bindbc/blend2d
bindstatic_d=${bindbc_blend2d_dir}/bindstatic.d
bindstatic_load_d=`pwd`/bindstatic_load.d
binddynamic_d=${bindbc_blend2d_dir}/binddynamic.d

skip_list="blDefaultApproximationOptions,blFormatInfo,blMatrix2DMapPointDArrayFuncs,blNone,blPixelConverterConvert,blRuntimeAllocImpl,blRuntimeFreeImpl"

function gen_bindstatic
{
  dstep_exe=dstep
  if [ -n "$WSL_DISTRO_NAME" -o "$OSTYPE" == "cygwin" -o "$OSTYPE" == "msys" ]; then
    dstep_exe=dstep.exe
  fi

  pushd "$1"

  find . -maxdepth 1 -name '*.h' -a ! -name '*_p.h' -a ! -name '*-impl.h' -exec ${dstep_exe} --collision-action=ignore --space-after-function-name=false --comments=false {} +
  sed -E -i "s/^(struct .+;)/\/\/\1/" api.d
  sed -E -i "s/^(.* _Pragma\(.+;)/\/\/\1/" api.d

  cat >api.tmp <<EOL
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

EOL

  cat `echo *.d | sort` > api.d.tmp
  rm *.d

  grep -E "^enum [^;{]+$" api.d.tmp | sed -E "s/^enum ([^;{]+)$/mixin(expandEnum\!\1);/" >> api.tmp

  cat api.tmp api.d.tmp > "${bindstatic_d}"
  rm *.tmp

  popd
}

function grep_pfn
{
  pfn=$1
  fn=${pfn:0}

  IFS=',' read -ra skip_fns <<< "${skip_list}"
  for skip_fn in "${skip_fns[@]}"; do
    if [ "${fn}" = "${skip_fn}" ]; then
      echo "Skip ${fn}"
      return
    fi
  done

  fn_def=$(grep " $fn(" ${bindstatic_d} | tr -d "\r" | cut -d':' -f2)
  echo "extern(C) alias p$pfn = ${fn_def/$fn/function}" >> "${binddynamic_d}"
  echo "__gshared p$pfn $fn;" >> "${binddynamic_d}"
  echo "" >> "${binddynamic_d}"
  echo "    lib.bindSymbol_stdcall($fn, \"$pfn\");" >> "${bindstatic_load_d}"
}

function gen_binddynamic
{

  cat >"${binddynamic_d}" <<EOL
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


EOL

  for line in $(cat "$1"); do
    grep_pfn $(echo "$line" | tr -d "\r")
  done

  cat >>"${binddynamic_d}" <<EOL
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
        const(char)[][2] libNames = [
            "blend2d.dylib"
        ];
    }
    else version(Posix) {
        const(char)[][4] libNames = [
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

EOL

  cat "${bindstatic_load_d}" >> "${binddynamic_d}"
  rm "${bindstatic_load_d}"

  cat >>"${binddynamic_d}" <<EOL

    if(errorCount() != errCount) return Blend2DSupport.badLibrary;
    else loadedVersion = Blend2DSupport.bl00;

    return loadedVersion;
}
EOL

}

blend2d_repo_src=${blend2d_dir}/src/blend2d
functions="`pwd`/functions.txt"

gen_bindstatic "${blend2d_repo_src}"

gen_binddynamic "${functions}"

for line in $(cat "${functions}"); do
  fn=$(echo "$line" | tr -d "\r")
  sed -E -i "s/^(.* ${fn}\()/version(BindBlend2D_Static) \1/" "${bindstatic_d}"
done
