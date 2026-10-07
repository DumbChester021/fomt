#include "mine_floor.hh"

EC u32 func_0809D8A0(MineFloor const * floor)
{
    return floor->layout;
}

EC u32 func_0809D8A4(MineFloor const * floor)
{
    u32 result = 13;
    if (floor->layout == 1)
        result = 28;
    return result;
}

EC u32 func_0809D8B8(MineFloor const * floor)
{
    u32 result = 6;
    if (floor->layout == 1)
        result = 28;
    else if (floor->layout == 2)
        result = 14;
    return result;
}

EC u32 func_0809D8D4(MineFloor const * floor, u32 x, u32 y)
{
    return floor->tiles[y][x].bits.type;
}
