module bindbc.blend2d.types;

import bindbc.blend2d.bind.blapi : BL_VERSION;

enum Blend2DSupport {
    noLibrary,
    badLibrary,
    bl00 = 0,
}

auto BL_MAJOR_VERSION(uint ver) { return ver >> 16; }
auto BL_MINOR_VERSION(uint ver) { return (ver >> 8) & ((1 << 8) - 1); }
auto BL_PATCH_VERSION(uint ver) { return ver & ((1 << 8) - 1); }

enum BLEND2D_VERSION_MAJOR = BL_MAJOR_VERSION(BL_VERSION);
enum BLEND2D_VERSION_MINOR = BL_MINOR_VERSION(BL_VERSION);
enum BLEND2D_VERSION_REVISION = BL_PATCH_VERSION(BL_VERSION);

enum blend2dSupport = Blend2DSupport.bl00;
