#ifndef TERRAIN_HH
#define TERRAIN_HH

#include "prelude.h"

struct TerrainInfo
{
    /* bit 00 */ u32 solid : 1;
    /* bit 01 */ u32 water_surface : 1;
    /* bit 02 */ u32 contact_script : 15;
    /* bit 17 */ u32 interaction_script : 15;
};

struct TerrainMapView
{
    /* +00 */ TerrainInfo const * terrain_info;
    /* +04 */ u8 const * terrain_map;
    /* +08 */ u16 width;
    /* +0A */ u16 height;
};

EC bool IsFootprintOnWaterSurface(TerrainMapView & terrain, i32 x, i32 y)
    asm("func_080AC5D0");

#endif
