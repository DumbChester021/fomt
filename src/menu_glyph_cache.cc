#include "menu_glyph_cache.hh"

u32 DrawCacheGlyph(MenuGlyphCache * self, u32 code)
{
    u32 column = self->column;
    i32 row = self->row + self->first_row;
    if (row > 2)
        row -= 3;
    MenuGlyphCacheEntry * entry = &(*self->rows[row])[column >> 2];
    u32 width = entry->Draw(column & 3, code);
    if (width == 0)
        return 0;
    if (width > 2)
        return 0;
    u32 next = column + width;
    if (next > 27)
        next %= 28;
    self->column = next;
    if (code != 0x20 && code != 0x8140)
        self->has_text = 1;
    self->dirty = 1;
    return 1;
}

void ResetCacheColumn(MenuGlyphCache * self)
{
    self->column = 0;
}

void ClearGlyphCache(MenuGlyphCache * self)
{
    for (i32 row = 0; row < 3; ++row)
        for (i32 column = 0; column < 7; ++column)
            (*self->rows[row])[column].Clear();
    self->row = 0;
    self->column = 0;
    self->rows_dirty = 1;
    self->dirty = 1;
    self->has_text = 0;
}

u8 GetCacheRowsDirty(MenuGlyphCache * self)
{
    return self->rows_dirty;
}
