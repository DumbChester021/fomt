#include "prelude.h"

EC void func_080086BC(void *, u32);
EC u8 vtable_unk_080E5A28[];

typedef void (*MenuReleaseMethod)(void *, u32);

struct MenuRangeOwnerView {
    u8 pad_00[8];
    void * owned;
    void * provider_vtable;
    u8 pad_10[0x124 - 0x10];
    u32 record_count;
    u8 records[8];
};

#define RANGE_OWNER_CLEANUP(name, section_name) \
    EC void name(MenuRangeOwnerView * self, u32 flags) SECTION(section_name); \
    void name(MenuRangeOwnerView * self, u32 flags) \
    { \
        u8 * header = reinterpret_cast<u8 *>(self) + 0x124; \
        u8 * end = header + 4 + (*reinterpret_cast<u32 *>(header) << 3); \
        u8 * it = reinterpret_cast<u8 *>(self) + 0x128; \
        while (it != end) \
            it += 8; \
        self->provider_vtable = vtable_unk_080E5A28; \
        void * owned = self->owned; \
        if (owned) { \
            void ** vtable = *reinterpret_cast<void ***>(reinterpret_cast<u8 *>(owned) + 0x5B4); \
            reinterpret_cast<MenuReleaseMethod *>(vtable)[2](owned, 3); \
        } \
        func_080086BC(self, flags); \
    }

RANGE_OWNER_CLEANUP(DestroyMenuRangeOwnerE1DD4, ".text.menu_owner_cleanup_e1dd4")
RANGE_OWNER_CLEANUP(DestroyMenuRangeOwnerE211C, ".text.menu_owner_cleanup_e211c")
