#include "entity.hh"

namespace
{
inline AEntity ** GetGameObjectEntitySlots(GameObject * game_object)
{
    return reinterpret_cast<AEntity **>(reinterpret_cast<u8 *>(game_object) + 8);
}
}

AEntity * GameObject::vfunc_44(u32 entity_selector)
{
    AEntity ** slot = GetGameObjectEntitySlots(this);
    slot += entity_selector;
    return *slot;
}

AEntity * GameObject::vfunc_40(u32 entity_selector)
{
    AEntity ** slot = GetGameObjectEntitySlots(this);
    slot += entity_selector;
    return *slot;
}
