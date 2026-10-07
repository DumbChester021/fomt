#include "mine_floor.hh"

extern u8 gUnk_086DC3C4[];
extern u8 gUnk_086DC3D0[];
extern u8 gUnk_086DC3DC[];
extern u8 gUnk_086DC3E8[];
extern u8 gUnk_086DC3F4[];

EC void const * func_0809E0AC(MineFloor const * floor, u32 x, u32 y)
{
    register u32 y_offset asm("r3") = y * 8;
    y_offset -= y;
    asm volatile("" : "+r"(y_offset));
    y_offset *= 8;
    y_offset += 4;

    u8 const * row = (u8 const *)floor + y_offset;
    u32 x_offset = x * 2;
    u16 raw = *(u16 const *)(row + x_offset);
    u32 type = ((u32)raw << 28) >> 28;

    switch (type)
    {
        case 0: return gUnk_086DC3C4;
        case 1: return gUnk_086DC3D0;
        case 2: return gUnk_086DC3DC;
        case 3: return gUnk_086DC3E8;
        case 4: return gUnk_086DC3F4;
        default: return 0;
    }
}
