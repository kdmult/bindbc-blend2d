module bindbc.blend2d;

public import bindbc.blend2d.types;

version(BindBC_Static) version = BindBlend2D_Static;
version(BindBlend2D_Dynamic) public import bindbc.blend2d.binddynamic;
public import bindbc.blend2d.bindstatic;
