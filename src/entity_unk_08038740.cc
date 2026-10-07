#include "entity.hh"
#include "entity_actor.hh"
#include "entity_effect.hh"
#include "terrain.hh"
#include "utility/vec2.hh"

#pragma interface

struct Entity38740;

struct Entity38740Controller
{
    Entity38740Controller(Entity38740 *) asm("func_08038820");

    void * owner_00;
    void * vtable_04;
    void * effect_08;
    u8 * effect_0C;
    void * collection_10;
    void * collection_14;
};
struct Entity39134;

struct Entity39134VTable
{
    void * unk_00[24];
    bool (*is_active)(Entity39134 *);
};

struct Entity39134
{
    /* +00 */ GameObject * game_object;
    /* +04 */ u16 location_map;
    /* +06 */ u16 unk_06;
    /* +08 */ u16 x_q16_low;
    /* +0A */ i16 x;
    /* +0C */ u16 y_q16_low;
    /* +0E */ i16 y;
    /* +10 */ void * unk_10;
    /* +14 */ Entity39134VTable * vtable;
};

struct EntityStrategyStateView
{
    u8 pad_00[0x0C];
    u32 mode_0C;
    u8 pad_10[2];
    u8 flag_12;
};

struct EntityStrategyOwnerView
{
    u8 pad_00[0x34];
    EntityStrategyStateView * state_34;
    void * strategies_38[5];
};

struct Entity398A4;

struct Entity_080E6554 : public AActorEntity
{
    Entity_080E6554(GameObject *, ActorLocation const &, u32);

    bool unk_30;
};

struct StrategyCall
{
    virtual void Update(Entity398A4 *, void *);
    virtual u32 Select(Entity398A4 *);
};

struct Strategy74CC
{
    virtual void vfunc_08();
    virtual u32 Select(Entity398A4 *);
};

struct Strategy74BC
{
    virtual void vfunc_08();
    virtual u32 Select(Entity398A4 *);
};

struct Strategy74AC
{
    virtual void vfunc_08();
    virtual u32 Select(Entity398A4 *);
};

struct Strategy749C
{
    virtual void vfunc_08();
    virtual u32 Select(Entity398A4 *);
};

struct Strategy748C
{
    virtual void vfunc_08();
    virtual u32 Select(Entity398A4 *);
};

struct Entity398A4 : public Entity_080E6554
{
    Entity398A4(GameObject *, Actor *) SECTION(".text.entity398a4_ctor");
    virtual ~Entity398A4() SECTION(".text.entity399c0_dtor");

    Actor * actor_34;
    SmartPtr<u8> strategies_38[5];
    u32 mode_4C;
    u32 unk_50;
};

struct EntityUpdateContext
{
    void * input_00;
    u8 active_04;
};

struct Entity398A4State
{
    u32 unk_00;
    u8 pad_04[6];
    u16 flags_0A;
};

struct Entity398A4Mode2Bits
{
    u32 timer : 16;
    u32 last_x : 16;
    u32 last_y : 16;
    u32 retry_count : 8;
    u32 target_id : 8;
};

struct Entity398A4Collision
{
    Entity398A4Collision(
        TerrainMapView const & terrain,
        Box const & box,
        i32 range,
        i32 zero)
        : unk_00(0x21),
          unk_04(-0x21),
          unk_08(-0x21),
          unk_0C(0x21),
          terrain_14(terrain),
          box_20(box),
          range_28(range),
          unk_2C(zero),
          unk_30(zero)
    {
    }

    i32 unk_00;
    i32 unk_04;
    i32 unk_08;
    i32 unk_0C;
    u32 unk_10;
    TerrainMapView terrain_14;
    Box box_20;
    i32 range_28;
    i32 unk_2C;
    i32 unk_30;
};

typedef Entity398A4State * (*GetState398A4)(GameObject *);

struct GameObjectVtable398A4
{
    void * pad_00[0x144 / 4];
    GetState398A4 get_state_144;
};

