#ifndef SAVE_BYTE_BUFFER_HH
#define SAVE_BYTE_BUFFER_HH

#include "prelude.h"
#include "actor.hh"

// Persistent inline byte buffer at GameState+0x1CA0. Its semantic owner
// remains unresolved. Original code bounds appends separately at count <= 29.
// The range copy constructs one-byte elements individually. The old STL
// treats this record as a class, preserving the retail placement-copy loop.
struct SavedBufferByte { u8 value; } __attribute__((packed));
typedef char SavedBufferByteSizeCheck[sizeof(SavedBufferByte) == 1 ? 1 : -1];

struct SavedByteBuffer
{
    SavedByteBuffer() SECTION(".text.saved_buffer_init");

    u32 count;          // +0x00
    u8 payload[0x20];   // +0x04
    Location location; // +0x24, packed map and coordinates
    u8 trailing[2];     // +0x2A, ownership/meaning not yet proven

    SavedBufferByte * begin()
    {
        return reinterpret_cast<SavedBufferByte *>(payload);
    }
    SavedBufferByte const * begin() const
    {
        return reinterpret_cast<SavedBufferByte const *>(payload);
    }
};
typedef char SavedByteBufferSizeCheck[sizeof(SavedByteBuffer) == 0x2C ? 1 : -1];

EC u32 SavedBufferCount(SavedByteBuffer const * state);
EC u8 * SavedBufferData(SavedByteBuffer * state);
EC u8 * SavedBufferEnd(SavedByteBuffer * state);
EC void AppendSavedBufferByte(SavedByteBuffer * state, unsigned int value);
EC void * GetSavedBufferLocation(void * output, SavedByteBuffer const * state);
EC void SetSavedBufferLocation(SavedByteBuffer * state, void const * location);

#endif
