#pragma once

#include "prelude.h"

struct SceneController;

extern u32 GetAnimalHeartCount(const SceneController *, u32) asm("func_08085EC4")
    SECTION(".text.livestock_controller_results");
extern u32 GetPurchasedAnimalType(const SceneController *) asm("func_08085EEC")
    SECTION(".text.livestock_controller_results");
extern u32 GetAnimalSalePrice(const SceneController *, u32, u32) asm("func_080868E4")
    SECTION(".text.livestock_controller_stats");
extern u32 CountPregnantAnimals(const SceneController *) asm("func_080869A0")
    SECTION(".text.livestock_controller_stats");
