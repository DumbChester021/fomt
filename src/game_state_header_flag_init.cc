#include "prelude.h"

// Packed bits in the first GameState header byte. Exact behavior is to
// clear bit 0 and enable bits 1, 2 and 3, preserving the other bits.
// Their higher-level event meanings are not yet established.
struct PackedHeaderFlagByte
{
    bool bit0 : 1;
    bool bit1 : 1;
    bool bit2 : 1;
    bool bit3 : 1;
    bool bit4 : 1;
};

EC void InitializePackedHeaderFlags(PackedHeaderFlagByte * flags)
    SECTION(".text.packed_header_flag_init");
EC void InitializePackedHeaderFlags(PackedHeaderFlagByte * flags)
{
    flags->bit0 = false;
    flags->bit1 = true;
    flags->bit2 = true;
    flags->bit3 = true;
}
EC void func_080114F8(PackedHeaderFlagByte * flags)
    ALIAS(InitializePackedHeaderFlags);
