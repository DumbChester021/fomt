#include "prelude.h"

// Exact cleanup wrappers for two menu/controller objects that own counted arrays
// of 16-byte records. Names describe recovered behavior only.

struct MenuRangeCleanupView
{
    u8 bytes[1];
};

EC void func_08076E0C(void *, u32);

EC void DestroyMenuDualRangeCleanup(MenuRangeCleanupView * self, u32 flags)
    SECTION(".text.menu_dual_range_cleanup_e1c18");

void DestroyMenuDualRangeCleanup(MenuRangeCleanupView * self, u32 flags)
{
    {
        u8 * header = reinterpret_cast<u8 *>(self) + 0x1638;
        u8 * end = header + 4 + (*reinterpret_cast<u32 *>(header) << 4);
        u8 * it = reinterpret_cast<u8 *>(self) + 0x163C;

        while (it != end)
            it += 16;
    }

    {
        u8 * header = reinterpret_cast<u8 *>(self) + 0x1264;
        u8 * end = header + 4 + (*reinterpret_cast<u32 *>(header) << 4);
        u8 * it = reinterpret_cast<u8 *>(self) + 0x1268;

        while (it != end)
            it += 16;
    }

    func_08076E0C(self, flags);
}

EC void DestroyMenuSingleRangeCleanup(MenuRangeCleanupView * self, u32 flags)
    SECTION(".text.menu_single_range_cleanup_e1d54");

void DestroyMenuSingleRangeCleanup(MenuRangeCleanupView * self, u32 flags)
{
    u8 * header = reinterpret_cast<u8 *>(self) + 0x2164;
    u8 * end = header + 4 + (*reinterpret_cast<u32 *>(header) << 4);
    u8 * it = reinterpret_cast<u8 *>(self) + 0x2168;

    while (it != end)
        it += 16;

    func_08076E0C(self, flags);
}
