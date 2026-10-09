#include "livestock_controller.hh"
#include <algorithm>
#include "barn.hh"

// Result-tail view; the controller prefix and virtual hierarchy remain unknown.
struct Controller85584Results
{
    /* +0000 */ u8 unk_0000[0x43D8];
    /* +43D8 */ u32 purchased_animal_type;
    /* +43DC */ u32 purchased_animal_slot;
};

u32 GetAnimalHeartCount(const SceneController *, u32 affection)
{
    return std::min<u32>(10, affection / 25);
}

u32 GetPurchasedAnimalType(const SceneController * controller)
{
    const Controller85584Results * self = reinterpret_cast<const Controller85584Results *>(controller);
    u32 type = self->purchased_animal_type;
    if (type > 1)
        return 999;
    return type;
}

struct ControllerBarnContext
{
    u8 unk_0000[0x5F0];
    Barn barn;
};

struct ControllerBarnPrefix
{
    void * unk_00;
    void * vtable;
    ControllerBarnContext * context;
};

u32 GetAnimalSalePrice(const SceneController * controller, u32 slot, u32 type)
{
    const ControllerBarnPrefix * self = reinterpret_cast<const ControllerBarnPrefix *>(controller);
    u32 price = 3000;
    if (type == 0) {
        switch (self->context->barn.GetCow(slot)->GetProductRank()) {
        case Livestock::PRODUCT_RANK_0: price = 3000; break;
        case Livestock::PRODUCT_RANK_1: price = 4000; break;
        case Livestock::PRODUCT_RANK_2: price = 5000; break;
        case Livestock::PRODUCT_RANK_3: price = 6000; break;
        case Livestock::PRODUCT_RANK_4: price = 7000; break;
        }
    } else if (type == 1) {
        switch (self->context->barn.GetSheep(slot)->GetProductRank()) {
        case Livestock::PRODUCT_RANK_0: price = 2000; break;
        case Livestock::PRODUCT_RANK_1: price = 2500; break;
        case Livestock::PRODUCT_RANK_2: price = 3000; break;
        case Livestock::PRODUCT_RANK_3: price = 4000; break;
        case Livestock::PRODUCT_RANK_4: price = 5000; break;
        }
    }
    return price;
}

u32 CountPregnantAnimals(const SceneController * controller)
{
    const ControllerBarnPrefix * self = reinterpret_cast<const ControllerBarnPrefix *>(controller);
    u32 count = 0;
    for (u32 slot = 0; slot < self->context->barn.GetCapacity(); ++slot) {
        if (self->context->barn.GetCow(slot)) {
            if (self->context->barn.GetCow(slot)->IsPregnant())
                ++count;
        } else if (self->context->barn.GetSheep(slot)) {
            if (self->context->barn.GetSheep(slot)->IsPregnant())
                ++count;
        }
    }
    return count;
}
