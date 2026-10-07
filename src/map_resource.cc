#include "unknown_types.hh"
#include "map_data.hh"

EC u32 GetMapResourceId(
    i32 logical_map,
    u32 season,
    u32 farmhouse_upgrade,
    u32 coop_upgrade,
    u32 barn_upgrade)
{
    if ((u32)(logical_map - 0x34) <= 0x1FF)
    {
        u32 floor;
        i32 second_mine;

        if (logical_map > 0x133)
        {
            floor = logical_map - 0x134;
            second_mine = 1;
        }
        else
        {
            floor = logical_map - 0x34;
            second_mine = 0;
        }

        if (floor == 0)
            return 0x38;
        if (floor == 9 && second_mine == 1)
            return 0x3D;
        if (floor % 5 == 0)
            return 0x39;
        if (floor % 3 == 0)
            return 0x3A;
        return 0x3B;
    }

    switch (logical_map)
    {
    case 2: return season == SEASON_WINTER ? 0x01 : 0x00;
    case 6: return season != SEASON_WINTER ? 0x02 : 0x03;
    case 5: return season != SEASON_WINTER ? 0x04 : 0x05;
    case 7: return season != SEASON_WINTER ? 0x06 : 0x07;
    case 1: return season != SEASON_WINTER ? 0x08 : 0x09;
    case 3: return season != SEASON_WINTER ? 0x0C : 0x0D;
    case 4: return season != SEASON_WINTER ? 0x0A : 0x0B;
    case 0: return season != SEASON_WINTER ? 0x0E : 0x0F;
    case 8: return season != SEASON_WINTER ? 0x10 : 0x11;

    case 17:
        switch (coop_upgrade)
        {
        case 0: return 0x24;
        case 1: return 0x25;
        default: return 0;
        }

    case 37:
        switch (barn_upgrade)
        {
        case 0: return 0x26;
        case 1: return 0x27;
        default: return 0;
        }

    case 29:
        switch (farmhouse_upgrade)
        {
        case 0: return 0x29;
        case 1: return 0x2A;
        case 2: return 0x2B;
        default: return 0;
        }

    case 31: return 0x12;
    case 32: return 0x13;
    case 33: return 0x14;
    case 34: return 0x15;
    case 21: return 0x16;
    case 22: return 0x17;
    case 23: return 0x18;
    case 15: return 0x19;
    case 16: return 0x1A;
    case 36: return 0x1B;
    case 13: return 0x1C;
    case 19: return 0x1D;
    case 20: return 0x1E;
    case 12: return 0x1F;
    case 24: return 0x20;
    case 25: return 0x21;
    case 26: return 0x22;
    case 27: return 0x23;
    case 9: return 0x28;
    case 10: return 0x2C;
    case 11: return 0x2D;
    case 41: return 0x2E;
    case 42: return 0x2F;
    case 38: return 0x30;
    case 40: return 0x31;
    case 30: return 0x32;
    case 14: return 0x33;
    case 28: return 0x34;
    case 18: return 0x35;
    case 35: return 0x36;
    case 39: return 0x37;
    case 43: return 0x3C;
    case 48: return 0x3E;
    case 49: return 0x3F;
    case 50: return 0x40;
    case 51: return 0x41;
    case 44:
    case 45:
    case 46:
        return 0x10;
    case 47:
        return 0x11;

    default:
        return 0;
    }
}
