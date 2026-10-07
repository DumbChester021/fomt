#include "mine_floor.hh"

#include "furniture.hh"
#include "item.hh"
#include "rucksack.hh"

EC bool func_0809DF2C(MineFloor const *, u32 content, u8 const * state)
{
    u32 result = 0;
    int tool_id = TOOL_NONE;

    switch (content)
    {
        case 4: tool_id = TOOL_CURSED_SICKLE; break;
        case 5: tool_id = TOOL_CURSED_HOE; break;
        case 6: tool_id = TOOL_CURSED_AXE; break;
        case 7: tool_id = TOOL_CURSED_HAMMER; break;
        case 8: tool_id = TOOL_CURSED_WATERING_CAN; break;
        case 9: tool_id = TOOL_CURSED_FISHING_ROD; break;
    }

    if (tool_id < TOOL_NONE)
    {
        Rucksack const & rucksack = *(Rucksack const *)(state + 0x1C38);
        if (rucksack.GetFirstSlotWithTool(tool_id) != (u32)-1)
            result = 1;

        ToolChest const & chest = *(ToolChest const *)(state + 0x380);
        if (chest.GetFirstSlotWith(tool_id) != (u32)-1)
            result = 1;
    }

    return result;
}

EC u8 func_0809DFAC(MineFloor const * floor)
{
    u8 result = 0;

    if (floor->goddess_jewel_floor_60) ++result;
    if (floor->goddess_jewel_floor_102) ++result;
    if (floor->goddess_jewel_floor_123) ++result;
    if (floor->goddess_jewel_floor_152) ++result;
    if (floor->goddess_jewel_floor_155) ++result;
    if (floor->goddess_jewel_floor_171) ++result;
    if (floor->goddess_jewel_floor_190) ++result;
    if (floor->goddess_jewel_floor_202) ++result;
    if (floor->goddess_jewel_floor_222) ++result;

    return result;
}

EC u8 func_0809E02C(MineFloor const * floor)
{
    u8 result = 0;

    if (floor->kappa_jewel_floor_0) ++result;
    if (floor->kappa_jewel_floor_40) ++result;
    if (floor->kappa_jewel_floor_60) ++result;
    if (floor->kappa_jewel_floor_80) ++result;
    if (floor->kappa_jewel_floor_120) ++result;
    if (floor->kappa_jewel_floor_140) ++result;
    if (floor->kappa_jewel_floor_160) ++result;
    if (floor->kappa_jewel_floor_180) ++result;
    if (floor->kappa_jewel_floor_255) ++result;

    return result;
}
