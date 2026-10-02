#include "prelude.h"
#include "intrusive_callback_list.hh"
#include <new>

EC u8 vtable_unk_080E82E4[];
EC u8 vtable_unk_080E830C[];

struct UnkAnimDesc_080A4BEC
{
    u32 unk_00;
    void * unk_04;
    u16 duration;
    u16 unk_0A;
};

struct UnkColor_080A4A94
{
    void Clear()
    {
        x = 0;
        y = 0;
        z = 0;
    }

    void Advance(UnkAnimDesc_080A4BEC const * descriptor)
    {
        if (++z >= descriptor->duration)
        {
            z = 0;
            y = 1;
        }
    }

    u8 x;
    u8 y;
    u8 z;
    u8 pad;
};

struct UnkNode_080A4A94 : IntrusiveCallbackNode
{
    void Init()
    {
        pprev = 0;
        next = 0;
        vtable = vtable_unk_080E830C;
    }
};

struct Unk_080A4A94
{
    u32 unk_00;
    u32 unk_04;
    u32 unk_08;
    u32 unk_0C;
    u8 * large_buffers[3];
    u8 * small_buffers[3];
    u8 unk_28;
    u8 unk_29;
    u8 unk_2A;
    u8 pad_2B;
    u8 * full_buffer;
    UnkColor_080A4A94 color_30;
    UnkColor_080A4A94 color_34;
    UnkColor_080A4A94 color_38;
    UnkColor_080A4A94 color_3C;
    UnkColor_080A4A94 color_40;
    UnkColor_080A4A94 color_44;
    UnkColor_080A4A94 color_48;
    UnkColor_080A4A94 color_4C;
    UnkColor_080A4A94 color_50;
    UnkColor_080A4A94 color_54;
    u8 unk_58;
    u8 pad_59[3];
    UnkNode_080A4A94 node;
    STRUCT_PAD(0x68, 0x84);
    u32 unk_84;
    u32 unk_88;
    u32 unk_8C;
    void * vtable;

    Unk_080A4A94() asm("func_080A4A94");
    void Update() asm("func_080A4BEC");
};

Unk_080A4A94::Unk_080A4A94()
{
    vtable = vtable_unk_080E82E4;
    unk_00 = 0x234;
    unk_04 = 0x42;
    unk_08 = 0;
    unk_0C = 0;
    unk_28 = 0;
    unk_29 = 0;
    unk_2A = 0;
    full_buffer = 0;

    color_30.Clear();
    color_34.Clear();
    color_38.Clear();
    color_3C.Clear();
    color_40.Clear();
    color_44.Clear();
    color_48.Clear();
    color_4C.Clear();
    color_50.Clear();
    color_54.Clear();

    unk_58 = 0;
    node.Init();
    unk_8C = 0;

    for (u32 i = 0; i <= 2; ++i)
        small_buffers[i] = new u8[0x1E0];

    for (u32 i = 0; i <= 2; ++i)
        large_buffers[i] = new u8[0x7900];

    full_buffer = new u8[0xF200];
}


void DestroyUnk_080A4A94(Unk_080A4A94 * self, u32 flags) asm("func_080A4B6C");

void DestroyUnk_080A4A94(Unk_080A4A94 * self, u32 flags)
{
    self->vtable = vtable_unk_080E82E4;

    if (self->full_buffer != 0)
        delete[] self->full_buffer;

    for (u32 i = 0; i <= 2; ++i)
    {
        if (self->large_buffers[i] != 0)
            delete[] self->large_buffers[i];
    }

    for (u32 i = 0; i <= 2; ++i)
    {
        if (self->small_buffers[i] != 0)
            delete[] self->small_buffers[i];
    }

    DestroyIntrusiveCallbackNode(&self->node, 2);

    if ((flags & 1) != 0)
        ::operator delete(self);
}


EC UnkAnimDesc_080A4BEC gUnk_08107114;
EC UnkAnimDesc_080A4BEC gUnk_08107120;
EC UnkAnimDesc_080A4BEC gUnk_0810712C;
EC UnkAnimDesc_080A4BEC gUnk_08107138;
EC UnkAnimDesc_080A4BEC gUnk_0810715C;
EC UnkAnimDesc_080A4BEC gUnk_08107168;
EC UnkAnimDesc_080A4BEC gUnk_08107174;
EC UnkAnimDesc_080A4BEC gUnk_08107180;
EC UnkAnimDesc_080A4BEC gUnk_0810718C;
EC UnkAnimDesc_080A4BEC gUnk_08107198;
EC UnkAnimDesc_080A4BEC gUnk_081071A4;
EC UnkAnimDesc_080A4BEC gUnk_081071B0;
EC UnkAnimDesc_080A4BEC gUnk_081071BC;
EC UnkAnimDesc_080A4BEC gUnk_081071C8;
EC UnkAnimDesc_080A4BEC gUnk_081071D4;
EC UnkAnimDesc_080A4BEC gUnk_081071E0;
EC UnkAnimDesc_080A4BEC gUnk_081071EC;
EC UnkAnimDesc_080A4BEC gUnk_081071F8;

void Unk_080A4A94::Update()
{
    if (unk_8C != 0)
    {
        unk_08 += unk_84;
        unk_0C += unk_88;
        --unk_8C;
        unk_29 = 1;
    }

    switch (unk_04)
    {
    case 14:
        color_40.Advance(&gUnk_0810718C);
        color_44.Advance(&gUnk_08107198);
        color_48.Advance(&gUnk_081071A4);
        break;

    case 15:
        color_40.Advance(&gUnk_081071B0);
        color_44.Advance(&gUnk_081071BC);
        color_48.Advance(&gUnk_081071C8);
        break;

    case 60:
        color_50.Advance(&gUnk_081071F8);
        break;

    case 31:
        color_54.Advance(&gUnk_081071E0);
        break;

    case 8:
        color_4C.Advance(&gUnk_081071D4);
        break;

    case 9:
        color_4C.Advance(&gUnk_081071EC);
        break;

    case 6:
        color_38.Advance(&gUnk_0810715C);
        color_3C.Advance(&gUnk_08107168);
        break;

    case 7:
        color_38.Advance(&gUnk_08107174);
        color_3C.Advance(&gUnk_08107180);
        break;

    case 0:
    case 62:
    case 63:
        color_30.Advance(&gUnk_08107114);
        color_34.Advance(&gUnk_0810712C);
        break;

    case 1:
        color_30.Advance(&gUnk_08107120);
        color_34.Advance(&gUnk_08107138);
        break;
    }
}
