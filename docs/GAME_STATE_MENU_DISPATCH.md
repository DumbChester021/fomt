# GameState menu dispatch and callback forwarding

## Exact retail recovery (October 10, 2026)

`src/game_state_menu_dispatch.cc` owns **23 exact C++ functions / 684 linked bytes** in five islands. The original assembler and linker preserve every intervening body and the original symbol addresses:

| Function island | Linked bytes | Functions |
| --- | ---: | ---: |
| 08014034..0801412C | 248 | 10 |
| 08014164..08014198 | 52 | 1 |
| 08014198..08014264 | 204 | 6 |
| 08014264..080142B8 | 84 | 2 |
| 080142B8..08014318 | 96 | 4 |

The forced full-ROM verification, `make -B -j4 compare`, passed again after the extension on October 10 (`sh_mv21rcv0_8fb063b4`, exit 0) at retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

## ABI and data layout

These functions receive a proxy with a runtime-state pointer at +4. Within that state, the byte-addressable saved-state pointer is at +0x8C, a menu/operation status word is at +0x9C, and the virtual dispatch target pointer is at +0xA8. The target's first word is its virtual table. Slots +0x80 through +0xA8 implement forwarding and action calls; two later slots are at +0x118/+0x11C. Two exact setters write byte 1 or 0 into the pointed-to saved state at +0x34C4. These descriptions are structural, not claims about original class names.

A virtual call through slot +0x40 on the target returns a child object. The child's pointer at +0x14 leads to another callback table with demonstrated slots +0x38, +0x40, +0x4C, +0x50, +0x54, +0x5C and +0x60. The chained read method at 1410C returns a value through r0; the two wrappers at 140C4/140DC forward their incoming second parameter, keeping r1 occupied and producing the retail r2 indirect call. This explains register choices without forced-register locals or compiler changes.

## Still assembly

Only `func_0801412C` remains assembly. The three adjacent functions `14164`, `14264`, and `14290` were subsequently proven byte-exact and promoted (+136 bytes). A bounded natural reconstruction of 1412C recovered behavior and exact 0x38-byte size but not codegen: candidate v1 had 14 differing linked bytes due to branch orientation; v2 had 29 differences. Avoid repeating source-spelling variants without new structural evidence.

Scratch candidates, full per-function comparison records, integration script and exact pre-integration backups are in `/mnt/waydroid-hdd/home-chester-waydroid/fomt-virtual-dispatch-20261010/`. Focused REA was not required: assembly, isolated compiler matches and final ROM diff supplied decisive evidence. Future REA can help classify a more complex neighboring function, not establish an exact source match by itself.

For current priorities and verification, see [Next agent handoff](../tools/ches/NEXT_AGENT_HANDOFF.md), [Repository map](REPO_MAP.md) and [Progress](PROGRESS.md).
