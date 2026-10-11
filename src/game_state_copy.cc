#include "save_persisted_layout.hh"

#include <memory>
#include <string.h>

// Preserve both six-byte library calls, as in the exact Farmer copy.
extern "C" void *CopySavedLocation(void *dest, void const *source, unsigned long size) __asm__("memcpy");

EC Farm *CopySavedFarmState(Farm *, Farm const *);
EC MoneyState *CopySavedMoneyState(MoneyState *, MoneyState const *);
EC Farmer *CopySavedFarmerState(Farmer *, Farmer const *);
EC Dog *CopySavedDogState(Dog *, Dog const *);
EC SavedSocialState *CopySavedSocialState(SavedSocialState *, SavedSocialState const *);
EC SavedNativeCallState *func_080D44D4(SavedNativeCallState *, SavedNativeCallState const *);

// Reconstruct only the active range; inactive bytes and trailing padding stay put.
inline void CopySavedBuffer(SavedByteBuffer *dest, SavedByteBuffer const *source)
{
    dest->count = 0;
    u32 count = source->count;
    std::uninitialized_copy(source->begin(), source->begin() + count, dest->begin());
    dest->count = count;
    CopySavedLocation(&dest->location, &source->location, 6);
}

// Fixed metadata arrays and null-terminated strings have distinct copy rules.
inline void CopySavedNames(SavedNames *dest, SavedNames const *source)
{
    dest->word_00 = source->word_00;
    dest->word_04 = source->word_04;
    u8 *to8 = dest->bytes_08;
    int count8 = 7;
    u8 const *from8 = source->bytes_08;
    for (; count8 != -1; --count8)
    {
        *to8 = *from8;
        ++to8;
        ++from8;
    }
    u8 *to4 = dest->bytes_10;
    int count4 = 3;
    u8 const *from4 = source->bytes_10;
    for (; count4 != -1; --count4)
    {
        *to4 = *from4;
        ++to4;
        ++from4;
    }
    strcpy(dest->name_14, source->name_14);
    strcpy(dest->name_24, source->name_24);
    strcpy(dest->name_34, source->name_34);
}

EC PersistedGameStateLayout * CopySavedGameState(
    PersistedGameStateLayout *dest, PersistedGameStateLayout const *source)
    SECTION(".text.save_game_state_copy");
EC PersistedGameStateLayout * CopySavedGameState(
    PersistedGameStateLayout *dest, PersistedGameStateLayout const *source)
{
    dest->header.flag_0 = source->header.flag_0;
    dest->header.flag_1 = source->header.flag_1;
    dest->header.flag_2 = source->header.flag_2;
    dest->header.flag_3 = source->header.flag_3;
    dest->header.flag_4 = source->header.flag_4;
    dest->header.value_5 = source->header.value_5;
    dest->header.value_13 = source->header.value_13;
    dest->header.value_18 = source->header.value_18;
    dest->header.value_25 = source->header.value_25;
    dest->header.flag_31 = source->header.flag_31;
    dest->header.flag_32 = source->header.flag_32;
    dest->header.words_08 = source->header.words_08;
    CopySavedFarmState(&dest->farm, &source->farm);
    CopySavedMoneyState(&dest->money, &source->money);
    CopySavedFarmerState(&dest->farmer, &source->farmer);
    CopySavedDogState(&dest->dog, &source->dog);
    CopySavedBuffer(&dest->saved_buffer, &source->saved_buffer);
    CopySavedLocation(dest->location_1ccc, source->location_1ccc, 6);
    CopySavedSocialState(&dest->social, &source->social);
    // This packed-state child still uses its original assembly implementation.
    func_080D44D4(&dest->native_calls, &source->native_calls);
    CopySavedNames(&dest->names, &source->names);
    dest->word_2210 = source->word_2210;
    memcpy(dest->block_2214, source->block_2214, sizeof(dest->block_2214));
    dest->words_2c1c = source->words_2c1c;
    dest->words_2c4c = source->words_2c4c;
    dest->transition = source->transition;
    memcpy(&dest->fishing_records, &source->fishing_records, sizeof(dest->fishing_records));
    memcpy(dest->block_2e58, source->block_2e58, sizeof(dest->block_2e58));
    dest->words_3480 = source->words_3480;
    dest->words_3494 = source->words_3494;
    dest->byte_34c4 = source->byte_34c4;
    dest->byte_34c5 = source->byte_34c5;
    dest->words_34c8 = source->words_34c8;
    dest->word_34d8 = source->word_34d8;
    dest->words_34dc = source->words_34dc;
    return dest;
}

EC PersistedGameStateLayout *func_080D4178(
    PersistedGameStateLayout *dest, PersistedGameStateLayout const *source)
    ALIAS(CopySavedGameState);
