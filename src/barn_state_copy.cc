#include "barn.hh"

// The retail Barn assignment copies packed state, both stored animal names,
// pregnancy-stall indices, and all 16 animal records fieldwise.
// Keep the original per-record copy behavior and layout intact.
EC Barn * CopySavedBarnState(Barn *dest, Barn const *src)
    SECTION(".text.save_barn_copy");
EC Barn * CopySavedBarnState(Barn *dest, Barn const *src)
{
    dest->upgrade_level = src->upgrade_level;
    dest->stored_bushel_count = src->stored_bushel_count;
    dest->unk_1_3 = src->unk_1_3;
    dest->unk_1_4 = src->unk_1_4;
    dest->stall_bushels = src->stall_bushels;
    dest->pregnancy_stall_bushels = src->pregnancy_stall_bushels;
    dest->unk_3_7 = src->unk_3_7;
    dest->unk_4_0 = src->unk_4_0;
    dest->unk_cow_age = src->unk_cow_age;
    dest->unk_sheep_age = src->unk_sheep_age;

    i8 *to_stall = dest->pregnancy_stall_ent_idx;
    int count = 1;
    i8 const *from_stall = src->pregnancy_stall_ent_idx;
    for (; count != -1; --count) {
        *to_stall = *from_stall;
        ++to_stall;
        ++from_stall;
    }

    dest->unk_cow_name = src->unk_cow_name;
    dest->unk_sheep_name = src->unk_sheep_name;

    Barn::Ent *to_ent = dest->ent;
    int ent_count = 15;
    Barn::Ent const *from_ent = src->ent;
    for (; ent_count != -1; --ent_count) {
        memcpy(to_ent, from_ent, sizeof(Barn::Ent));
        ++to_ent;
        ++from_ent;
    }
    return dest;
}
EC Barn * func_080D657C(Barn *dest, Barn const *src)
    ALIAS(CopySavedBarnState);
