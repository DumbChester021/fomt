#include "intrusive_callback_list.hh"
#include <new>

EC u8 vtable_unk_080E5BE8[];
EC u8 vtable_unk_080E5BB4[];

void DestroyIntrusiveCallbackNode(IntrusiveCallbackNode * self, u32 flags)
{
    self->vtable = vtable_unk_080E5BE8;

    IntrusiveCallbackNode ** pprev = self->pprev;
    if (pprev != 0)
    {
        *pprev = self->next;
        self->next->pprev = pprev;
    }

    if ((flags & 1) != 0)
        ::operator delete(self);
}

void DestroyIntrusiveCallbackList(IntrusiveCallbackList * self, u32 flags)
{
    self->base.vtable = vtable_unk_080E5BB4;
    self->Clear();
    DestroyIntrusiveCallbackNode(&self->sentinel, 2);
    DestroyIntrusiveCallbackNode(&self->base, flags);
}

void IntrusiveCallbackList::Append(IntrusiveCallbackNode * node)
{
    IntrusiveCallbackNode ** pprev = node->pprev;
    if (pprev != 0)
    {
        *pprev = node->next;
        node->next->pprev = pprev;
    }

    IntrusiveCallbackNode ** tail_link = sentinel.pprev;
    *tail_link = node;
    node->pprev = tail_link;
    node->next = &sentinel;
    sentinel.pprev = &node->next;
}

void IntrusiveCallbackList::Remove(IntrusiveCallbackNode * node)
{
    IntrusiveCallbackNode ** pprev = node->pprev;
    if (pprev != 0)
    {
        *pprev = node->next;
        node->next->pprev = pprev;
        node->pprev = 0;
        node->next = 0;
    }
}

void IntrusiveCallbackList::Clear()
{
    IntrusiveCallbackList * list = this;
    IntrusiveCallbackNode * current = list->head;
    IntrusiveCallbackNode * sentinel_ = &list->sentinel;

    if (current != sentinel_)
    {
        u32 zero = 0;
        do
        {
            IntrusiveCallbackNode * node = current;
            current = current->next;
            node->pprev = reinterpret_cast<IntrusiveCallbackNode **>(zero);
            node->next = reinterpret_cast<IntrusiveCallbackNode *>(zero);
        }
        while (current != sentinel_);
    }

    IntrusiveCallbackNode * end = &list->sentinel;
    list->head = end;
    list->sentinel.pprev = &list->head;
}
