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

    r = blImageInitAs(&img, 480, 480, BL_FORMAT_PRGB32);
    if (r != BL_SUCCESS)
        return 1;

    r = blContextInitAs(&ctx, &img, null);
    if (r != BL_SUCCESS)
        return 1;

    blContextSetCompOp(&ctx, BL_COMP_OP_SRC_COPY);
    blContextFillAll(&ctx);

    // First shape filld by a radial gradient.
    BLGradientCore radial;
    BLRadialGradientValues radialValues = { 180, 180, 180, 180, 180 };
    r = blGradientInitAs(&radial, BL_GRADIENT_TYPE_RADIAL, &radialValues, BL_EXTEND_MODE_PAD, null, 0, null);
    if (r != BL_SUCCESS)
        return 1;

    blGradientAddStopRgba32(&radial, 0.0, 0xFFFFFFFFU);
    blGradientAddStopRgba32(&radial, 1.0, 0xFFFF6F3FU);

    BLCircle circle;
    circle.cx = 180;
    circle.cy = 180;
    circle.r = 160;

    blContextSetCompOp(&ctx, BL_COMP_OP_SRC_OVER);
    blContextSetFillStyle(&ctx, cast(BLStyleCore*)&radial);
    blContextFillGeometry(&ctx, BL_GEOMETRY_TYPE_CIRCLE, &circle);

    // Second shape filled by a linear gradient.
    BLGradientCore linear;
    BLLinearGradientValues linearValues = { 195, 195, 470, 470 };
    r = blGradientInitAs(&linear, BL_GRADIENT_TYPE_LINEAR, &linearValues, BL_EXTEND_MODE_PAD, null, 0, null);
    if (r != BL_SUCCESS)
        return 1;

    blGradientAddStopRgba32(&linear, 0.0, 0xFFFFFFFFU);
    blGradientAddStopRgba32(&linear, 1.0, 0xFF3F9FFFU);

    BLRoundRect rrect = { 195, 195, 270, 270, 25, 25 };

    blContextSetCompOp(&ctx, BL_COMP_OP_DIFFERENCE);
    blContextSetFillStyle(&ctx, cast(BLStyleCore*)&linear);
    blContextFillGeometry(&ctx, BL_GEOMETRY_TYPE_ROUND_RECT, &rrect);

    blContextEnd(&ctx);

    BLImageCodecCore codec;
    blImageCodecInit(&codec);
    blImageCodecFindByName(&codec, "BMP", SIZE_MAX, null);
    blImageWriteToFile(&img, "bl-getting-started-5.bmp", &codec);
    blImageCodecReset(&codec);

    blImageReset(&img);

    return 0;
}
