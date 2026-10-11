#include "prelude.h"

// Original GameState header bits 18..24 straddle bytes +2 and +3.
// The original compiler accesses this 16-bit aligned storage as a halfword.
struct __attribute__((packed, aligned(2))) PackedHeaderProgressB
{
    u16 lower : 2;
    u16 value : 7;
    u16 upper : 7;
};

EC unsigned IncreasePackedHeaderFieldB(u8 *header, unsigned requested)
    SECTION(".text.packed_header_progress_b");
EC unsigned IncreasePackedHeaderFieldB(u8 *header, unsigned requested)
{
    PackedHeaderProgressB *field =
        reinterpret_cast<PackedHeaderProgressB *>(header + 2);

    if (requested > 99)
        requested = 99;

    if (field->value < requested)
    {
        field->value = requested;
        return 1;
    }
    return 0;
}
EC unsigned func_08011498(u8 *header, unsigned requested)
    ALIAS(IncreasePackedHeaderFieldB);
