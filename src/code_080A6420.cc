#include "prelude.h"

struct RendererState_080A6420
{
    u32 unk_00;
};

EC u32 func_0803A8A4(u32, u32, u32, u32, u32);

EC u32 func_080A6420(RendererState_080A6420 * self)
{
    return func_0803A8A4(self->unk_00, 1, 0, 0, 0);
}
