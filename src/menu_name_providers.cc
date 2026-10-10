#include "prelude.h"
#include <new>
#include <string.h>

// Descriptive views for the small menu/provider vtable family around E797C..E7A08.
// Names here describe recovered behavior and do not claim original class names.

struct MenuProviderNameResult
{
    u8 valid;
    u8 padding[3];
    char text[32];
};

struct MenuProviderLifetimeView
{
    void * vtable;
};

struct IndexedItemNameProviderView
{
    void * vtable;
    u32 index;
};

struct StoredStringNameProviderView
{
    void * vtable;
    char const * text;
};

struct LargeProviderWrapperView
{
    u8 pad_0000[0x9C4];
    void * nested_vtable;
};

EC u8 vtable_unk_080E76F8[];
EC u8 vtable_unk_080E5A28[];
EC char gUnk_080FB000[][20];
EC void func_08076EA8(void *);
EC void func_08076E0C(void *, u32);

static inline void CopyProviderName31(char * dest, char const * source)
{
    u32 length = strlen(source);
    if (length > 31)
        length = 31;
    memcpy(dest, source, length);
    dest[length] = 0;
}

EC void DestroyAnimalNameProvider(MenuProviderLifetimeView * self, u32 flags)
    SECTION(".text.menu_provider_dtor_e1824");

void DestroyAnimalNameProvider(MenuProviderLifetimeView * self, u32 flags)
{
    self->vtable = vtable_unk_080E76F8;
    if ((flags & 1) != 0)
        ::operator delete(self);
}

EC MenuProviderNameResult * BuildIndexedItemName(
    MenuProviderNameResult * out,
    IndexedItemNameProviderView const * self,
    u32 mode) SECTION(".text.menu_indexed_item_name");

MenuProviderNameResult * BuildIndexedItemName(
    MenuProviderNameResult * out,
    IndexedItemNameProviderView const * self,
    u32 mode)
{
    char text[32];

    if (mode == 0xFF)
    {
        CopyProviderName31(text, gUnk_080FB000[self->index]);
        out->valid = 1;
        strcpy(out->text, text);
    }
    else
    {
        text[0] = 0;
        out->valid = 0;
        strcpy(out->text, text);
    }

    return out;
}

EC void DestroyIndexedItemNameProvider(MenuProviderLifetimeView * self, u32 flags)
    SECTION(".text.menu_provider_dtor_e1964");

void DestroyIndexedItemNameProvider(MenuProviderLifetimeView * self, u32 flags)
{
    self->vtable = vtable_unk_080E76F8;
    if ((flags & 1) != 0)
        ::operator delete(self);
}

EC void DestroySpriteAnimationProviderLifetime(MenuProviderLifetimeView * self, u32 flags)
    SECTION(".text.menu_provider_dtor_e1984");

void DestroySpriteAnimationProviderLifetime(MenuProviderLifetimeView * self, u32 flags)
{
    self->vtable = vtable_unk_080E5A28;
    if ((flags & 1) != 0)
        ::operator delete(self);
}

EC MenuProviderNameResult * BuildStoredStringName(
    MenuProviderNameResult * out,
    StoredStringNameProviderView const * self,
    u32 mode) SECTION(".text.menu_stored_string_name");

MenuProviderNameResult * BuildStoredStringName(
    MenuProviderNameResult * out,
    StoredStringNameProviderView const * self,
    u32 mode)
{
    char text[32];

    if (mode == 0xFF)
    {
        CopyProviderName31(text, self->text);
        out->valid = 1;
        strcpy(out->text, text);
    }
    else
    {
        text[0] = 0;
        out->valid = 0;
        strcpy(out->text, text);
    }

    return out;
}

EC void DestroyStoredStringNameProvider(MenuProviderLifetimeView * self, u32 flags)
    SECTION(".text.menu_provider_dtor_e1a28");

void DestroyStoredStringNameProvider(MenuProviderLifetimeView * self, u32 flags)
{
    self->vtable = vtable_unk_080E76F8;
    if ((flags & 1) != 0)
        ::operator delete(self);
}

EC u8 RunProviderCheck(void * self)
    SECTION(".text.menu_provider_check_e1a48");

u8 RunProviderCheck(void * self)
{
    func_08076EA8(self);
    return 1;
}

EC void CleanupLargeProvider(LargeProviderWrapperView * self, u32 flags)
    SECTION(".text.menu_provider_cleanup_e1a54");

void CleanupLargeProvider(LargeProviderWrapperView * self, u32 flags)
{
    self->nested_vtable = vtable_unk_080E5A28;
    func_08076E0C(self, flags);
}

EC u8 CheckMenuRangeProvider(void * self)
    SECTION(".text.menu_range_check_e1dbc");

u8 CheckMenuRangeProvider(void * self)
{
    func_08076EA8(self);
    return 1;
}

EC void ReleaseMenuRangeProvider(void * self, u32 flags)
    SECTION(".text.menu_range_release_e1dc8");

void ReleaseMenuRangeProvider(void * self, u32 flags)
{
    func_08076E0C(self, flags);
}
