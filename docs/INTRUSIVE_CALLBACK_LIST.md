# Intrusive callback list

## Overview

`IntrusiveCallbackList` is a 0x1C-byte sentinel-backed list of polymorphic callback nodes. The same list implementation is used by hardware update code and game-state code, so it is shared runtime infrastructure rather than a hardware-specific container.

The first recovered source batch covers `func_080098AC`, `func_080098DC`, `func_08009940`, `func_08009968`, and `func_08009984`.

## Node layout

`IntrusiveCallbackNode` is 0x0C bytes:

| Offset | Type | Meaning |
| --- | --- | --- |
| +0x00 | `IntrusiveCallbackNode **` | pointer to the link that currently references this node; null when unlinked |
| +0x04 | `IntrusiveCallbackNode *` | next node |
| +0x08 | `void *` | vtable pointer |

Unlinking uses the first field as a pointer-to-link:

`*pprev = next; next->pprev = pprev`

This is not a conventional doubly linked `prev`/`next` layout.

The base-node vtable at `0x080E5BE8` has an abstract callback slot and uses `func_080098AC` as its deleting destructor.

## List layout

`IntrusiveCallbackList` is 0x1C bytes:

| Offset | Type | Meaning |
| --- | --- | --- |
| +0x00 | `IntrusiveCallbackNode` | base node |
| +0x0C | `IntrusiveCallbackNode *` | first node; equals the sentinel when empty |
| +0x10 | `IntrusiveCallbackNode **` | sentinel `pprev`, also the tail-link pointer |
| +0x14 | `IntrusiveCallbackNode *` | sentinel `next` |
| +0x18 | `void *` | sentinel vtable |

The embedded sentinel uses vtable `0x080E5BD8`. Its callback returns true, allowing list-processing code to use the same node interface without removing the sentinel.

The empty-list invariant is:

- `head == &sentinel`;
- `sentinel.pprev == &head`;
- `sentinel.next == &sentinel`.

## Recovered operations

### `DestroyIntrusiveCallbackNode`, `func_080098AC`

Installs the base-node vtable, unlinks the node when linked, and deletes it when flags bit 0 is set.

### `DestroyIntrusiveCallbackList`, `func_080098DC`

Restores the concrete list vtable, clears the list, destroys the embedded sentinel, and then destroys the base node.

### `IntrusiveCallbackList::Append`, `func_08009940`

Unlinks the node from any current list, appends it at the current tail link, and makes it point to the sentinel.

### `IntrusiveCallbackList::Remove`, `func_08009968`

Unlinks a node and clears its `pprev` and `next` fields.

### `IntrusiveCallbackList::Clear`, `func_08009984`

Clears linkage from every non-sentinel node and restores the empty-list invariant.

## Adjacent operations still in assembly

The concrete list vtable at `0x080E5BB4` also references:

- `func_08009908`: iterate/process callbacks and remove nodes whose callback returns false;
- `func_080099B0`: splice/move list state and reset the source;
- `func_080099D4`: swap list state.

Nearby raw helpers initialize/query the same node and list layouts but remain in assembly until their own source boundaries are reconstructed.

## Existing typed users

`HardwareContext +0x494` is an `IntrusiveCallbackList` used as the persistent callback list in the VBlank update path.

`src/code_080A4A94.cc` embeds a specialized node derived from `IntrusiveCallbackNode`, preserving its own vtable while reusing the shared linkage layout.

## Integration boundary

The source-converted ranges are:

- `func_080098AC`: `0x080098AC..0x080098D7`;
- `func_080098DC`: `0x080098DC..0x08009907`;
- `func_08009940`: `0x08009940..0x08009965`, followed by alignment;
- `func_08009968`: `0x08009968..0x08009981`, followed by alignment;
- `func_08009984`: `0x08009984..0x080099AF`.

Raw ranges `0x080098D8..0x080098DB`, `0x08009908..0x0800993F`, and `0x080099B0` onward remain in assembly.

## Validation

The integrated list source and typed callers must preserve the retail ROM SHA1:

`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`

All five recovered functions must also retain their retail linked addresses.
