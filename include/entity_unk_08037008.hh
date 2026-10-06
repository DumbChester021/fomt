#ifndef ENTITY_UNK_08037008_HH
#define ENTITY_UNK_08037008_HH

#include "entity_actor.hh"

#pragma interface

struct UnkEntity37008 : public AActorEntity
{
    UnkEntity37008(GameObject * game_object, ActorLocation & location, u32 arg_3, u32 arg_4)
        SECTION(".text.entity_locbound_run1");
    virtual ~UnkEntity37008() SECTION(".text.entity_locbound_run1");

    virtual Box GetBox() const SECTION(".text.entity_locbound_run2");
    virtual void vfunc_10() SECTION(".text.entity_locbound_run2");
    virtual void vfunc_14() SECTION(".text.entity_locbound_run2");
    virtual u32 vfunc_34() SECTION(".text.entity_locbound_run2");
    virtual void vfunc_3C() = 0;
    virtual u32 vfunc_40() = 0;

    /* +30 */ ActorLocation * location_ref;
    /* +34 */ Box unk_34;
    /* +3C */ u16 unk_3C;
    /* +3E */ u16 unk_3E;
    /* +40 */ bool unk_40;
};

struct UnkEntity72E4 : public UnkEntity37008
{
    UnkEntity72E4(GameObject *, ActorLocation &, u32);
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.entity_locbound_run3");
    virtual void vfunc_3C();
    virtual u32 vfunc_40();
    u32 GetAnim(u32 index) SECTION(".text.entity_locbound_run3b");
    u32 GetSpeed(u32 index) SECTION(".text.entity_locbound_run3b");

    /* +44 */ u8 unk_44 : 2;
};

struct UnkEntity72A0 : public UnkEntity37008
{
    UnkEntity72A0(GameObject *, ActorLocation &, u32);
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.entity_locbound_run4");
    virtual void vfunc_3C();
    virtual u32 vfunc_40();
    u32 GetAnim(u32 index) SECTION(".text.entity_locbound_run4b");
    u32 GetSpeed(u32 index) SECTION(".text.entity_locbound_run4b");

    /* +44 */ u8 unk_44 : 2;
};

struct UnkEntity725C : public UnkEntity37008
{
    UnkEntity725C(GameObject *, ActorLocation &) SECTION(".text.entity_locbound_run8");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.entity_locbound_run5");
    virtual void vfunc_3C() SECTION(".text.entity_locbound_run5");
    virtual u32 vfunc_40();
    u32 GetAnim(u32 index) SECTION(".text.entity_locbound_run5");
    u32 GetSpeed(u32 index) SECTION(".text.entity_locbound_run5");

    /* +44 */ u8 unk_44;
};

struct UnkEntity7218 : public UnkEntity37008
{
    UnkEntity7218(GameObject *, ActorLocation &) SECTION(".text.entity_locbound_run8");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.entity_locbound_run6");
    virtual void vfunc_3C() SECTION(".text.entity_locbound_run6");
    virtual u32 vfunc_40();
    u32 GetAnim(u32 index) SECTION(".text.entity_locbound_run6");
    u32 GetSpeed(u32 index) SECTION(".text.entity_locbound_run6");

    /* +44 */ u8 unk_44;
};

#endif // ENTITY_UNK_08037008_HH
