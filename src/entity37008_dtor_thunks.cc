#include "entity_unk_08037008.hh"

extern void Entity37008DtorRaw(UnkEntity37008 *) asm("_._14UnkEntity37008");

#define ENTITY37008_DTOR_THUNK(name) \
    EC void name(UnkEntity37008 * self) SECTION(".text.entity37008_dtor_thunks"); \
    void name(UnkEntity37008 * self) { Entity37008DtorRaw(self); }

ENTITY37008_DTOR_THUNK(func_080DCB4C)
ENTITY37008_DTOR_THUNK(func_080DCB58)
ENTITY37008_DTOR_THUNK(func_080DCB64)
ENTITY37008_DTOR_THUNK(func_080DCB70)
