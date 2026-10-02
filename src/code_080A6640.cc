#include "prelude.h"

struct RendererStatePair_080A6640
{
    void Clear()
    {
        x = 0;
        y = 0;
    }

    u8 x;
    u8 y;
};

struct RendererState_080A6640
{
    STRUCT_PAD(0x00, 0xB4);
    RendererStatePair_080A6640 state_b4;
    RendererStatePair_080A6640 state_b8;
};

EC void func_080A5760(RendererState_080A6640 *, u32, u32, u32);

EC void func_080A6640(RendererState_080A6640 * self, u32 arg1, u32 arg2, u32 arg3)
{
    func_080A5760(self, arg1, arg2, arg3);
    self->state_b4.Clear();
    self->state_b8.Clear();
}
