#ifndef SPRITE_ANIMATION_PROVIDER_HH
#define SPRITE_ANIMATION_PROVIDER_HH

#include "prelude.h"

struct PackedSpriteAnimationFrame
{
    u16 sprite_id;
    u16 duration;
};

struct PackedSpriteAnimation
{
    PackedSpriteAnimation(PackedSpriteAnimationFrame const * frames_, u16 frame_count_)
        : frames(frames_), frame_count(frame_count_)
    {
    }

    PackedSpriteAnimationFrame const * frames;
    u16 frame_count;
    u16 unk_06;
};

struct SpriteAnimationIndexEntry
{
    u16 frame_count;
    u16 first_frame;
};

struct PackedSpriteAnimationProvider
{
    /* +00 */ void const * vtable;
    /* +04 */ u8 const * pools[7];
    /* +20 */ u16 counts[7];

    PackedSpriteAnimation GetAnimation(u32 index) const asm("func_0805E760");
    u16 GetSpriteCount() const asm("func_0805E81C") SECTION(".text.sprite_animation_provider_counts");
    u16 GetAnimationCount() const asm("func_0805E820") SECTION(".text.sprite_animation_provider_counts");
};

extern "C" PackedSpriteAnimationProvider * func_0805E6CC(
    PackedSpriteAnimationProvider * provider,
    u8 const * data);

#endif
