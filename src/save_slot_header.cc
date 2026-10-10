#include "save_format.hh"

EXTERN_C
extern u16 gUnk_03000400;
bool func_080006E4(void * context, void * destination, unsigned int offset, unsigned int size);
bool func_080006A4(void * context, unsigned int offset, void const * source, unsigned int size);
bool func_080002E0(void * context);
EXTERN_C_END

extern "C" char const gUnk_080E862C[];

extern "C" int memcmp(void const *, void const *, unsigned long);

EC bool VerifySaveHeader(void * context) SECTION(".text.save_slot_verify_header");
EC bool VerifySaveHeader(void * context)
{
    u8 signature[32];
    unsigned int valid_slots;
    unsigned int selected_slot;

    func_080006E4(context, signature, 0, 0x20);
    if (gUnk_03000400 != 0)
        return false;

    valid_slots = 0;
    func_080006E4(context, &valid_slots, 0x20, 4);
    if (gUnk_03000400 != 0)
        return false;

    selected_slot = 0;
    func_080006E4(context, &selected_slot, 0x24, 4);
    if (gUnk_03000400 != 0)
        return false;

    return memcmp(signature, gUnk_080E862C, 0x20) == 0 &&
           (valid_slots & 3) == valid_slots &&
           selected_slot <= 1;
}

EC bool func_080002E0(void * context) ALIAS(VerifySaveHeader);

EC void InitializeSaveHeader(void * context) SECTION(".text.save_slot_initialize_header");
EC void InitializeSaveHeader(void * context)
{
    unsigned int zero;
    func_080006A4(context, 0, gUnk_080E862C, 0x20);
    if (gUnk_03000400 == 0)
    {
        zero = 0;
        func_080006A4(context, 0x20, &zero, 4);
        if (gUnk_03000400 == 0)
            func_080006A4(context, 0x24, &zero, 4);
    }
}

EC void func_08000358(void * context) ALIAS(InitializeSaveHeader);

EC unsigned int ReadValidSaveSlotMask(void * context) SECTION(".text.save_slot_read_valid_mask");
EC unsigned int ReadValidSaveSlotMask(void * context)
{
    if (!func_080002E0(context))
        return 0;

    unsigned int mask = 0;
    func_080006E4(context, &mask, 0x20, 4);

    if (gUnk_03000400 != 0)
        return 0;

    return mask;
}

EC unsigned int func_080003A0(void * context) ALIAS(ReadValidSaveSlotMask);

EC void MarkSaveSlotValid(void * context, unsigned int slot) SECTION(".text.save_slot_mark_valid");
EC void MarkSaveSlotValid(void * context, unsigned int slot)
{
    unsigned int mask = 0;
    func_080006E4(context, &mask, 0x20, 4);

    if (gUnk_03000400 == 0)
    {
        mask |= 1U << slot;
        func_080006A4(context, 0x20, &mask, 4);
    }
}

EC void func_080003E8(void * context, unsigned int slot) ALIAS(MarkSaveSlotValid);

EC void ClearSaveSlotValid(void * context, unsigned int slot) SECTION(".text.save_slot_clear_valid");
EC void ClearSaveSlotValid(void * context, unsigned int slot)
{
    unsigned int mask = 0;
    func_080006E4(context, &mask, 0x20, 4);

    if (gUnk_03000400 == 0)
    {
        mask &= ~(1U << slot);
        func_080006A4(context, 0x20, &mask, 4);
    }
}

EC void func_0800042C(void * context, unsigned int slot) ALIAS(ClearSaveSlotValid);

EC void WriteSelectedSaveSlot(void * context, unsigned int slot) SECTION(".text.save_slot_write_selected");
EC void WriteSelectedSaveSlot(void * context, unsigned int slot)
{
    func_080006A4(context, 0x24, &slot, 4);
}

EC void func_08000470(void * context, unsigned int slot) ALIAS(WriteSelectedSaveSlot);

EC unsigned int ReadSelectedSaveSlot(void * context) SECTION(".text.save_slot_read_selected");
EC unsigned int ReadSelectedSaveSlot(void * context)
{
    if (!func_080002E0(context))
        return 0;

    unsigned int selected = 0;
    func_080006E4(context, &selected, 0x24, 4);

    if (gUnk_03000400 != 0)
        return 0;

    return selected;
}

EC unsigned int func_08000488(void * context) ALIAS(ReadSelectedSaveSlot);
