#include "prelude.h"

struct Unk_080A4A4C_State
{
    u32 unk_00;
    u32 unk_04;
    u32 enabled;
    u16 unk_0C;
    u16 unk_0E;
    u8 data[1];
};

typedef int (*UnkIwramCall)(
    void *, void *, u32, u32, u32, u32, u32, u16, void *);

int func_080A4A4C(
    Unk_080A4A4C_State * state,
    void * arg1,
    void * arg2,
    u32 arg3,
    u32 arg4,
    u32 arg5,
    u32 arg6,
    u32 arg7) asm("func_080A4A4C");

int func_080A4A4C(
    Unk_080A4A4C_State * state,
    void * arg1,
    void * arg2,
    u32 arg3,
    u32 arg4,
    u32 arg5,
    u32 arg6,
    u32 arg7)
{
    Unk_080A4A4C_State * current = state;
    void * first = arg1;
    void * second = arg2;
    u32 enabled = current->enabled;

    if ((int)(-enabled | enabled) < 0)
    {
        u16 value = current->unk_0C;
        void * data = current->data;
        return reinterpret_cast<UnkIwramCall>(0x030004DC)(
            first,
            second,
            arg3,
            arg4,
            arg5,
            arg6,
            arg7,
            value,
            data);
    }

    return 0;
}
