#ifndef WATER_REGION_HH
#define WATER_REGION_HH

#include "actor.hh"

enum WaterRegion
{
    WATER_REGION_KAPPA_LAKE = 0,
    WATER_REGION_GODDESS_POND = 2,
    WATER_REGION_OCEAN = 4,
    WATER_REGION_HOT_SPRING = 6,
    WATER_REGION_NONE = 7,
};

struct WaterRegionBounds
{
    u32 map_id;
    i32 left;
    i32 top;
    i32 right;
    i32 bottom;
    int region_id;
};

EC WaterRegionBounds const gWaterRegionBounds[8] asm("gUnk_0810563C");
EC int GetWaterRegion(Location const & location) asm("func_080A45A8");

#endif
