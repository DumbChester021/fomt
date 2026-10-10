#include "prelude.h"

EC u8 __vt_7AEntity[];
EC void __builtin_delete(void *);
typedef void (*ReleaseFn)(void *, u32);

struct MenuOwnerDtorView {
    u8 pad_0[16];
    void * owned;
    void * vtable;
};

EC void DestroyMenuOwner_080dce60(MenuOwnerDtorView * self, u32 mode)
    SECTION(".text.menu_owner_dtor_080dce60");

void DestroyMenuOwner_080dce60(MenuOwnerDtorView * self, u32 mode)
{
    self->vtable = __vt_7AEntity;
    void * owned = self->owned;
    if (owned) {
        void ** table = *reinterpret_cast<void ***>((u8 *)owned + 4);
        reinterpret_cast<ReleaseFn *>(table)[2](owned, 3);
    }
    if (mode & 1)
        __builtin_delete(self);
}

EC void DestroyMenuOwner_080dceec(MenuOwnerDtorView * self, u32 mode)
    SECTION(".text.menu_owner_dtor_080dceec");

void DestroyMenuOwner_080dceec(MenuOwnerDtorView * self, u32 mode)
{
    self->vtable = __vt_7AEntity;
    void * owned = self->owned;
    if (owned) {
        void ** table = *reinterpret_cast<void ***>((u8 *)owned + 4);
        reinterpret_cast<ReleaseFn *>(table)[2](owned, 3);
    }
    if (mode & 1)
        __builtin_delete(self);
}

EC void DestroyMenuOwner_080e4510(MenuOwnerDtorView * self, u32 mode)
    SECTION(".text.menu_owner_dtor_080e4510");

void DestroyMenuOwner_080e4510(MenuOwnerDtorView * self, u32 mode)
{
    self->vtable = __vt_7AEntity;
    void * owned = self->owned;
    if (owned) {
        void ** table = *reinterpret_cast<void ***>((u8 *)owned + 4);
        reinterpret_cast<ReleaseFn *>(table)[2](owned, 3);
    }
    if (mode & 1)
        __builtin_delete(self);
}
