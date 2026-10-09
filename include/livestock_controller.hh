#pragma once

#include "scene_owners.hh"
#include "utility/fixed_str.hh"

#pragma interface

struct ControllerBarnContext;

// Shared controller extent; fields beyond the context are not yet recovered.
struct ControllerC7F58 : public SceneController
{
    ControllerC7F58(void *);
    virtual ~ControllerC7F58();
    /* +0008 */ ControllerBarnContext * context;
    /* +000C */ u8 unk_000C[0x698];
};

struct LivestockMenuRecord
{
    LivestockMenuRecord() {}
    u32 unk_00;
    u8 unk_04[0x300];
};

struct LivestockAnimalRecord
{
    u32 unk_00;
    FixedStr<127> text;
};

struct LivestockController : public ControllerC7F58
{
    LivestockController(void *, u32) SECTION(".text.livestock_controller_lifecycle");
    virtual ~LivestockController() SECTION(".text.livestock_controller_lifecycle");
    /* +06A4 */ u32 state;
    /* +06A8 */ bool unk_06A8;
    /* +06AC */ u8 unk_06AC[0x80];
    /* +072C */ u32 unk_072C;
    /* +0730 */ u8 unk_0730[0x40];
    /* +0770 */ LivestockMenuRecord rows[17];
    /* +3AB4 */ FixedStr<127> title;
    /* +3B34 */ FixedStr<99> message;
    /* +3B98 */ LivestockAnimalRecord animals[16];
    /* +43D8 */ u32 purchased_animal_type;
    /* +43DC */ u32 purchased_animal_slot;
};

extern u32 GetAnimalHeartCount(const SceneController *, u32) asm("func_08085EC4")
    SECTION(".text.livestock_controller_results");
extern u32 GetPurchasedAnimalType(const SceneController *) asm("func_08085EEC")
    SECTION(".text.livestock_controller_results");
extern u32 GetAnimalSalePrice(const SceneController *, u32, u32) asm("func_080868E4")
    SECTION(".text.livestock_controller_stats");
extern u32 CountPregnantAnimals(const SceneController *) asm("func_080869A0")
    SECTION(".text.livestock_controller_stats");
