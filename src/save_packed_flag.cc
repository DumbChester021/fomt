#include "prelude.h"

// Marks bit 4 in the first byte of this saved packed-state record.
// The specific gameplay meaning of the flag is not yet identified.
EC void MarkSavedPackedFlag(u8 * flags) SECTION(".text.saved_packed_flag");
EC void MarkSavedPackedFlag(u8 * flags)
{
    *flags |= 0x10;
}
EC void func_08011458(u8 * flags) ALIAS(MarkSavedPackedFlag);
