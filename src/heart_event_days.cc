#include "prelude.h"
#include "bachelorette.hh"
#include "script_engine.hh"

EC Bachelorette * func_080A0878(void * social_state, unsigned int character_id);

EC unsigned int func_08045584(ScriptEngine * engine, unsigned int character_id, u8 rival_event)
{
    u8 * state = static_cast<u8 *>(engine->unk_350);
    Bachelorette * bachelorette = func_080A0878(state + 0x1CD4, character_id);

    if (bachelorette == 0)
        return 0;

    if (rival_event == 0)
    {
        if (bachelorette->GetPlayerEventCount() != 5)
            return 0;

        return bachelorette->GetDaysSincePlayerEvent_bugged();
    }

    if (bachelorette->GetRivalEventCount() != 4)
        return 0;

    return bachelorette->GetDaysSinceRivalEvent();
}
