#include "prelude.h"
#include "mine_floor.hh"

#include <stdlib.h>

// READABILITY WARNING: func_0809CF34 is byte-exact but not ordinary portable
// C++. Its fixed ARM registers, stack-addressed operands and inline assembly
// are unresolved historical matching debt. The typed MineFloor layout and
// simpler initializer are recoverable C++; do not model new work on the forced
// register technique. See docs/MINE_FLOOR.md and the compiler fingerprint.

struct ALIGN(4) MinePoint
{
    u8 x;
    u8 y;
};

static inline void SetMineTileType(MineTile & tile, u8 type)
{
    u8 * raw = (u8 *)&tile;
    register int mask asm("r0") = -16;
    asm volatile("" : "+r"(mask));
    mask &= raw[4];
    mask |= type;
    raw[4] = mask;
}

EC MineFloor * func_0809CE8C(MineFloor * self)
{
    self->layout = 0;

    self->unk_624_0 = 0;
    self->kappa_jewel_floor_0 = 0;
    self->kappa_jewel_floor_40 = 0;
    self->kappa_jewel_floor_60 = 0;
    self->kappa_jewel_floor_80 = 0;
    self->kappa_jewel_floor_120 = 0;
    self->kappa_jewel_floor_140 = 0;
    self->kappa_jewel_floor_160 = 0;
    self->kappa_jewel_floor_180 = 0;
    self->kappa_jewel_floor_255 = 0;
    self->unk_625_2 = 0;
    self->unk_625_3 = 0;
    self->unk_625_4 = 0;
    self->goddess_jewel_floor_60 = 0;
    self->goddess_jewel_floor_102 = 0;
    self->goddess_jewel_floor_123 = 0;
    self->goddess_jewel_floor_152 = 0;
    self->goddess_jewel_floor_155 = 0;
    self->goddess_jewel_floor_171 = 0;
    self->goddess_jewel_floor_190 = 0;
    self->goddess_jewel_floor_202 = 0;
    self->goddess_jewel_floor_222 = 0;

    for (u32 y = 0; y < 28; ++y)
    {
        for (u32 x = 0; x < 28; ++x)
        {
            self->tiles[y][x].bits.type = 0;
            self->tiles[y][x].bits.unk_04 = 0;
            self->tiles[y][x].bits.unk_0A = 0;
        }
    }

    return self;
}

EC u32 func_0809D8A4(MineFloor const * floor);
EC u32 func_0809D8B8(MineFloor const * floor);
EC void func_0809D168(MineFloor * floor, u32 level, u32 density, MinePoint const * exclusions);
EC void func_0809D500(MineFloor * floor, u32 level, u32 density, MinePoint const * exclusions);

