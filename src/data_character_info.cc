#include "character_info.hh"

EXTERN_C
extern char const gUnk_08104108[];
extern char const gUnk_08104122[];
EXTERN_C_END

EC CharacterInfo const gCharacterInfo[CHARACTER_COUNT] =
{
    { gUnk_08104108, { SEASON_SPRING, 0 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 0: Empty
    { gUnk_08104122 + 0x006, { SEASON_SPRING, 19 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 1: Lillia
    { gUnk_08104122 + 0x00E, { SEASON_AUTUMN, 27 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 2: Rick
    { gUnk_08104122 + 0x016, { SEASON_SUMMER, 3 }, { SEASON_SUMMER, 10 }, { 0, 0 } }, // 3: Popuri
    { gUnk_08104122 + 0x01E, { SEASON_SPRING, 17 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 4: Barley
    { gUnk_08104122 + 0x026, { SEASON_WINTER, 26 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 5: May
    { gUnk_08104122 + 0x02A, { SEASON_SPRING, 11 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 6: Saibara
    { gUnk_08104122 + 0x032, { SEASON_WINTER, 6 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 7: Gray
    { gUnk_08104122 + 0x03A, { SEASON_WINTER, 15 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 8: Duke
    { gUnk_08104122 + 0x042, { SEASON_AUTUMN, 11 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 9: Manna
    { gUnk_08104122 + 0x04A, { SEASON_SUMMER, 11 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 10: Basil
    { gUnk_08104122 + 0x052, { SEASON_AUTUMN, 23 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 11: Anna
    { gUnk_08104122 + 0x05A, { SEASON_WINTER, 20 }, { SEASON_WINTER, 23 }, { 0, 0 } }, // 12: Mary
    { gUnk_08104122 + 0x062, { SEASON_SUMMER, 25 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 13: Thomas
    { gUnk_08104122 + 0x06A, { SEASON_SUMMER, 4 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 14: Harris
    { gUnk_08104122 + 0x072, { SEASON_WINTER, 13 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 15: Ellen
    { gUnk_08104122 + 0x07A, { SEASON_AUTUMN, 5 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 16: Stu
    { gUnk_08104122 + 0x07E, { SEASON_WINTER, 29 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 17: Jeff
    { gUnk_08104122 + 0x086, { SEASON_SPRING, 30 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 18: Sasha
    { gUnk_08104122 + 0x08E, { SEASON_AUTUMN, 15 }, { SEASON_AUTUMN, 23 }, { 0, 0 } }, // 19: Karen
    { gUnk_08104122 + 0x096, { SEASON_AUTUMN, 19 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 20: Doctor
    { gUnk_08104122 + 0x09E, { SEASON_SPRING, 16 }, { SEASON_SPRING, 20 }, { 0, 0 } }, // 21: Elli
    { gUnk_08104122 + 0x0A6, { SEASON_AUTUMN, 20 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 22: Carter
    { gUnk_08104122 + 0x0AE, { SEASON_SUMMER, 6 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 23: Cliff
    { gUnk_08104122 + 0x0B6, { SEASON_WINTER, 11 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 24: Doug
    { gUnk_08104122 + 0x0BE, { SEASON_SUMMER, 17 }, { SEASON_SUMMER, 22 }, { 0, 0 } }, // 25: Ann
    { gUnk_08104122 + 0x0C2, { SEASON_SUMMER, 22 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 26: Kai
    { gUnk_08104122 + 0x0C6, { SEASON_AUTUMN, 2 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 27: Gotz
    { gUnk_08104122 + 0x0CE, { SEASON_SUMMER, 29 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 28: Zack
    { gUnk_08104122 + 0x0D6, { SEASON_WINTER, 19 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 29: Won
    { gUnk_08104122 + 0x0DA, { SEASON_SPRING, 19 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 30: Gourmet
    { gUnk_08104122 + 0x0E2, { SEASON_SPRING, 8 }, { SEASON_SPRING, 9 }, { 0, 0 } }, // 31: H. Goddess
    { gUnk_08104122 + 0x0EE, { SEASON_SPRING, 19 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 32: Kappa
    { gUnk_08104122 + 0x0F6, { SEASON_SPRING, 19 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 33: Lou
    { gUnk_08104122 + 0x0FA, { SEASON_SPRING, 19 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 34: Lu
    { gUnk_08104108, { SEASON_SPRING, 0 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 35: Child
    { gUnk_08104122 + 0x0FE, { SEASON_SPRING, 15 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 36: Staid
    { gUnk_08104122 + 0x106, { SEASON_WINTER, 22 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 37: Nappy
    { gUnk_08104122 + 0x10E, { SEASON_SPRING, 4 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 38: Bold
    { gUnk_08104122 + 0x116, { SEASON_AUTUMN, 14 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 39: Chef
    { gUnk_08104122 + 0x11E, { SEASON_SPRING, 26 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 40: Aqua
    { gUnk_08104122 + 0x126, { SEASON_AUTUMN, 10 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 41: Hoggy
    { gUnk_08104122 + 0x12E, { SEASON_SUMMER, 16 }, { SEASON_SPRING, 0 }, { 0, 0 } }, // 42: Timid
};
