#ifndef SAVE_TRANSITION_STATE_HH
#define SAVE_TRANSITION_STATE_HH

#include "prelude.h"

// Persisted GameState subobject at offset 0x2C74.
// The value 16 is an unset index in both word fields. The exact gameplay
// identity of these indices is not yet established.
struct SavedTransitionState
{
    u32 current_index;       // +0x00
    u32 pending_index;       // +0x04
    u8 countdown;            // +0x08, decremented during the day update
    u8 reserved[3];          // +0x09..0x0B, only the first 9 bytes proven
};
typedef char SavedTransitionStateSizeCheck[sizeof(SavedTransitionState) == 12 ? 1 : -1];

EC void InitializeSavedTransitionState(SavedTransitionState * state);
EC unsigned int GetSavedTransitionCurrentIndex(SavedTransitionState const * state);
EC unsigned int GetSavedTransitionPendingIndex(SavedTransitionState const * state);
EC bool IsSavedTransitionReady(SavedTransitionState const * state);
EC void SetSavedTransitionCurrentIndex(SavedTransitionState * state, unsigned int index);
EC void ArmSavedTransition(SavedTransitionState * state);
EC void ClearSavedTransition(SavedTransitionState * state);
EC void TickSavedTransition(SavedTransitionState * state);

#endif