struct EntityStrategyMode4Bits
{
    u32 timer : 16;
    u32 sub_counter : 7;
    u32 target_kind : 1;
    u32 facing_timer : 8;
};

struct Entity39F50Child;

struct Entity39F50ChildVTable
{
    void * unk_00[2];
    void (*destroy)(Entity39F50Child *, u32);
};

struct Entity39F50Child
{
    u8 pad_00[0x24];
    Entity39F50ChildVTable * vtable_24;
};

struct Entity39F50Owner
{
    u8 pad_00[8];
    u8 effect_08[0x40];
    Entity39F50Child * child_48;
    void * vtable_4C;
};

struct SoundPlayer3A350;

struct SoundPlayerList3A350
{
    SoundPlayer3A350 ** begin;
    SoundPlayer3A350 ** end;
};

struct GameObjectVtable3A350
{
    STRUCT_PAD(0x000, 0x14C);
    SoundPlayerList3A350 * (*get_object_list)(GameObject *);
};

struct Entity3A350Owner
{
    GameObject * owner_00;
};

struct Entity3A798Raw
{
    u8 bytes[0x20];
};

struct Entity38740 : public AEntity
{
    Entity38740(GameObject *, void *) SECTION(".text.entity38740_ctor");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.entity38740_factory");

    void MethodB8() SECTION(".text.entity38740_b8");
    void MethodC8() SECTION(".text.entity38740_c8");
    bool MethodD8() SECTION(".text.entity38740_d8");
    void MethodEC() SECTION(".text.entity38740_ec");
    void MethodFC() SECTION(".text.entity38740_fc");
    bool Method0C() SECTION(".text.entity38740_0c");

    void * state_18;
};

EC void func_08038DF0(UnknownEntityThing *);
EC void func_08038E90(Entity38740Controller *) SECTION(".text.entity38740_ctrl_e90");
EC bool func_08038EA0(Entity38740Controller *) SECTION(".text.entity38740_ctrl_ea0");
EC void func_080A47B4(void *, u32);
EC void func_08038EB8(Entity38740Controller *) SECTION(".text.entity38740_ctrl_eb8");
EC void func_08038EE0(UnknownEntityThing *);
EC bool func_080390D0(Entity38740Controller *) SECTION(".text.entity38740_ctrl_390d0");
EC u32 func_08039134(GameObject *, u32, i32, i32) SECTION(".text.entity39134_nearest");
EC bool func_080391C0(i32, i32) SECTION(".text.entity391c0_area");
EC void func_080391FC() SECTION(".text.entity391fc_noop");
EC bool func_08039200() SECTION(".text.entity39200_false");
EC bool func_0803930C() SECTION(".text.entity3930c_true");
EC u32 func_080396F4(void *, EntityStrategyOwnerView *) SECTION(".text.entity396f4_mode");
EC u32 func_080398A0() SECTION(".text.entity398a0_two");
EC u32 func_08039E88() SECTION(".text.entity39e88_two");
EC void * func_08039E8C(EntityStrategyOwnerView *) SECTION(".text.entity39e8c_strategy");
EC u16 gUnk_080F16AE[];
EC u16 gUnk_080F16C2[];
EC i16 gUnk_080F16D2[256];
EC UnknownEntityThing * func_08039A30(AActorEntity *) SECTION(".text.entity39a30_factory");
EC void func_08039A5C() SECTION(".text.entity39a5c_noop");
EC u32 func_08039D4C(void *, u32) SECTION(".text.entity39d4c_table");
EC u32 func_08039D5C(void *, u32) SECTION(".text.entity39d5c_mask");
EC bool func_08039D98(EntityStrategyOwnerView *) SECTION(".text.entity39d98_mode");
EC u32 func_080AB788(u32);
EC void func_0809C0C8(EntityStrategyStateView &, u32 const *);
EC void func_0809C068(EntityStrategyStateView &, int);
EC void func_08032384(EntityStrategyOwnerView &, u32, bool);
EC void func_08020080(AActorEntity *, u32);
EC void func_080200C4(EntityStrategyOwnerView *, u32);
EC void func_0809C0AC(Actor &, u32 const *);
EC void func_080ABA90(void *, Box const &, u32);
EC void func_08020170(AActorEntity *, void *);
EC void func_08039A60(Entity398A4 *, EntityUpdateContext *) SECTION(".text.entity39a60_update");
EC u32 func_0803A144(void *, u16 *, i8) SECTION(".text.entity3a144_table");
EC i16 func_0803A320(void *, i16) SECTION(".text.entity3a320_sine");
EC i16 func_0803A334(void *, i16) SECTION(".text.entity3a334_cosine");
EC bool IsSoundPlayerBusy3A350(SoundPlayer3A350 *) asm("func_08008CD0");
EC void StartSongOnPlayer3A350(SoundPlayer3A350 *, u16) asm("func_08008B6C");
EC void func_0803A350(Entity3A350Owner *, u32) SECTION(".text.entity3a350_sound");
EC void * vtable_unk_080E7568[];
EC void AEntityCtor3A798(AEntity *, GameObject *, Location const &)
    asm("__7AEntityP10GameObjectRC8Location");
