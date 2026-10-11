#ifndef SAVE_PERSISTED_LAYOUT_HH
#define SAVE_PERSISTED_LAYOUT_HH

#include "save_format.hh"
#include "save_byte_buffer.hh"
#include "save_transition_state.hh"
#include "money.hh"
#include "dog.hh"
#include "farm.hh"
#include "farmer.hh"
#include "fishing_records.hh"
#include "saved_native_call_state.hh"
#include "saved_social_state.hh"

// Word aggregates retain the retail ldm/stm copies. Their gameplay meanings
// are unresolved; their sizes and containing offsets are verified below.
template<unsigned N>
struct SavedWords
{
    u32 words[N];
};

// The copy assigns every first-word field and bit 0 of the second word.
// The remaining 31 bits are preserved in the destination.
struct SavedHeader
{
    u32 flag_0:1;
    u32 flag_1:1;
    u32 flag_2:1;
    u32 flag_3:1;
    u32 flag_4:1;
    u32 value_5:8;
    u32 value_13:5;
    u32 value_18:7;
    u32 value_25:6;
    u32 flag_31:1;
    u32 flag_32:1;
    u32 reserved:31;
    SavedWords<3> words_08;
};

// Three null-terminated strings, each backed by 16 bytes. Their owners and
// the preceding metadata remain unnamed until their consumers are recovered.
struct SavedNames
{
    u32 word_00;
    u32 word_04;
    u8 bytes_08[8];
    u8 bytes_10[4];
    char name_14[16];
    char name_24[16];
    char name_34[16];
};

// Complete 0x34F4 serialized layout used by the exact GameState copy.
// Offset names and opaque blocks deliberately leave unknown semantics open.
struct PersistedGameStateLayout
{
    SavedHeader header;                  // +0x0000
    Farm farm;                           // +0x0014
    MoneyState money;                     // +0x1AA8
    Farmer farmer;                        // +0x1BD8
    Dog dog;                              // +0x1C70
    SavedByteBuffer saved_buffer;         // +0x1CA0
    u8 location_1ccc[6];                  // +0x1CCC, semantics unresolved
    u8 padding_1cd2[2];                   // preserved
    SavedSocialState social;             // +0x1CD4
    SavedNativeCallState native_calls;    // +0x214C
    SavedNames names;                     // +0x21CC
    u32 word_2210;
    u8 block_2214[0xA08];
    SavedWords<12> words_2c1c;
    SavedWords<10> words_2c4c;
    SavedTransitionState transition;     // +0x2C74
    FishingRecords fishing_records;      // +0x2C80
    u8 block_2e58[0x628];
    SavedWords<5> words_3480;
    SavedWords<12> words_3494;
    u8 byte_34c4;
    u8 byte_34c5;
    u8 padding_34c6[2];                   // preserved
    SavedWords<4> words_34c8;
    u32 word_34d8;
    SavedWords<6> words_34dc;
};

EC PersistedGameStateLayout * CopySavedGameState(
    PersistedGameStateLayout *dest, PersistedGameStateLayout const *source);

// Each SRAM slot stores its length prefix, raw GameState and checksum.
// Remaining bytes in the slot have not been assigned retail semantics.
struct SaveSlotStorageLayout
{
    u32 payload_length;                                    // +0x0000
    PersistedGameStateLayout payload;                      // +0x0004
    u32 checksum;                                          // +0x34F8
    u8 unclaimed_tail[SAVE_SLOT_SIZE-SAVE_SLOT_RECORD_SIZE]; // +0x34FC
};

// Exact header fields recovered by source-matched save_slot_header.cc.
// Signature bytes are the original 32-byte gUnk_080E862C constant.
// Mask bits 0 and 1 mark valid slots; selected_slot must be 0 or 1.
struct SaveSramHeaderLayout
{
    u8 signature[0x20];                       // +0x00
    u32 valid_slot_mask;                     // +0x20
    u32 selected_slot;                       // +0x24
};

// Fixed SRAM image: 0x28-byte typed header, then two 0x3FEC-byte slots.
struct SaveSramStorageLayout
{
    SaveSramHeaderLayout header;             // +0x0000
    SaveSlotStorageLayout slots[2];          // +0x0028
};

