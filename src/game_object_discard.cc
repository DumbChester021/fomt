#include "actor.hh"
#include "smart_ptr.hh"
#include "rucksack_item.hh"
#include "unknown_types.hh"

typedef UnkMap TerrainMapView;

extern "C" bool IsFootprintOnWaterSurface(TerrainMapView & terrain, i32 x, i32 y)
    asm("func_080AC5D0");

struct SoundPlayer;
extern "C" bool IsSoundPlayerBusy(SoundPlayer * player) asm("func_08008CD0");
extern "C" void StartSongOnPlayer(SoundPlayer * player, int song_id) asm("func_08008B6C");
extern "C" int ClassifyDiscardLocation(Location const & location) asm("func_080A45A8");
extern "C" void SetOceanSmallFishBaitFlag(void * game_state) asm("func_08011458");
extern "C" void ApplyLitteringPenalty(void * social_state, Location const & location,
                                      void * relationship_state) asm("func_080A1484");

namespace
{
enum DiscardLocationClass
{
    DISCARD_LOCATION_KAPPA_LAKE = 0,
    DISCARD_LOCATION_GODDESS_POND = 2,
    DISCARD_LOCATION_OCEAN = 4,
    DISCARD_LOCATION_HOT_SPRING = 6,
};

enum
{
    EVENT_GODDESS_OFFERING = 0x23B,
    EVENT_KAPPA_OFFERING = 0x23C,

    SONG_DISCARDED_ITEM = 0x6D,
    EFFECT_WATER_SPLASH = 0x1A9,
    EFFECT_WRAPPED_ITEM = 0x160,
};

struct EventRequest
{
    EventRequest(u32 requested_event_id, u32 requested_parameter)
        : event_id(requested_event_id), parameter(requested_parameter)
    {
    }

    u32 event_id;
    u32 parameter;
};

struct SoundPlayerList
{
    SoundPlayer ** begin;
    SoundPlayer ** end;
};

struct DiscardEffectBase
{
    virtual ~DiscardEffectBase();
    STRUCT_PAD(0x00, 0x24);
};

struct DiscardEffect : DiscardEffectBase
{
    DiscardEffect(void * effect_context, u32 resource_id, GameObject * game_object, int render_layer,
                  int render_priority, bool refresh_sprite_parts_each_update)
        asm("func_080A4A00");
    STRUCT_PAD(0x28, 0x40);
};

typedef SmartPtr<DiscardEffect> DiscardEffectPtr;

inline DiscardEffect * CreateDiscardEffect(void * effect_context, u32 resource_id, GameObject * object)
{
    return new DiscardEffect(effect_context, resource_id, object, 2, 3, false);
}



struct ItemConversionTarget;

struct ItemConversionTargetVtable
{
    STRUCT_PAD(0x00, 0x5C);
    void (*replace_item)(ItemConversionTarget *, RucksackItem const &, int);
};

struct ItemConversionTarget
{
    STRUCT_PAD(0x00, 0x14);
    ItemConversionTargetVtable * vtable;
};

struct DiscardEffectPosition
{
    i16 x;
    i16 y;
};

struct DiscardEffectState
{
    DiscardEffectPtr effect;
    DiscardEffectPosition position;
    u8 is_dry_land;
    u8 duration;
    u8 state;
    u8 padding;
};

struct DiscardGameObjectVtable
{
    STRUCT_PAD(0x000, 0x034);
    TerrainMapView (*get_location_terrain)(GameObject *, u32);
    STRUCT_PAD(0x038, 0x064);
    void * (*get_effect_context)(GameObject *);
    STRUCT_PAD(0x068, 0x140);
    void (*queue_event)(GameObject *, EventRequest const &, int);
    STRUCT_PAD(0x144, 0x14C);
    SoundPlayerList * (*get_object_list)(GameObject *);
};

struct DiscardGameObjectView
{
    u32 HandleDiscardedRucksackItem(Location const & landing_arg, RucksackItem const & item_arg)
        asm("func_0801EE00");

    DiscardGameObjectVtable * vtable;
    STRUCT_PAD(0x0004, 0x0008);
    ItemConversionTarget * item_conversion_target;
    STRUCT_PAD(0x000C, 0x102C);
    DiscardEffectState discard_effect;
    void * game_state;
};

}

