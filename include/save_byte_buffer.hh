#ifndef SAVE_BYTE_BUFFER_HH
#define SAVE_BYTE_BUFFER_HH

#include "prelude.h"

// Persistent inline byte buffer at GameState+0x1CA0. Its semantic owner
// remains unresolved. Original code bounds appends separately at count <= 29.
struct SavedByteBuffer
{
    u32 count;          // +0x00
    u8 payload[0x20];   // +0x04
    u8 location[6];     // +0x24, copied verbatim by existing methods
    u8 trailing[2];     // +0x2A, ownership/meaning not yet proven
};
typedef char SavedByteBufferSizeCheck[sizeof(SavedByteBuffer) == 0x2C ? 1 : -1];

EC u32 SavedBufferCount(SavedByteBuffer const * state);
EC u8 * SavedBufferData(SavedByteBuffer * state);
EC u8 * SavedBufferEnd(SavedByteBuffer * state);
EC void AppendSavedBufferByte(SavedByteBuffer * state, unsigned int value);
EC void * GetSavedBufferLocation(void * output, SavedByteBuffer const * state);
EC void SetSavedBufferLocation(SavedByteBuffer * state, void const * location);

#endif
