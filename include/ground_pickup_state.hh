#pragma once

#include "prelude.h"

struct PACKED ALIGN(4) GroundPickupState
{
    u8 available[7];

    u32 durability_0 : 3;
    u32 durability_1 : 3;
    u32 durability_2 : 3;
    u32 durability_3 : 3;
    u32 durability_4 : 3;
    u32 durability_5 : 3;
    u32 durability_6 : 3;
    u32 durability_7 : 3;
    u32 durability_8 : 3;
    u32 durability_9 : 3;
    u32 durability_10 : 3;
    u32 durability_11 : 3;
    u32 durability_12 : 3;
    u32 durability_13 : 3;
    u32 durability_14 : 3;
};

EC void func_080A1A48(GroundPickupState * self);
EC void func_080A1A4C(GroundPickupState * self);
EC u32 func_080A1EF4(GroundPickupState const * self, u32 index);
EC void func_080A1FC4(GroundPickupState * self, u32 index, int amount);
