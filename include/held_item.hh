#ifndef HELD_ITEM_HH
#define HELD_ITEM_HH

#include "prelude.h"

#include "rucksack_item.hh"

struct HeldItem
{
    HeldItem();

    enum Kind
    {
        KIND_FOOD,
        KIND_ARTICLE,
        KIND_DOG,
        KIND_CHICKEN,
        KIND_BASKET,
        KIND_SPRITE,
    };

    union PACKED Inner
    {
        struct
        {
            u8 id;
            i8 stamina_bonus;
            i8 fatigue_bonus;
        } food;

        struct
        {
            u8 id;
        } article;

        struct
        {
            u8 coop_slot;
        } chicken;

        u16 sprite_id;
    };

    Kind kind : 3;
    bool wrapped : 1;
    STRUCT_PAD(0x01, 0x02);
    Inner inner;
};

EC bool IsHeldItemEmpty(HeldItem const * self) asm("func_0800F190");
EC HeldItem::Kind GetHeldItemKind(HeldItem const * self) asm("func_0800F204");
EC Food GetHeldFood(HeldItem const * self) asm("func_0800F20C");
EC Article GetHeldArticle(HeldItem const * self) asm("func_0800F258");
EC RucksackItem GetHeldRucksackItem(HeldItem const * self) asm("func_0800F294");
EC int GetHeldChickenCoopSlot(HeldItem const * self) asm("func_0800F344");
EC int GetHeldSpriteId(HeldItem const * self) asm("func_0800F360");
EC bool IsHeldItemWrapped(HeldItem const * self) asm("func_0800F388");
EC void ClearHeldItem(HeldItem * self) asm("func_0800F390");
EC void SetHeldFood(HeldItem * self, Food food) asm("func_0800F3B0");
EC void SetHeldArticle(HeldItem * self, Article article) asm("func_0800F3E8");
EC void SetHeldRucksackItem(HeldItem * self, RucksackItem rucksack_item) asm("func_0800F418");
EC void SetHeldDog(HeldItem * self) asm("func_0800F4C0");
EC void SetHeldBasket(HeldItem * self) asm("func_0800F4D8");
EC void SetHeldChicken(HeldItem * self, fu8 coop_slot) asm("func_0800F4F0");
EC void SetHeldSprite(HeldItem * self, int sprite_id) asm("func_0800F510");
EC bool TryWrapHeldItem(HeldItem * self) asm("func_0800F528");

#endif // HELD_ITEM_HH
