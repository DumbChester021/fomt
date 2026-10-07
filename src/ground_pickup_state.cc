#include "ground_pickup_state.hh"

EC void func_080A1A48(GroundPickupState * self) SECTION(".text.ground_pickup_state_init");
EC void func_080A1A4C(GroundPickupState * self) SECTION(".text.ground_pickup_state_init");
EC u32 func_080A1EF4(GroundPickupState const * self, u32 index) SECTION(".text.ground_pickup_state_durability");
EC void func_080A1FC4(GroundPickupState * self, u32 index, int amount) SECTION(".text.ground_pickup_state_durability");

void func_080A1A48(GroundPickupState *)
{
}

void func_080A1A4C(GroundPickupState * self)
{
    for (int i = 0; i < 7; ++i)
        self->available[i] = 0xFF;

    self->durability_0 = 6;
    self->durability_1 = 6;
    self->durability_2 = 6;
    self->durability_3 = 6;
    self->durability_4 = 6;
    self->durability_5 = 6;
    self->durability_6 = 6;
    self->durability_7 = 6;
    self->durability_8 = 6;
    self->durability_9 = 6;
    self->durability_10 = 6;
    self->durability_11 = 6;
    self->durability_12 = 6;
    self->durability_13 = 1;
    self->durability_14 = 1;
}

u32 func_080A1EF4(GroundPickupState const * self, u32 index)
{
    u32 id = index;
    u32 result = 0;

    if (id > 0x5F)
    {
        id -= 0x60;
        if (id <= 0xE)
        {
            switch (id)
            {
                case 0: result = self->durability_0; break;
                case 1: result = self->durability_1; break;
                case 2: result = self->durability_2; break;
                case 3: result = self->durability_3; break;
                case 4: result = self->durability_4; break;
                case 5: result = self->durability_5; break;
                case 6: result = self->durability_6; break;
                case 7: result = self->durability_7; break;
                case 8: result = self->durability_8; break;
                case 9: result = self->durability_9; break;
                case 10: result = self->durability_10; break;
                case 11: result = self->durability_11; break;
                case 12: result = self->durability_12; break;
                case 13: result = self->durability_13; break;
                case 14: result = self->durability_14; break;
            }
        }
    }

    return result;
}

void func_080A1FC4(GroundPickupState * self, u32 index, int amount)
{
    u32 id = index;

    if (id > 0x5F)
    {
        id -= 0x60;
        if (id <= 0xE)
        {
            switch (id)
            {
                case 0:
                {
                    int value = self->durability_0 - amount;
                    if (value < 0) value = 0;
                    self->durability_0 = value;
                    break;
                }
                case 1:
                {
                    int value = self->durability_1 - amount;
                    if (value < 0) value = 0;
                    self->durability_1 = value;
                    break;
                }
                case 2:
                {
                    int value = self->durability_2 - amount;
                    if (value < 0) value = 0;
                    self->durability_2 = value;
                    break;
                }
                case 3:
                {
                    int value = self->durability_3 - amount;
                    if (value < 0) value = 0;
                    self->durability_3 = value;
                    break;
                }
                case 4:
                {
                    int value = self->durability_4 - amount;
                    if (value < 0) value = 0;
                    self->durability_4 = value;
                    break;
                }
                case 5:
                {
                    int value = self->durability_5 - amount;
                    if (value < 0) value = 0;
                    self->durability_5 = value;
                    break;
                }
                case 6:
                {
                    int value = self->durability_6 - amount;
                    if (value < 0) value = 0;
                    self->durability_6 = value;
                    break;
                }
                case 7:
                {
                    int value = self->durability_7 - amount;
                    if (value < 0) value = 0;
                    self->durability_7 = value;
                    break;
                }
                case 8:
                {
                    int value = self->durability_8 - amount;
                    if (value < 0) value = 0;
                    self->durability_8 = value;
                    break;
                }
                case 9:
                {
                    int value = self->durability_9 - amount;
                    if (value < 0) value = 0;
                    self->durability_9 = value;
                    break;
                }
                case 10:
                {
                    int value = self->durability_10 - amount;
                    if (value < 0) value = 0;
                    self->durability_10 = value;
                    break;
                }
                case 11:
                {
                    int value = self->durability_11 - amount;
                    if (value < 0) value = 0;
                    self->durability_11 = value;
                    break;
                }
                case 12:
                {
                    int value = self->durability_12 - amount;
                    if (value < 0) value = 0;
                    self->durability_12 = value;
                    break;
                }
                case 13:
                {
                    int value = self->durability_13 - amount;
                    if (value < 0) value = 0;
                    self->durability_13 = value;
                    break;
                }
                case 14:
                {
                    int value = self->durability_14 - amount;
                    if (value < 0) value = 0;
                    self->durability_14 = value;
                    break;
                }
            }
        }
    }
}