// These static assertions are the binary-compatibility gate for this view.
// No members may be inserted/reordered unless all retail offsets still match.
typedef char SaveMoneyRecordSizeCheck[sizeof(MoneyRecord) == 8 ? 1 : -1];
typedef char SaveDailyHistorySizeCheck[sizeof(MoneyHistory<30>) == 0xF4 ? 1 : -1];
typedef char SaveSeasonalHistorySizeCheck[sizeof(MoneyHistory<4>) == 0x24 ? 1 : -1];
typedef char SaveMoneyDailyOffsetCheck[offsetof(MoneyState,daily) == 0x08 ? 1 : -1];
typedef char SaveMoneySeasonalOffsetCheck[offsetof(MoneyState,seasonal) == 0xFC ? 1 : -1];
typedef char SaveMoneyMaxDailyIncomeOffsetCheck[offsetof(MoneyState,max_daily) + offsetof(MoneyRecord,income) == 0x120 ? 1 : -1];
typedef char SaveMoneyMaxDailySpendOffsetCheck[offsetof(MoneyState,max_daily) + offsetof(MoneyRecord,spend) == 0x124 ? 1 : -1];
typedef char SaveMoneyMaxSeasonalIncomeOffsetCheck[offsetof(MoneyState,max_seasonal) + offsetof(MoneyRecord,income) == 0x128 ? 1 : -1];
typedef char SaveMoneyMaxSeasonalSpendOffsetCheck[offsetof(MoneyState,max_seasonal) + offsetof(MoneyRecord,spend) == 0x12C ? 1 : -1];
typedef char SaveMoneyStateSizeCheck[sizeof(MoneyState) == 0x130 ? 1 : -1];
// Farm's real children were already reconstructed in their respective headers.
// Their offsets match the struct-copy calls in func_080D64C8.
typedef char SaveFarmHorseOffsetCheck[offsetof(Farm,horse_placeholder) == 0x14 ? 1 : -1];
typedef char SaveFarmShippingOffsetCheck[offsetof(Farm,shipping_bin) == 0x40 ? 1 : -1];
typedef char SaveFarmHouseOffsetCheck[offsetof(Farm,farm_house) == 0x1E0 ? 1 : -1];
typedef char SaveFarmCoopOffsetCheck[offsetof(Farm,coop) == 0x3FC ? 1 : -1];
typedef char SaveFarmBarnOffsetCheck[offsetof(Farm,barn) == 0x5DC ? 1 : -1];
typedef char SaveFarmFieldOffsetCheck[offsetof(Farm,field) == 0x9C8 ? 1 : -1];
typedef char SaveFarmStateSizeCheck[sizeof(Farm) == 0x1A94 ? 1 : -1];
typedef char SaveFarmerLocationOffsetCheck[offsetof(Farmer,location) == 0x24 ? 1 : -1];
typedef char SaveFarmerHeldItemOffsetCheck[offsetof(Farmer,held_item) == 0x54 ? 1 : -1];
typedef char SaveFarmerRucksackOffsetCheck[offsetof(Farmer,rucksack) == 0x60 ? 1 : -1];
typedef char SaveFishingRecordSizeCheck[sizeof(FishingRecord) == 8 ? 1 : -1];
typedef char SaveFarmerStateSizeCheck[sizeof(Farmer) == 0x98 ? 1 : -1];
typedef char SaveFishingRecordsSizeCheck[sizeof(FishingRecords) == 0x1D8 ? 1 : -1];
typedef char SaveDogStateSizeCheck[sizeof(Dog) == 0x30 ? 1 : -1];
typedef char SaveStateSizeCheck[sizeof(PersistedGameStateLayout) == SAVE_GAME_STATE_SIZE ? 1 : -1];
typedef char SaveStateFarmOffsetCheck[offsetof(PersistedGameStateLayout,farm) == 0x14 ? 1 : -1];
typedef char SaveStateMoneyOffsetCheck[offsetof(PersistedGameStateLayout,money) == 0x1AA8 ? 1 : -1];
typedef char SaveStateFarmerOffsetCheck[offsetof(PersistedGameStateLayout,farmer) == 0x1BD8 ? 1 : -1];
typedef char SaveStateDogOffsetCheck[offsetof(PersistedGameStateLayout,dog) == 0x1C70 ? 1 : -1];
typedef char SaveStateBufferOffsetCheck[offsetof(PersistedGameStateLayout,saved_buffer) == 0x1CA0 ? 1 : -1];
typedef char SaveStateNativeCallOffsetCheck[offsetof(PersistedGameStateLayout,native_calls) == 0x214C ? 1 : -1];
typedef char SaveStateNamesOffsetCheck[offsetof(PersistedGameStateLayout,names) == 0x21CC ? 1 : -1];
typedef char SaveStateTransitionOffsetCheck[offsetof(PersistedGameStateLayout,transition) == 0x2C74 ? 1 : -1];
typedef char SaveStateFishingOffsetCheck[offsetof(PersistedGameStateLayout,fishing_records) == 0x2C80 ? 1 : -1];
typedef char SaveSlotSizeCheck[sizeof(SaveSlotStorageLayout) == SAVE_SLOT_SIZE ? 1 : -1];
typedef char SaveSlotPayloadOffsetCheck[offsetof(SaveSlotStorageLayout,payload) == SAVE_SLOT_PAYLOAD_OFFSET ? 1 : -1];
typedef char SaveSlotChecksumOffsetCheck[offsetof(SaveSlotStorageLayout,checksum) == SAVE_SLOT_CHECKSUM_OFFSET ? 1 : -1];
typedef char SaveHeaderSizeCheck[sizeof(SaveSramHeaderLayout) == SAVE_HEADER_SIZE ? 1 : -1];
typedef char SaveHeaderMaskOffsetCheck[offsetof(SaveSramHeaderLayout,valid_slot_mask) == 0x20 ? 1 : -1];
typedef char SaveHeaderSelectedOffsetCheck[offsetof(SaveSramHeaderLayout,selected_slot) == 0x24 ? 1 : -1];
typedef char SaveImageHeaderOffsetCheck[offsetof(SaveSramStorageLayout,slots) == SAVE_HEADER_SIZE ? 1 : -1];
typedef char SaveImageSecondSlotOffsetCheck[offsetof(SaveSramStorageLayout,slots[1]) == SAVE_HEADER_SIZE + SAVE_SLOT_SIZE ? 1 : -1];
typedef char SaveImageSizeCheck[sizeof(SaveSramStorageLayout) == 0x8000 ? 1 : -1];

