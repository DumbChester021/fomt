#include "prelude.h"
#include "unknown_types.hh"

struct RendererState_080A5EA0
{
    u32 unk_00;
    u32 map_id;
};

EC MapData const * GetMapData(u32);
EC void Unpack(void const *, void *);

EC void func_080A5EA0(RendererState_080A5EA0 * self)
{
    MapData const * map = GetMapData(self->map_id);
    Unpack(map->packed_img, (void *)0x06000000);
}
