import bindbc.blend2d;

import core.stdc.stdint;

int main() {
    version(BindBlend2D_Dynamic) {
        Blend2DSupport ret = loadBlend2D();
        if (ret != blend2dSupport) {
            import core.stdc.stdio : printf;

            if (ret == Blend2DSupport.noLibrary) {
                printf("Blend2D: Shared library failed to load\n");
            }
            else if (Blend2DSupport.badLibrary) {
                printf("Blend2D: One or more symbols failed to load\n");
            }

            return 1;
        }
    }

    BLResult r;
    BLImageCore img;
    BLContextCore ctx;
    BLGradientCore gradient;

    r = blImageInitAs(&img, 256, 256, BL_FORMAT_PRGB32);
    if (r != BL_SUCCESS)
        return 1;

    r = blContextInitAs(&ctx, &img, null);
    if (r != BL_SUCCESS)
        return 1;

    BLLinearGradientValues values = { 0, 0, 256, 256 };
    r = blGradientInitAs(&gradient, BL_GRADIENT_TYPE_LINEAR, &values, BL_EXTEND_MODE_PAD, null, 0, null);
    if (r != BL_SUCCESS)
        return 1;

    blGradientAddStopRgba32(&gradient, 0.0, 0xFFFFFFFFU);
    blGradientAddStopRgba32(&gradient, 0.5, 0xFFFFAF00U);
    blGradientAddStopRgba32(&gradient, 1.0, 0xFFFF0000U);

    blContextSetFillStyle(&ctx, &gradient);
    blContextFillAll(&ctx);
    blGradientDestroy(&gradient);

    BLCircle circle;
    circle.cx = 128;
    circle.cy = 128;
    circle.r = 64;

    blContextSetCompOp(&ctx, BL_COMP_OP_EXCLUSION);
    blContextSetFillStyleRgba32(&ctx, 0xFF00FFFFU);
    blContextFillGeometry(&ctx, BL_GEOMETRY_TYPE_CIRCLE, &circle);

    blContextEnd(&ctx);

    BLImageCodecCore codec;
    blImageCodecInit(&codec);
    blImageCodecFindByName(&codec, "BMP", SIZE_MAX, null);
    blImageWriteToFile(&img, "bl-capi-sample.bmp", &codec);
    blImageCodecDestroy(&codec);

    blImageDestroy(&img);
    return 0;
}
