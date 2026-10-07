#include "mine_floor.hh"

EC u32 func_0809DA00(MineFloor * floor, u32 content, void * context);

EC u32 func_0809D9B4(MineFloor * floor, u32 x, u32 y, void * context)
{
    u32 result = 0;
    u32 x_offset = x * 2;
    u32 y_offset = (y * 7) * 8;
    u32 offset = x_offset + y_offset;
    MineFloor * tile_floor = (MineFloor *)((u8 *)floor + offset);
    MineTile & tile = tile_floor->tiles[0][0];

    u32 type = ((u32)*((u8 *)&tile) << 28) >> 28;
    if (type == 4)
    {
        result = func_0809DA00(floor, tile.bits.unk_04, context);
        tile.bits.type = 0;
        tile.bits.unk_04 = 0;
    }

    return result;
}
