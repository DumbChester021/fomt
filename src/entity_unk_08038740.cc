#include "entity.hh"

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
