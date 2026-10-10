#include "save_persisted_layout.hh"

// Only occupied animal slots affect the result. Each existing animal must
// have affection above 199, including the dog and optional horse.
EC bool AllOwnedAnimalsHaveHighAffection(PersistedGameStateLayout const * state)
    SECTION(".text.game_state_animal_affection");
EC bool AllOwnedAnimalsHaveHighAffection(PersistedGameStateLayout const * state)
{
    bool result = true;

    if (state->dog.GetAffection() <= 199)
        result = false;

    Horse const * horse = state->farm.GetHorse();
    if (horse && horse->GetAffection() <= 199)
        result = false;

    u32 i = 0;
    Coop const & coop = state->farm.coop;
    for (; i < coop.GetCapacity(); ++i)
    {
        Chicken const * chicken = coop.GetChicken(i);
        if (chicken && chicken->GetAffection() <= 199)
            result = false;
    }

    i = 0;
    Barn const & barn = state->farm.barn;
    for (; i < barn.GetCapacity(); ++i)
    {
        Cow const * cow = barn.GetCow(i);
        if (cow)
        {
            if (cow->GetAffection() <= 199)
                result = false;
        }
        else
        {
            Sheep const * sheep = barn.GetSheep(i);
            if (sheep && sheep->GetAffection() <= 199)
                result = false;
        }
    }

    return result;
}
EC bool func_08010E68(PersistedGameStateLayout const * state)
    ALIAS(AllOwnedAnimalsHaveHighAffection);
