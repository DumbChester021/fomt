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
