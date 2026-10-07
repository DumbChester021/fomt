#pragma once

#include "prelude.h"

struct PACKED ALIGN(2) MineTileBits
{
    u16 type : 4;
    u16 unk_04 : 6;
    u16 unk_0A : 6;
};

union PACKED ALIGN(2) MineTile
{
    u16 raw;
    MineTileBits bits;
};

struct MineFloor
{
    u32 layout;
    MineTile tiles[28][28];

    u32 unk_624_0 : 1;
    u32 kappa_jewel_floor_0 : 1;
    u32 kappa_jewel_floor_40 : 1;
    u32 kappa_jewel_floor_60 : 1;
    u32 kappa_jewel_floor_80 : 1;
    u32 kappa_jewel_floor_120 : 1;
    u32 kappa_jewel_floor_140 : 1;
    u32 kappa_jewel_floor_160 : 1;
    u32 kappa_jewel_floor_180 : 1;
    u32 kappa_jewel_floor_255 : 1;
    u32 unk_625_2 : 1;
    u32 unk_625_3 : 1;
    u32 unk_625_4 : 1;
    u32 goddess_jewel_floor_60 : 1;
    u32 goddess_jewel_floor_102 : 1;
    u32 goddess_jewel_floor_123 : 1;
    u32 goddess_jewel_floor_152 : 1;
    u32 goddess_jewel_floor_155 : 1;
    u32 goddess_jewel_floor_171 : 1;
    u32 goddess_jewel_floor_190 : 1;
    u32 goddess_jewel_floor_202 : 1;
    u32 goddess_jewel_floor_222 : 1;
    u32 unk_626_6 : 10;

    MineTile & At(u32 x, u32 y)
    {
        return *(MineTile *)((u8 *)this + (x + y * 28) * sizeof(MineTile));
    }
};

EC u32 func_0809D8A0(MineFloor const * floor);
EC u32 func_0809D8A4(MineFloor const * floor);
EC u32 func_0809D8B8(MineFloor const * floor);
EC u32 func_0809D8D4(MineFloor const * floor, u32 x, u32 y);
EC u32 func_0809D9B4(MineFloor * floor, u32 x, u32 y, void * context);