u32 DiscardGameObjectView::HandleDiscardedRucksackItem(Location const & landing_arg,
                                                    RucksackItem const & item_arg)
{
    DiscardGameObjectView * object = this;
    Location const * landing_pointer = &landing_arg;
    RucksackItem const * item_pointer = &item_arg;
    ItemConversionTargetVtable * conversion_vtable;

    bool is_dry_land;
    {
        DiscardGameObjectVtable * terrain_vtable = object->vtable;
        TerrainMapView terrain = terrain_vtable->get_location_terrain(
            reinterpret_cast<GameObject *>(object), landing_pointer->GetMap());
        is_dry_land = !IsFootprintOnWaterSurface(
            terrain, landing_pointer->GetX(), landing_pointer->GetY());
    }
    u32 event_id = 0;
    u32 apply_discard_consequences = true;

    if (!is_dry_land)
    {
        SoundPlayerList * sound_players =
            object->vtable->get_object_list(reinterpret_cast<GameObject *>(object));
        SoundPlayer ** player = sound_players->begin;
        SoundPlayer ** end = sound_players->end;
        SoundPlayer * selected_player;
        int discard_location;

        if (player != end)
        {
            do
            {
                if (!IsSoundPlayerBusy(*player))
                    goto use_current_player;
                ++player;
            }
            while (player != end);
        }

        selected_player = *(end - 1);
        goto play_discard_sound;

    play_discard_sound:
        StartSongOnPlayer(selected_player, SONG_DISCARDED_ITEM);
        discard_location = ClassifyDiscardLocation(*landing_pointer);

        if (discard_location == DISCARD_LOCATION_GODDESS_POND)
            goto discard_at_goddess_pond;
        if (discard_location > DISCARD_LOCATION_GODDESS_POND)
            goto classify_high_discard_location;
        if (discard_location == DISCARD_LOCATION_KAPPA_LAKE)
            goto discard_at_kappa_lake;
        goto discard_location_done;

    use_current_player:
        selected_player = *player;
        goto play_discard_sound;

    classify_high_discard_location:
        if (discard_location == DISCARD_LOCATION_OCEAN)
            goto discard_in_ocean;
        if (discard_location == DISCARD_LOCATION_HOT_SPRING)
            goto discard_in_hot_spring;
        goto discard_location_done;

    discard_in_ocean:
        if (item_pointer->GetKind() == RucksackItem::KIND_FOOD
            && item_pointer->GetFood().GetId() == FOOD_SMALL_FISH)
        {
            SetOceanSmallFishBaitFlag(object->game_state);
        }
        goto discard_location_done;

    discard_in_hot_spring:
        {
            bool is_convertible_egg = false;
            if ((is_convertible_egg =
                    item_pointer->GetKind() == RucksackItem::KIND_FOOD
                    && item_pointer->GetFood().GetId() > FOOD_REGULAR_QUALITY_EGG - 1
                    && item_pointer->GetFood().GetId() <= FOOD_X_EGG))
            {
                ItemConversionTarget * conversion_target =
                    object->item_conversion_target;
                conversion_vtable = conversion_target->vtable;
                RucksackItem hot_spring_egg((Food(FOOD_SPABOILED_EGG)));
                conversion_vtable->replace_item(
                    conversion_target, hot_spring_egg, 0);
                apply_discard_consequences = false;
            }
        }
        goto discard_location_done;

    discard_at_goddess_pond:
        event_id = EVENT_GODDESS_OFFERING;
        apply_discard_consequences = false;
        goto discard_location_done;

    discard_at_kappa_lake:
        if (item_pointer->GetKind() == RucksackItem::KIND_FOOD
            && item_pointer->GetFood().GetId() == FOOD_CUCUMBER)
        {
            event_id = EVENT_KAPPA_OFFERING;
            apply_discard_consequences = false;
        }

    discard_location_done:
        ;
    }

    u32 queued_event_id = event_id;
    if (queued_event_id != 0)
    {
        object->vtable->queue_event(
            reinterpret_cast<GameObject *>(object), EventRequest(queued_event_id, 0), 0);
    }

    if (apply_discard_consequences)
    {
        u8 * state = static_cast<u8 *>(object->game_state);
        ApplyLitteringPenalty(state + 0x1CD4, *landing_pointer, state + 0x214C);
    }

    u16 effect_resource;
    if (!item_pointer->IsWrapped())
    {
        switch (item_pointer->GetKind())
        {
            default:
            case RucksackItem::KIND_FOOD:
                effect_resource = item_pointer->GetFood().GetIconId();
                break;

            case RucksackItem::KIND_ARTICLE:
            {
                Article article = item_pointer->GetArticle();
                if (article.GetId() != ARTICLE_ALEXANDRITE)
                {
                    effect_resource = article.GetIconId();
                }
                else
                {
                    int landing_map_for_effect =
                        static_cast<int>(landing_pointer->GetMap());
                    effect_resource = 3;
                    if (landing_map_for_effect <= 8)
                        effect_resource = 4;
                }
                break;
            }
        }
    }
    else
    {
        effect_resource = EFFECT_WRAPPED_ITEM;
    }

    Location const * effect_landing_pointer = landing_pointer;
    i16 landing_x = effect_landing_pointer->GetX();
    i16 landing_y_coordinate = effect_landing_pointer->GetY();
    int landing_y = landing_y_coordinate;
    DiscardEffectPosition position;
    DiscardEffectPosition * position_pointer = &position;
    position_pointer->x = landing_x;
    position_pointer->y = landing_y;
    void * fetched_effect_context =
        object->vtable->get_effect_context(reinterpret_cast<GameObject *>(object));
    DiscardEffectState & effect_state = object->discard_effect;
    void * effect_context = fetched_effect_context;
    u16 dry_land_effect_resource = effect_resource;
    effect_state.position = *position_pointer;
    effect_state.effect = 0;

    if ((effect_state.is_dry_land = is_dry_land))
    {
        effect_state.effect =
            CreateDiscardEffect(effect_context, dry_land_effect_resource,
                                reinterpret_cast<GameObject *>(object));
        effect_state.duration = 16;
        effect_state.state = 0;
        return 16;
    }

    effect_state.effect =
        CreateDiscardEffect(effect_context, EFFECT_WATER_SPLASH,
                          reinterpret_cast<GameObject *>(object));
    return 0;
}
