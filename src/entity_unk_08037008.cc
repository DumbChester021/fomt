#include "entity_unk_08037008.hh"
#include "entity_effect.hh"

EC ActorLocation func_080A198C();
EC ActorLocation func_080A19EC();
EC u16 const gUnk_080F1560[];
EC u16 const gUnk_080F15A4[];
EC u16 const gUnk_080F161C[];
EC u16 const gUnk_080F1644[];

UnkEntity37008::UnkEntity37008(
    GameObject * game_object, ActorLocation & location, u32 arg_3, u32 arg_4)
    : AActorEntity(game_object, location, 2, arg_3),
      location_ref(&location),
      unk_34(0, 0),
      unk_3C(arg_4),
      unk_3E(0),
      unk_40(true)
{
}

UnkEntity37008::~UnkEntity37008()
{
    *location_ref = GetLocation();
}

void UnkEntity37008::SetBox(Box const & box)
{
    unk_34 = box;
}

u32 UnkEntity37008::vfunc_34()
{
    return unk_3C;
}

void UnkEntity37008::vfunc_10()
{
    if (!unk_40)
        vfunc_3C();

    unk_3E = 0;
    AEntity::vfunc_10();
}

void UnkEntity37008::vfunc_14()
{
    AEntity::vfunc_14();
    unk_40 = false;
}

Box UnkEntity37008::GetBox() const
{
    return Box(GetQ16X() >> 16, (GetQ16Y() >> 16) - 2, 14, 14);
}

UnknownEntityThing * UnkEntity72E4::vfunc_30()
{
    return new UnknownEntityThing(this, 2, 9, 0, 7, 0, false);
}



u32 UnkEntity72E4::GetAnim(u32 index)
{
    return gUnk_080F1560[index];
}

u32 UnkEntity72E4::GetSpeed(u32 index)
{
    if (index == 1)
        return 0x8000;
    else
        return 0;
}

UnknownEntityThing * UnkEntity72A0::vfunc_30()
{
    return new UnknownEntityThing(this, 4, 12, 2, 12, 0, false);
}



u32 UnkEntity72A0::GetAnim(u32 index)
{
    return gUnk_080F15A4[index];
}

u32 UnkEntity72A0::GetSpeed(u32 index)
{
    if (index == 1)
        return 0x8000;
    else
        return 0;
}

UnknownEntityThing * UnkEntity725C::vfunc_30()
{
    return new UnknownEntityThing(this, 2, 0x1B, 0, 8, 0, false);
}

void UnkEntity725C::vfunc_3C()
{
    ActorLocation location = func_080A198C();
    SetLocation(location);
    u32 anim = GetAnim(0);
    if (anim_id != anim)
        SetAnim(anim);
}

u32 UnkEntity725C::GetAnim(u32 index)
{
    return gUnk_080F161C[index];
}


u32 UnkEntity725C::GetSpeed(u32 index)
{
    u32 result;
    switch (index)
    {
    default:
    case 0:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 12:
        result = 0;
        break;
    case 1:
        result = 0x8000;
        break;
    case 2:
    case 11:
        result = 0x10000;
        break;
    }
    return result;
}

UnknownEntityThing * UnkEntity7218::vfunc_30()
{
    return new UnknownEntityThing(this, 2, 0x1B, 0, 8, 0, false);
}

void UnkEntity7218::vfunc_3C()
{
    ActorLocation location = func_080A19EC();
    SetLocation(location);
    u32 anim = GetAnim(0);
    if (anim_id != anim)
        SetAnim(anim);
}

u32 UnkEntity7218::GetAnim(u32 index)
{
    return gUnk_080F1644[index];
}


u32 UnkEntity7218::GetSpeed(u32 index)
{
    if (index == 1)
        return 0x8000;
    else
        return 0;
}

UnkEntity7218::UnkEntity7218(GameObject * game_object, ActorLocation & location)
    : UnkEntity37008(game_object, location, 0x207, 10)
{
}

UnkEntity725C::UnkEntity725C(GameObject * game_object, ActorLocation & location)
    : UnkEntity37008(game_object, location, 0x379, 12)
{
}