EC Entity3A798Raw * func_0803A798(GameObject *, void *) SECTION(".text.entity3a798_factory");
EC void func_08039DA8(EntityStrategyOwnerView *) SECTION(".text.entity39da8_setup");
EC void func_08039E18(EntityStrategyOwnerView *) SECTION(".text.entity39e18_setup");
EC void * vtable_unk_080E76BC[];
EC void func_08039F50(Entity39F50Owner *, u32) SECTION(".text.entity39f50_dtor");
void func_08038E90(Entity38740Controller * self)
{
    u8 * effect = self->effect_0C;
    *reinterpret_cast<u32 *>(effect + 0x4C) = 0x1200000;
    effect[0x50] = 1;
}

bool func_08038EA0(Entity38740Controller * self)
{
    u8 * effect = self->effect_0C;
    bool result = false;
    if (effect[0x50] == 0)
        result = true;
    return result;
}

void func_08038EB8(Entity38740Controller * self)
{
    u8 ** slot = &self->effect_0C;
    u8 * next = 0;
    u8 * old = self->effect_0C;
    if (next != old)
    {
        if (old != 0)
        {
            func_080A47B4(old, 2);
            delete old;
        }
    }
    *slot = next;
}

bool func_080390D0(Entity38740Controller * self)
{
    return self->collection_10 != 0;
}

Entity398A4::Entity398A4(GameObject * game_object, Actor * actor)
    : Entity_080E6554(game_object, Actor(*actor).location, 0x9C7),
      actor_34(actor)
{
    strategies_38[0] = reinterpret_cast<u8 *>(new Strategy74CC);
    strategies_38[1] = reinterpret_cast<u8 *>(new Strategy74BC);
    strategies_38[2] = reinterpret_cast<u8 *>(new Strategy74AC);
    strategies_38[3] = reinterpret_cast<u8 *>(new Strategy749C);
    strategies_38[4] = reinterpret_cast<u8 *>(new Strategy748C);

    u32 strategy_index = *reinterpret_cast<u32 *>(
        reinterpret_cast<u8 *>(actor_34) + 0x0C);
    StrategyCall * strategy = reinterpret_cast<StrategyCall *>(
        strategies_38[strategy_index].Get());

    u32 mode = strategy->Select(this);

    func_08020080(this, func_08039D5C(this, mode));

    u32 anim = func_08039D4C(this, mode);
    if (anim_id != anim)
        SetAnim(anim);

    mode_4C = mode;
    unk_50 = facing;
}

Entity398A4::~Entity398A4()
{
    Actor * actor = actor_34;
    ActorLocation location = GetLocation();
    actor->SetLocation(location);
}

