#include "unknown_types.hh"

EC MapData const gMapData[66] asm("gUnk_08105EDC");

EC MapData const * GetMapData(u32 map_id)
{
    return &gMapData[map_id];
}
