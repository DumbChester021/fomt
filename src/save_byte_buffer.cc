#include "save_byte_buffer.hh"

EXTERN_C
extern void * memcpy(void * destination, void const * source, unsigned long size);
EXTERN_C_END

EC u32 SavedBufferCount(SavedByteBuffer const * state)
    SECTION(".text.saved_buffer_accessors");
EC u32 SavedBufferCount(SavedByteBuffer const * state)
{
    return state->count;
}
EC u32 func_0800FFD0(SavedByteBuffer const * state) ALIAS(SavedBufferCount);

EC u8 * SavedBufferData(SavedByteBuffer * state)
    SECTION(".text.saved_buffer_accessors");
EC u8 * SavedBufferData(SavedByteBuffer * state)
{
    return state->payload;
}
EC u8 * func_0800FFD4(SavedByteBuffer * state) ALIAS(SavedBufferData);

EC u8 * SavedBufferEnd(SavedByteBuffer * state)
    SECTION(".text.saved_buffer_accessors");
EC u8 * SavedBufferEnd(SavedByteBuffer * state)
{
    return state->payload + state->count;
}
EC u8 * func_0800FFD8(SavedByteBuffer * state) ALIAS(SavedBufferEnd);

EC void * GetSavedBufferLocation(void * output, SavedByteBuffer const * state)
    SECTION(".text.saved_buffer_accessors");
EC void * GetSavedBufferLocation(void * output, SavedByteBuffer const * state)
{
    void * result = output;
    memcpy(output, state->location, 6);
    return result;
}
EC void * func_0800FFE0(void * output, SavedByteBuffer const * state)
    ALIAS(GetSavedBufferLocation);

// Retail accepts a full-width argument and stores only its low byte.
// Narrowing the formal parameter changes Thumb codegen and the original ABI.
EC void AppendSavedBufferByte(SavedByteBuffer * state, unsigned int value)
    SECTION(".text.saved_buffer_append");
EC void AppendSavedBufferByte(SavedByteBuffer * state, unsigned int value)
{
    unsigned int count = state->count;
    if (count <= 29)
    {
        u8 * slot = state->payload + count;
        if (slot != 0)
            *slot = value;
        state->count += 1;
    }
}
EC void func_0800FFF4(SavedByteBuffer * state, unsigned int value)
    ALIAS(AppendSavedBufferByte);

EC void SetSavedBufferLocation(SavedByteBuffer * state, void const * location)
    SECTION(".text.saved_buffer_set_location");
EC void SetSavedBufferLocation(SavedByteBuffer * state, void const * location)
{
    memcpy(state->location, location, 6);
}
EC void func_08010014(SavedByteBuffer * state, void const * location)
    ALIAS(SetSavedBufferLocation);
