#ifndef ENTITY_RESIDENT_NPCS_HH
#define ENTITY_RESIDENT_NPCS_HH

#include "entity_npc.hh"

#pragma interface

struct RickEntity : public ANpcEntity
{
    RickEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run1");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run1");
};

struct PopuriEntity : public ANpcEntity
{
    PopuriEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run1");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run2");
};

struct BarleyEntity : public ANpcEntity
{
    BarleyEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run2");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run2");
};

struct MayEntity : public ANpcEntity
{
    MayEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run2");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run2");
};

struct SaibaraEntity : public ANpcEntity
{
    SaibaraEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run2");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run2");
};

struct GrayEntity : public ANpcEntity
{
    GrayEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run2");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run2");
};

struct DukeEntity : public ANpcEntity
{
    DukeEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run2");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run2");
};

struct MannaEntity : public ANpcEntity
{
    MannaEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run2");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run2");
};

struct BasilEntity : public ANpcEntity
{
    BasilEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run2");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run2");
};

struct AnnaEntity : public ANpcEntity
{
    AnnaEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run2");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run2");
};

struct MaryEntity : public ANpcEntity
{
    MaryEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run2");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run3");
};

struct ThomasEntity : public ANpcEntity
{
    ThomasEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run3");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run3");
};

struct HarrisEntity : public ANpcEntity
{
    HarrisEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run3");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run3");
};

struct EllenEntity : public ANpcEntity
{
    EllenEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run3");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run3");
};

struct StuEntity : public ANpcEntity
{
    StuEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run3");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run3");
};

struct JeffEntity : public ANpcEntity
{
    JeffEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run3");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run3");
};

struct SashaEntity : public ANpcEntity
{
    SashaEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run3");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run3");
};

struct KarenEntity : public ANpcEntity
{
    KarenEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run3");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run4");
};

struct DoctorEntity : public ANpcEntity
{
    DoctorEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run4");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run4");
};

struct ElliEntity : public ANpcEntity
{
    ElliEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run4");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run5");
};

struct CarterEntity : public ANpcEntity
{
    CarterEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run5");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run5");
};

struct CliffEntity : public ANpcEntity
{
    CliffEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run5");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run6");
};

struct DougEntity : public ANpcEntity
{
    DougEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run6");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run6");
};

struct AnnEntity : public ANpcEntity
{
    AnnEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run6");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run7");
};

struct KaiEntity : public ANpcEntity
{
    KaiEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run7");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run7");
};

struct GotzEntity : public ANpcEntity
{
    GotzEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run7");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run8");
};

struct ZackEntity : public ANpcEntity
{
    ZackEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run8");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run8");
};

struct WonEntity : public ANpcEntity
{
    WonEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run9");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run9");
};

struct GourmetEntity : public ANpcEntity
{
    GourmetEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run9");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run9");
};

struct HarvestGoddessEntity : public ANpcEntity
{
    HarvestGoddessEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run9");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run9");
};

struct KappaEntity : public ANpcEntity
{
    KappaEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run9");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run9");
};

struct LuEntity : public ANpcEntity
{
    LuEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_resident_run6");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_resident_run6");
};


struct LouEntity : public ANpcEntity
{
    LouEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_special_run1");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.npc_special_run1");
};

struct ChildEntity : public ANpcEntity
{
    ChildEntity(GameObject * game_object, Npc * npc, u32 context) SECTION(".text.npc_special_run1");
    virtual UnknownEntityThing * vfunc_30();
    virtual void vfunc_3C(u32 arg) SECTION(".text.npc_special_run2");

    /* +48 */ u16 unk_48;
};

#endif // ENTITY_RESIDENT_NPCS_HH
