import bindbc.blend2d;

import core.stdc.stdint;

int main() {
    Blend2DSupport ret = loadBlend2D();
    if (ret != blend2dSupport) {
        import std.stdio;

        if (ret == Blend2DSupport.noLibrary) {
            writeln("Blend2D: Shared library failed to load");
        }
        else if (Blend2DSupport.badLibrary) {
            writeln("Blend2D: One or more symbols failed to load");
        }

        return 1;
    }

    BLResult r;
    BLImageCore img;
    BLContextCore ctx;
    BLGradientCore gradient;

    r = blImageInitAs(&img, 256, 256, BLFormat.BL_FORMAT_PRGB32);
    if (r != BLResultCode.BL_SUCCESS)
        return 1;

    r = blContextInitAs(&ctx, &img, null);
    if (r != BLResultCode.BL_SUCCESS)
        return 1;

    BLLinearGradientValues values = { 0, 0, 256, 256 };
    r = blGradientInitAs(&gradient, BLGradientType.BL_GRADIENT_TYPE_LINEAR, &values, BLExtendMode.BL_EXTEND_MODE_PAD, null, 0, null);
    if (r != BLResultCode.BL_SUCCESS)
        return 1;

    blGradientAddStopRgba32(&gradient, 0.0, 0xFFFFFFFFU);
    blGradientAddStopRgba32(&gradient, 0.5, 0xFFFFAF00U);
    blGradientAddStopRgba32(&gradient, 1.0, 0xFFFF0000U);

    blContextSetFillStyle(&ctx, &gradient);
    blContextFillAll(&ctx);
    blGradientReset(&gradient);

    BLCircle circle;
    circle.cx = 128;
    circle.cy = 128;
    circle.r = 64;

    blContextSetCompOp(&ctx, BLCompOp.BL_COMP_OP_EXCLUSION);
    blContextSetFillStyleRgba32(&ctx, 0xFF00FFFFU);
    blContextFillGeometry(&ctx, BLGeometryType.BL_GEOMETRY_TYPE_CIRCLE, &circle);

    blContextEnd(&ctx);

    BLImageCodecCore codec;
    blImageCodecInit(&codec);
    blImageCodecFindByName(&codec, "BMP", SIZE_MAX, null);
    blImageWriteToFile(&img, "bl-capi-sample.bmp", &codec);
    blImageCodecReset(&codec);

    blImageReset(&img);
    return 0;
}
