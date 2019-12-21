module bindbc.blend2d;

public import bindbc.blend2d.types;

version(BindBC_Static) version = BindBlend2D_Static;
version(BindBlend2D_Static) public import bindbc.blend2d.bindstatic;
else public import bindbc.blend2d.binddynamic;
