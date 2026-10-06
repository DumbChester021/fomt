#include "entity.hh"

#pragma interface

struct Entity38740 : public AEntity
{
    Entity38740(GameObject *, void *);
    virtual UnknownEntityThing * vfunc_30();

    void MethodB8() SECTION(".text.entity38740_b8");
    void MethodC8() SECTION(".text.entity38740_c8");
    void MethodEC() SECTION(".text.entity38740_ec");
    void MethodFC() SECTION(".text.entity38740_fc");

    void * state_18;
};

EC void func_08038DF0(UnknownEntityThing *);
EC void func_08038E90(UnknownEntityThing *);
EC void func_08038EB8(UnknownEntityThing *);
EC void func_08038EE0(UnknownEntityThing *);

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