EC MinePoint * func_0809CF34(
    MinePoint * out,
    MineFloor * floor,
    u32 mine,
    u32 level,
    MinePoint const *,
    u32 exclusion_count)
{
    register MineFloor * target asm("r6");
    register u32 floor_level asm("r8");
    register u32 count asm("r9");
    register u32 density asm("sl");
    MinePoint local_exclusions[12];
    u8 result[4] ALIGN(4);
    u32 mine_slot;

    asm volatile(
        ".syntax unified\n"
        "adds %0, %5, #0\n"
        "str %6, %3\n"
        "mov %1, %7\n"
        "ldr r0, %8\n"
        "mov %2, r0\n"
        ".syntax divided"
        : "=r"(target), "=r"(floor_level), "=r"(count), "=m"(mine_slot)
        : "m"(out), "r"(floor), "r"(mine), "r"(level), "m"(exclusion_count)
        : "r0", "memory");

    result[0] = 0;
    result[1] = 0;
    asm volatile("" : : : "sl");

    register MinePoint * point asm("r0") = local_exclusions;
    register int i asm("r2") = 11;
    register u8 zero asm("r1") = 0;
    register int minus_one asm("r3") = -1;
    do
    {
        point->x = zero;
        point->y = zero;
        ++point;
        --i;
    }
    while (i != minus_one);

    {
        register u32 row asm("r0") = 0;
        register int type_mask asm("r12") = -16;
        u32 xy_mask = 0xFFFFFC0F;
        register u32 upper_mask asm("r5") = 3;
        do
        {
            register u32 col asm("r3") = 0;
            register u32 offset asm("r1") = row << 3;
            register u32 next_row asm("r4") = row + 1;
            offset -= row;
            offset <<= 3;
            register u8 * base asm("r0");
            asm volatile(
                ".syntax unified\n"
                "adds %0, %1, #4\n"
                ".syntax divided"
                : "=r"(base)
                : "r"(target));
            register MineTile * tile asm("r2") = (MineTile *)(offset + (u32)base);
            do
            {
                register u32 value asm("r1") = ((u8 *)tile)[0];
                register u32 masked asm("r0") = type_mask;
                masked &= value;
                ((u8 *)tile)[0] = masked;

                value = tile->raw;
                masked = xy_mask;
                masked &= value;
                tile->raw = masked;

                value = ((u8 *)tile)[1];
                masked = upper_mask;
                masked &= value;
                ((u8 *)tile)[1] = masked;
                ++tile;
                ++col;
            }
            while (col <= 27);

            row = next_row;
        }
        while (row <= 27);
    }

    MinePoint const * exclusions;
    asm volatile("ldr %0, [sp, #0x5c]" : "=r"(exclusions));

    if (exclusions != nullptr)
    {
        for (u32 i = 0; i < count; ++i)
            local_exclusions[i] = exclusions[i];
    }

    register u32 invalid_coordinate asm("r3") = 0xFF;
    register MinePoint * transformed asm("r1") = local_exclusions;
    do
    {
        register u32 value asm("r2") = transformed->x;
        register u32 adjusted asm("r0") = (u8)(value - 2);
        if (adjusted > 55)
        {
            adjusted = value;
            adjusted |= invalid_coordinate;
        }
        else
        {
            adjusted = *(volatile u8 *)&transformed->x;
            adjusted -= 2;
            adjusted = (i32)adjusted >> 1;
        }
        transformed->x = adjusted;

        value = transformed->y;
        adjusted = (u8)(value - 7);
        if (adjusted > 55)
        {
            adjusted = value;
            adjusted |= invalid_coordinate;
        }
        else
        {
            adjusted = *(volatile u8 *)&transformed->y;
            adjusted -= 7;
            adjusted = (i32)adjusted >> 1;
        }
        transformed->y = adjusted;

        transformed = (MinePoint *)((u8 *)transformed + 4);
        register MinePoint * last asm("r0");
        asm volatile(
            ".syntax unified\n"
            "add %0, sp, #0x2c\n"
            ".syntax divided"
            : "=r"(last));
        if ((i32)transformed > (i32)last)
            break;
    }
    while (true);

    asm volatile(
        ".syntax unified\n"
        "mov r1, r8\n"
        "cmp r1, #0\n"
        "bne 1f\n"
        "str r1, [r6]\n"
        "movs r0, #0x14\n"
        "b 4f\n"
        "1:\n"
        "mov r1, r8\n"
        "cmp r1, #9\n"
        "bne 2f\n"
        "ldr r0, [sp, #0x38]\n"
        "cmp r0, #1\n"
        "bne 2f\n"
        "movs r0, #4\n"
        "str r0, [r6]\n"
        "movs r1, #0x28\n"
        "mov %0, r1\n"
        "b 5f\n"
        "2:\n"
        "mov r0, r8\n"
        "movs r1, #5\n"
        "bl __umodsi3\n"
        "cmp r0, #0\n"
        "bne 3f\n"
        "movs r0, #1\n"
        "str r0, [r6]\n"
        "movs r0, #0x96\n"
        "lsls r0, r0, #1\n"
        "b 4f\n"
        "3:\n"
        "mov r0, r8\n"
        "movs r1, #3\n"
        "bl __umodsi3\n"
        "cmp r0, #0\n"
        "bne 6f\n"
        "movs r0, #2\n"
        "str r0, [r6]\n"
        "movs r1, #0x64\n"
        "mov %0, r1\n"
        "b 5f\n"
        "6:\n"
        "movs r0, #3\n"
        "str r0, [r6]\n"
        "movs r0, #0x1e\n"
        "4:\n"
        "mov %0, r0\n"
        "5:\n"
        ".syntax divided"
        : "=r"(density)
        : "r"(target), "r"(floor_level)
        : "r0", "r1", "r2", "r3", "lr", "cc", "memory");

    asm volatile(
        ".syntax unified\n"
        "mov r1, r8\n"
        "cmp r1, #0\n"
        "beq 8f\n"
        "bl rand\n"
        "adds r4, r0, #0\n"
        "adds r0, r6, #0\n"
        "bl func_0809D8A4\n"
        "adds r1, r0, #0\n"
        "asrs r4, r4, #8\n"
        "subs r1, #2\n"
        "adds r0, r4, #0\n"
        "bl __umodsi3\n"
        "mov r9, r0\n"
        "mov r5, r9\n"
        "adds r5, #1\n"
        "bl rand\n"
        "adds r4, r0, #0\n"
        "adds r0, r6, #0\n"
        "bl func_0809D8B8\n"
        "adds r1, r0, #0\n"
        "asrs r4, r4, #8\n"
        "subs r1, #2\n"
        "adds r0, r4, #0\n"
        "bl __umodsi3\n"
        "adds r7, r0, #0\n"
        "adds r4, r7, #1\n"
        "lsls r2, r5, #1\n"
        "lsls r0, r4, #3\n"
        "subs r0, r0, r4\n"
        "lsls r0, r0, #3\n"
        "adds r2, r2, r0\n"
        "adds r2, r6, r2\n"
        "ldrb r1, [r2, #4]\n"
        "movs r0, #0x10\n"
        "rsbs r0, r0, #0\n"
        "ands r0, r1\n"
        "movs r1, #3\n"
        "orrs r0, r1\n"
        "strb r0, [r2, #4]\n"
        "bl rand\n"
        "asrs r1, r0, #8\n"
        "movs r0, #3\n"
        "ands r1, r0\n"
        "movs r0, #2\n"
        "ands r0, r1\n"
        "cmp r0, #0\n"
        "beq 2f\n"
        "movs r0, #1\n"
        "ands r1, r0\n"
        "cmp r1, #0\n"
        "beq 1f\n"
        "mov r5, r9\n"
        "b 4f\n"
        "1:\n"
        "adds r5, #1\n"
        "b 4f\n"
        "2:\n"
        "movs r0, #1\n"
        "ands r1, r0\n"
        "cmp r1, #0\n"
        "beq 3f\n"
        "adds r4, r7, #0\n"
        "b 4f\n"
        "3:\n"
        "adds r4, #1\n"
        "4:\n"
        "add r0, sp, #0x30\n"
        "strb r5, [r0]\n"
        "strb r4, [r0, #1]\n"
        "ldrb r1, [r0]\n"
        "lsls r1, r1, #1\n"
        "ldrb r2, [r0, #1]\n"
        "lsls r0, r2, #3\n"
        "subs r0, r0, r2\n"
        "lsls r0, r0, #3\n"
        "adds r1, r1, r0\n"
        "adds r1, r6, r1\n"
        "ldrb r2, [r1, #4]\n"
        "movs r0, #0x10\n"
        "rsbs r0, r0, #0\n"
        "ands r0, r2\n"
        "movs r2, #1\n"
        "orrs r0, r2\n"
        "strb r0, [r1, #4]\n"
        "8:\n"
        "ldr r1, [sp, #0x38]\n"
        "cmp r1, #0\n"
        "bne 5f\n"
        "adds r0, r6, #0\n"
        "mov r1, r8\n"
        "mov r2, sl\n"
        "mov r3, sp\n"
        "bl func_0809D168\n"
        "b 6f\n"
        "5:\n"
        "adds r0, r6, #0\n"
        "mov r1, r8\n"
        "mov r2, sl\n"
        "mov r3, sp\n"
        "bl func_0809D500\n"
        "6:\n"
        "mov r0, r8\n"
        "cmp r0, #0\n"
        "beq 7f\n"
        "add r0, sp, #0x30\n"
        "ldrb r1, [r0]\n"
        "lsls r1, r1, #1\n"
        "ldrb r2, [r0, #1]\n"
        "lsls r0, r2, #3\n"
        "subs r0, r0, r2\n"
        "lsls r0, r0, #3\n"
        "adds r1, r1, r0\n"
        "adds r1, r6, r1\n"
        "ldrb r2, [r1, #4]\n"
        "movs r0, #0x10\n"
        "rsbs r0, r0, #0\n"
        "ands r0, r2\n"
        "strb r0, [r1, #4]\n"
        "7:\n"
        ".syntax divided"
        :
        : "r"(target), "r"(floor_level), "r"(density)
        : "r0", "r1", "r2", "r3", "r4", "r5", "r7", "lr", "cc", "memory");

    register MinePoint * return_value asm("r0");
    asm volatile(
        "ldr r0, [sp, #0x30]\n"
        "ldr r1, %1\n"
        "str r0, [r1]\n"
        "ldr %0, %1"
        : "=r"(return_value)
        : "m"(out)
        : "r1", "memory");
    return return_value;
}
