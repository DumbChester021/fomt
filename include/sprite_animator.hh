#ifndef SPRITE_ANIMATOR_HH
#define SPRITE_ANIMATOR_HH

#include "prelude.h"

struct SpriteAnimationFrame
{
    /* +00 */ u16 sprite_id;
    /* +02 */ u16 duration;
};

struct SpriteAnimation
{
    /* +00 */ SpriteAnimationFrame const * frames;
    /* +04 */ u16 frame_count;
    /* +06 */ u16 unk_06;

    SpriteAnimationFrame const & operator[](u32 index) const
    {
        return frames[index];
    }

    SpriteAnimationFrame const * Begin() const
    {
        return frames;
    }

    u32 Count() const
    {
        SpriteAnimationFrame const * frames_ = frames;
        u32 count = 0;
        if (frames_ != 0)
            count = frame_count;
        return count;
    }
};

struct SpriteAnimationProvider
{
    virtual ~SpriteAnimationProvider();
    virtual SpriteAnimation GetAnimation(u32 id);
};

struct SpriteAnimator
{
    SpriteAnimator(SpriteAnimationProvider *, u32, i32) asm("func_0805E824");

    void Init(SpriteAnimationProvider *, u32) asm("func_0805E850");
    void SetAnimation(u32) asm("func_0805E860");
    bool WillFinish() const asm("func_0805E894");
    u32 Update() asm("func_0805E8F0");

    /* +00 */ SpriteAnimationProvider * provider;
    /* +04 */ SpriteAnimation animation;
    /* +0C */ u16 frame_index;
    /* +0E */ u16 frame_timer;
    /* +10 */ i16 step;
    /* +12 */ bool changed;
    /* +13 */ u8 pad_13;
};

#endif // SPRITE_ANIMATOR_HH
