#include "resource_owners.hh"

Unk_0803AEA0::~Unk_0803AEA0()
{
    ResourceOwnerProvider * current = provider;
    current->vtable->release_value(current, values[0]);
    std::destroy(animations.begin(), animations.end());
    std::destroy(records.begin(), records.end());
}
