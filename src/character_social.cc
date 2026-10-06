#include "prelude.h"
#include "bachelorette.hh"
#include "character_info.hh"
#include "harvest_sprite.hh"
#include "npc.hh"

EC Npc * func_080A0A04(void * social_state);

EC Npc * func_080A06B0(void * social_state, unsigned int character_id)
{
    register unsigned int offset asm("r1");

    switch (character_id)
    {
    default: return 0;
    case CHARACTER_ID_CHILD: return func_080A0A04(social_state);
    case 1:  return reinterpret_cast<Npc *>(static_cast<u8 *>(social_state) + 0x070);
    case 2:  return reinterpret_cast<Npc *>(static_cast<u8 *>(social_state) + 0x084);
    case 3:  return reinterpret_cast<Npc *>(static_cast<u8 *>(social_state) + 0x098);
    case 4:  return reinterpret_cast<Npc *>(static_cast<u8 *>(social_state) + 0x0B0);
    case 5:  return reinterpret_cast<Npc *>(static_cast<u8 *>(social_state) + 0x0C4);
    case 6:  return reinterpret_cast<Npc *>(static_cast<u8 *>(social_state) + 0x0D8);
    case 7:  return reinterpret_cast<Npc *>(static_cast<u8 *>(social_state) + 0x0F0);
    case 8:  offset = 0x104; break;
    case 9:  offset = 0x118; break;
    case 10: offset = 0x12C; break;
    case 11: offset = 0x140; break;
    case 12: offset = 0x154; break;
    case 13: offset = 0x16C; break;
    case 14: offset = 0x180; break;
    case 15: offset = 0x194; break;
    case 16: offset = 0x1A8; break;
    case 17: offset = 0x1BC; break;
    case 18: offset = 0x1D0; break;
    case 19: offset = 0x1E4; break;
    case 20: offset = 0x1FC; break;
    case 21: offset = 0x210; break;
    case 22: offset = 0x228; break;
    case 23: offset = 0x23C; break;
    case 24: offset = 0x250; break;
    case 25: offset = 0x264; break;
    case 26: offset = 0x27C; break;
    case 27: offset = 0x290; break;
    case 28: offset = 0x2A8; break;
    case 29: offset = 0x2BC; break;
    case 30: offset = 0x2D0; break;
    case 31: offset = 0x2E4; break;
    case 32: offset = 0x2FC; break;
    case 33: offset = 0x310; break;
    case 34: offset = 0x328; break;
    case 36: offset = 0x33C; break;
    case 37: offset = 0x360; break;
    case 38: offset = 0x384; break;
    case 39: offset = 0x3A8; break;
    case 40: offset = 0x3CC; break;
    case 41: offset = 0x3F0; break;
    case 42: offset = 0x414; break;
    }

    return reinterpret_cast<Npc *>(static_cast<u8 *>(social_state) + offset);
}

EC Bachelorette * func_080A0878(void * social_state, unsigned int character_id)
{
    u8 * base = static_cast<u8 *>(social_state);

    switch (character_id)
    {
    default: return 0;
    case CHARACTER_ID_POPURI: return reinterpret_cast<Bachelorette *>(base + 0x098);
    case CHARACTER_ID_MARY: return reinterpret_cast<Bachelorette *>(base + 0x154);
    case CHARACTER_ID_KAREN: return reinterpret_cast<Bachelorette *>(base + 0x1E4);
    case CHARACTER_ID_ELLI: return reinterpret_cast<Bachelorette *>(base + 0x210);
    case CHARACTER_ID_ANN: return reinterpret_cast<Bachelorette *>(base + 0x264);
    case CHARACTER_ID_HARVEST_GODDESS: return reinterpret_cast<Bachelorette *>(base + 0x2E4);
    }
}

EC HarvestSprite * func_080A0930(void * social_state, unsigned int character_id)
{
    u8 * base = static_cast<u8 *>(social_state);

    switch (character_id)
    {
    default: return 0;
    case 36: return reinterpret_cast<HarvestSprite *>(base + 0x33C);
    case 37: return reinterpret_cast<HarvestSprite *>(base + 0x360);
    case 38: return reinterpret_cast<HarvestSprite *>(base + 0x384);
    case 39: return reinterpret_cast<HarvestSprite *>(base + 0x3A8);
    case 40: return reinterpret_cast<HarvestSprite *>(base + 0x3CC);
    case 41: return reinterpret_cast<HarvestSprite *>(base + 0x3F0);
    case 42: return reinterpret_cast<HarvestSprite *>(base + 0x414);
    }
}

EC HarvestSprite * func_080A099C(void * social_state, unsigned int sprite_id)
{
    u8 * base = static_cast<u8 *>(social_state);

    switch (sprite_id)
    {
    default: return 0;
    case 0: return reinterpret_cast<HarvestSprite *>(base + 0x33C);
    case 1: return reinterpret_cast<HarvestSprite *>(base + 0x360);
    case 2: return reinterpret_cast<HarvestSprite *>(base + 0x384);
    case 3: return reinterpret_cast<HarvestSprite *>(base + 0x3A8);
    case 4: return reinterpret_cast<HarvestSprite *>(base + 0x3CC);
    case 5: return reinterpret_cast<HarvestSprite *>(base + 0x3F0);
    case 6: return reinterpret_cast<HarvestSprite *>(base + 0x414);
    }
}

EC Npc * func_080A0A04(void * social_state)
{
    u8 * base = static_cast<u8 *>(social_state);
    int present = base[3] << 30;
    Npc * result = 0;

    if (present < 0)
        result = reinterpret_cast<Npc *>(base + 4);

    return result;
}
