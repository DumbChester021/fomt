#ifndef SAVED_SOCIAL_STATE_HH
#define SAVED_SOCIAL_STATE_HH

#include "prelude.h"
#include "npc.hh"
#include "bachelorette.hh"
#include "harvest_sprite.hh"

// Shared layout of the social record at GameState+0x1CD4.
struct NpcWithTrailingWord { Npc npc; u32 trailing_word; };

struct SavedSocialState
{
    struct PackedHeader {
        u32 flag_0_5:6;
        u32 flag_6_12:7;
        u32 flag_13_20:8;
        u32 flag_21:1;
        u32 flag_22_24:3;
        u32 flag_25:1;
        u32 flag_26_28:3;
        u32 reserved:3;
    } packed_header;
    struct FiveWords { u32 data[5]; } child_prefix; // +0x04
    char child_name[0x10]; // +0x18
    u8 child_values[2]; // +0x28..+0x29
    u8 child_active:1;
    u8 child_unused_bits:7;
    u8 child_unused_2b;
    u32 child_word_2c;
    struct ChildRecord { u8 bytes[8]; } child_chunks[8]; // +0x30..0x6F, neutral 8-byte records
    Npc lillia; // +0x70
    Npc rick; // +0x84
    Bachelorette popuri; // +0x98
    Npc barley; // +0xb0
    Npc may; // +0xc4
    NpcWithTrailingWord saibara; // +0xd8
    Npc gray; // +0xf0
    Npc duke; // +0x104
    Npc manna; // +0x118
    Npc basil; // +0x12c
    Npc anna; // +0x140
    Bachelorette mary; // +0x154
    Npc thomas; // +0x16c
    Npc harris; // +0x180
    Npc ellen; // +0x194
    Npc stu; // +0x1a8
    Npc jeff; // +0x1bc
    Npc sasha; // +0x1d0
    Bachelorette karen; // +0x1e4
    Npc doctor; // +0x1fc
    Bachelorette elli; // +0x210
    Npc carter; // +0x228
    Npc cliff; // +0x23c
    Npc doug; // +0x250
    Bachelorette ann; // +0x264
    Npc kai; // +0x27c
    NpcWithTrailingWord gotz; // +0x290
    Npc zack; // +0x2a8
    Npc won; // +0x2bc
    Npc gourmet; // +0x2d0
    Bachelorette goddess; // +0x2e4
    Npc kappa; // +0x2fc
    NpcWithTrailingWord lou; // +0x310
    Npc lu; // +0x328
    HarvestSprite staid; // +0x33c
    HarvestSprite nappy; // +0x360
    HarvestSprite bold; // +0x384
    HarvestSprite chef; // +0x3a8
    HarvestSprite aqua; // +0x3cc
    HarvestSprite hoggy; // +0x3f0
    HarvestSprite timid; // +0x414
    u8 suffix[0x38]; // +0x438
    u32 last_word; // +0x470
    u8 last_byte; // +0x474
    u8 tail_padding[3];
};
typedef char SocialSize[(sizeof(SavedSocialState) == 0x478) ? 1 : -1];
typedef char Offset_Lillia[(offsetof(SavedSocialState, lillia) == 0x70) ? 1 : -1];
typedef char Offset_Rick[(offsetof(SavedSocialState, rick) == 0x84) ? 1 : -1];
typedef char Offset_Popuri[(offsetof(SavedSocialState, popuri) == 0x98) ? 1 : -1];
typedef char Offset_Barley[(offsetof(SavedSocialState, barley) == 0xb0) ? 1 : -1];
typedef char Offset_May[(offsetof(SavedSocialState, may) == 0xc4) ? 1 : -1];
typedef char Offset_Saibara[(offsetof(SavedSocialState, saibara) == 0xd8) ? 1 : -1];
typedef char Offset_Gray[(offsetof(SavedSocialState, gray) == 0xf0) ? 1 : -1];
typedef char Offset_Duke[(offsetof(SavedSocialState, duke) == 0x104) ? 1 : -1];
typedef char Offset_Manna[(offsetof(SavedSocialState, manna) == 0x118) ? 1 : -1];
typedef char Offset_Basil[(offsetof(SavedSocialState, basil) == 0x12c) ? 1 : -1];
typedef char Offset_Anna[(offsetof(SavedSocialState, anna) == 0x140) ? 1 : -1];
typedef char Offset_Mary[(offsetof(SavedSocialState, mary) == 0x154) ? 1 : -1];
typedef char Offset_Thomas[(offsetof(SavedSocialState, thomas) == 0x16c) ? 1 : -1];
typedef char Offset_Harris[(offsetof(SavedSocialState, harris) == 0x180) ? 1 : -1];
typedef char Offset_Ellen[(offsetof(SavedSocialState, ellen) == 0x194) ? 1 : -1];
typedef char Offset_Stu[(offsetof(SavedSocialState, stu) == 0x1a8) ? 1 : -1];
typedef char Offset_Jeff[(offsetof(SavedSocialState, jeff) == 0x1bc) ? 1 : -1];
typedef char Offset_Sasha[(offsetof(SavedSocialState, sasha) == 0x1d0) ? 1 : -1];
typedef char Offset_Karen[(offsetof(SavedSocialState, karen) == 0x1e4) ? 1 : -1];
typedef char Offset_Doctor[(offsetof(SavedSocialState, doctor) == 0x1fc) ? 1 : -1];
typedef char Offset_Elli[(offsetof(SavedSocialState, elli) == 0x210) ? 1 : -1];
typedef char Offset_Carter[(offsetof(SavedSocialState, carter) == 0x228) ? 1 : -1];
typedef char Offset_Cliff[(offsetof(SavedSocialState, cliff) == 0x23c) ? 1 : -1];
typedef char Offset_Doug[(offsetof(SavedSocialState, doug) == 0x250) ? 1 : -1];
typedef char Offset_Ann[(offsetof(SavedSocialState, ann) == 0x264) ? 1 : -1];
typedef char Offset_Kai[(offsetof(SavedSocialState, kai) == 0x27c) ? 1 : -1];
typedef char Offset_Gotz[(offsetof(SavedSocialState, gotz) == 0x290) ? 1 : -1];
typedef char Offset_Zack[(offsetof(SavedSocialState, zack) == 0x2a8) ? 1 : -1];
typedef char Offset_Won[(offsetof(SavedSocialState, won) == 0x2bc) ? 1 : -1];
typedef char Offset_Gourmet[(offsetof(SavedSocialState, gourmet) == 0x2d0) ? 1 : -1];
typedef char Offset_Goddess[(offsetof(SavedSocialState, goddess) == 0x2e4) ? 1 : -1];
typedef char Offset_Kappa[(offsetof(SavedSocialState, kappa) == 0x2fc) ? 1 : -1];
typedef char Offset_Lou[(offsetof(SavedSocialState, lou) == 0x310) ? 1 : -1];
typedef char Offset_Lu[(offsetof(SavedSocialState, lu) == 0x328) ? 1 : -1];
typedef char Offset_Staid[(offsetof(SavedSocialState, staid) == 0x33c) ? 1 : -1];
typedef char Offset_Nappy[(offsetof(SavedSocialState, nappy) == 0x360) ? 1 : -1];
typedef char Offset_Bold[(offsetof(SavedSocialState, bold) == 0x384) ? 1 : -1];
typedef char Offset_Chef[(offsetof(SavedSocialState, chef) == 0x3a8) ? 1 : -1];
typedef char Offset_Aqua[(offsetof(SavedSocialState, aqua) == 0x3cc) ? 1 : -1];
typedef char Offset_Hoggy[(offsetof(SavedSocialState, hoggy) == 0x3f0) ? 1 : -1];
typedef char Offset_Timid[(offsetof(SavedSocialState, timid) == 0x414) ? 1 : -1];

#endif
