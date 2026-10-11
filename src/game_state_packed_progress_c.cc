#include "prelude.h"

// Original GameState header bits 25..30 are a six-bit field in byte +3.
struct __attribute__((packed)) PackedHeaderProgressC {
    u8 lower : 1;
    u8 value : 6;
    u8 upper : 1;
};

EC unsigned IncreasePackedHeaderFieldC(u8 *header, unsigned requested)
    SECTION(".text.packed_header_progress_c");
EC unsigned IncreasePackedHeaderFieldC(u8 *header, unsigned requested)
{
    PackedHeaderProgressC *field =
        reinterpret_cast<PackedHeaderProgressC *>(header + 3);
    if (requested > 99)
        requested = 99;
    if (field->value < requested)
    {
        field->value = requested;
        return 1;
    }
    return 0;
}
EC unsigned func_080114C8(u8 *header, unsigned requested)
    ALIAS(IncreasePackedHeaderFieldC);
