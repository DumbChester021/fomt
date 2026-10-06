#ifndef ENTITY_BALL_HH
#define ENTITY_BALL_HH

#include "entity.hh"

#pragma interface

struct BallVisualController;

struct BallEntity : public AEntity
{
    BallEntity(GameObject * game_object, Location & location) SECTION(".text.ball_ctor");
    virtual ~BallEntity() SECTION(".text.ball_dtor");

    virtual Box GetBox() const SECTION(".text.ball_run2");
    virtual void vfunc_18() SECTION(".text.ball_run3");
    virtual void vfunc_2C(u32 dummy) SECTION(".text.ball_run3");
    virtual UnknownEntityThing * vfunc_30() SECTION(".text.ball_run3");

    void Launch(u32 state) SECTION(".text.ball_run1");
    u32 IsActive() const SECTION(".text.ball_run1");
    i32 GetFlightHeight() const SECTION(".text.ball_run2");

    /* +18 */ Location * location_ref;
    /* +1C */ i32 flight_pos_q16;
    /* +20 */ i32 flight_speed_q16;
    /* +24 */ u8 launch_state;
    /* +25 */ u8 active;
    /* +26 */ u8 dog_play;
    /* +27 */ u8 pad_27;
    /* +28 */ u16 resource_id;
};

struct BallVisualController : public UnknownEntityThingBase
{
    BallVisualController(BallEntity *) asm("func_0803853C");

    virtual void vfunc_0C() SECTION(".text.ball_controller_update");
    virtual void vfunc_10(u32 dummy);

    /* +08 */ EntityEffect effect;
};

#endif // ENTITY_BALL_HH
