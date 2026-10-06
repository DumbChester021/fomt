#include "entity_resident_npcs.hh"
#include "entity_effect.hh"
#include "schedule_info.hh"

EC ScheduleInfo const ScheduleInfo_Unk_080F1A80;
EC ScheduleInfo const gUnk_080F1FC0;
EC ScheduleInfo const gUnk_080F2AF8;
EC ScheduleInfo const gUnk_080F2DC0;
EC ScheduleInfo const gUnk_080F3010;
EC ScheduleInfo const gUnk_080F33B8;
EC ScheduleInfo const gUnk_080F3408;
EC ScheduleInfo const gUnk_080F35E4;
EC ScheduleInfo const gUnk_080F3FD8;
EC ScheduleInfo const gUnk_080F42F0;
EC ScheduleInfo const gUnk_080F43DC;
EC ScheduleInfo const gUnk_080F4974;
EC ScheduleInfo const gUnk_080F49C0;
EC ScheduleInfo const gUnk_080F4D74;
EC ScheduleInfo const gUnk_080F5540;
EC ScheduleInfo const gUnk_080F597C;
EC ScheduleInfo const gUnk_080F59CC;
EC ScheduleInfo const gUnk_080F5D94;
EC ScheduleInfo const gUnk_080F61FC;
EC ScheduleInfo const gUnk_080F6370;
EC ScheduleInfo const gUnk_080F66C4;
EC ScheduleInfo const gUnk_080F6B4C;
EC ScheduleInfo const gUnk_080F6DE8;
EC ScheduleInfo const gUnk_080F6FF8;
EC ScheduleInfo const gUnk_080F7294;
EC ScheduleInfo const gUnk_080F77FC;
EC ScheduleInfo const gUnk_080F7B40;
EC ScheduleInfo const gUnk_080F81BC;
EC ScheduleInfo const gUnk_080F8678;

EC void func_08035C04(PopuriEntity *);
EC void func_08036084(MaryEntity *);
EC void func_08036430(KarenEntity *);
EC void func_080365CC(ElliEntity *);
EC void func_08036768(CliffEntity *);
EC void func_08036900(AnnEntity *);
EC void func_08036AB4(GotzEntity *);

RickEntity::RickEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &ScheduleInfo_Unk_080F1A80, 0x213, 0x217, 0x3E0)
{
}

UnknownEntityThing * RickEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}

PopuriEntity::PopuriEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F1FC0, 0x22F, 0x233, 0x3E1)
{
}

UnknownEntityThing * PopuriEntity::vfunc_30()
{
    func_08035C04(this);
    return new UnknownEntityThing(this, 5, 0x1B, 1, 0, 0, false);
}

BarleyEntity::BarleyEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F8678, 0x9EF, 0x9F3, 0x406)
{
}

UnknownEntityThing * BarleyEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 3, 0, false);
}

MayEntity::MayEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F81BC, 0x9E7, 0x9EB, 0x405)
{
}

UnknownEntityThing * MayEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 1, 0, false);
}

SaibaraEntity::SaibaraEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F77FC, 0x9A1, 0x9A5, 0x403)
{
}

UnknownEntityThing * SaibaraEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}

GrayEntity::GrayEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F7294, 0x989, 0x98D, 0x402)
{
}

UnknownEntityThing * GrayEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 2, 0, false);
}

DukeEntity::DukeEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F6370, 0x8C0, 0x8C4, 0x3FC)
{
}

UnknownEntityThing * DukeEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}

MannaEntity::MannaEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F66C4, 0x8D0, 0x8D4, 0x3FD)
{
}

UnknownEntityThing * MannaEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}

BasilEntity::BasilEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F49C0, 0x80B, 0x80F, 0x3F5)
{
}

UnknownEntityThing * BasilEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 2, 0, false);
}

AnnaEntity::AnnaEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F5540, 0x84B, 0x84F, 0x3F7)
{
}

UnknownEntityThing * AnnaEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}

MaryEntity::MaryEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F4D74, 0x813, 0x817, 0x3F6)
{
}

