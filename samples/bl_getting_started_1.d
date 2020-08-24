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


    // Clear the image.
    blContextSetCompOp(&ctx, BL_COMP_OP_SRC_COPY);
    blContextFillAll(&ctx);


    // Fill some path.
    BLPathCore path;
    blPathInit(&path);
    blPathMoveTo(&path, 26, 31);
    blPathCubicTo(&path, 642, 132, 587, -136, 25, 464);
    blPathCubicTo(&path, 882, 404, 144, 267, 27, 31);

    blContextSetCompOp(&ctx, BL_COMP_OP_SRC_OVER);
    blContextSetFillStyleRgba32(&ctx, 0xFFFFFFFFU);
    blContextFillPathD(&ctx, &path);

    // Detach the rendering context from `img`.
    blContextEnd(&ctx);

    // Let's use some built-in codecs provided by Blend2D.
    BLImageCodecCore codec;
    blImageCodecInit(&codec);
    blImageCodecFindByName(&codec, "BMP", SIZE_MAX, null);
    blImageWriteToFile(&img, "bl-getting-started-1.bmp", &codec);
    blImageCodecDestroy(&codec);
    blPathDestroy(&path);

    blImageDestroy(&img);

    return 0;
}
