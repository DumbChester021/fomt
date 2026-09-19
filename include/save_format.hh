#ifndef SAVE_FORMAT_HH
#define SAVE_FORMAT_HH

#include "prelude.h"

enum SaveFormatSize
{
    SAVE_HEADER_SIZE = 0x28,
    SAVE_SLOT_SIZE = 0x3FEC,
    SAVE_SLOT_PAYLOAD_OFFSET = 0x04,
    SAVE_GAME_STATE_SIZE = 0x34F4,
    SAVE_SLOT_CHECKSUM_OFFSET = SAVE_SLOT_PAYLOAD_OFFSET + SAVE_GAME_STATE_SIZE,
    SAVE_SLOT_RECORD_SIZE = 0x34FC,
    SAVE_SLOT_EXTENSION_OFFSET = SAVE_SLOT_RECORD_SIZE,
    SAVE_SLOT_EXTENSION_SIZE = SAVE_SLOT_SIZE - SAVE_SLOT_RECORD_SIZE,
};

EC unsigned int GetSaveSlotOffset(void const * save_context, unsigned int slot);
EC unsigned int CalculateSaveChecksum(void const * data, unsigned int size);
EC unsigned int GetSaveSlotRecordSize();
EC unsigned int WriteSaveSlotRecord(void const * game_state, void * save_context, unsigned int slot_offset);

#endif