typedef char SaveGameHeaderSizeCheck[sizeof(SavedHeader) == 0x14 ? 1 : -1];
typedef char SaveNamesSizeCheck[sizeof(SavedNames) == 0x44 ? 1 : -1];
typedef char SaveGameHeaderWordsOffsetCheck[offsetof(SavedHeader,words_08) == 0x08 ? 1 : -1];
typedef char SaveState_location_1cccCheck[offsetof(PersistedGameStateLayout,location_1ccc) == 0x1CCC ? 1 : -1];
typedef char SaveState_socialCheck[offsetof(PersistedGameStateLayout,social) == 0x1CD4 ? 1 : -1];
typedef char SaveState_word_2210Check[offsetof(PersistedGameStateLayout,word_2210) == 0x2210 ? 1 : -1];
typedef char SaveState_block_2214Check[offsetof(PersistedGameStateLayout,block_2214) == 0x2214 ? 1 : -1];
typedef char SaveState_words_2c1cCheck[offsetof(PersistedGameStateLayout,words_2c1c) == 0x2C1C ? 1 : -1];
typedef char SaveState_words_2c4cCheck[offsetof(PersistedGameStateLayout,words_2c4c) == 0x2C4C ? 1 : -1];
typedef char SaveState_block_2e58Check[offsetof(PersistedGameStateLayout,block_2e58) == 0x2E58 ? 1 : -1];
typedef char SaveState_words_3480Check[offsetof(PersistedGameStateLayout,words_3480) == 0x3480 ? 1 : -1];
typedef char SaveState_words_3494Check[offsetof(PersistedGameStateLayout,words_3494) == 0x3494 ? 1 : -1];
typedef char SaveState_byte_34c4Check[offsetof(PersistedGameStateLayout,byte_34c4) == 0x34C4 ? 1 : -1];
typedef char SaveState_byte_34c5Check[offsetof(PersistedGameStateLayout,byte_34c5) == 0x34C5 ? 1 : -1];
typedef char SaveState_words_34c8Check[offsetof(PersistedGameStateLayout,words_34c8) == 0x34C8 ? 1 : -1];
typedef char SaveState_word_34d8Check[offsetof(PersistedGameStateLayout,word_34d8) == 0x34D8 ? 1 : -1];
typedef char SaveState_words_34dcCheck[offsetof(PersistedGameStateLayout,words_34dc) == 0x34DC ? 1 : -1];

#endif
