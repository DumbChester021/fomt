#ifndef INTRUSIVE_CALLBACK_LIST_HH
#define INTRUSIVE_CALLBACK_LIST_HH

#include "prelude.h"

struct IntrusiveCallbackNode
{
    /* +00 */ IntrusiveCallbackNode ** pprev;
    /* +04 */ IntrusiveCallbackNode * next;
    /* +08 */ void * vtable;
};

struct IntrusiveCallbackList
{
    /* +00 */ IntrusiveCallbackNode base;
    /* +0C */ IntrusiveCallbackNode * head;
    /* +10 */ IntrusiveCallbackNode sentinel;

    void Append(IntrusiveCallbackNode *) asm("func_08009940")
        SECTION(".text.intrusive_callback_list_append");
    void Remove(IntrusiveCallbackNode *) asm("func_08009968")
        SECTION(".text.intrusive_callback_list_remove");
    void Clear() asm("func_08009984")
        SECTION(".text.intrusive_callback_list_clear");
};

EC void DestroyIntrusiveCallbackNode(IntrusiveCallbackNode *, u32)
    asm("func_080098AC") SECTION(".text.intrusive_callback_node_destroy");
EC void DestroyIntrusiveCallbackList(IntrusiveCallbackList *, u32)
    asm("func_080098DC") SECTION(".text.intrusive_callback_list_destroy");

#endif // INTRUSIVE_CALLBACK_LIST_HH
