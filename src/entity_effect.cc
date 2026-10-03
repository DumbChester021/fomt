#include "entity_actor.hh"

static inline u32 GetActorResource(AActorEntity * owner)
{
    return owner->anim_id + owner->facing;
}

static inline GameObject * GetActorGameObject(AActorEntity * owner)
{
    return owner->game_object;
}

struct GameObjectVtableTail
{
    STRUCT_PAD(0x00, 0x6C);
    void * (*vfunc_6C)(GameObject *);
};

static inline void * GetGameObjectVfunc6C(GameObject * object)
{
    GameObjectVtableTail * vtable = *reinterpret_cast<GameObjectVtableTail **>(object);
    return vtable->vfunc_6C(object);
}

UnknownEntityThing::UnknownEntityThing(
    AActorEntity * owner_arg,
    u32 value,
    u32 arg,
    u32 state_88_arg,
    u32 state_8A_arg,
    u32 state_8B_arg,
    bool refresh)
    : UnknownEntityThingBase(owner_arg),
      effect_08(
          owner_arg->game_object->vfunc_68(),
          GetActorResource(owner_arg),
          GetActorGameObject(owner_arg),
          value,
          arg,
          refresh),
      effect_48(
          GetGameObjectVfunc6C(owner_arg->game_object),
          0,
          GetActorGameObject(owner_arg),
          2,
          14,
          false)
{
    state_88 = state_88_arg;
    state_89 = 0;
    u8 * state_8A_ptr = &state_8A.packed;
    *state_8A_ptr = state_8A_arg << 2;
    state_8B = state_8B_arg;
}

UnknownEntityThing::UnknownEntityThing(
    AActorEntity * owner_arg,
    u32 value,
    u32 const * args,
    u32 count,
    u32 state_88_arg,
    u32 state_8A_arg,
    u32 state_8B_arg,
    bool refresh)
    : UnknownEntityThingBase(owner_arg),
      effect_08(
          owner_arg->game_object->vfunc_68(),
          GetActorResource(owner_arg),
          GetActorGameObject(owner_arg),
          value,
          args,
          count,
          refresh),
      effect_48(
          GetGameObjectVfunc6C(owner_arg->game_object),
          0,
          GetActorGameObject(owner_arg),
          2,
          14,
          false)
{
    state_88 = state_88_arg;
    state_89 = 0;
    u8 * state_8A_ptr = &state_8A.packed;
    *state_8A_ptr = state_8A_arg << 2;
    state_8B = state_8B_arg;
}

void UnknownEntityThing::vfunc_0C()
{
    effect_08.Update();

    u32 mode = state_8A.fields.mode;
    if (mode != 0)
    {
        bool clear_mode = false;
        u32 result = effect_48.Update();
        if ((i32)(result << 29) < 0 && mode != 2)
            clear_mode = true;

        if (clear_mode)
            state_8A.fields.mode = 0;
    }
}

struct SpriteRenderData
{
    u8 pad_00[8];
    GraphicsBlob graphics;
    GraphicsBlob chunks;
    u8 pad_18[8];
};

struct SpriteRenderProviderVtable
{
    STRUCT_PAD(0x00, 0x10);
    void (*get_render_data)(SpriteRenderData *, SpriteAnimationProvider *, u32);
};

static inline void GetSpriteRenderData(
    SpriteRenderData * out, SpriteAnimator & animator)
{
    SpriteAnimationProvider * provider = animator.provider;
    SpriteRenderProviderVtable * vtable =
        *reinterpret_cast<SpriteRenderProviderVtable **>(provider);
    u32 sprite_id = animator.animation[animator.frame_index].sprite_id;
    vtable->get_render_data(out, provider, sprite_id);
}

struct RenderResources
{
    GraphicsTransferVector * transfer_queue;
    void * renderer;

    RenderResources(GraphicsTransferVector * queue, void * render)
        : transfer_queue(queue), renderer(render)
    {
    }
};

struct EffectOffset
{
    i16 x;
    i16 y;
};

struct GameObjectVtable58
{
    STRUCT_PAD(0x00, 0x58);
    void * (*vfunc_58)(GameObject *);
};

static inline void * GetGameObjectVfunc58(GameObject * object)
{
    GameObjectVtable58 * vtable =
        *reinterpret_cast<GameObjectVtable58 **>(object);
    return vtable->vfunc_58(object);
}

EC EffectOffset gUnk_080F1328[][4];
typedef int (*RenderIwramCall)(
    void *, i32, i32, u32, i32, SpriteRenderData *,
    void *, u16, void *);
EC void func_0803AE58(void *, void *, i32, i32, u32);

typedef int (*EffectIwramCall)(
    void *, void *, u32, u32, u32, u32, u32, u16, void *);

static inline int DrawEffectBase(
    EffectBase * state,
    void * arg1,
    void * arg2,
    u32 arg3,
    u32 arg4,
    u32 arg5,
    u32 arg6,
    u32 arg7,
    u32 enabled)
{
    EffectBase * current = state;
    void * first = arg1;
    void * second = arg2;

    if ((int)(-enabled | enabled) < 0)
    {
        u16 value = current->unk_0C;
        void * data = &current->count;
        return reinterpret_cast<EffectIwramCall>(0x030004DC)(
            first, second, arg3, arg4, arg5, arg6, arg7, value, data);
    }

    return 0;
}

static inline void QueueEffectGraphics(
    EntityEffect & effect,
    RenderResources & resources,
    SpriteRenderData & render_data)
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
    UnknownEntityThing * self,
    EntityRenderContext * context)
{
    AActorEntity * owner = self->owner;
    GameObject * game_object = owner->game_object;
    i32 x = (owner->x_q16 >> 16) - context->camera_x;
    i32 y = (owner->y_q16 >> 16) - context->camera_y;
    i32 depth = 0x8000 - (owner->y_q16 >> 16);
    RenderResources resources(context->transfer_queue, context->renderer);
    SpriteRenderData render_data;

    i32 mode = self->state_8A.fields.mode;
    if (mode != 0)
    {
        if (mode >= 0)
        {
            if (mode <= 2)
            {
                u32 facing = owner->facing;
                EffectOffset const * offset =
                    &gUnk_080F1328[self->state_8A.fields.value][facing];
                i32 offset_x = offset->x;
                i32 offset_y = offset->y;
                EntityEffect * effect = &self->effect_48;
                i32 effect_x = x + offset_x;
                i32 effect_y = y + offset_y;

                GetSpriteRenderData(&render_data, effect->animator);
                SpriteRenderData * render = &render_data;

                int draw_result = DrawEffectBase(
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
                    QueueEffectGraphics(*effect, resources, *render);
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

    EntityEffect * effect = &self->effect_08;
    RenderResources * resources_ptr = &resources;
    GetSpriteRenderData(&render_data, effect->animator);
    SpriteRenderData * render = &render_data;

    int draw_result = DrawEffectBase(
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
        QueueEffectGraphics(*effect, *resources_ptr, *render);

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
