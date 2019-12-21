module bindbc.blend2d.binddynamic;

version(BindBlend2D_Static) {}
else version = BindBlend2D_Dynamic;

version(BindBlend2D_Dynamic):

import bindbc.loader;
import bindbc.blend2d.types;
/+
extern(C) @nogc nothrow {
    alias pglfwInit = int function();

}

 __gshared {
    pglfwInit glfwInit;
    pglfwTerminate glfwTerminate;
    pglfwGetVersion glfwGetVersion;
}

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

    lib.bindSymbol(cast(void**)&glfwInit,"glfwInit");
    lib.bindSymbol(cast(void**)&glfwTerminate,"glfwTerminate");
    lib.bindSymbol(cast(void**)&glfwGetVersion,"glfwGetVersion");

    if(errorCount() != errCount) return Blend2DSupport.badLibrary;
    else loadedVersion = Blend2DSupport.bl00;

    return loadedVersion;
}
+/