void func_08039A60(Entity398A4 * self, EntityUpdateContext * update)
{
    GameObject * game_object = self->game_object;

    if (update->active_04 != 0 && self->location_map != 2)
    {
        GameObjectVtable398A4 * vtable =
            *reinterpret_cast<GameObjectVtable398A4 **>(game_object);
        Entity398A4State * state = vtable->get_state_144(game_object);

        if ((state->flags_0A & 0x7FF) == 0x14 && state->unk_00 == 0)
        {
            Vec2 target_position =
                func_080AB788(2) != 0
                    ? Vec2(0x108, 0x2D0)
                    : Vec2(0x154, -0x10);

            u32 target = func_08039134(
                game_object, 2, target_position.x, target_position.y);
            if (target != 0x64 && func_080AB788(0x64) <= 0x0E)
            {
                Location location(2, target_position.x, target_position.y);
                ActorLocation actor_location(location, 1);
                self->SetLocation(actor_location);

                Entity398A4Mode2Bits command;
                command.timer = 0;
                command.retry_count = func_080AB788(8) + 3;
                command.target_id = target;
                func_0809C0AC(
                    *self->actor_34,
                    reinterpret_cast<u32 const *>(&command));
                func_080200C4(
                    reinterpret_cast<EntityStrategyOwnerView *>(self),
                    0xAB);
            }
        }
    }

    u32 map = self->location_map;
    if (map != MAP_NONE)
    {
        TerrainMapView terrain = game_object->GetLocationTerrain(map);
        Box box = self->GetBox();

        Entity398A4Collision collision(terrain, box, 0x20, 0);

        AEntity * entity = self->game_object->vfunc_40(0);
        if (entity != 0 && entity->location_map == map)
        {
            Box entity_box = entity->GetBox();
            func_080ABA90(&collision, entity_box, 0);
        }

        entity = self->game_object->vfunc_40(0x4A);
        if (entity != 0 && entity->location_map == map)
        {
            Box entity_box = entity->GetBox();
            func_080ABA90(&collision, entity_box, 0);
        }

        u32 strategy_index = *reinterpret_cast<u32 *>(
            reinterpret_cast<u8 *>(self->actor_34) + 0x0C);
        reinterpret_cast<StrategyCall *>(
            self->strategies_38[strategy_index].Get())->Update(self, &collision);

        strategy_index = *reinterpret_cast<u32 *>(
            reinterpret_cast<u8 *>(self->actor_34) + 0x0C);
        u32 mode = reinterpret_cast<StrategyCall *>(
            self->strategies_38[strategy_index].Get())->Select(self);

        u32 facing = self->facing;
        u32 old_mode = self->mode_4C;
        u8 * facing_ptr = &self->facing;

        if (mode != old_mode || facing != self->unk_50)
            func_08020080(self, func_08039D5C(self, mode));

        if (mode != self->mode_4C)
        {
            u32 anim = func_08039D4C(self, mode);
            if (self->anim_id != anim)
                self->SetAnim(anim);
        }

        self->mode_4C = mode;
        self->unk_50 = facing;

        void * collision_ptr = &collision;
        strategy_index = *reinterpret_cast<u32 *>(
            reinterpret_cast<u8 *>(self->actor_34) + 0x0C);
        u32 facing_check = *facing_ptr;
        if (strategy_index >= 1 && strategy_index <= 2 &&
            facing_check <= 1 &&
            func_080391C0(self->x_q16 >> 16, self->y_q16 >> 16))
        {
            collision_ptr = 0;
        }

        func_08020170(self, collision_ptr);
    }

    self->unk_30 = false;

    if (self->unk_24 != 0)
        --self->unk_24;
    else
        self->unk_24 = self->unk_26;

    if (self->unk_10.Get() != 0)
        self->unk_10->vfunc_0C();
}

