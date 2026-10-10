#include "prelude.h"

EXTERN_C
void func_080D6B00(u8 * state, unsigned int flags);
void func_080D6C08(u8 * state, unsigned int flags);
void __builtin_delete(void * address);
EXTERN_C_END

// Cleans up nested GameState resources. Only mode bit zero controls whether
// the GameState allocation itself is released. The original byte-buffer walk
// advances without touching its elements; preserving this matches retail.
EC void CleanupGameState(u8 * state, unsigned int mode)
    SECTION(".text.game_state_cleanup");
EC void CleanupGameState(u8 * state, unsigned int mode)
{
    u8 * buffer = state + 0x1CA0;
    unsigned int length = *reinterpret_cast<u32 *>(buffer) + 4;
    u8 * end = buffer + length;
    u8 * begin = state + 0x1CA4;
    while (begin != end)
        ++begin;

    func_080D6B00(state + 0x1C38, 2);
    func_080D6C08(state + 0x1AA8, 2);
    if (mode & 1)
        __builtin_delete(state);
}
EC void func_080D4480(u8 * state, unsigned int mode)
    ALIAS(CleanupGameState);

 // Nested GameState block at +0x1C38: the original releases no individual
 // elements while walking its 2-byte and 4-byte collection ranges.
 // The block allocation is freed only if mode bit zero is set.
EC void CleanupGameStateBlock1C38(u8 * state, unsigned int mode)
    SECTION(".text.game_state_block_1c38_cleanup");
EC void CleanupGameStateBlock1C38(u8 * state, unsigned int mode)
{
    unsigned int itemBytes = *reinterpret_cast<u32 *>(state + 0x24) * 2;
    u8 * itemEnd = reinterpret_cast<u8 *>(itemBytes + reinterpret_cast<unsigned int>(state) + 0x28);
    u8 * items = state + 0x28;
    while (items != itemEnd)
        items += 2;

    unsigned int cellBytes = *reinterpret_cast<u32 *>(state) * 4 + 4;
    u8 * cellEnd = state + cellBytes;
    u8 * cells = state + 4;
    while (cells != cellEnd)
        cells += 4;

    if (mode & 1)
        __builtin_delete(state);
}
EC void func_080D6B00(u8 * state, unsigned int mode)
    ALIAS(CleanupGameStateBlock1C38);

 // Two eight-byte-entry ranges in the GameState nested block at +0x1AA8.
 // Retail advances over both ranges, then conditionally frees the allocation.
EC void CleanupGameStateBlock1AA8(u8 * state, unsigned int mode)
    SECTION(".text.game_state_block_1aa8_cleanup");
EC void CleanupGameStateBlock1AA8(u8 * state, unsigned int mode)
{
    u8 * secondData = state + 0xFC;
    unsigned int secondBytes = *reinterpret_cast<u32 *>(secondData) * 8 + 4;
    u8 * secondEnd = secondData + secondBytes;
    u8 * second = state + 0x100;
    while (second != secondEnd)
        second += 8;

    u8 * firstData = state + 8;
    unsigned int firstBytes = *reinterpret_cast<u32 *>(firstData) * 8 + 4;
    u8 * firstEnd = firstData + firstBytes;
    u8 * first = state + 0xC;
    while (first != firstEnd)
        first += 8;

    if (mode & 1)
        __builtin_delete(state);
}
EC void func_080D6C08(u8 * state, unsigned int mode)
    ALIAS(CleanupGameStateBlock1AA8);
