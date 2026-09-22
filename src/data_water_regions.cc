#include "water_region.hh"

extern "C" WaterRegionBounds const gWaterRegionBounds[8] = {
    { 0, 33, 42, 72, 68, WATER_REGION_KAPPA_LAKE },
    { 0, 53, 32, 125, 41, 1 },
    { 0, 117, 42, 149, 51, WATER_REGION_GODDESS_POND },
    { 2, 0, 47, 127, 87, 3 },
    { 1, 25, 0, 63, 73, WATER_REGION_OCEAN },
    { 43, 1, 0, 28, 10, 5 },
    { 0, 110, 56, 117, 61, WATER_REGION_HOT_SPRING },
    { 7, 32, 58, 172, 63, 3 },
};
