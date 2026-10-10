#include "prelude.h"

// Byte-copy routine used by the SRAM reader when relocated to executable RAM.
// The count is kept in the original decrement-to-sentinel form.
EC void CopySramBytes(u8 const * source, u8 * destination, unsigned int size)
    SECTION(".text.sram_byte_copy");
EC void CopySramBytes(u8 const * source, u8 * destination, unsigned int size)
{
    unsigned int remaining = size - 1;
    if (size)
    {
        do
        {
            *destination++ = *source++;
            --remaining;
        } while (remaining != ~0U);
    }
}
EC void func_080D3778(u8 const * source, u8 * destination, unsigned int size)
    ALIAS(CopySramBytes);
