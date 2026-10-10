#include "prelude.h"

struct MenuSimpleDtorView { void *vtable; };
EC void __builtin_delete(void *);
EC u8 vtable_unk_080E5A28[];
EC u8 vtable_unk_080E76F8[];
EC u8 vtable_unk_080E78F0[];
EC u8 vtable_unk_080E61A0[];

EC void DestroyMenuSimple_080d3ed4(MenuSimpleDtorView *self, u32 mode)
    SECTION(".text.menu_simple_dtor_080d3ed4");
void DestroyMenuSimple_080d3ed4(MenuSimpleDtorView *self, u32 mode)
{
    self->vtable = vtable_unk_080E5A28;
    if (mode & 1) __builtin_delete(self);
}

EC void DestroyMenuSimple_080de220(MenuSimpleDtorView *self, u32 mode)
    SECTION(".text.menu_simple_dtor_080de220");
void DestroyMenuSimple_080de220(MenuSimpleDtorView *self, u32 mode)
{
    self->vtable = vtable_unk_080E76F8;
    if (mode & 1) __builtin_delete(self);
}

EC void DestroyMenuSimple_080e103c(MenuSimpleDtorView *self, u32 mode)
    SECTION(".text.menu_simple_dtor_080e103c");
void DestroyMenuSimple_080e103c(MenuSimpleDtorView *self, u32 mode)
{
    self->vtable = vtable_unk_080E78F0;
    if (mode & 1) __builtin_delete(self);
}

EC void DestroyMenuSimple_080e3d94(MenuSimpleDtorView *self, u32 mode)
    SECTION(".text.menu_simple_dtor_080e3d94");
void DestroyMenuSimple_080e3d94(MenuSimpleDtorView *self, u32 mode)
{
    self->vtable = vtable_unk_080E76F8;
    if (mode & 1) __builtin_delete(self);
}

EC void DestroyMenuSimple_080e4190(MenuSimpleDtorView *self, u32 mode)
    SECTION(".text.menu_simple_dtor_080e4190");
void DestroyMenuSimple_080e4190(MenuSimpleDtorView *self, u32 mode)
{
    self->vtable = vtable_unk_080E76F8;
    if (mode & 1) __builtin_delete(self);
}

EC void DestroyMenuSimple_080e4544(MenuSimpleDtorView *self, u32 mode)
    SECTION(".text.menu_simple_dtor_080e4544");
void DestroyMenuSimple_080e4544(MenuSimpleDtorView *self, u32 mode)
{
    self->vtable = vtable_unk_080E61A0;
    if (mode & 1) __builtin_delete(self);
}
