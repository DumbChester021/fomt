#ifndef RESOURCE_HANDLE_HH
#define RESOURCE_HANDLE_HH

#include "prelude.h"

#pragma interface

union ResourceId
{
    u32 value;
    struct PACKED
    {
        u32 index : 8;
        u32 generation : 16;
        u32 unused : 8;
    } fields;

    ResourceId(u32 arg) : value(arg) {}
    u32 Index() const { return fields.index; }
    u32 Generation() const { return fields.generation; }
};

struct UnkHandleBase
{
    /* +00 */ u32 unk_00;

    UnkHandleBase();
    ~UnkHandleBase() SECTION(".text.resource_handle_dtor");
    u32 Acquire(u32) asm("func_08007B54");
    void Release(u32) asm("func_08007C28") SECTION(".text.resource_handle_ops");
    u32 Retain(u32) asm("func_08007CD8") SECTION(".text.resource_handle_ops");
    int GetStart(u32) asm("func_08007D4C") SECTION(".text.resource_handle_ops");
    u32 GetOrder(u32) asm("func_08007DB8") SECTION(".text.resource_handle_ops");
};

EC u32 func_08007B54(void *, u32);
EC void func_08007C28(void *, u32);
EC int func_08007D4C(void *, u32);

struct UnkHandle : public UnkHandleBase
{
    /* +04 */ u32 value;

    UnkHandle(u32 arg) : UnkHandleBase(), value(func_08007B54(this, arg)) {}
    ~UnkHandle() { func_08007C28(this, value); }

    int GetStart() { return func_08007D4C(this, value); }
};

#endif // RESOURCE_HANDLE_HH
