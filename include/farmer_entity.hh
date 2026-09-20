#ifndef FARMER_ENTITY_HH
#define FARMER_ENTITY_HH

#include "entity_actor.hh"
#include "farmer.hh"

struct FarmerEntity : public AActorEntity
{
    FarmerEntity(GameObject * game_object);

    enum HeldItemAction
    {
        HELD_ITEM_ACTION_THROW,
        HELD_ITEM_ACTION_INTERACT,
        HELD_ITEM_ACTION_BLOCKED,
        HELD_ITEM_ACTION_THROW_BALL,
    };

    HeldItemAction ClassifyHeldItemAction();

    /* +30 */ STRUCT_PAD(0x30, 0x34);
    /* +34 */ void * game_state;
    /* +38 */ Farmer * farmer;
};

#endif // FARMER_ENTITY_HH
