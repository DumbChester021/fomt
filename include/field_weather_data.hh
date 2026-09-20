#ifndef FIELD_WEATHER_DATA_HH
#define FIELD_WEATHER_DATA_HH

#include "prelude.h"

struct Unk_080E8CC4
{
    /* +00 */ u8 lumber_decay_rate;
    /* +01 */ u8 unk_01;
    /* +02 */ u8 unk_02;
    /* +03 */ u8 unk_03;
    /* +04 */ u8 unk_04;
    /* +05 */ u8 unk_05;
    /* +06 */ u8 unk_06;
    /* +07 */ u8 crop_loss_rate;
};

extern Unk_080E8CC4 const gUnk_080E8CC4[4][2];
extern Unk_080E8CC4 const gUnk_080E8D04;
extern Unk_080E8CC4 const gUnk_080E8D0C;

#endif // FIELD_WEATHER_DATA_HH
