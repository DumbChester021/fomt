#include "prelude.h"

struct MenuGlobalOwnerView {
    void * data;
    void * vtable;
};

EC u8 vtable_unk_080E5B54[];
EC u8 vtable_unk_080E8594[];
EC void * gUnk_03000410;
EC void * gUnk_03000414;
EC void __builtin_delete(void *);

EC void DestroyMenuGlobal_080d7aac(MenuGlobalOwnerView * self, u32 mode)
    SECTION(".text.menu_global_dtor_080d7aac");

void DestroyMenuGlobal_080d7aac(MenuGlobalOwnerView * self, u32 mode)
{
    self->vtable = vtable_unk_080E5B54;
    gUnk_03000410 = self->data;
    if (mode & 1)
        __builtin_delete(self);
}

EC void DestroyMenuGlobal_080d7b04(MenuGlobalOwnerView * self, u32 mode)
    SECTION(".text.menu_global_dtor_080d7b04");

void DestroyMenuGlobal_080d7b04(MenuGlobalOwnerView * self, u32 mode)
{
    self->vtable = vtable_unk_080E5B54;
    gUnk_03000410 = self->data;
    if (mode & 1)
        __builtin_delete(self);
}

EC void DestroyMenuGlobal_080e581c(MenuGlobalOwnerView * self, u32 mode)
    SECTION(".text.menu_global_dtor_080e581c");

void DestroyMenuGlobal_080e581c(MenuGlobalOwnerView * self, u32 mode)
{
    self->vtable = vtable_unk_080E8594;
    gUnk_03000414 = self->data;
    if (mode & 1)
        __builtin_delete(self);
}

EC void DestroyMenuGlobal_080e5844(MenuGlobalOwnerView * self, u32 mode)
    SECTION(".text.menu_global_dtor_080e5844");

void DestroyMenuGlobal_080e5844(MenuGlobalOwnerView * self, u32 mode)
{
    self->vtable = vtable_unk_080E8594;
    gUnk_03000414 = self->data;
    if (mode & 1)
        __builtin_delete(self);
}
