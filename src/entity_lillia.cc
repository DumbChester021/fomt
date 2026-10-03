#include "entity_npc.hh"
#include "entity_effect.hh"
#include "schedule_info.hh"

EC ScheduleInfo const gUnk_080F280C;

LilliaEntity::LilliaEntity(GameObject * game_object, Npc * npc, u32 context)
    : ANpcEntity(game_object, npc, context, &gUnk_080F280C, 0x25F, 0x263, 0x3E2)
{
}

UnknownEntityThing * LilliaEntity::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false);
}
