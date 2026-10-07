#ifndef FISHING_RECORDS_HH
#define FISHING_RECORDS_HH

#include "prelude.h"

enum
{
    NUM_FISHING_RECORDS = 59,
    FIRST_FISH_RECORD = 8,
    FIRST_FISH_KING_RECORD = 53,
};

struct FishingRecord
{
    u32 count;
    u32 max_size;
};

struct FishingRecords
{
    FishingRecord records[NUM_FISHING_RECORDS];
};

EC FishingRecords * InitFishingRecords(FishingRecords * self) asm("func_0809CD78");
EC bool RecordFishingCatch(FishingRecords * self, u32 index, u32 size) asm("func_0809CD98");
EC bool HasCaughtAllFish(FishingRecords const * self) asm("func_0809CDCC");
EC u32 GetTotalFishCaught(FishingRecords const * self) asm("func_0809CDEC");
EC u32 GetFishingCatchCount(FishingRecords const * self, u32 index) asm("func_0809CE1C");
EC u32 GetFishingMaxSize(FishingRecords const * self, u32 index) asm("func_0809CE24");
EC u32 GetFishKingSpriteId(FishingRecords const * self, u32 index) asm("func_0809CE30");
EC char const * GetFishingRecordName(FishingRecords const * self, u32 index) asm("func_0809CE7C");

#endif
