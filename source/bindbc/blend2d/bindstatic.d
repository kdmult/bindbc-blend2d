module bindbc.blend2d.bindstatic;

version(BindBC_Static) version = BindBlend2D_Static;
version(BindBlend2D_Static):

import bindbc.blend2d.types;

extern(C) @nogc nothrow {
    import bindbc.blend2d.bind;
    import bindbc.blend2d.bind.blapi_c_functions.d;
}
