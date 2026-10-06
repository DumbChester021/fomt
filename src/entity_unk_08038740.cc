#include "entity.hh"
#include "entity_effect.hh"

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
EC UnknownEntityThing * func_08039A30(AActorEntity *) SECTION(".text.entity39a30_factory");
EC void func_08039A5C() SECTION(".text.entity39a5c_noop");
EC u32 func_08039D4C(void *, u32) SECTION(".text.entity39d4c_table");
EC u32 func_08039D5C(void *, u32) SECTION(".text.entity39d5c_mask");
EC bool func_08039D98(EntityStrategyOwnerView *) SECTION(".text.entity39d98_mode");
EC u32 func_080AB788(u32);
EC void func_0809C0C8(EntityStrategyStateView &, u32 const *);
EC void func_0809C068(EntityStrategyStateView &, int);
EC void func_08032384(EntityStrategyOwnerView &, u32, bool);
EC void func_080200C4(EntityStrategyOwnerView *, u32);
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
