#include "prelude.h"
EC void func_080A47B4(void *,u32);
EC u8 vtable_unk_080E65E0[];
EC void __builtin_delete(void *);
struct MenuEntityDtorView {u8 pad_0[4];void * vtable;u8 body[1];};
EC void DestroyMenuEntity_080dce94(MenuEntityDtorView *self,u32 mode) SECTION(".text.menu_entity_dtor_080dce94");
void DestroyMenuEntity_080dce94(MenuEntityDtorView *self,u32 mode) { func_080A47B4(self->body,2); self->vtable = vtable_unk_080E65E0; if(mode & 1) __builtin_delete(self); }
EC void DestroyMenuEntity_080dcec0(MenuEntityDtorView *self,u32 mode) SECTION(".text.menu_entity_dtor_080dcec0");
void DestroyMenuEntity_080dcec0(MenuEntityDtorView *self,u32 mode) { func_080A47B4(self->body,2); self->vtable = vtable_unk_080E65E0; if(mode & 1) __builtin_delete(self); }
EC void DestroyMenuEntity_080dcf20(MenuEntityDtorView *self,u32 mode) SECTION(".text.menu_entity_dtor_080dcf20");
void DestroyMenuEntity_080dcf20(MenuEntityDtorView *self,u32 mode) { func_080A47B4(self->body,2); self->vtable = vtable_unk_080E65E0; if(mode & 1) __builtin_delete(self); }
