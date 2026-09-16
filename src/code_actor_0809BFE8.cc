#include "prelude.h"

#include "actor.hh"
#include "item.hh"

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

EC void func_0809C098(Unk_Actor_0809BFE8 & self, void const *)
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


EC void func_0809C0D4(Unk_Actor_0809BFE8 & self)
{
    ActorLocation location(Location(MAP_NONE, 0, 0), 0);
    u32 unused;

    self.SetLocation(location);
    func_0809C098(self, &unused);
    self.unk_08_0 = 100;
}

EC u8 * func_0809C144(u8 * self)
{
    unsigned int i = 0;
    unsigned int zero = 0;
    u8 * p = self;
    do
    {
        p[0] = zero;
        p[12] = zero;
        p[6] = zero;
        ++p;
        ++i;
    } while (i <= 5);
    return self;
}


EC bool func_0809C160(u8 const *, Tool const & tool)
{
    switch (tool.GetId())
    {
        case TOOL_CURSED_SICKLE:
        case TOOL_CURSED_HOE:
        case TOOL_CURSED_AXE:
        case TOOL_CURSED_HAMMER:
        case TOOL_CURSED_WATERING_CAN:
        case TOOL_CURSED_FISHING_ROD:
            return true;
        default:
            return false;
    }
}

EC unsigned int func_0809C22C(u8 const *, unsigned int tool_id)
{
    unsigned int result = 1;

    switch (tool_id)
    {
        case TOOL_CURSED_SICKLE:
            result = 0;
            break;
        case TOOL_CURSED_HOE:
            result = 1;
            break;
        case TOOL_CURSED_AXE:
            result = 2;
            break;
        case TOOL_CURSED_HAMMER:
            result = 3;
            break;
        case TOOL_CURSED_WATERING_CAN:
            result = 4;
            break;
        case TOOL_CURSED_FISHING_ROD:
            result = 5;
            break;
    }

    return result;
}

EC u8 func_0809C304(u8 const * self, unsigned int tool_id)
{
    return self[func_0809C22C(self, tool_id)];
}

EC u8 func_0809C318(u8 const * self, unsigned int tool_id)
{
    unsigned int index = func_0809C22C(self, tool_id);
    self += 6;
    return self[index];
}

EC bool func_0809C32C(u8 const * self)
{
    unsigned int result = 0;
    int a0 = -self[7]; int b0 = -self[1]; b0 |= a0;
    if (b0 < 0)
    {
        int a1 = -self[6]; int b1 = -self[0]; b1 |= a1;
        if (b1 < 0)
        {
            int a2 = -self[8]; int b2 = -self[2]; b2 |= a2;
            if (b2 < 0)
            {
                int a3 = -self[9]; int b3 = -self[3]; b3 |= a3;
                if (b3 < 0)
                {
                    int a4 = -self[10]; int b4 = -self[4]; b4 |= a4;
                    if (b4 < 0)
                    {
                        int a5 = -self[11]; int b5 = -self[5]; b5 |= a5;
                        result = ((unsigned int)b5) >> 31;
                    }
                }
            }
        }
    }
    return result;
}

EC bool func_0809C38C(u8 const * self)
{
    unsigned int result = 0;
    if (self[7] == 0) goto out;
    if (self[6] == 0) goto out;
    if (self[8] == 0) goto out;
    if (self[9] == 0) goto out;
    if (self[10] == 0) goto out;
    result = ((unsigned int)-self[11]) >> 31;
out:
    return result;
}
