#include "fishing_records.hh"

FishingRecords * InitFishingRecords(FishingRecords * self)
{
    FishingRecord * current = self->records;
    int index = NUM_FISHING_RECORDS - 1;
    do
    {
        current->count = 0;
        current->max_size = 0;
        ++current;
        --index;
    } while (index != -1);
    return self;
}

bool RecordFishingCatch(FishingRecords * self, u32 index, u32 size)
{
    bool result = false;
    if (self->records[index].count <= 999999999)
        ++self->records[index].count;
    if (size > self->records[index].max_size)
    {
        self->records[index].max_size = size;
        result = true;
    }
    return result;
}

bool HasCaughtAllFish(FishingRecords const * self)
{
    bool result = true;
    for (u32 index = FIRST_FISH_RECORD; index < NUM_FISHING_RECORDS; ++index)
        if (self->records[index].count == 0)
            result = false;
    return result;
}

u32 GetTotalFishCaught(FishingRecords const * self)
{
    u32 result = 0;
    for (u32 index = FIRST_FISH_RECORD; index < NUM_FISHING_RECORDS; ++index)
    {
        result += self->records[index].count;
        if (result > 999999999)
            result = 1000000000;
    }
    return result;
}

u32 GetFishingCatchCount(FishingRecords const * self, u32 index)
{
    return self->records[index].count;
}

u32 GetFishingMaxSize(FishingRecords const * self, u32 index)
{
    return self->records[index].max_size;
}

u32 GetFishKingSpriteId(FishingRecords const *, u32 index)
{
    switch (index)
    {
    case 53:
    default:
        return 252;
    case 54:
        return 249;
    case 55:
        return 254;
    case 56:
        return 253;
    case 57:
        return 250;
    case 58:
        return 251;
    }
}

extern char const * gUnk_08103A18[];

char const * GetFishingRecordName(FishingRecords const *, u32 index)
{
    return gUnk_08103A18[index];
}
