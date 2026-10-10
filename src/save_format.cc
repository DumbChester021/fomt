#include "save_format.hh"
#include "save_persisted_layout.hh"

EXTERN_C
extern u16 gUnk_03000400;
bool func_080006A4(void * save_context, unsigned int offset, void const * source, unsigned int size);
EXTERN_C_END

// This expression retains a harmless register lifetime barrier for the
// original agbcc code shape. See the exactness/readability debt notes in
// docs/FOMT_COMPILER_FINGERPRINT.md. Do not copy this into new routines.
EC unsigned int GetSaveSlotOffset(void const *, unsigned int slot)
{
    unsigned int slot_size = SAVE_SLOT_SIZE;
    asm("" : "+r"(slot_size));
    return SAVE_HEADER_SIZE + slot * slot_size;
}

EC unsigned int func_080003DC(void const * save_context, unsigned int slot) ALIAS(GetSaveSlotOffset);

EC unsigned int CalculateSaveChecksum(void const * data, unsigned int size) SECTION(".text.save_record");

EC unsigned int CalculateSaveChecksum(void const * data, unsigned int size)
{
    unsigned int checksum = 0;

    if (data != 0 && size != 0)
    {
        u8 const * current = static_cast<u8 const *>(data);

        do
        {
            checksum += *current++;
        } while (--size != 0);
    }

    return checksum;
}

EC unsigned int func_08011588(void const * data, unsigned int size) ALIAS(CalculateSaveChecksum);

EC unsigned int GetSaveSlotRecordSize() SECTION(".text.save_record");

EC unsigned int GetSaveSlotRecordSize()
{
    return SAVE_SLOT_RECORD_SIZE;
}

EC unsigned int func_080115A8() ALIAS(GetSaveSlotRecordSize);

EC unsigned int WriteSaveSlotRecord(void const * game_state, void * save_context, unsigned int slot_offset) SECTION(".text.save_record");

// This exact writer is readable at the operation level, but the register-pinned
// locals below are historical codegen constraints, not a recommended C++ API.
// Retail writes length, payload, then checksum as three separate SRAM writes;
// failures are not atomic and carry different high-word error categories.
EC unsigned int WriteSaveSlotRecord(void const * game_state, void * save_context, unsigned int slot_offset)
{
    void const * game_state_ptr = game_state;
    register void * save_context_ptr asm("r5") = save_context;
    register unsigned int record_offset asm("r4") = slot_offset;
    register unsigned int original_record_offset asm("r8") = record_offset;
    register unsigned int game_state_size asm("r6") = SAVE_GAME_STATE_SIZE;
    unsigned int stored_size = game_state_size;
    unsigned int checksum;
    unsigned int result;
    unsigned int error;

    if (!func_080006A4(save_context_ptr, record_offset, &stored_size, sizeof(stored_size)))
    {
        result = gUnk_03000400;
        error = 0x10000;
        goto write_error;
    }

    record_offset += SAVE_SLOT_PAYLOAD_OFFSET;

    if (!func_080006A4(save_context_ptr, record_offset, game_state_ptr, game_state_size))
    {
        result = gUnk_03000400;
        error = 0x20000;
        goto write_error;
    }

    record_offset = original_record_offset + SAVE_SLOT_CHECKSUM_OFFSET;
    checksum = CalculateSaveChecksum(game_state_ptr, game_state_size);

    if (func_080006A4(save_context_ptr, record_offset, &checksum, sizeof(checksum)))
        return 0;

    result = gUnk_03000400;
    error = 0x30000;

write_error:
    return result | error;
}

EC unsigned int func_080115B0(void const * game_state, void * save_context, unsigned int slot_offset) ALIAS(WriteSaveSlotRecord);