UnknownEntityThing * MaryEntity::vfunc_30()
{
    func_08036084(this);
    return new UnknownEntityThing(this, 5, 0x1B, 1, 0, 0, false);
}

ThomasEntity::ThomasEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F59CC, 0x85F, 0x863, 0x3F9)
{
}

UnknownEntityThing * ThomasEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}

HarrisEntity::HarrisEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F6B4C, 0x8E4, 0x8E8, 0x3FF)
{
}

UnknownEntityThing * HarrisEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 2, 0, false);
}

EllenEntity::EllenEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F33B8, 0x685, 0x685, 0x3EE)
{
}

UnknownEntityThing * EllenEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 2, 0, false);
}

StuEntity::StuEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F61FC, 0x8B8, 0x8BC, 0x3FB)
{
}

UnknownEntityThing * StuEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 1, 0, false);
}

JeffEntity::JeffEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F3408, 0x689, 0x68D, 0x3EF)
{
}

UnknownEntityThing * JeffEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}

SashaEntity::SashaEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F3FD8, 0x6C5, 0x6C9, 0x3F1)
{
}

UnknownEntityThing * SashaEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}

KarenEntity::KarenEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F35E4, 0x691, 0x695, 0x3F0)
{
}

UnknownEntityThing * KarenEntity::vfunc_30()
{
    func_08036430(this);
    return new UnknownEntityThing(this, 5, 0x1B, 1, 0, 0, false);
}

DoctorEntity::DoctorEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F3010, 0x320, 0x324, 0x3E6)
{
}

UnknownEntityThing * DoctorEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}

ElliEntity::ElliEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F5D94, 0x884, 0x888, 0x3FA)
{
}

UnknownEntityThing * ElliEntity::vfunc_30()
{
    func_080365CC(this);
    return new UnknownEntityThing(this, 5, 0x1B, 1, 0, 0, false);
}

CarterEntity::CarterEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F6DE8, 0x8EC, 0x8F0, 0x400)
{
}

UnknownEntityThing * CarterEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}

CliffEntity::CliffEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F2AF8, 0x27B, 0x27F, 0x3E4)
{
}

UnknownEntityThing * CliffEntity::vfunc_30()
{
    func_08036768(this);
    return new UnknownEntityThing(this, 5, 0x1B, 1, 0, 0, false);
}

DougEntity::DougEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F42F0, 0x7B2, 0x7B6, 0x3F2)
{
}

UnknownEntityThing * DougEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}

LuEntity::LuEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F4974, 0x7F2, 0x7F6, 0x3F4)
{
}

UnknownEntityThing * LuEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}

AnnEntity::AnnEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F43DC, 0x7BE, 0x7C2, 0x3F3)
{
}

UnknownEntityThing * AnnEntity::vfunc_30()
{
    func_08036900(this);
    return new UnknownEntityThing(this, 5, 0x1B, 1, 0, 0, false);
}

KaiEntity::KaiEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F6FF8, 0x902, 0x906, 0x401)
{
}

UnknownEntityThing * KaiEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}

GotzEntity::GotzEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F7B40, 0x9D3, 0x9D7, 0x404)
{
}

UnknownEntityThing * GotzEntity::vfunc_30()
{
    func_08036AB4(this);
    return new UnknownEntityThing(this, 5, 0x1B, 1, 0, 0, false);
}

ZackEntity::ZackEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F2DC0, 0x318, 0x31C, 0x3E5)
{
}

UnknownEntityThing * ZackEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 2, 0, false);
}

WonEntity::WonEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F597C, 0x857, 0x85B, 0x3F8)
{
}

UnknownEntityThing * WonEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}

GourmetEntity::GourmetEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, 0, 0x679, 0x67D, 0x0)
{
}

UnknownEntityThing * GourmetEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 2, 0, false);
}

HarvestGoddessEntity::HarvestGoddessEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, 0, 0x669, 0x66D, 0x0)
{
}

UnknownEntityThing * HarvestGoddessEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}

KappaEntity::KappaEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, 0, 0x7FE, 0x7FE, 0x0)
{
}

UnknownEntityThing * KappaEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}
