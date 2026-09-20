#include "unknown_types.hh"

struct Unk_08017C00_04
{
    /* +00 */ u32 unk_00;
    /* +04 */ u32 map_id;
};

struct Unk_08017C00
{
    /* +0000 */ void const * vtable;
    /* +0004 */ Unk_08017C00_04 const * unk_04;
    /* +0008 */ STRUCT_PAD(0x0008, 0x103C);
    /* +103C */ bool unk_103C;
};

EC MapData const * GetMapData(u32 map_id);

EC bool func_08017C00(Unk_08017C00 const & self)
{
    if (self.unk_103C)
        return true;

    if (GetMapData(self.unk_04->map_id)->is_interior)
        return true;

    return false;
}
