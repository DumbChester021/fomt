#include "prelude.h"
#include "npc.hh"
#include "bachelorette.hh"
#include "harvest_sprite.hh"
#include <string.h>

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
EC SavedSocialState * CopySavedSocialState(SavedSocialState * dest, SavedSocialState const * src)
    SECTION(".text.save_social_copy");
EC SavedSocialState * CopySavedSocialState(SavedSocialState * dest, SavedSocialState const * src)
{
    dest->packed_header.flag_0_5 = src->packed_header.flag_0_5;
    dest->packed_header.flag_6_12 = src->packed_header.flag_6_12;
    dest->packed_header.flag_13_20 = src->packed_header.flag_13_20;
    dest->packed_header.flag_21 = src->packed_header.flag_21;
    dest->packed_header.flag_22_24 = src->packed_header.flag_22_24;
    dest->packed_header.flag_25 = src->packed_header.flag_25;
    dest->packed_header.flag_26_28 = src->packed_header.flag_26_28;
    dest->child_prefix = src->child_prefix;
    strcpy(dest->child_name, src->child_name);
    u8 * child_dest = dest->child_values;
    *child_dest = src->child_values[0];
    u8 second_child_value = src->child_values[1];
    ++child_dest;
    *child_dest = second_child_value;
    dest->child_active = src->child_active;
    dest->child_word_2c = src->child_word_2c;
    dest->child_chunks[0] = src->child_chunks[0];
    dest->child_chunks[1] = src->child_chunks[1];
    dest->child_chunks[2] = src->child_chunks[2];
    dest->child_chunks[3] = src->child_chunks[3];
    dest->child_chunks[4] = src->child_chunks[4];
    dest->child_chunks[5] = src->child_chunks[5];
    dest->child_chunks[6] = src->child_chunks[6];
    dest->child_chunks[7] = src->child_chunks[7];
    dest->lillia = src->lillia;
    dest->rick = src->rick;
    dest->popuri = src->popuri;
    dest->barley = src->barley;
    dest->may = src->may;
    dest->saibara = src->saibara;
    dest->gray = src->gray;
    dest->duke = src->duke;
    dest->manna = src->manna;
    dest->basil = src->basil;
    dest->anna = src->anna;
    dest->mary = src->mary;
    dest->thomas = src->thomas;
    dest->harris = src->harris;
    dest->ellen = src->ellen;
    dest->stu = src->stu;
    dest->jeff = src->jeff;
    dest->sasha = src->sasha;
    dest->karen = src->karen;
    dest->doctor = src->doctor;
    dest->elli = src->elli;
    dest->carter = src->carter;
    dest->cliff = src->cliff;
    dest->doug = src->doug;
    dest->ann = src->ann;
    dest->kai = src->kai;
    dest->gotz = src->gotz;
    dest->zack = src->zack;
    dest->won = src->won;
    dest->gourmet = src->gourmet;
    dest->goddess = src->goddess;
    dest->kappa = src->kappa;
    dest->lou = src->lou;
    dest->lu = src->lu;
    dest->staid = src->staid;
    dest->nappy = src->nappy;
    dest->bold = src->bold;
    dest->chef = src->chef;
    dest->aqua = src->aqua;
    dest->hoggy = src->hoggy;
    dest->timid = src->timid;
    memcpy(dest->suffix, src->suffix, sizeof(dest->suffix));
    dest->last_word = src->last_word;
    dest->last_byte = src->last_byte;
    return dest;
}

EC SavedSocialState * func_080D60B0(SavedSocialState * dest, SavedSocialState const * src)
    ALIAS(CopySavedSocialState);
