#ifndef MENU_GLYPH_CACHE_HH
#define MENU_GLYPH_CACHE_HH

#include "menu_text.hh"
#include "resource_handle.hh"
#include "smart_ptr.hh"

inline bool HasGlyphCacheResource(UnkHandle const & handle)
{
    return handle.value != 0;
}

struct MenuGlyphCacheEntry
{
    u8 * canvas;
    UnkHandle handle;
    u8 dirty;

    u32 Draw(u32 column, u32 code)
    {
        if (column <= 3)
        {
            u8 * destination = canvas;
            u32 x = (column & 3) * 8;
            MenuTextSize size(4, 2);
            u32 width = DrawMenuGlyph(size, destination + 4, x, 0, code);
            if (width >= 1 && width <= 2)
                dirty = HasGlyphCacheResource(handle);
            return width;
        }
        return 0;
    }

    void Clear()
    {
        u8 * destination = canvas;
        MenuTextSize size(4, 2);
        FillMenuText(size, destination + 4, 0);
        dirty = HasGlyphCacheResource(handle);
    }
};

struct MenuGlyphCacheRow
{
    MenuGlyphCacheEntry entries[7];

    MenuGlyphCacheEntry & operator[](u32 column) { return entries[column]; }
};

struct MenuGlyphCache
{
    void * vtable;
    void * context;
    SmartPtr<MenuGlyphCacheRow> rows[3];
    u16 column;
    u16 row;
    u8 first_row;
    u8 rows_dirty;
    u8 dirty;
    u8 has_text;
};

u32 DrawCacheGlyph(MenuGlyphCache *, u32)
    asm("func_0804EFAC") SECTION(".text.menu_glyph_cache_draw");
void ResetCacheColumn(MenuGlyphCache *)
    asm("func_0804F058") SECTION(".text.menu_glyph_cache_draw");
void NextCacheRow(MenuGlyphCache *) asm("func_0804F060");
void ClearGlyphCache(MenuGlyphCache *)
    asm("func_0804F0E0") SECTION(".text.menu_glyph_cache_clear");
u8 GetCacheRowsDirty(MenuGlyphCache *)
    asm("func_0804F15C") SECTION(".text.menu_glyph_cache_clear");

#endif // MENU_GLYPH_CACHE_HH
