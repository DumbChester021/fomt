#include "prelude.h"

// Raw packed-state readers. Field meanings are not established yet.
// The byte/word accesses preserve the retail storage width.

EC unsigned ReadPackedStateBit0(u8 const * state) SECTION(".text.packed_state_header_read_0_3");
EC unsigned ReadPackedStateBit1(u8 const * state) SECTION(".text.packed_state_header_read_0_3");
EC unsigned ReadPackedStateBit2(u8 const * state) SECTION(".text.packed_state_header_read_0_3");
EC unsigned ReadPackedStateBit3(u8 const * state) SECTION(".text.packed_state_header_read_0_3");
EC unsigned ReadPackedStateBit4(u8 const * state) SECTION(".text.packed_state_header_read_4_7");
EC unsigned ReadPackedStateWordField(u32 const * state) SECTION(".text.packed_state_header_read_4_7");
EC unsigned ReadPackedStateHalfwordField(u16 const * state) SECTION(".text.packed_state_header_read_4_7");
EC unsigned ReadPackedStateByteField(u8 const * state) SECTION(".text.packed_state_header_read_4_7");

EC unsigned ReadPackedStateBit0(u8 const * state)
{
    unsigned value = *state;
    return (value << 31) >> 31;
}
EC unsigned ReadPackedStateBit1(u8 const * state)
{
    unsigned value = *state;
    return (value << 30) >> 31;
}
EC unsigned ReadPackedStateBit2(u8 const * state)
{
    unsigned value = *state;
    return (value << 29) >> 31;
}
EC unsigned ReadPackedStateBit3(u8 const * state)
{
    unsigned value = *state;
    return (value << 28) >> 31;
}
EC unsigned ReadPackedStateBit4(u8 const * state)
{
    unsigned value = *state;
    return (value << 27) >> 31;
}
EC unsigned ReadPackedStateWordField(u32 const * state)
{
    unsigned value = *state;
    return (value << 14) >> 27;
}
EC unsigned ReadPackedStateHalfwordField(u16 const * state)
{
    unsigned value = state[1];
    return (value << 23) >> 25;
}
EC unsigned ReadPackedStateByteField(u8 const * state)
{
    unsigned value = state[3];
    return (value << 25) >> 26;
}

// Keep the original labels and all existing callsites.
EC unsigned func_08010E48(u8 const * state) ALIAS(ReadPackedStateBit0);
EC unsigned func_08010E50(u8 const * state) ALIAS(ReadPackedStateBit1);
EC unsigned func_08010E58(u8 const * state) ALIAS(ReadPackedStateBit2);
EC unsigned func_08010E60(u8 const * state) ALIAS(ReadPackedStateBit3);
EC unsigned func_08010F04(u8 const * state) ALIAS(ReadPackedStateBit4);
EC unsigned func_08010F0C(u32 const * state) ALIAS(ReadPackedStateWordField);
EC unsigned func_08010F14(u16 const * state) ALIAS(ReadPackedStateHalfwordField);
EC unsigned func_08010F1C(u8 const * state) ALIAS(ReadPackedStateByteField);
