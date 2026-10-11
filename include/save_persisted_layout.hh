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

// Verified offset-oriented view, NOT a claim that all GameState fields have
// been decompiled. Unknown bytes are preserved exactly as opaque storage.
// This describes the 0x34F4 serialized state that retail writes to SRAM.
struct PersistedGameStateLayout
{
    u8 game_header[0x14];                                // +0x0000, packed GameState header
    Farm farm;                                             // +0x0014
    MoneyState money;                                      // +0x1AA8
    Farmer farmer;                                         // +0x1BD8
    Dog dog;                                               // +0x1C70
    SavedByteBuffer saved_buffer;                          // +0x1CA0
    u8 before_native_calls[0x214C-0x1CCC];                // +0x1CCC
    SavedNativeCallState native_calls;                      // +0x214C
    u8 after_native_calls[0x2C74-0x21CC];                  // +0x21CC
    SavedTransitionState transition;                       // +0x2C74
    FishingRecords fishing_records;                        // +0x2C80
    u8 after_fishing_records[SAVE_GAME_STATE_SIZE-0x2E58]; // +0x2E58
};

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
typedef char SaveStateAfterNativeOffsetCheck[offsetof(PersistedGameStateLayout,after_native_calls) == 0x21CC ? 1 : -1];
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

#endif
