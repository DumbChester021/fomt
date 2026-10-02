#include "water_region.hh"

EC int GetWaterRegion(Location const & location)
{
    int region = WATER_REGION_NONE;
    int x = location.GetX() / 8;
    int y = location.GetY() / 8;
    int index = 0;
    u32 map_id = location.GetMap();

    for (; index < 8; ++index)
    {
        if (map_id == gWaterRegionBounds[index].map_id
            && x >= gWaterRegionBounds[index].left
            && x <= gWaterRegionBounds[index].right
            && y >= gWaterRegionBounds[index].top
            && y <= gWaterRegionBounds[index].bottom)
        {
            region = gWaterRegionBounds[index].region_id;
            break;
        }
    }

    return region;
}
