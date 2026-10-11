#include "rucksack.hh"

EC Rucksack * CopySavedRucksackState(Rucksack *dest, Rucksack const *source)
    SECTION(".text.save_rucksack_copy");
EC Rucksack * CopySavedRucksackState(Rucksack *dest, Rucksack const *source)
{
    dest->items.CopyConstructFrom(source->items);
    dest->tools.CopyConstructFrom(source->tools);
    return dest;
}
EC Rucksack * func_080D6A80(Rucksack *dest, Rucksack const *source)
    ALIAS(CopySavedRucksackState);
