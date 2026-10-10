#include "farm.hh"

extern "C" void func_080D66A4(Coop *, Coop const *);
extern "C" void func_080D657C(Barn *, Barn const *);

// The retail Farm assignment is member-aware: packed flags, the 11-word
// horse placeholder, plain saved records and dedicated coop/barn copying.
// It must not be replaced with a whole-Farm memcpy or implicit assignment.
EC Farm * CopySavedFarmState(Farm * dest, Farm const * src)
    SECTION(".text.save_farm_copy");
EC Farm * CopySavedFarmState(Farm * dest, Farm const * src)
{
    dest->name = src->name;
    dest->unk_0010_0 = src->unk_0010_0;
    dest->has_horse = src->has_horse;
    dest->unk_0010_11 = src->unk_0010_11;
    dest->unk_0010_12 = src->unk_0010_12;

    u32 * target = reinterpret_cast<u32 *>(&dest->horse_placeholder);
    int count = 10;
    u32 const * origin = reinterpret_cast<u32 const *>(&src->horse_placeholder);
    for (; count != -1; --count)
        *target++ = *origin++;

    dest->shipping_bin = src->shipping_bin;
    dest->farm_house = src->farm_house;
    func_080D66A4(&dest->coop, &src->coop);
    func_080D657C(&dest->barn, &src->barn);
    dest->field = src->field;
    return dest;
}
EC Farm * func_080D64C8(Farm * dest, Farm const * src)
    ALIAS(CopySavedFarmState);
