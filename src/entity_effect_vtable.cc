#include "entity_effect.hh"

EC void func_080DC8F8(UnknownEntityThing *, u32);
EC void func_0803260C(UnknownEntityThing *);
EC void func_08032690(UnknownEntityThing *, EntityRenderContext *);

EC UnknownEntityThingVtable const vtable_unk_080E68B4 =
{
    0,
    0,
    func_080DC8F8,
    func_0803260C,
    func_08032690,
};
