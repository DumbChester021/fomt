#ifndef ENTITY_EFFECT_HH
#define ENTITY_EFFECT_HH

#include "prelude.h"
#include "hardware_transfer.hh"
#include "sprite_animator.hh"

#pragma interface

struct AActorEntity;

struct GraphicsBlob
{
    void const * data;
    u16 size;
};

struct EffectHandle
{
    u32 unk_00;
    u32 value;

    operator bool() const
    {
        return value != 0;
    }
};

struct EffectBase
{
    /* +00 */ void * game_object;
    /* +04 */ EffectHandle handle;
    /* +0C */ u16 unk_0C;
    /* +0E */ u16 unk_0E;
    /* +10 */ u32 count;
    /* +14 */ u8 values[16];
    /* +24 */ void * vtable;

    void QueueGraphicsTransfer(GraphicsTransferVector *, GraphicsBlob const *)
        asm("func_080A480C");
    void QueueGraphicsChunks(GraphicsBlob const *, u8) asm("func_080A4944");
};

struct EntityEffect
{
    EntityEffect(void *, u32, void *, u32, u32 const *, u32, bool)
        asm("func_080A49A0");
    EntityEffect(void *, u32, void *, u32, u32, bool)
        asm("func_080A4A00");

    u32 Update()
    {
        u32 result;
        if (reset_update == 0)
        {
            u32 animator_result = animator.Update();
            if ((i32)(animator_result << 30) < 0)
                active = 1;
            result = animator_result;
        }
        else
        {
            reset_update = false;
            result = 2;
        }
        return result;
    }

    /* +00 */ EffectBase base;
    /* +28 */ SpriteAnimator animator;
    /* +3C */ u8 active;
    /* +3D */ u8 refresh_sprite_parts_each_update;
    /* +3E */ u8 unk_3E;
    /* +3F */ bool reset_update;
};

union PACKED EntityEffectState
{
    u8 packed;
    struct PACKED
    {
        u8 mode : 2;
        u8 value : 6;
    } fields;
};

struct UnknownEntityThingBase
{
    UnknownEntityThingBase(AActorEntity * arg) : owner(arg) {}
    virtual ~UnknownEntityThingBase();
    virtual void vfunc_0C();
    virtual void vfunc_10(u32 dummy);

    /* +00 */ AActorEntity * owner;
    /* +04 */ // vtable
};

struct UnknownEntityThing : public UnknownEntityThingBase
{
    UnknownEntityThing(AActorEntity *, u32, u32, u32, u32, u32, bool)
        asm("func_080324BC");
    UnknownEntityThing(AActorEntity *, u32, u32 const *, u32, u32, u32, u32, bool)
        asm("func_08032560");
    virtual ~UnknownEntityThing();
    virtual void vfunc_0C() asm("func_0803260C");

    /* +08 */ EntityEffect effect_08;
    /* +48 */ EntityEffect effect_48;
    /* +88 */ u8 state_88;
    /* +89 */ i8 state_89;
    /* +8A */ EntityEffectState state_8A;
    /* +8B */ u8 state_8B;
};

struct EntityRenderContext
{
    /* +00 */ GraphicsTransferVector * transfer_queue;
    /* +04 */ u32 unk_04;
    /* +08 */ void * renderer;
    /* +0C */ i16 camera_x;
    /* +0E */ i16 camera_y;
};

struct UnknownEntityThingVtable
{
    u32 unk_00;
    u32 unk_04;
    void (*destroy)(UnknownEntityThing *, u32);
    void (*update)(UnknownEntityThing *);
    void (*render)(UnknownEntityThing *, EntityRenderContext *);
};

EC UnknownEntityThingVtable const vtable_unk_080E68B4;

#endif // ENTITY_EFFECT_HH
