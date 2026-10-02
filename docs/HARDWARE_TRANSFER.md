# Hardware transfers

## Overview

The hardware transfer layer builds 16-byte transfer descriptors and executes them through GBA DMA3. The neighboring CPU-copy routines consume the same descriptor layout.

The recovered source routines are `func_08008E64`, `func_08008EB8`, `func_08008F0C`, `func_08008F60`, and `func_08008FE4`.

## Transfer descriptor

`GraphicsTransfer` is 0x10 bytes:

| Offset | Type | Meaning |
| --- | --- | --- |
| +0x00 | `u32` | mode |
| +0x04 | `GraphicsTransferSource` | source pointer or immediate fill value |
| +0x08 | `void *` | destination |
| +0x0C | `u32` | transfer count/control |

The two proven modes are:

| Value | Meaning |
| ---: | --- |
| 0 | copy from a source pointer |
| 1 | fill from an immediate value using fixed-source DMA |

`GraphicsTransferVector` is a 0x10-byte vector-shaped container:

| Offset | Type | Meaning |
| --- | --- | --- |
| +0x00 | `GraphicsTransfer *` | begin |
| +0x04 | `GraphicsTransfer *` | end |
| +0x08 | `u32` | unresolved vector state |
| +0x0C | `GraphicsTransfer *` | end of storage |

The hardware context owns one of these containers at offset +0x24.

## DMA control construction

Transfer setup requires a nonzero size and at least halfword alignment.

When source, destination, and size are all word-aligned, the descriptor uses 32-bit DMA units and a count of `size >> 2`. Otherwise, a halfword-aligned transfer uses 16-bit units and a count of `size >> 1`.

The count is stored as a 16-bit value before the DMA control bits are added.

Fill transfers set the GBA DMA fixed-source flag and keep the fill value inside the descriptor.

## Functions

### `DmaCopy`, `func_08008E64`

Executes an immediate DMA3 copy from a source pointer to a destination.

### `DmaFill`, `func_08008EB8`

Executes an immediate DMA3 fill using a stack copy of the fill value and fixed-source DMA.

### `GraphicsTransfer::GraphicsTransfer(void const *, void *, u32)`, `func_08008F0C`

Constructs a mode-0 copy descriptor.

### `GraphicsTransfer::GraphicsTransfer(u32, void *, u32)`, `func_08008F60`

Constructs a mode-1 fill descriptor.

### `ExecuteDmaTransfers`, `func_08008FE4`

Executes a half-open descriptor range through DMA3. Mode-1 descriptors copy their stored immediate value to the stack and use that address as the fixed DMA source.

The VBlank transfer callback uses this routine for the `GraphicsTransferVector` stored in `HardwareContext +0x24`.

## Integration boundary

The source-converted ranges are:

- `func_08008E64`: `0x08008E64..0x08008EB7`
- `func_08008EB8`: `0x08008EB8..0x08008F0B`
- `func_08008F0C`: `0x08008F0C..0x08008F5D`
- alignment: `0x08008F5E..0x08008F5F`
- `func_08008F60`: `0x08008F60..0x08008FB7`
- raw single-descriptor DMA executor: `0x08008FB8..0x08008FE3`
- `func_08008FE4`: `0x08008FE4..0x0800901B`
- raw CPU-copy executor: `0x0800901C..0x08009093`
- following named range executor: `func_08009094`

The raw neighbors remain in assembly until their own interfaces are reconstructed.

## Validation

The integrated transfer source must preserve the retail ROM SHA1:

`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`

The five converted functions must also retain their retail linked addresses.
