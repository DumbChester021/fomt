# Hardware context

## Overview

`Hardware` is an eight-byte owner used directly or as a base subobject by scene code. It owns a pointer to a 0x4B0-byte `HardwareContext` and provides access to shared input, transfer, display, OAM, scheduler, and VBlank-update state.

This document covers the five recovered accessors at `0x080088DC`, `0x08008910`, `0x08008918`, `0x08008920`, and `0x08008940`.

## Types

`Hardware` is eight bytes:

| Offset | Type | Meaning |
| --- | --- | --- |
| +0x00 | `HardwareContext *` | owned hardware context |
| +0x04 | 4 bytes | runtime vtable slot / derived-class state |

The owned `HardwareContext` is 0x4B0 bytes:

| Offset | Size | Type | Proven role |
| --- | ---: | --- | --- |
| +0x000 | 0x24 | opaque | key-input and repeat state |
| +0x024 | 0x10 | `DmaTransferQueue` | queued 16-byte transfer descriptors |
| +0x034 | 0x58 | `DisplayRegisterShadow` | shadow of display I/O state |
| +0x08C | 0x404 | `OamShadow` | OAM entry/state shadow |
| +0x490 | 0x04 | `HardwareSchedulerHandle` | scheduler interface handle |
| +0x494 | 0x1C | `VBlankCallbackList` | persistent VBlank callback list |

The internal subobjects remain opaque in the public header where their complete layouts or class contracts have not yet been reconstructed.

## Accessors

### `GetContext`, `func_080088DC`

Returns the owned `HardwareContext` pointer.

### `GetTransferQueue`, `func_08008910`

Returns the transfer queue at context offset +0x24.

Callers append 16-byte descriptors constructed by the transfer helpers around `func_08008F0C`. The execution path ultimately uses DMA3 registers beginning at `0x040000D4`.

### `GetDisplayRegisters`, `func_08008918`

Returns the display-register shadow at +0x34.

The initializer at `func_080096B0` clears the shadow and initializes the BG2/BG3 affine matrices to identity values. `func_080096F0` uploads the shadow to display I/O registers beginning at `0x04000000`.

### `GetOam`, `func_08008920`

Returns the OAM shadow at +0x8C.

`func_08009744` initializes 128 eight-byte OAM entries as disabled. The upload path copies the 0x400-byte entry array to OAM memory at `0x07000000`.

### `GetVBlankCallbacks`, `func_08008940`

Returns the persistent VBlank callback list at +0x494.

## VBlank update path

`func_080087C8` assembles a temporary update list containing:

- the persistent callback list from context +0x494;
- a display-register upload callback;
- a queued-transfer callback;
- an OAM upload callback.

The display, transfer, and OAM callbacks call `func_080096F0`, `func_08008FE4`, and `func_08009864` respectively. They return zero after execution and are removed from the intrusive callback container.

The update list is registered through the scheduler handle at +0x490. `func_08008AF0` then calls `func_08000568(1)`; that routine executes `IntrWait(1, 1)`, waiting for GBA interrupt bit 1, VBlank. The temporary update list is unregistered after the wait completes.

## Integration boundary

The first recovered source batch intentionally leaves several neighboring raw routines in assembly.

Source-converted functions:

- `func_080088DC`: `0x080088DC..0x080088DF`
- `func_08008910`: `0x08008910..0x08008917`
- `func_08008918`: `0x08008918..0x0800891F`
- `func_08008920`: `0x08008920..0x08008927`
- `func_08008940`: `0x08008940..0x0800894B`

The unnamed routines and duplicate accessors in `0x080088E0..0x0800890F`, `0x08008928..0x0800893F`, and from `0x0800894C` onward remain in assembly until their own interfaces are reconstructed.

## Validation

The integrated accessors preserve the retail ROM SHA1:

`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`

The five source functions also retain their original linked addresses.
