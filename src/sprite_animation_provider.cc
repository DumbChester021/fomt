#include "sprite_animation_provider.hh"

extern "C" void const * vtable_unk_080E79C8[];

PackedSpriteAnimationProvider * func_0805E6CC(
    PackedSpriteAnimationProvider * provider,
    u8 const * data)
{
    provider->vtable = vtable_unk_080E79C8;

    if (data != 0)
    {
        provider->counts[0] = *reinterpret_cast<u16 const *>(data);
        data += 4;
        provider->pools[0] = data;
        data += provider->counts[0] * 4;

        provider->counts[1] = *reinterpret_cast<u16 const *>(data);
        data += 4;
        provider->pools[1] = data;
        data += provider->counts[1] * 16;

        provider->counts[2] = *reinterpret_cast<u16 const *>(data);
        data += 4;
        provider->pools[2] = data;
        data += provider->counts[2] * 8;

        provider->counts[3] = *reinterpret_cast<u16 const *>(data);
        data += 4;
        provider->pools[3] = data;
        data += provider->counts[3] * 32;

        provider->counts[4] = *reinterpret_cast<u16 const *>(data);
        data += 4;
        provider->pools[4] = data;
        data += provider->counts[4] * 32;

        provider->counts[5] = *reinterpret_cast<u16 const *>(data);
        data += 4;
        provider->pools[5] = data;
        data += provider->counts[5] * 8;

        provider->counts[6] = *reinterpret_cast<u16 const *>(data);
        provider->pools[6] = data + 4;
    }
    else
    {
        provider->counts[0] = 0;
        provider->pools[0] = 0;
        provider->counts[1] = 0;
        provider->pools[1] = 0;
        provider->counts[2] = 0;
        provider->pools[2] = 0;
        provider->counts[3] = 0;
        provider->pools[3] = 0;
        provider->counts[4] = 0;
        provider->pools[4] = 0;
        provider->counts[5] = 0;
        provider->pools[5] = 0;
        provider->counts[6] = 0;
        provider->pools[6] = 0;
    }

    return provider;
}

PackedSpriteAnimation PackedSpriteAnimationProvider::GetAnimation(u32 index) const
{
    if (index < counts[0])
    {
        SpriteAnimationIndexEntry const * entry =
            reinterpret_cast<SpriteAnimationIndexEntry const *>(pools[0]) + index;

        u16 first_frame = entry->first_frame;
        u16 frame_count = entry->frame_count;

        u32 frame_address = first_frame * sizeof(PackedSpriteAnimationFrame);
        frame_address += reinterpret_cast<u32>(pools[6]);

        return PackedSpriteAnimation(
            reinterpret_cast<PackedSpriteAnimationFrame const *>(frame_address),
            frame_count);
    }

    return PackedSpriteAnimation(0, 0);
}
