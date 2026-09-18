#include "save_format.hh"

EC unsigned int GetSaveSlotOffset(void const *, unsigned int slot)
{
    unsigned int slot_size = SAVE_SLOT_SIZE;
    asm("" : "+r"(slot_size));
    return SAVE_HEADER_SIZE + slot * slot_size;
}

EC unsigned int func_080003DC(void const * save_context, unsigned int slot) ALIAS(GetSaveSlotOffset);
