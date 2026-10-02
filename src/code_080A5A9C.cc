#include "prelude.h"

struct RendererState_080A5A9C
{
    STRUCT_PAD(0x00, 0x8C);
    u32 movement_countdown;
};

EC bool func_080A5A9C(RendererState_080A5A9C * self)
{
    return self->movement_countdown == 0;
}
