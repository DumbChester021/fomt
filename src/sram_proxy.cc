#include "save_format.hh"

EXTERN_C
extern u16 gUnk_03000400;
extern u8 gUnk_03000402;
void func_080D379C(void const * source, void * destination, unsigned int size);
unsigned int func_080D100C(unsigned int index, unsigned int value);
EXTERN_C_END

// The retail entrypoint at 0x0800063C has no side effects.
EC void EmptySramHook(void * context) SECTION(".text.sram_bootstrap");
EC void EmptySramHook(void * context)
{
}
EC void func_0800063C(void * context) ALIAS(EmptySramHook);

// The first initialization call marks SRAM access as initialized and clears
// the error word. Subsequent calls preserve the existing error and flag.
EC void * BeginSramAccess(void * context) SECTION(".text.sram_bootstrap");
EC void * BeginSramAccess(void * context)
{
    if (gUnk_03000402 == 0)
    {
        gUnk_03000402 = 1;
        gUnk_03000400 = 0;
    }
    return context;
}
EC void * func_08000640(void * context) ALIAS(BeginSramAccess);

// The cartridge SRAM is mapped at 0x0E000000. Retail callers pass an
// SRAM-relative offset and separately inspect gUnk_03000400 for errors.
EC bool ReadSram(void * context, void * destination, unsigned int offset, unsigned int size)
    SECTION(".text.sram_read");
EC bool ReadSram(void * context, void * destination, unsigned int offset, unsigned int size)
{
    gUnk_03000400 = 0;
    if (size == 0)
        return false;

    func_080D379C(reinterpret_cast<void const *>(0x0E000000U | offset), destination, size);
    return true;
}

EC bool func_080006E4(void * context, void * destination, unsigned int offset, unsigned int size)
    ALIAS(ReadSram);

// Context byte +4 chooses one of four word slots (indices 3..6).
// The underlying exchange returns the previous word; the slot's higher
// level purpose is not established yet.
EC unsigned int ReplaceSramContextWord(void * context, unsigned int value)
    SECTION(".text.sram_context_word");
EC unsigned int ReplaceSramContextWord(void * context, unsigned int value)
{
    unsigned int selector = reinterpret_cast<u8 const *>(context)[4];
    return func_080D100C((selector & 3) + 3, value);
}
EC unsigned int func_08000714(void * context, unsigned int value)
    ALIAS(ReplaceSramContextWord);

 // The original switch uses a non-numeric case layout. Keeping this order
 // reproduces the retail Thumb dispatch and error-word update exactly.
EC void OrSramErrorFlag(void * context, unsigned int error) SECTION(".text.sram_error_flags");
EC void OrSramErrorFlag(void * context, unsigned int error)
{
    u16 flag = error;
    switch (flag)
    {
    case 1: gUnk_03000400 |= 1; break;
    case 2: gUnk_03000400 |= 2; break;
    case 256:
    case 512: gUnk_03000400 |= flag; break;
    case 4: gUnk_03000400 |= 4; break;
    case 32: gUnk_03000400 |= 32; break;
    case 8: gUnk_03000400 |= 8; break;
    case 16: gUnk_03000400 |= 16; break;
    case 64: gUnk_03000400 |= 64; break;
    case 128: gUnk_03000400 |= 128; break;
    }
}
EC void func_08000728(void * context, unsigned int error) ALIAS(OrSramErrorFlag);
