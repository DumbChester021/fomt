#include "entity_actor.hh"
#include "hardware_transfer.hh"
#include "sprite_animator.hh"

struct GraphicsBlobCandidate
{
    void const * data;
    u16 size;
    u16 pad;
};

struct SpriteRenderDataCandidate
{
    u8 pad_00[8];
    GraphicsBlobCandidate graphics;
    GraphicsBlobCandidate chunks;
    u8 pad_18[8];
};

struct SpriteRenderProviderVtable
{
    STRUCT_PAD(0x00, 0x10);
    void (*get_render_data)(SpriteRenderDataCandidate *, SpriteAnimationProvider *, u32);
};

static inline void GetSpriteRenderData(
    SpriteRenderDataCandidate * out, SpriteAnimator & animator)
{
    SpriteAnimationProvider * provider = animator.provider;
    SpriteRenderProviderVtable * vtable =
        *reinterpret_cast<SpriteRenderProviderVtable **>(provider);
    u32 sprite_id = animator.animation[animator.frame_index].sprite_id;
    vtable->get_render_data(out, provider, sprite_id);
}

struct EffectHandleRenderCandidate
{
    u32 unk_00;
    u32 value;

    operator bool() const
    {
        return value != 0;
    }
};

struct EffectBaseRenderCandidate
{
    void * game_object;
    EffectHandleRenderCandidate handle;
    u16 unk_0C;
    u16 unk_0E;
    u32 count;
    u8 values[16];
    void * vtable;

    void QueueGraphicsTransfer(GraphicsTransferVector *, GraphicsBlobCandidate const *)
        asm("func_080A480C");
    void QueueGraphicsChunks(GraphicsBlobCandidate const *, u8)
        asm("func_080A4944");
};

struct DiscardEffectRenderCandidate
{
    EffectBaseRenderCandidate base;
    SpriteAnimator animator;
    u8 active;
    u8 refresh_sprite_parts_each_update;
    u8 unk_3E;
    bool reset_update;
};

struct UnknownEntityThingRenderCandidate
{
    AActorEntity * owner;
    void * vtable;
    DiscardEffectRenderCandidate effect_08;
    DiscardEffectRenderCandidate effect_48;
    u8 state_88;
    i8 state_89;
    u8 state_8A_0 : 2;
    u8 state_8A_2 : 6;
    u8 state_8B;
};

struct EntityRenderContextCandidate
{
    GraphicsTransferVector * transfer_queue;
    u32 unk_04;
    void * renderer;
    i16 camera_x;
    i16 camera_y;
};

struct RenderResourcesCandidate
{
    GraphicsTransferVector * transfer_queue;
    void * renderer;

    RenderResourcesCandidate(GraphicsTransferVector * queue, void * render)
        : transfer_queue(queue), renderer(render)
    {
    }
};

struct EffectOffsetCandidate
{
    i16 x;
    i16 y;
};

struct GameObjectVtable58Candidate
{
    STRUCT_PAD(0x00, 0x58);
    void * (*vfunc_58)(GameObject *);
};

static inline void * GetGameObjectVfunc58(GameObject * object)
{
    GameObjectVtable58Candidate * vtable =
        *reinterpret_cast<GameObjectVtable58Candidate **>(object);
    return vtable->vfunc_58(object);
}

EC EffectOffsetCandidate gUnk_080F1328[][4];
typedef int (*RenderIwramCall)(
    void *, i32, i32, u32, i32, SpriteRenderDataCandidate *,
    void *, u16, void *);
EC void func_0803AE58(void *, void *, i32, i32, u32);

typedef int (*ExactIwramCall)(
    void *, void *, u32, u32, u32, u32, u32, u16, void *);

static inline int DrawEffectBaseExact(
    EffectBaseRenderCandidate * state,
    void * arg1,
    void * arg2,
    u32 arg3,
    u32 arg4,
    u32 arg5,
    u32 arg6,
    u32 arg7,
    u32 enabled)
{
    EffectBaseRenderCandidate * current = state;
    void * first = arg1;
    void * second = arg2;

    if ((int)(-enabled | enabled) < 0)
    {
        u16 value = current->unk_0C;
        void * data = &current->count;
        return reinterpret_cast<ExactIwramCall>(0x030004DC)(
            first, second, arg3, arg4, arg5, arg6, arg7, value, data);
    }

    return 0;
}

