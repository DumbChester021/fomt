#include "entity.hh"

#pragma interface

struct Entity38740;

struct Entity38740Controller
{
    Entity38740Controller(Entity38740 *) asm("func_08038820");

    u8 data[0x18];
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
EC void func_08038E90(UnknownEntityThing *);
EC bool func_08038EA0(UnknownEntityThing *);
EC void func_08038EB8(UnknownEntityThing *);
EC void func_08038EE0(UnknownEntityThing *);
EC bool func_080390D0(UnknownEntityThing *);

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
    UnknownEntityThing * controller = unk_10.Get();
    if (controller != 0)
        func_08038E90(controller);
}
bool Entity38740::MethodD8()
{
    UnknownEntityThing * controller = unk_10.Get();
    if (controller != 0)
        return func_08038EA0(controller);
    return true;
}

void Entity38740::MethodEC()
{
    UnknownEntityThing * controller = unk_10.Get();
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
    UnknownEntityThing * controller = unk_10.Get();
    if (controller != 0)
        return func_080390D0(controller);
    return false;
}