u32 func_0803A144(void *, u16 * output, i8 index)
{
    u32 selected = static_cast<u8>(index);
    if (index < 0)
        selected = static_cast<u8>(func_080AB788(3));

    u16 * table = gUnk_080F16C2;
    i32 signed_index = static_cast<i8>(selected);
    output[2] = table[signed_index * 2];
    output[3] = gUnk_080F16C2[signed_index * 2 + 1];
    return signed_index;
}

i16 func_0803A320(void *, i16 angle)
{
    return gUnk_080F16D2[angle];
}

i16 func_0803A334(void *, i16 angle)
{
    return gUnk_080F16D2[(angle + 0x40) & 0xFF];
}

void func_0803A350(Entity3A350Owner * self, u32 song_id)
{
    GameObject * object = self->owner_00;
    GameObjectVtable3A350 * vtable =
        *reinterpret_cast<GameObjectVtable3A350 **>(object);
    SoundPlayerList3A350 * sound_players = vtable->get_object_list(object);
    SoundPlayer3A350 ** player = sound_players->begin;
    SoundPlayer3A350 ** end = sound_players->end;
    SoundPlayer3A350 * selected_player;

    if (player != end)
    {
    scan_player:
        if (IsSoundPlayerBusy3A350(*player))
            goto next_player;

        selected_player = *player;
        goto play_sound;

    next_player:
        ++player;
        if (player != end)
            goto scan_player;
    }

    selected_player = *(end - 1);

play_sound:
    StartSongOnPlayer3A350(selected_player, song_id);
}

Entity3A798Raw * func_0803A798(GameObject * game_object, void * state)
{
    Entity3A798Raw * result = new Entity3A798Raw;

    Location location(0, 0, 0);
    AEntityCtor3A798(
        reinterpret_cast<AEntity *>(result),
        game_object,
        location);

    *reinterpret_cast<void **>(result->bytes + 0x14) = vtable_unk_080E7568;
    *reinterpret_cast<void **>(result->bytes + 0x18) = state;
    result->bytes[0x1C] = 1;

    return result;
}

u32 func_08039134(
    GameObject * game_object,
    u32 location_map,
    i32 x,
    i32 y)
{
    u32 result = 0x64;
    i32 best_distance = 0;

    for (i32 entity_selector = 0x2E;
         entity_selector <= 0x45;
         ++entity_selector)
    {
        Entity39134 * entity = reinterpret_cast<Entity39134 *>(
            game_object->vfunc_40(entity_selector));

        if (entity == 0)
            continue;

        if (entity->location_map != location_map)
            continue;

        if (!entity->vtable->is_active(entity))
            continue;

        i32 x_diff = entity->x - x;
        i32 y_diff = entity->y - y;
        i32 distance = x_diff * x_diff + y_diff * y_diff;
        i32 saved_distance = distance;

        if (result == 0x64 || best_distance > distance)
        {
            result = entity_selector;
            best_distance = saved_distance;
        }
    }

    return result;
}

bool func_080391C0(i32 x, i32 y)
{
    if (y <= 0x38 && x > 0x143 && x <= 0x164)
        return true;

    if (y > 0x27F && x > 0xF7 && x <= 0x118)
        return true;

    return false;
}

void func_080391FC()
{
}

bool func_08039200()
{
    return false;
}

bool func_0803930C()
{
    return true;
}

u32 func_080396F4(void *, EntityStrategyOwnerView * owner)
{
    u32 flag = owner->state_34->flag_12;
    u32 result = 0;
    if (flag != 0)
        result = 3;
    return result;
}

u32 func_080398A0()
{
    return 2;
}

u32 func_08039E88()
{
    return 2;
}

void * func_08039E8C(EntityStrategyOwnerView * owner)
{
    u32 offset = owner->state_34->mode_0C << 2;
    u8 * base = reinterpret_cast<u8 *>(
        offset + reinterpret_cast<u32>(owner));
    return *reinterpret_cast<void **>(base + 0x38);
}

