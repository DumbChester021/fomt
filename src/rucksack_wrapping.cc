#include "types.h"

#include "held_item.hh"
#include "money.hh"
#include "rucksack_item.hh"

extern "C" u8 gUnk_086678A0[];

struct WrappingUiContext
{
    u8 unknown_00[8];
    u8 * game_state;
    u8 unknown_0C[0x70];
    void * item_renderer;
    u8 unknown_80[0x80];
    HeldItem * held_item;
    void * rucksack_ui;
};

extern "C" int func_080CE184(WrappingUiContext *, int slot, int page);
extern "C" RucksackItem * GetItemAt__8RucksackUi(void *, int slot);
extern "C" void func_080CC728(void *, int slot, u8 const *, u32 icon_id, u32 amount);
extern "C" void func_080CCE58(void *, u8 const *, u32 icon_id, u32 amount);
extern "C" void func_080A0A54(void *, u32);

extern "C" void func_08092CD0(WrappingUiContext * self, int slot)
{
    if (slot == 9)
    {
        TryWrapHeldItem(self->held_item);
        func_080CCE58(self->item_renderer, gUnk_086678A0, 352, 1);
    }
    else
    {
        void * rucksack_ui = self->rucksack_ui;
        int mapped_slot = func_080CE184(self, slot, 0);
        RucksackItem * item = GetItemAt__8RucksackUi(rucksack_ui, mapped_slot);
        item->TryWrap();

        void * renderer = self->item_renderer;
        mapped_slot = func_080CE184(self, slot, 0);
        func_080CC728(renderer, mapped_slot, gUnk_086678A0, 352, 1);
    }

    func_0809ACC0(
        reinterpret_cast<MoneyState *>(self->game_state + 0x1AA8),
        100);
    func_080A0A54(self->game_state + 0x1CD4, 1);
}
