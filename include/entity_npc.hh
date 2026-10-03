#ifndef ENTITY_NPC_HH
#define ENTITY_NPC_HH

#include "prelude.h"
#include "entity_actor.hh"
#include "npc.hh"

#pragma interface

struct UnkNpcSchedule;

struct ANpcEntity : public AActorEntity
{
    ANpcEntity(GameObject * game_object, Npc * npc, u32 arg_3, void const * arg_4, u32 anim_id, u32 arg_6, u32 arg_7);
    ~ANpcEntity();

    /* vt+3C */ virtual void vfunc_3C(u32 unk_arg_1);

    /* +30 */ Npc * npc;
    /* +34 */ u32 unk_34;
    /* +38 */ UnkNpcSchedule const * unk_38;
    /* +3C */ u8 unk_3C; /* current schedule */
    /* +3D */ u8 unk_3D; /* current path */
    /* +3E */ u8 unk_3E; /* current path point */
    /* +3F */ u8 unk_3F; /* is frozen? */
    /* +40 */ u16 unk_40;
    /* +42 */ u16 unk_42;
    /* +44 */ u16 unk_44; /* moving anim? */
    /* +46 */ u16 unk_46; /* frozen anim? */
};


struct LilliaEntity : public ANpcEntity
{
    LilliaEntity(GameObject * game_object, Npc * npc, u32 context);
    virtual UnknownEntityThing * vfunc_30();
};

#endif // ENTITY_NPC_HH
