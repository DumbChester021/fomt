#include "prelude.h"
#include "rucksack.hh"
#include <new>

EXTERN_C
void func_080D6B00(Rucksack * state, unsigned int flags);
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

    func_080D6B00(reinterpret_cast<Rucksack *>(state + 0x1C38), 2);
    func_080D6C08(state + 0x1AA8, 2);
    if (mode & 1)
        __builtin_delete(state);
}
EC void func_080D4480(u8 * state, unsigned int mode)
    ALIAS(CleanupGameState);

// Cleanup of the saved Rucksack's active tools and item collection.
 // Elements have trivial destructors, so the loops only advance; the original
 // optional allocation deletion is retained. This replaces raw-offset walks.
EC void CleanupGameStateBlock1C38(Rucksack * state, unsigned int mode)
    SECTION(".text.game_state_block_1c38_cleanup");
EC void CleanupGameStateBlock1C38(Rucksack * state, unsigned int mode)
{
    ToolStack *toolEnd = state->tools.end();
    ToolStack *tool = state->tools.begin();
    for (; tool != toolEnd; ++tool)
        tool->~ToolStack();

    RucksackItem *itemEnd = state->items.end();
    RucksackItem *item = state->items.begin();
    for (; item != itemEnd; ++item)
        item->~RucksackItem();

    if (mode & 1)
        ::operator delete(state);
}
EC void func_080D6B00(Rucksack * state, unsigned int mode)
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
