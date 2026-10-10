#include "prelude.h"

EXTERN_C
void func_080D3800(void const * source, void * destination, unsigned int size);
void * func_080D3870(void const * source, void * destination, unsigned int size);
EXTERN_C_END

// The low-level SRAM writer copies then verifies up to three times.
// Return the address of the first mismatched byte, or null when verified.
EC void * WriteSramWithVerification(void const * source, void * destination, unsigned int size)
    SECTION(".text.sram_write_verify");
EC void * WriteSramWithVerification(void const * source, void * destination, unsigned int size)
{
    u8 attempt = 0;
    void * mismatch;
    while (attempt <= 2)
    {
        func_080D3800(source, destination, size);
        mismatch = func_080D3870(source, destination, size);
        if (mismatch == 0)
            break;
        ++attempt;
    }
    return mismatch;
}

EC void * func_080D38D4(void const * source, void * destination, unsigned int size)
    ALIAS(WriteSramWithVerification);
