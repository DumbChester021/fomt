#include "resource_handle.hh"
#include "smart_ptr.hh"

// Lifetime-only structural view used to recover the compiler-generated destructor.
// The runtime vtable remains owned by asm/vtables.s.
struct MenuGlyphCacheBase
{
    virtual ~MenuGlyphCacheBase() {}
    virtual u32 Draw(u32) = 0;
    virtual void Reset() {}
    virtual void Next() {}
    virtual void Clear() {}
    virtual u8 RowsDirty() { return 0; }
};

struct MenuGlyphCacheLifetimeEntry
{
    SmartPtr<u8> canvas;
    UnkHandle handle;
    u8 dirty;
};

struct MenuGlyphCacheLifetimeRow
{
    MenuGlyphCacheLifetimeEntry entries[7];
};

struct MenuGlyphCacheLifetime : MenuGlyphCacheBase
{
    void * context;
    SmartPtr<MenuGlyphCacheLifetimeRow> rows[3];
    u16 column;
    u16 row;
    u8 first_row;
    u8 rows_dirty;
    u8 dirty;
    u8 has_text;

    virtual u32 Draw(u32);
};

// This out-of-line key method makes old GCC emit the implicit destructor.
// Its .text body and generated vtables are intentionally not linked.
u32 MenuGlyphCacheLifetime::Draw(u32)
{
    return 0;
}
