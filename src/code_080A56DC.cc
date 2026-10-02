#include "prelude.h"
#include "actor.hh"

struct Unk_080A56DC;

typedef void (*UnkCallback_080A56DC)(Unk_080A56DC *, u32, u32, u32);

struct UnkOps_080A56DC
{
    STRUCT_PAD(0x00, 0x14);
    UnkCallback_080A56DC func_14;
};

struct Unk_080A56DC
{
    u32 unk_00;
    STRUCT_PAD(0x04, 0x08);
    u32 unk_08;
    u32 unk_0C;
    STRUCT_PAD(0x10, 0x90);
    UnkOps_080A56DC * ops;

    void SetPacked(
        Location const &,
        u32,
        u32,
        u32) asm("func_080A56DC");
};

EC void func_080A5960(Unk_080A56DC *, i16, i16);

void Unk_080A56DC::SetPacked(
    Location const & location,
    u32 arg2,
    u32 arg3,
    u32 arg4)
{
    unk_00 = location.GetMap();
    unk_08 = location.GetX() << 16;
    unk_0C = location.GetY() << 16;

    ops->func_14(this, arg2, arg3, arg4);

    func_080A5960(this, location.GetX(), location.GetY());
}
