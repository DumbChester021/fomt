#include "resource_handle.hh"
#include "utility/bit_array.hh"
#include <algorithm>
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

EC ResourceEntry * func_080D770C(ResourceEntry *, u32, ResourceEntry *) SECTION(".text.resource_entry_pool_init");

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
    u8 IsFull() const { return full; }
    u8 IsEmpty() const { return empty; }
    enum { HalfSize = 1 << (Order - 1) };
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
EC void func_080080A0(ResourceBlock<10> *, u32, u32) SECTION(".text.resource_block_free");

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

EC void func_08007EE8(ResourceBlock<10> *, u32, u32) SECTION(".text.resource_block_ranges");
EC void func_08007F84(ResourceBlock<10> *, u32, u32) SECTION(".text.resource_block_ranges");
EC void func_080D7118(ResourceBlock<9> *, u32, u32);
EC void func_080D734C(ResourceBlock<9> *, u32, u32);
EC void func_080D76C0(ResourceBlock<9> *, u32, u32) SECTION(".text.resource_child_free");
EC void func_080D7678(ResourceBlock<8> *, u32, u32);

EC void func_08007EE8(ResourceBlock<10> * blocks, u32 start, u32 size)
{
    if (start < 1024 && size != 0)
    {
        if (start == 0 && size >= 1024)
            func_08007EA8(blocks);
        else
        {
            if (start < 512)
            {
                u32 left_size = min(size, 512 - start);
                func_080D7118(&blocks->children[0], start, left_size);
            }
            const u32 half = ResourceBlock<10>::HalfSize;
            u32 end = start + size;
            if (end > half)
            {
                u32 offset = start >= half ? start - half : 0;
                u32 remaining = end - half;
                remaining -= offset;
                func_080D7118(&blocks->children[1], offset, remaining);
            }
            blocks->full = blocks->children[0].IsFull() && blocks->children[1].IsFull();
            blocks->empty = 0;
        }
    }
}

EC void func_08007F84(ResourceBlock<10> * blocks, u32 start, u32 size)
{
    if (start < 1024 && size != 0)
    {
        if (start == 0 && size >= 1024)
            func_08007EC8(blocks);
        else
        {
            if (start < 512)
                func_080D734C(&blocks->children[0], start, min(size, 512 - start));
            const u32 half = ResourceBlock<10>::HalfSize;
            u32 end = start + size;
            if (end > half)
            {
                u32 offset = start >= half ? start - half : 0;
                u32 remaining = end - half;
                remaining -= offset;
                func_080D734C(&blocks->children[1], offset, remaining);
            }
            blocks->full = 0;
            blocks->empty = blocks->children[0].IsEmpty() && blocks->children[1].IsEmpty();
        }
    }
}

EC void func_080080A0(ResourceBlock<10> * blocks, u32 start, u32 order)
{
    if (order < 10)
    {
        ResourceBlock<9> * child = start & 512
            ? &blocks->children[1] : &blocks->children[0];
        func_080D76C0(child, start, order);
        blocks->full = 0;
        blocks->empty = blocks->children[0].IsEmpty() && blocks->children[1].IsEmpty();
    }
    else if (order == 10)
        func_08007EC8(blocks);
}

EC void func_080D76C0(ResourceBlock<9> * blocks, u32 start, u32 order)
{
    if (order < 9)
    {
        ResourceBlock<8> * child = start & 256
            ? &blocks->children[1] : &blocks->children[0];
        func_080D7678(child, start, order);
        blocks->full = 0;
        blocks->empty = blocks->children[0].IsEmpty() && blocks->children[1].IsEmpty();
    }
    else if (order == 9)
        func_080D6F5C(blocks);
}

EC ResourceEntry * func_080D770C(ResourceEntry * entries, u32 count, ResourceEntry * tail)
{
    ResourceEntry * entry = entries + (count - 1);
    entry->next = tail;
    while (entry != entries)
    {
        ResourceEntry * next = entry--;
        entry->next = next;
    }
    return entry;
}
