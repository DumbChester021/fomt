#include "unknown_types.hh"

struct Unk_08105708Entry
{
    u16 minute;
    u8 value;
    u8 pad;
};

extern "C" Unk_08105708Entry const * const gUnk_08105708[4][4];

EC u8 func_080A4650(u8 hour, u8 minute, u32 season, u32 period)
{
    Unk_08105708Entry const * entry = gUnk_08105708[season][period];
    u16 time = hour * 60 + minute;
    u8 value = 0;
    u16 threshold = entry->minute;
    u16 sentinel = 0xFFFF;

loop:
    if (threshold == sentinel)
        goto done;

    if (threshold > time)
        goto done;

    value = entry->value;
    ++entry;
    threshold = entry->minute;
    goto loop;

done:
    return value;
}
