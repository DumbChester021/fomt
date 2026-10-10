#include "save_transition_state.hh"

EC void InitializeSavedTransitionState(SavedTransitionState * state)
    SECTION(".text.save_transition_state");
EC void InitializeSavedTransitionState(SavedTransitionState * state)
{
    state->current_index = 16;
    state->pending_index = 16;
    state->countdown = 0;
}
EC void func_08011510(SavedTransitionState * state)
    ALIAS(InitializeSavedTransitionState);

EC unsigned int GetSavedTransitionCurrentIndex(SavedTransitionState const * state)
    SECTION(".text.save_transition_state");
EC unsigned int GetSavedTransitionCurrentIndex(SavedTransitionState const * state)
{
    return state->current_index;
}
EC unsigned int func_0801151C(SavedTransitionState const * state)
    ALIAS(GetSavedTransitionCurrentIndex);

EC unsigned int GetSavedTransitionPendingIndex(SavedTransitionState const * state)
    SECTION(".text.save_transition_state");
EC unsigned int GetSavedTransitionPendingIndex(SavedTransitionState const * state)
{
    return state->pending_index;
}
EC unsigned int func_08011520(SavedTransitionState const * state)
    ALIAS(GetSavedTransitionPendingIndex);

EC bool IsSavedTransitionReady(SavedTransitionState const * state)
    SECTION(".text.save_transition_state");
EC bool IsSavedTransitionReady(SavedTransitionState const * state)
{
    return state->pending_index != 16 && state->countdown == 0;
}
EC bool func_08011524(SavedTransitionState const * state)
    ALIAS(IsSavedTransitionReady);

EC void SetSavedTransitionCurrentIndex(SavedTransitionState * state, unsigned int index)
    SECTION(".text.save_transition_state");
EC void SetSavedTransitionCurrentIndex(SavedTransitionState * state, unsigned int index)
{
    state->current_index = index;
}
EC void func_08011540(SavedTransitionState * state, unsigned int index)
    ALIAS(SetSavedTransitionCurrentIndex);

EC void ArmSavedTransition(SavedTransitionState * state)
    SECTION(".text.save_transition_state");
EC void ArmSavedTransition(SavedTransitionState * state)
{
    state->pending_index = state->current_index;
    state->countdown = 2;
}
EC void func_08011544(SavedTransitionState * state)
    ALIAS(ArmSavedTransition);

EC void ClearSavedTransition(SavedTransitionState * state)
    SECTION(".text.save_transition_state");
EC void ClearSavedTransition(SavedTransitionState * state)
{
    if (state->pending_index == state->current_index)
        state->current_index = 16;
    state->pending_index = 16;
}
EC void func_08011550(SavedTransitionState * state)
    ALIAS(ClearSavedTransition);

EC void TickSavedTransition(SavedTransitionState * state)
    SECTION(".text.save_transition_state");
EC void TickSavedTransition(SavedTransitionState * state)
{
    if (state->current_index != 16 &&
        state->pending_index != 16 &&
        state->countdown != 0)
    {
        --state->countdown;
    }
}
EC void func_08011568(SavedTransitionState * state)
    ALIAS(TickSavedTransition);
