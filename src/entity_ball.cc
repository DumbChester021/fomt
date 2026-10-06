#include "entity_ball.hh"
#include "entity_actor.hh"

EC bool func_08020460(AActorEntity *);
EC void func_08038374(BallEntity *, i32, i32, u32, u32);
EC void func_08038110(BallEntity *);


BallEntity::BallEntity(GameObject * game_object, Location & location)
    : AEntity(game_object, location),
      location_ref(&location),
      flight_pos_q16(0),
      active(false),
      dog_play(false),
      resource_id(0x31)
{
    AActorEntity * dog_entity =
        static_cast<AActorEntity *>(game_object->vfunc_40(0x2B));

    if (dog_entity != nullptr
        && dog_entity->location_map == location_map
        && func_08020460(dog_entity))
    {
        func_08038374(
            this,
            dog_entity->x_q16,
            dog_entity->y_q16,
            dog_entity->anim_id,
            dog_entity->facing);
    }
}

void BallEntity::Launch(u32 state)
{
    launch_state = state;
    flight_pos_q16 = 0x150000;
    flight_speed_q16 = 0x30000;
    active = true;
}

u32 BallEntity::IsActive() const
{
    return active;
}

Box BallEntity::GetBox() const
{
    return Box(x_q16 >> 16, y_q16 >> 16, 8, 8);
}

i32 BallEntity::GetFlightHeight() const
{
    return flight_pos_q16 >> 16;
}

BallEntity::~BallEntity()
{
    *location_ref = GetLocation();
}

void BallEntity::vfunc_18()
{
    if (unk_10.Get() != nullptr)
        unk_10->vfunc_0C();

    func_08038110(this);
}

void BallEntity::vfunc_2C(u32 dummy)
{
    AEntity::vfunc_2C(dummy);
    func_08038110(this);
}

UnknownEntityThing * BallEntity::vfunc_30()
{
    return reinterpret_cast<UnknownEntityThing *>(new BallVisualController(this));
}

void BallVisualController::vfunc_0C()
{
    effect.Update();
}
