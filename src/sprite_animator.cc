#include "sprite_animator.hh"

SpriteAnimator::SpriteAnimator(SpriteAnimationProvider * provider_, u32 animation_id, i32 step_)
    : provider(provider_),
      animation(provider_->GetAnimation(animation_id)),
      frame_index(0),
      frame_timer(animation.frames[0].duration << 8),
      step(step_),
      changed(true)
{
}

void SpriteAnimator::Init(SpriteAnimationProvider * provider_, u32 animation_id)
{
    provider = provider_;
    SetAnimation(animation_id);
}

void SpriteAnimator::SetAnimation(u32 animation_id)
{
    animation = provider->GetAnimation(animation_id);
    frame_index = 0;
    frame_timer = animation.frames[0].duration << 8;
    changed = true;
}

bool SpriteAnimator::WillFinish() const
{
    i32 step_ = step;
    i32 timer = frame_timer;

    if (step_ == 0 || timer == 0)
        return false;

    i32 amount = step_;
    if (amount < 0)
        amount = -amount;

    timer -= amount;
    if (timer > 0)
        return false;

    u32 index = frame_index;
    u32 count = animation.Count();
    SpriteAnimationFrame const * frames = animation.Begin();

    for (;;)
    {
        if (step_ > 0)
        {
            ++index;
            if (index >= count)
                return true;
        }
        else
        {
            if (index == 0)
                return true;
            --index;
        }

        SpriteAnimationFrame const * frame = frames + index;
        u16 duration = frame->duration;
        if (duration == 0)
            return false;

        timer += duration << 8;
        if (timer > 0)
            return false;
    }
}

u32 SpriteAnimator::Update()
{
    u32 result = 0;

    if (changed)
    {
        result = 2;
        changed = false;
    }

    i32 step_ = step;
    i32 timer = frame_timer;

    if (step_ != 0 && timer != 0)
    {
        i32 amount = step_;
        if (amount < 0)
            amount = -amount;

        timer -= amount;

        if (timer <= 0)
        {
            u32 index = frame_index;
            u16 previous_sprite = animation[index].sprite_id;

            result |= 1;

            SpriteAnimationFrame const * frames = animation.Begin();
            u16 count = animation.Count();

            u32 frame_offset;
            for (;;)
            {
                if (step_ > 0)
                {
                    ++index;
                    if (index >= count)
                    {
                        index = 0;
                        result |= 4;
                    }
                }
                else
                {
                    if (index == 0)
                    {
                        index = count;
                        result |= 4;
                    }
                    --index;
                }

                frame_offset = index << 2;
                u16 duration = ((SpriteAnimationFrame const *)((u8 const *)frames + frame_offset))->duration;
                if (duration != 0)
                {
                    timer += duration << 8;
                    if (timer > 0)
                        break;
                    continue;
                }

                timer = 0;
                break;
            }

            if (((SpriteAnimationFrame const *)((u8 const *)frames + frame_offset))->sprite_id != previous_sprite)
                result |= 2;

            frame_index = index;
        }

        frame_timer = timer;
    }

    return result;
}
