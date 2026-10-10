#include "prelude.h"

// Comparison helper relocated to executable RAM for SRAM write verification.
// Return the first mismatched destination address, or null on a full match.
EC void * FindSramMismatch(u8 const * source, u8 const * destination, unsigned int size)
    SECTION(".text.sram_byte_compare");
EC void * FindSramMismatch(u8 const * source, u8 const * destination, unsigned int size)
{
    unsigned int remaining = size - 1;
    if (size)
    {
        do
        {
            if (*destination++ != *source++)
                return const_cast<u8 *>(destination - 1);
            --remaining;
        } while (remaining != ~0U);
    }
    return 0;
}
EC void * func_080D3840(u8 const * source, u8 const * destination, unsigned int size)
    ALIAS(FindSramMismatch);
