#include "types.h"

#include "chicken.hh"
#include "dog.hh"
#include "held_item.hh"
#include "rucksack_item.hh"

extern "C" u8 gUnk_086678A0[];
extern "C" u8 gUnk_0858BA28[];

struct RucksackRenderContext
{
    u8 unknown_00[8];
    u8 * game_state;
    u8 unknown_0C[0x70];
    void * item_renderer;
    u8 unknown_80[0x80];
    HeldItem * held_item;
    void * rucksack_ui;
};

extern "C" RucksackItem * GetItemAt__8RucksackUi(void *, u32 slot);
extern "C" Chicken * GetChicken__4CoopUi(void *, int slot);
extern "C" void func_080CC728(void *, u32 slot, u8 const *, u32 icon_id, u32 amount);
extern "C" void func_080CCE58(void *, u8 const *, u32 icon_id, u32 amount);

enum
{
    ICON_BASKET = 53,
    ICON_WRAPPED_PRESENT = 352,
};

extern "C" void func_08092754(RucksackRenderContext * self, u32 count)
{
    for (u32 slot = 0; slot < count; ++slot)
    {
        RucksackItem item = *GetItemAt__8RucksackUi(self->rucksack_ui, slot);
        if (item.IsEmpty())
            continue;

        u16 icon_id = 0;
        switch (item.GetKind())
        {
            case RucksackItem::KIND_FOOD:
                icon_id = item.GetFood().GetIconId();
                break;

            case RucksackItem::KIND_ARTICLE:
            {
                Article article = item.GetArticle();
                icon_id = article.GetIconId();
                break;
            }
        }

        if (item.IsWrapped())
            icon_id = ICON_WRAPPED_PRESENT;

        func_080CC728(self->item_renderer, slot, gUnk_086678A0, icon_id, 1);
    }

    if (IsHeldItemEmpty(self->held_item))
        return;

    switch (GetHeldItemKind(self->held_item))
    {
        case HeldItem::KIND_FOOD:
        {
            u16 icon_id = GetHeldFood(self->held_item).GetIconId();
            RucksackItem item = GetHeldRucksackItem(self->held_item);
            if (item.IsWrapped())
                icon_id = ICON_WRAPPED_PRESENT;

            func_080CCE58(self->item_renderer, gUnk_086678A0, icon_id, 1);
            break;
        }

        case HeldItem::KIND_ARTICLE:
        {
            Article article = GetHeldArticle(self->held_item);
            u16 icon_id = article.GetIconId();
            RucksackItem item = GetHeldRucksackItem(self->held_item);
            if (item.IsWrapped())
                icon_id = ICON_WRAPPED_PRESENT;

            func_080CCE58(self->item_renderer, gUnk_086678A0, icon_id, 1);
            break;
        }

        case HeldItem::KIND_DOG:
        {
            Dog * dog = reinterpret_cast<Dog *>(self->game_state + 0x1C70);
            if (dog->GetGrowthStage() == Dog::STAGE_0)
                func_080CCE58(self->item_renderer, gUnk_0858BA28, 0x3DA, 1);
            else
                func_080CCE58(self->item_renderer, gUnk_0858BA28, 0x374, 1);
            break;
        }

        case HeldItem::KIND_CHICKEN:
        {
            int slot = GetHeldChickenCoopSlot(self->held_item);
            Chicken * chicken =
                GetChicken__4CoopUi(self->game_state + 0x410, slot);
            if (chicken == 0)
                break;

            if (chicken->GetGrowthStage() == Chicken::STAGE_0)
                func_080CCE58(self->item_renderer, gUnk_0858BA28, 0x73D, 1);
            else
                func_080CCE58(self->item_renderer, gUnk_0858BA28, 0x734, 1);
            break;
        }

        case HeldItem::KIND_BASKET:
            func_080CCE58(
                self->item_renderer,
                gUnk_086678A0,
                ICON_BASKET,
                1);
            break;

        case HeldItem::KIND_SPRITE:
            break;
    }
}
