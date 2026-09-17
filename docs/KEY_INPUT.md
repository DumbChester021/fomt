# Matching key-input helpers

`src/key_input.cc` reconstructs seven helpers covering ROM addresses
0x0800912C through 0x080091A3. `include/key_input.hh` exposes descriptive
names and button masks; original function symbols remain aliases at their
original addresses. This contribution preserves gameplay and ROM bytes.

| Original address | Interface | Behavior |
| --- | --- | --- |
| 0x0800912C | `ReadHeldKeys` | Read KEYINPUT and return the active-high ten-button mask. |
| 0x08009140 | `InitHeldKeys` | Poll/store held keys and return the record pointer. |
| 0x08009154 | `SetHeldKeys` | Store the supplied mask's low halfword and return the record pointer. |
| 0x08009158 | `PollHeldKeys` | Poll/store held keys and return the mask. |
| 0x08009168 | `InitKeyInput` | Initialize held keys from hardware, then copy held to pressed. |
| 0x0800917C | `InitKeyInputWithKeys` | Initialize held and pressed from the supplied mask. |
| 0x08009190 | `UpdateKeyInput` | Poll/store held keys; store and return current AND NOT previous. |

`KeyInput` models an eight-byte prefix: held keys at +0, pressed keys at +4,
and opaque bytes at +2 and +6. The larger repeat-input record uses +8 and
later offsets and remains in assembly. Do not allocate only this prefix for
functions that require that larger record. Initialization seeds pressed from
held; subsequent updates calculate new presses. These are descriptive source
names, not recovered original developer identifiers.

Existing frame-update code owns polling. Polling twice can consume the first
update's new-press edges. `PollHeldKeys` changes held state without updating
pressed. This interface supports future control modifications, but the patch
itself adds no remapping, expansion content, or modern input backend.

## Fishing cross-check

The original FOMT fishing guide at
https://fogu.com/hm4/farm/fishing.htm was consulted on September 17, 2026.
It describes B-button charge/cast controls and pressing B at the bite indicator
to reel in. This corroborates observable behavior; internal provenance comes
from the following assembly evidence.

`func_08014AF8` installs the GameObject at scene implementation+0xA8.
`func_08012028` passes that same implementation to `sub_080D8178`. Let S be
the latter routine's local stack pointer: [S+0x564] holds implementation+0xA8.
At 0x080DAB0C, GameObject slot+0x0C calls `func_08017C30` with r1=S+0x4C0
and [S+0x4C0]=S+0x10, the input-record pointer.

`func_08017C30` copies that pointer into its entity-update wrapper. The
dispatch at 0x0801805A reaches `func_08024CD0`, which forwards the pointer to
`func_0802F0EC`. It becomes fishing r4 unless cooldown suppresses input.
The checks at .L08030E50 and .L08030F0E read [r4+4] AND 2: newly pressed B,
not TerrainInfo bit1. The latter check leads to fishing reward construction.

## Matching validation

`fomt.lds` places the C++ helpers between `asm/hardware.o(.text)` and
`asm/hardware.o(.text.after_key_input)`, where the remaining assembly resumes
at `func_080091A4`. All seven original addresses and aliases are preserved.

`make compare` and `sha1sum -c fomt.sha1` passed on September 17, 2026.
ROM SHA1: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
