#include "prelude.h"
#include "map_data.hh"

struct RendererState_080A6420
{
    u32 unk_00;
};

EC u32 func_080A6420(RendererState_080A6420 * self)
{
    return GetMapResourceId(self->unk_00, 1, 0, 0, 0);
}