static inline void QueueEffectGraphicsV2(
    DiscardEffectRenderCandidate & effect,
    RenderResourcesCandidate & resources,
    SpriteRenderDataCandidate & render_data)
{
    u8 active_value = effect.active;
    u8 * active = &effect.active;
    if (active_value == 0)
        return;

    effect.base.QueueGraphicsTransfer(resources.transfer_queue, &render_data.graphics);

    if (effect.refresh_sprite_parts_each_update)
    {
        effect.base.QueueGraphicsChunks(&render_data.chunks, 1);
    }
    else
    {
        u8 * uploaded = &effect.unk_3E;
        if (*uploaded == 0)
        {
            effect.base.QueueGraphicsChunks(&render_data.chunks, 1);
            *uploaded = 1;
        }
    }

    *active = 0;
}

EC void func_08032690(
    UnknownEntityThingRenderCandidate * self,
    EntityRenderContextCandidate * context)
{
    AActorEntity * owner = self->owner;
    GameObject * game_object = owner->game_object;
    i32 x = (owner->x_q16 >> 16) - context->camera_x;
    i32 y = (owner->y_q16 >> 16) - context->camera_y;
    i32 depth = 0x8000 - (owner->y_q16 >> 16);
    RenderResourcesCandidate resources(context->transfer_queue, context->renderer);
    SpriteRenderDataCandidate render_data;

    i32 mode = self->state_8A_0;
    if (mode != 0)
    {
        if (mode >= 0)
        {
            if (mode <= 2)
            {
            u32 facing = owner->facing;
            EffectOffsetCandidate const * offset =
                &gUnk_080F1328[self->state_8A_2][facing];
            i32 offset_x = offset->x;
            i32 offset_y = offset->y;
            DiscardEffectRenderCandidate * effect = &self->effect_48;
            i32 effect_x = x + offset_x;
            i32 effect_y = y + offset_y;

            GetSpriteRenderData(&render_data, effect->animator);
            SpriteRenderDataCandidate * render = &render_data;

            int draw_result = DrawEffectBaseExact(
                &effect->base,
                resources.renderer,
                reinterpret_cast<void *>(effect_x),
                effect_y,
                0x55,
                depth,
                reinterpret_cast<u32>(render),
                reinterpret_cast<u32>(effect->base.game_object),
                self->effect_48.base.handle.value);

            if (draw_result != 0)
                QueueEffectGraphicsV2(*effect, resources, *render);
            }
        }
    }

    u32 attr;
    i32 attr_state = self->state_8B;
    if (attr_state == 1)
        goto attr_case_1;
    if (attr_state <= 1)
        goto attr_default;
    if (attr_state == 2)
        goto attr_case_2;
    goto attr_default;

attr_default:
    {
        u32 value = owner->unk_21;
        value &= 3;
        attr = value | (value << 2) | (value << 4) | (value << 6);
    }
    goto attr_done;
attr_case_1:
    attr = 0x19;
    goto attr_done;
attr_case_2:
    attr = 0x1A;
attr_done:;

    DiscardEffectRenderCandidate * effect = &self->effect_08;
    RenderResourcesCandidate * resources_ptr = &resources;
    GetSpriteRenderData(&render_data, effect->animator);
    SpriteRenderDataCandidate * render = &render_data;

    int draw_result = DrawEffectBaseExact(
        &effect->base,
        resources_ptr->renderer,
        reinterpret_cast<void *>(x),
        y,
        attr,
        depth,
        reinterpret_cast<u32>(render),
        reinterpret_cast<u32>(effect->base.game_object),
        self->effect_08.base.handle.value);

    if (draw_result != 0)
        QueueEffectGraphicsV2(*effect, *resources_ptr, *render);

    u32 draw_mode;
    i32 draw_state = self->state_88;
    if (draw_state == 1)
        goto draw_case_1;
    if (draw_state > 1)
        goto draw_gt_1;
    if (draw_state == 0)
        goto draw_case_0;
    goto draw_case_1;
draw_gt_1:
    if (draw_state == 2)
        goto draw_case_2;
    if (draw_state != 3)
        goto draw_case_1;
    return;
draw_case_0:
    draw_mode = 0;
    goto draw_done;
draw_case_1:
    draw_mode = 1;
    goto draw_done;
draw_case_2:
    draw_mode = 2;
draw_done:;

    func_0803AE58(
        GetGameObjectVfunc58(game_object),
        context->renderer,
        x,
        y + self->state_89,
        draw_mode);
}
