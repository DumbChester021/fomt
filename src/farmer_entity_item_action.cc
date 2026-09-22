#include "farmer_entity.hh"

extern "C" bool IsBoxBlockedByTerrain(TerrainMapView & terrain, Box const & box)
    asm("func_080AC070");

namespace
{
typedef i32 (*ArticleInteractionFn)(GameObject *, Location const &, Article const &);

enum ArticleInteractionResult
{
    ARTICLE_INTERACTION_HANDLED,
    ARTICLE_INTERACTION_BLOCKED,
    ARTICLE_INTERACTION_UNHANDLED,
};

inline ArticleInteractionFn const * GetArticleInteractionSlot(GameObject * game_object)
{
    u8 const * vtable = *reinterpret_cast<u8 const * const *>(game_object);
    return reinterpret_cast<ArticleInteractionFn const *>(vtable + 0xE8);
}

struct HeldItemInteractionBox
{
    HeldItemInteractionBox(i32 center_x, i32 center_y)
    {
        x1 = center_x - 7;
        y1 = center_y - 4;

        register i32 right_edge asm("r0") = center_x + 7;
        asm("" : "+r"(right_edge));
        x2 = right_edge;

        y2 = center_y + 5;
    }

    Box const & AsBox() const { return *reinterpret_cast<Box const *>(this); }

    i16 x1, y1;
    i16 x2, y2;
};

}

FarmerEntity::HeldItemAction FarmerEntity::ClassifyHeldItemAction()
{
    register HeldItem const * held_item asm("r8");
    register i32 far_x asm("r9");
    register i32 far_y asm("sl");
    register i32 interaction_x asm("r4");
    i32 interaction_y;
    GameObject * current_game_object;
    u32 current_map;

    {
        register FarmerEntity * entity asm("r5") = this;
        held_item = &entity->farmer->held_item;

        if (IsHeldItemEmpty(held_item))
            return FarmerEntity::HELD_ITEM_ACTION_BLOCKED;

        if (IsHeldItemWrapped(held_item))
            return FarmerEntity::HELD_ITEM_ACTION_THROW;

        far_x = entity->x_q16 >> 16;
        far_y = entity->y_q16 >> 16;
        interaction_x = far_x;
        interaction_y = far_y;

        switch (entity->facing)
        {
            case 1:
                far_y = interaction_y - 20;
                interaction_y -= 16;
                break;

            case 0:
                far_y = interaction_y + 20;
                interaction_y += 16;
                break;

            case 2:
                far_x = interaction_x - 20;
                interaction_x -= 16;
                break;

            case 3:
                far_x = interaction_x + 20;
                interaction_x += 16;
                break;
        }

        current_game_object = entity->game_object;
        current_map = entity->location_map;
    }

    TerrainMapView terrain_storage = current_game_object->GetLocationTerrain(current_map);
    register TerrainMapView * terrain asm("r5") = &terrain_storage;

    switch (GetHeldItemKind(held_item))
    {
        case HeldItem::KIND_FOOD:
            return FarmerEntity::HELD_ITEM_ACTION_THROW;

        case HeldItem::KIND_ARTICLE:
        {
            Article const & article = GetHeldArticle(held_item);
            if (!article.CanBeDiscarded())
                return FarmerEntity::HELD_ITEM_ACTION_BLOCKED;

            switch (article.GetId())
            {
                case ARTICLE_STONES:
                    if (IsFootprintOnWaterSurface(*terrain, far_x, far_y))
                        return FarmerEntity::HELD_ITEM_ACTION_THROW;
                    break;

                case ARTICLE_BALL:
                    return FarmerEntity::HELD_ITEM_ACTION_THROW_BALL;

                case ARTICLE_BRANCHES:
                case ARTICLE_LUMBER:
                case ARTICLE_GOLDEN_LUMBER:
                    break;

                default:
                    return FarmerEntity::HELD_ITEM_ACTION_THROW;
            }

            ArticleInteractionFn const * article_interaction_slot =
                GetArticleInteractionSlot(current_game_object);
            Location interaction_location(current_map, interaction_x, interaction_y);
            register i32 interaction_result asm("r0") =
                (*article_interaction_slot)(current_game_object, interaction_location, article);

            switch (interaction_result)
            {
                case ARTICLE_INTERACTION_HANDLED:
                    return FarmerEntity::HELD_ITEM_ACTION_INTERACT;

                case ARTICLE_INTERACTION_BLOCKED:
                    return FarmerEntity::HELD_ITEM_ACTION_BLOCKED;

                case ARTICLE_INTERACTION_UNHANDLED:
                    if (article.GetId() == ARTICLE_STONES)
                        return FarmerEntity::HELD_ITEM_ACTION_BLOCKED;
                    return FarmerEntity::HELD_ITEM_ACTION_THROW;

                default:
                    return FarmerEntity::HELD_ITEM_ACTION_BLOCKED;
            }
        }

        case HeldItem::KIND_DOG:
        {
            HeldItemInteractionBox dog_interaction_box(interaction_x, interaction_y);

            return IsBoxBlockedByTerrain(*terrain, dog_interaction_box.AsBox())
                       ? FarmerEntity::HELD_ITEM_ACTION_BLOCKED
                       : FarmerEntity::HELD_ITEM_ACTION_INTERACT;
        }

        case HeldItem::KIND_CHICKEN:
        {
            HeldItemInteractionBox chicken_interaction_box(interaction_x, interaction_y);

            return IsBoxBlockedByTerrain(*terrain, chicken_interaction_box.AsBox())
                       ? FarmerEntity::HELD_ITEM_ACTION_BLOCKED
                       : FarmerEntity::HELD_ITEM_ACTION_INTERACT;
        }

        case HeldItem::KIND_BASKET:
        {
            HeldItemInteractionBox basket_interaction_box(interaction_x, interaction_y);

            return IsBoxBlockedByTerrain(*terrain, basket_interaction_box.AsBox())
                       ? FarmerEntity::HELD_ITEM_ACTION_BLOCKED
                       : FarmerEntity::HELD_ITEM_ACTION_INTERACT;
        }

        case HeldItem::KIND_SPRITE:
        default:
            return FarmerEntity::HELD_ITEM_ACTION_BLOCKED;
    }
}
