#include "resource_handle.hh"
#include "utility/bit_array.hh"
#include <new>

union ResourceEntry
{
    ResourceEntry * next;
    struct
    {
        u16 start : 10;
        u16 order : 4;
        u16 unused : 2;
        u16 references;
        u16 generation;
        u16 unk_06;
    } allocation;

    bool Matches(ResourceId const & id) const
    {
        bool result = false;
        if (id.Generation() == allocation.generation)
            result = true;
        return result;
    }
};

struct ResourceEntryPool
{
    ResourceEntry * free;
    ResourceEntry entries[256];

    void Push(ResourceEntry * entry)
    {
        entry->next = free;
        free = entry;
    }

    ResourceEntry * Get(u32 index) { return entries + index; }
};

template <u32 Order>
struct ResourceBlock
{
    u8 full;
    u8 empty;
    ResourceBlock<Order - 1> children[2];
};

template <>
struct ResourceBlock<5>
{
    u32 bits;
};

struct ResourceManager
{
    /* +000 */ BitArray<256> occupied;
    /* +020 */ ResourceEntryPool pool;
    /* +824 */ ResourceBlock<10> blocks;
    /* +920 */ u16 active_count;
    /* +922 */ u16 generation;
    /* +924 */ u32 clients;
    /* +928 */ u16 reserved_start;
    /* +92A */ u16 reserved_size;
};

EC ResourceManager * gUnk_03000408;
EC void func_080080A0(ResourceBlock<10> *, u32, u32);

UnkHandleBase::~UnkHandleBase()
{
    if (--gUnk_03000408->clients == 0)
    {
        if (gUnk_03000408 != 0)
            ::operator delete(gUnk_03000408);
        gUnk_03000408 = 0;
    }
}

void UnkHandleBase::Release(u32 value)
{
    ResourceManager * manager = gUnk_03000408;
    if (value != 0)
    {
        ResourceId id(value);
        if (manager->occupied.Test(id.Index()))
        {
            u32 index = id.Index();
            ResourceEntry * entry = manager->pool.Get(index);
            if (entry->Matches(id))
            {
                u16 references = --entry->allocation.references;
                if (references == 0)
                {
                    func_080080A0(&manager->blocks,
                        entry->allocation.start, entry->allocation.order);
                    entry->allocation.generation = references;
                    manager->pool.Push(entry);
                    manager->occupied.Clear(index);
                    --manager->active_count;
                }
            }
        }
    }
}

u32 UnkHandleBase::Retain(u32 value)
{
    ResourceManager * manager = gUnk_03000408;
    if (value != 0)
    {
        ResourceId id(value);
        if (manager->occupied.Test(id.Index()))
        {
            ResourceEntry * entry = manager->pool.Get(id.Index());
            if (entry->Matches(id))
            {
                u16 references = entry->allocation.references;
                if (++entry->allocation.references != 0)
                    return value;
                entry->allocation.references = references;
            }
        }
    }
    return 0;
}

int UnkHandleBase::GetStart(u32 value)
{
    ResourceManager * manager = gUnk_03000408;
    if (value != 0)
    {
        ResourceId id(value);
        if (manager->occupied.Test(id.Index()))
        {
            ResourceEntry * entry = manager->pool.Get(id.Index());
            if (entry->Matches(id))
                return entry->allocation.start;
        }
    }
    return -1;
}

u32 UnkHandleBase::GetOrder(u32 value)
{
    ResourceManager * manager = gUnk_03000408;
    if (value != 0)
    {
        ResourceId id(value);
        if (manager->occupied.Test(id.Index()))
        {
            ResourceEntry * entry = manager->pool.Get(id.Index());
            if (entry->Matches(id))
                return entry->allocation.order;
        }
    }
    return 11;
}
