#include "prelude.h"

EC void func_080073E0(void *, u32);
EC void func_08007184(void *, u32);
EC void func_08007C28(void *, u32);
EC void func_080079E8(void *, u32);
EC void func_080086BC(void *, u32);
EC u8 vtable_unk_080E5A28[];

struct HardwareRefView514
{
    u32 base;
    u32 value;

    void Destroy()
    {
        func_080073E0(this, value);
        func_08007184(this, 2);
    }
};

struct ResourceRefView514
{
    u32 base;
    u32 value;

    void Destroy()
    {
        func_08007C28(this, value);
        func_080079E8(this, 2);
    }
};

struct MenuScene5143CView
{
    u8 pad_00[0x10];
    void * animation_provider_vtable;
    u8 pad_14[0x94];
    ResourceRefView514 resource;
    HardwareRefView514 hardware_ref;
};

EC void DestroyMenuScene5143C(MenuScene5143CView * self, u32 flags)
    SECTION(".text.menu_scene_dtor_5143c");

void DestroyMenuScene5143C(MenuScene5143CView * self, u32 flags)
{
    self->hardware_ref.Destroy();
    self->resource.Destroy();
    self->animation_provider_vtable = vtable_unk_080E5A28;
    func_080086BC(self, flags);
}
