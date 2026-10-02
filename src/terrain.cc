#include "terrain.hh"

EC bool IsFootprintOnWaterSurface(TerrainMapView & terrain, i32 x, i32 y)
{
    int adjusted_y = y - 8;
    int top = adjusted_y;
    top >>= 3;
    int left = (x - 6) >> 3;
    int bottom = (y + 3) >> 3;
    int right = (x + 5) >> 3;

    if (top > bottom || left > right)
        return false;

    unsigned int width = terrain.width;
    if (top < 0 || left < 0
        || static_cast<u32>(bottom) >= terrain.height
        || static_cast<u32>(right) >= width)
        return false;

    TerrainInfo const * descriptors = terrain.terrain_info;
    if (descriptors == 0)
        return false;

    u8 const * cells = terrain.terrain_map;
    for (int row = top; row <= bottom; ++row)
    {
        for (int column = left; column <= right; ++column)
        {
            unsigned int index = column + row * width;
            TerrainInfo const * info;
            if (cells != 0)
                info = &descriptors[cells[index]];
            else
                info = &descriptors[index];

            if (!info->water_surface)
                return false;
        }
    }

    return true;
}
