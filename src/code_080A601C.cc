#include "prelude.h"

struct RendererState_080A601C
{
    STRUCT_PAD(0x00, 0x58);
    u8 unk_58;
};

EC void func_080A601C(RendererState_080A601C * self)
{
    self->unk_58 = 0x14;
}
