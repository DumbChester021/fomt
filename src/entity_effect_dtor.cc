#include "entity_actor.hh"
#include <new>

EC void func_080A47B4(void *, u32);

EC u8 vtable_unk_080E65E0[];

struct UnknownEntityThingHeader
{
    AActorEntity * owner;
    void * vtable;
};

EC void func_080DC8F8(UnknownEntityThing * self, u32 flags)
{
    func_080A47B4(&self->effect_48.base, 2);
    func_080A47B4(&self->effect_08.base, 2);
    reinterpret_cast<UnknownEntityThingHeader *>(self)->vtable = vtable_unk_080E65E0;

    if ((flags & 1) != 0)
        ::operator delete(self);
}
