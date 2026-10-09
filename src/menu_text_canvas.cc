#include "menu_text.hh"
#include "gbasvc.h"

u32 DrawUnalignedMenuGlyph(MenuTextSize, u8 *, u32, u32, MenuGlyphTiles const *)
{
    return 0;
}

u32 DrawUnalignedStyledMenuGlyph(MenuTextSize, u8 *, u32, u32,
                               MenuGlyphTiles const *, u32, u32)
{
    return 0;
}

void CopyMenuText(MenuTextSize size, u8 * destination, u32 const * source)
{
    u32 bytes = (u32)size.width * (u32)size.height * 32;
    CpuFastSet(source, destination, (bytes / 4) & 0x1FFFFF);
}
