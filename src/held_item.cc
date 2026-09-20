#include "held_item.hh"

HeldItem::HeldItem()
{
    kind = HeldItem::KIND_SPRITE;
    wrapped = 0;
    inner.sprite_id = UINT16_MAX;
}

EC bool IsHeldItemEmpty(HeldItem const * self)
{
    switch (self->kind)
    {
        default:
            return true;

        case HeldItem::KIND_FOOD:
            return self->inner.food.id >= FOOD_NONE;

        case HeldItem::KIND_ARTICLE:
            return self->inner.article.id >= ARTICLE_NONE;

        case HeldItem::KIND_DOG:
            return false;

        case HeldItem::KIND_CHICKEN:
            return self->inner.chicken.coop_slot >= 8;

        case HeldItem::KIND_BASKET:
            return false;

        case HeldItem::KIND_SPRITE:
            return self->inner.sprite_id == 0xFFFF;
    }
}

EC HeldItem::Kind GetHeldItemKind(HeldItem const * self)
{
    return self->kind;
}

EC Food GetHeldFood(HeldItem const * self)
{
    if (self->kind == HeldItem::KIND_FOOD && self->inner.food.id < FOOD_NONE)
    {
        Food food(self->inner.food.id);

        food.AddBonuses(self->inner.food.stamina_bonus, self->inner.food.fatigue_bonus);

        return food;
    }

    return Food(FOOD_NONE);
}

EC Article GetHeldArticle(HeldItem const * self)
{
    if (self->kind == HeldItem::KIND_ARTICLE && self->inner.article.id < ARTICLE_NONE)
    {
        return Article(self->inner.article.id);
    }

    return Article(ARTICLE_NONE);
}

EC RucksackItem GetHeldRucksackItem(HeldItem const * self)
{
    if (self->kind == HeldItem::KIND_FOOD && self->inner.food.id < FOOD_NONE)
    {
        Food food(self->inner.food.id);

        food.AddBonuses(self->inner.food.stamina_bonus, self->inner.food.fatigue_bonus);

        RucksackItem rucksack_item(food);

        if (self->wrapped)
        {
            rucksack_item.TryWrap();
        }

        return rucksack_item;
    }

    if (self->kind == HeldItem::KIND_ARTICLE && self->inner.food.id < ARTICLE_NONE)
    {
        Article article(self->inner.article.id);

        RucksackItem rucksack_item(article);

        if (self->wrapped)
        {
            rucksack_item.TryWrap();
        }

        return rucksack_item;
    }

    return RucksackItem();
}

EC int GetHeldChickenCoopSlot(HeldItem const * self)
{
    if (self->kind == HeldItem::KIND_CHICKEN && self->inner.chicken.coop_slot < 8)
        return self->inner.chicken.coop_slot;

    return -1;
}

EC int GetHeldSpriteId(HeldItem const * self)
{
    if (self->kind == HeldItem::KIND_SPRITE && self->inner.sprite_id < 0xFFFF)
        return self->inner.sprite_id;

    return -1;
}

EC bool IsHeldItemWrapped(HeldItem const * self)
{
    return self->wrapped;
}

EC void ClearHeldItem(HeldItem * self)
{
    self->kind = HeldItem::KIND_SPRITE;
    self->wrapped = 0;
    self->inner.sprite_id = UINT16_MAX;
}

EC void SetHeldFood(HeldItem * self, Food food)
{
    self->kind = HeldItem::KIND_FOOD;
    self->wrapped = 0;
    self->inner.food.id = food.GetId();
    self->inner.food.stamina_bonus = food.GetStaminaBonus();
    self->inner.food.fatigue_bonus = food.GetFatigueBonus();
}

EC void SetHeldArticle(HeldItem * self, Article article)
{
    self->kind = HeldItem::KIND_ARTICLE;
    self->wrapped = 0;
    self->inner.food.id = article.GetId();
}

EC void SetHeldRucksackItem(HeldItem * self, RucksackItem rucksack_item)
{
    switch (rucksack_item.GetKind())
    {
        default:
            self->wrapped = false;
            break;

        case RucksackItem::KIND_FOOD:
        {
            self->kind = HeldItem::KIND_FOOD;
            self->wrapped = rucksack_item.IsWrapped();
            Food food = rucksack_item.GetFood();
            self->inner.food.id = food.GetId();
            self->inner.food.stamina_bonus = food.GetStaminaBonus();
            self->inner.food.fatigue_bonus = food.GetFatigueBonus();
            break;
        }

        case RucksackItem::KIND_ARTICLE:
        {
            self->kind = HeldItem::KIND_ARTICLE;
            self->wrapped = rucksack_item.IsWrapped();
            Article article = rucksack_item.GetArticle();
            self->inner.food.id = article.GetId();
            break;
        }
    }
}

EC void SetHeldDog(HeldItem * self)
{
    self->kind = HeldItem::KIND_DOG;
    self->wrapped = 0;
}

EC void SetHeldBasket(HeldItem * self)
{
    self->kind = HeldItem::KIND_BASKET;
    self->wrapped = 0;
}

EC void SetHeldChicken(HeldItem * self, fu8 coop_slot)
{
    self->kind = HeldItem::KIND_CHICKEN;
    self->wrapped = 0;
    self->inner.chicken.coop_slot = coop_slot % 8;
}

EC void SetHeldSprite(HeldItem * self, int sprite_id)
{
    self->kind = HeldItem::KIND_SPRITE;
    self->wrapped = 0;
    self->inner.sprite_id = sprite_id;
}

EC bool TryWrapHeldItem(HeldItem * self)
{
    bool can_be_wrapped = false;

    switch (self->kind)
    {
        case HeldItem::KIND_FOOD:
            can_be_wrapped = true;
            break;

        case HeldItem::KIND_ARTICLE:
            can_be_wrapped = Article(self->inner.article.id).CanBeDiscarded();
            break;

        default:
            break;
    }

    self->wrapped = can_be_wrapped;
    return can_be_wrapped;
}
