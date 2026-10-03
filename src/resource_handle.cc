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

EC ResourceEntry * func_080D770C(ResourceEntry *, u32, ResourceEntry *);

struct ResourceEntryPool
{
    ResourceEntry * free;
    ResourceEntry entries[256];

    void Push(ResourceEntry * entry)
    {
        entry->next = free;
        free = entry;
    }

    ResourceEntryPool() : free(func_080D770C(entries, 256, 0)) {}

    ResourceEntry * Pop()
    {
        ResourceEntry * result = free;
        if (result != 0)
            free = result->next;
        return result;
    }

    u32 Index(ResourceEntry * entry) { return entry - entries; }
    ResourceEntry * Get(u32 index) { return entries + index; }
};

template <u32 Order>
struct ResourceBlock
{
    u8 full;
    u8 empty;
    ResourceBlock<Order - 1> children[2];

    ResourceBlock() : full(0), empty(1) {}
};

template <>
struct ResourceBlock<5>
{
    u32 bits;
    ResourceBlock() : bits(0) {}
};

EC void func_08007EC8(ResourceBlock<10> *) SECTION(".text.resource_block_reset");
EC u32 func_08008020(ResourceBlock<10> *, u32);

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

    inline u32 Acquire(u32);

    ResourceManager()
        : active_count(0), clients(0), reserved_start(0), reserved_size(0)
    {
        fill_inl(occupied.begin(), occupied.end(), 0);
        func_08007EC8(&blocks);
    }
};

EC ResourceManager * gUnk_03000408;
EC void func_080080A0(ResourceBlock<10> *, u32, u32);

static inline bool ValidResourceStart(u32 const & value)
{
    return value < 1024;
}

u32 ResourceManager::Acquire(u32 order)
{
    ResourceManager * manager = this;
    u32 start = func_08008020(&manager->blocks, order);
    if (ValidResourceStart(start))
    {
        ResourceEntry * entry = manager->pool.Pop();
        if (entry != 0)
        {
            u32 index = manager->pool.Index(entry);
            manager->occupied.Set(index);
            ++manager->active_count;
            entry->allocation.start = start;
            entry->allocation.order = order;
            entry->allocation.references = 1;
            u32 generation = manager->generation + 1;
            if (generation > 65535)
                generation = 1;
            entry->allocation.generation = generation;
            manager->generation = generation;
            ResourceId id(0);
            id.fields.index = index;
            id.fields.generation = entry->allocation.generation;
            return id.value;
        }
        func_080080A0(&manager->blocks, start, order);
    }
    return 0;
}

UnkHandleBase::UnkHandleBase()
{
    if (gUnk_03000408 == 0)
        gUnk_03000408 = new ResourceManager;
    ++gUnk_03000408->clients;
}

u32 UnkHandleBase::Acquire(u32 order)
{
    return gUnk_03000408->Acquire(order);
}

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

u32 UnkHandleBase::GetReferences(u32 value)
{
    ResourceManager * manager = gUnk_03000408;
    if (value != 0)
    {
        ResourceId id(value);
        if (manager->occupied.Test(id.Index()))
        {
            ResourceEntry * entry = manager->pool.Get(id.Index());
            if (entry->Matches(id))
                return entry->allocation.references;
        }
    }
    return 0;
}

EC void func_08007EA8(ResourceBlock<10> *) SECTION(".text.resource_block_reset");
EC void func_080D6EEC(ResourceBlock<9> *);
EC void func_080D6F5C(ResourceBlock<9> *);

EC void func_08007EA8(ResourceBlock<10> * blocks)
{
    func_080D6EEC(&blocks->children[0]);
    func_080D6EEC(&blocks->children[1]);
    blocks->full = 1;
    blocks->empty = 0;
}

EC void func_08007EC8(ResourceBlock<10> * blocks)
{
    func_080D6F5C(&blocks->children[1]);
    func_080D6F5C(&blocks->children[0]);
    blocks->full = 0;
    blocks->empty = 1;
}
