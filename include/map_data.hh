#ifndef MAP_DATA_HH
#define MAP_DATA_HH

#include "prelude.h"

struct MapData;

EC u32 GetMapResourceId(
    i32 logical_map,
    u32 season,
    u32 farmhouse_upgrade,
    u32 coop_upgrade,
    u32 barn_upgrade)
    asm("func_0803A8A4");

EC MapData const * GetMapData(u32 resource_id);

#endif
