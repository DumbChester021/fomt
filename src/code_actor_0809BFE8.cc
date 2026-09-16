#include "prelude.h"

#include "actor.hh"

struct Unk_Actor_0809BFE8 : Actor
{
    Unk_Actor_0809BFE8();

    u32 unk_08_0 : 7;
    u32 unk_0C;
    u32 unk_10;
    u32 unk_14;
};

Unk_Actor_0809BFE8::Unk_Actor_0809BFE8()
    : Actor(ActorLocation(Location(MAP_NONE, 0, 0), 0)), unk_08_0(100), unk_0C(0)
{
}

EC Unk_Actor_0809BFE8 * func_0809BFE8() ALIAS(__18Unk_Actor_0809BFE8);

EC unsigned int func_0809C060(Unk_Actor_0809BFE8 const & self)
{
    return self.unk_08_0;
}

EC void func_0809C068(Unk_Actor_0809BFE8 & self, int arg_0)
{
    int val = self.unk_08_0 - arg_0;

    if (val < 0)
        val = 0;
    else if (val > 100)
        val = 100;

    self.unk_08_0 = val;
}

EC void func_0809C098(Unk_Actor_0809BFE8 & self)
{
    self.unk_0C = 0;
}



EC void func_0809C0A0(Unk_Actor_0809BFE8 & self, u32 const * arg_1)
{
    self.unk_10 = arg_1[0];
    self.unk_0C = 1;
}

EC void func_0809C0AC(Unk_Actor_0809BFE8 & self, u32 const * arg_1)
{
    u32 second = arg_1[1];
    u32 first = arg_1[0];

    self.unk_10 = first;
    self.unk_14 = second;
    self.unk_0C = 2;
}

EC void func_0809C0BC(Unk_Actor_0809BFE8 & self, u32 const * arg_1)
{
    self.unk_10 = arg_1[0];
    self.unk_0C = 3;
}

EC void func_0809C0C8(Unk_Actor_0809BFE8 & self, u32 const * arg_1)
{
    self.unk_10 = arg_1[0];
    self.unk_0C = 4;
}

/* what follows shouldn't be hard except that to do it well I think there needs to be union/placeholder shenanigans */
