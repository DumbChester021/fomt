#include "prelude.h"

// The first packed progress field uses bits 13..17 of the GameState header.
// The original limits requested progress to 99, while the stored field
// truncates to five bits. Preserve that behavior exactly.
struct PackedProgressWord {
    u32 lower : 13;
    u32 count : 5;
    u32 higher : 14;
};

EC unsigned IncreasePackedHeaderProgress(PackedProgressWord *state, unsigned requested)
    SECTION(".text.packed_header_progress");
EC unsigned IncreasePackedHeaderProgress(PackedProgressWord *state, unsigned requested)
{
    if (requested > 99)
        requested = 99;

    if (state->count < requested)
    {
        state->count = requested;
        return 1;
    }

    return 0;
}
EC unsigned func_08011464(PackedProgressWord *state, unsigned requested)
    ALIAS(IncreasePackedHeaderProgress);
