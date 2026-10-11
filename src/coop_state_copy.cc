#include "coop.hh"

// Retail Coop assignment preserves the packed header and copies the
// stored name, all eight animal slots, eight eggs, and two incubators.
EC Coop * CopySavedCoopState(Coop *dest, Coop const *src)
    SECTION(".text.save_coop_copy");
EC Coop * CopySavedCoopState(Coop *dest, Coop const *src)
{
    dest->upgrade_level = src->upgrade_level;
    dest->stored_bushel_count = src->stored_bushel_count;
    dest->unk_001_3 = src->unk_001_3;
    dest->unk_001_4 = src->unk_001_4;
    dest->unk_002_4 = src->unk_002_4;
    dest->unk_002_5 = src->unk_002_5;
    dest->unk_003_0 = src->unk_003_0;
    dest->unk_chicken_name = src->unk_chicken_name;

    Coop::Ent *to_ent = dest->ent;
    int ent_count = 7;
    Coop::Ent const *from_ent = src->ent;
    for (; ent_count != -1; --ent_count)
    {
        *to_ent = *from_ent;
        ++to_ent;
        ++from_ent;
    }

    Coop::Egg *to_egg = dest->egg;
    int egg_count = 7;
    Coop::Egg const *from_egg = src->egg;
    for (; egg_count != -1; --egg_count)
    {
        *to_egg = *from_egg;
        ++to_egg;
        ++from_egg;
    }

    Coop::Incubator *to_incubator = dest->incubator;
    int incubation_count = 1;
    Coop::Incubator const *from_incubator = src->incubator;
    for (; incubation_count != -1; --incubation_count)
    {
        *to_incubator = *from_incubator;
        ++to_incubator;
        ++from_incubator;
    }

    return dest;
}
EC Coop * func_080D66A4(Coop *dest, Coop const *src)
    ALIAS(CopySavedCoopState);
