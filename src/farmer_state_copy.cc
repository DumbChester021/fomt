#include "farmer.hh"

// Preserve the original two-byte memcpy call for the stored ToolStack.
// A direct memcpy expression is optimized to an inline halfword assignment by
// the current compiler, so this binding retains the original library call.
EC void * CopyToolStackBytes(void *dest, void const *src, unsigned long size)
    __asm__("memcpy");

EC Rucksack * func_080D6A80(Rucksack *dest, Rucksack const *src);

EC Farmer * CopySavedFarmerState(Farmer *dest, Farmer const *src)
    SECTION(".text.save_farmer_copy");
EC Farmer * CopySavedFarmerState(Farmer *dest, Farmer const *src)
{
    dest->unk_00 = src->unk_00;
    dest->unk_10 = src->unk_10;
    dest->unk_20 = src->unk_20;
    dest->location = src->location;

    Farmer::ToolLevel *to_level = dest->unk_2C;
    int count = 5;
    Farmer::ToolLevel const *from_level = src->unk_2C;
    for (; count != -1; --count)
        *to_level++ = *from_level++;

    dest->num_power_berries = src->num_power_berries;
    dest->unk_44_04 = src->unk_44_04;
    dest->unk_44_05 = src->unk_44_05;
    dest->unk_44_06 = src->unk_44_06;
    dest->stamina = src->stamina;
    dest->unk_44_0F = src->unk_44_0F;
    dest->unk_44_17 = src->unk_44_17;
    dest->step_count = src->step_count;
    dest->unk_48_1D = src->unk_48_1D;
    dest->unk_4C_00 = src->unk_4C_00;
    dest->unk_4C_07 = src->unk_4C_07;
    dest->unk_4C_0F = src->unk_4C_0F;
    dest->unk_50_0D = src->unk_50_0D;
    dest->held_item = src->held_item;
    CopyToolStackBytes(&dest->unk_5C, &src->unk_5C, sizeof(ToolStack));
    func_080D6A80(&dest->rucksack, &src->rucksack);
    return dest;
}
EC Farmer * func_080D68C0(Farmer *dest, Farmer const *src)
    ALIAS(CopySavedFarmerState);
