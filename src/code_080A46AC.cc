#include "prelude.h"
#include <string.h>

#pragma interface

struct UnkProviderVTable
{
    void * unk_00[18];
    u8 (*get_value)(void *, u32);
    void (*release_value)(void *, u8);
};

struct UnkProvider
{
    UnkProviderVTable * vtable;
};

EC u32 func_08007B54(void *, u32);
EC int func_08007D4C(void *);
EC void func_08007C28(void *, u32);

struct UnkHandleBase
{
    u32 unk_00;

    UnkHandleBase();
    ~UnkHandleBase();
};

struct UnkHandle : public UnkHandleBase
{
    u32 value;

    UnkHandle(u32 arg)
        : UnkHandleBase(),
          value(func_08007B54(this, arg))
    {
    }

    ~UnkHandle()
    {
        func_08007C28(this, value);
    }
};

struct UnkPoly
{
    UnkProvider * provider;
    UnkHandle handle;
    u16 unk_0C;
    u16 unk_0E;
    u32 count;
    u8 values[16];

    UnkPoly(UnkProvider *, u32, u32 const *, u32) asm("func_080A46AC");
    UnkPoly(UnkProvider *, u32, u32) asm("func_080A4740");
    virtual ~UnkPoly();
};

UnkPoly::UnkPoly(
    UnkProvider * provider_arg,
    u32 value,
    u32 const * args,
    u32 count_arg)
    : provider(provider_arg),
      handle(value)
{
    unk_0C = func_08007D4C(&handle);

    volatile u8 zero = 0;
    count = 0;

    if (count_arg <= 16)
    {
        memset(values, zero, count_arg);
        count = count_arg;
    }

    u32 i = 0;
    if (i < count_arg)
    {
        u8 * out = values;
        u32 const * it = args;
        do
        {
            *out++ = provider_arg->vtable->get_value(provider_arg, *it++);
            ++i;
        }
        while (i < count_arg);
    }
}

UnkPoly::UnkPoly(UnkProvider * provider_arg, u32 value, u32 arg)
    : provider(provider_arg),
      handle(value)
{
    unk_0C = func_08007D4C(&handle);

    u32 one = 1;
    volatile u8 zero = 0;
    count = 0;
    memset(values, zero, one);
    count = one;
    values[0] = provider_arg->vtable->get_value(provider_arg, arg);
}

UnkPoly::~UnkPoly()
{
    u32 i = 0;
    if (i < count)
    {
        u8 * it = values;
        do
        {
            UnkProvider * current_provider = provider;
            UnkProviderVTable * current_vtable = current_provider->vtable;
            u8 value = *it;
            current_vtable->release_value(current_provider, value);
            ++it;
            ++i;
        }
        while (i < count);
    }
}