UnknownEntityThing * func_08039A30(AActorEntity * owner)
{
    return new UnknownEntityThing(owner, 2, 0x1B, 0, 8, 0, false);
}

void func_08039A5C()
{
}

u32 func_08039D4C(void *, u32 index)
{
    return gUnk_080F16AE[index];
}

u32 func_08039D5C(void *, u32 mode)
{
    u32 result;
    switch (mode)
    {
        case 0:
            result = 0;
            break;
        case 1:
            result = 0x8000;
            break;
        case 2:
            result = 0x10000;
            break;
        case 3:
        case 4:
        default:
            result = 0;
            break;
    }
    return result;
}

bool func_08039D98(EntityStrategyOwnerView * owner)
{
    return owner->state_34->mode_0C != 4;
}

void func_08039DA8(EntityStrategyOwnerView * owner)
{
    if (owner->state_34->mode_0C == 1)
        return;

    EntityStrategyMode4Bits next;
    next.timer = func_080AB788(0x78) + 0xF0;
    next.sub_counter = 0x3C;
    next.target_kind = 0;
    next.facing_timer = 0;

    func_0809C0C8(
        *owner->state_34,
        reinterpret_cast<u32 const *>(&next));
    func_0809C068(*owner->state_34, 0xF);
    func_08032384(*owner, 2, false);
    func_080200C4(owner, 0xAA);
}

void func_08039E18(EntityStrategyOwnerView * owner)
{
    if (owner->state_34->mode_0C == 1)
        return;

    EntityStrategyMode4Bits next;
    next.timer = func_080AB788(0x78) + 0xF0;
    next.sub_counter = 0x3C;
    next.target_kind = 1;
    next.facing_timer = 0;

    func_0809C0C8(
        *owner->state_34,
        reinterpret_cast<u32 const *>(&next));
    func_0809C068(*owner->state_34, 4);
    func_08032384(*owner, 2, false);
    func_080200C4(owner, 0xAA);
}

void func_08039F50(Entity39F50Owner * self, u32 flags)
{
    self->vtable_4C = vtable_unk_080E76BC;

    Entity39F50Child * child = self->child_48;
    if (child != 0)
        child->vtable_24->destroy(child, 3);

    func_080A47B4(self->effect_08, 2);

    if ((flags & 1) != 0)
        delete reinterpret_cast<u8 *>(self);
}

Entity38740::Entity38740(GameObject * game_object, void * state)
    : AEntity(game_object, Location(8, 0, 0)),
      state_18(state)
{
}

UnknownEntityThing * Entity38740::vfunc_30()
{
    return reinterpret_cast<UnknownEntityThing *>(
        new Entity38740Controller(this));
}
void Entity38740::MethodB8()
{
    UnknownEntityThing * controller = unk_10.Get();
    if (controller != 0)
        func_08038DF0(controller);
}

void Entity38740::MethodC8()
{
    Entity38740Controller * controller =
        reinterpret_cast<Entity38740Controller *>(unk_10.Get());
    if (controller != 0)
        func_08038E90(controller);
}
bool Entity38740::MethodD8()
{
    Entity38740Controller * controller =
        reinterpret_cast<Entity38740Controller *>(unk_10.Get());
    if (controller != 0)
        return func_08038EA0(controller);
    return true;
}

void Entity38740::MethodEC()
{
    Entity38740Controller * controller =
        reinterpret_cast<Entity38740Controller *>(unk_10.Get());
    if (controller != 0)
        func_08038EB8(controller);
}

void Entity38740::MethodFC()
{
    UnknownEntityThing * controller = unk_10.Get();
    if (controller != 0)
        func_08038EE0(controller);
}

bool Entity38740::Method0C()
{
    Entity38740Controller * controller =
        reinterpret_cast<Entity38740Controller *>(unk_10.Get());
    if (controller != 0)
        return func_080390D0(controller);
    return false;
}
