#include "prelude.h"

#include "actor.hh"
#include "cursed_tool_state.hh"
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

EC CursedToolState * func_0809C144(CursedToolState * self)
{
    unsigned int i = 0;
    unsigned int zero = 0;
    do
    {
        self->active[i] = zero;
        self->count[i] = zero;
        self->completed[i] = zero;
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

EC void func_0809C3BC(u8 * self, unsigned int tool_id)
{
    unsigned int index = func_0809C22C(self, tool_id);
    u8 * flag = self + index;
    u8 value = *flag;
    if (value == 0)
    {
        *flag = 1;
        u8 * count = self;
        count += 12;
        count[index] = value;
    }
}

extern u8 const gUnk_081036C0[];
EC unsigned int func_0809C3E0(u8 * self, unsigned int index)
{
    unsigned int result = 0;
    u8 * active = self + index;
    if (*active != 0)
    {
        u8 * count_base = self + 12;
        u8 * count = count_base + index;
        if (*count < gUnk_081036C0[index])
            ++*count;
        else
        {
            *active = result;
            u8 * done_base = self + 6;
            u8 * done = done_base + index;
            *done = 1;
            result = 1;
        }
    }
    return result;
}

EC void func_0809C420(u8 * self, unsigned int index)
{
    u8 * base = self;
    if (base[index] != 0)
    {
        if (index == 0 || index == 3)
        {
            u8 * count = base;
            count += 12;
            count += index;
            *count = 0;
        }
    }
}

EC u8 func_0809C444(u8 * self, unsigned int tool_id)
{
    u8 result = 0;
    unsigned int index = func_0809C22C(self, tool_id);
    if (self[index] != 0)
    {
        if (index == 0 || index == 3)
            result = func_0809C3E0(self, index);
    }
    return result;
}

EC u8 func_0809C474(u8 * self, unsigned int tool_id)
{
    unsigned int index = func_0809C22C(self, tool_id);
    u8 result = 0;
    if (self[index] != 0)
    {
        if (index == 1 || index == 4)
            result = func_0809C3E0(self, index);
        if (index == 0 || index == 3)
            func_0809C420(self, index);
    }
    return result;
}

EC u8 func_0809C4B4(u8 * self, unsigned int tool_id)
{
    unsigned int index = func_0809C22C(self, tool_id);
    u8 result = 0;
    if (self[index] != 0 && (index == 5 || index == 2))
        result = func_0809C3E0(self, index);
    return result;
}

EC void func_0809C4E4(u32 self[])
{
    self[0] = 0;
}

EC unsigned int func_0809C4EC(u32 const * self, unsigned int index)
{
    unsigned int result = 0;
    if (index <= 13)
    {
        unsigned int mask = 1 << (index & 31);
        unsigned int value = *self & mask;
        result = ((unsigned int)(-value | value)) >> 31;
    }
    unsigned int one = 1;
    one ^= result;
    return one;
}

extern u8 gUnk_081036D4[];
extern u8 gUnk_08107094[];
extern u8 gUnk_081070AC[];
EC u32 * func_0809C510(u32 * out, u32 const * flags, unsigned int index, u8 variant)
{
    u8 special = variant;
    bool enabled = false;
    if (index <= 13)
    {
        unsigned int mask = 1u << (index & 31);
        u32 value = *flags & mask;
        enabled = ((u32)(-value | value)) >> 31;
    }
    register u32 data asm("r0"); register u32 x asm("r1"); register u32 y asm("r2");
    if (enabled)
    {
        if (index == 13 && variant != 0)
        {
            u8 *entry = gUnk_081036D4;
            entry += 156;
            x = entry[8];
            y = entry[9];
            data = (u32)gUnk_081070AC;
            goto store;
        }
        u8 *base = gUnk_081036D4;
        unsigned int off = index * 12;
        u8 *data_base = base + 4;
        u32 *data_p = (u32 *)(data_base + off);
        u8 *entry = base + off;
        u32 xv = entry[8];
        u32 yv = entry[9];
        u32 dv = *data_p;
        out[0] = dv;
        out[1] = xv;
        out[2] = yv;
        goto done;
    }
    if (index == 13 && special != 0)
    {
        u8 *entry = gUnk_081036D4;
        entry += 156;
        x = entry[8];
        y = entry[9];
        data = (u32)gUnk_08107094;
        goto store;
    }
    {
        u8 *base = gUnk_081036D4;
        unsigned int off = index * 12;
        u8 *entry = base + off;
        x = entry[8];
        y = entry[9];
        data = *(u32 *)entry;
    }
store:
    out[0] = data;
    out[1] = x;
    out[2] = y;
done:
    return out;
}

EC void func_0809C5B4(u32 * self, unsigned int index)
{
    if (index <= 13)
        *self |= 1u << (index & 31);
}

EC void func_0809C5D0(u32 * self, unsigned int index)
{
    if (index <= 13)
        *self &= ~(1u << (index & 31));
}

EC void func_0809C5EC(u32 * self)
{
    *self = 0;
}

EC bool func_0809C5F4(u32 const * self)
{
    return *self != 0;
}

#include <string.h>

EC u16 * func_080E3DB4(u16 * first, u16 * last, u16 const * value);
EC u16 * func_080E3E28(u16 * first, u16 * last, u16 const * value);

EC void func_0809C600(u32 * self, u16 value)
{
    u16 * first = (u16 *)(self + 1);
    u16 * last = (u16 *)((u8 *)self + ((*self << 1) + 4));

    if (func_080E3DB4(first, last, &value) == last)
    {
        u16 * value_p = &value;
        unsigned int raw = *self;
        unsigned int count = raw;

        if (raw <= 2)
        {
            u16 * dst = (u16 *)((u8 *)self + ((raw << 1) + 4));
            if (dst != 0)
                *dst = *value_p;

            unsigned int result = count + 1;
            *self = result;
        }
    }
}

EC void func_0809C644(u32 * self, u16 value)
{
    register u16 * first asm("r0") = (u16 *)(self + 1);
    register u16 * last asm("r4") = (u16 *)((u8 *)self + ((*self << 1) + 4));
    u16 * found = func_080E3E28(first, last, &value);

    if (found != last && *self != 0)
    {
        u16 * end = (u16 *)((u8 *)self + ((*self << 1) + 4));
        u16 * next = found + 1;

        if (next != end)
        {
            asm volatile("" : "+r"(next), "+r"(end));
            if (end != next)
                memmove(found, next, (u8 *)end - (u8 *)next);
        }

        --*self;
    }
}

EC bool func_0809C694(u16 const * self, u16 value)
{
    return self[6] == value;
}

EC void func_0809C6AC(u16 * self, u16 value)
{
    self[6] = value;
}

EC void func_0809C6B0(u16 * self)
{
    unsigned int value = 0xFFFF;
    self[6] = value;
}
