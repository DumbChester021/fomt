#include "character_info.hh"
#include "npc.hh"

EC ActorLocation GetCharacterLocation(void * social_state, unsigned int character_id)
{
    Npc * npc = GetCharacterNpc(social_state, character_id);

    if (npc != nullptr)
        return npc->GetLocation();

    return ActorLocation(Location(2, 0, 0), 0);
}

EC ActorLocation func_080A03B8(void * social_state, unsigned int character_id) ALIAS(GetCharacterLocation);
