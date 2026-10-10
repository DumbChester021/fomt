# GameState menu callbacks and incubation helpers

## Exact integration, October 10, 2026

`src/game_state_menu_callbacks.cc` replaces **13 C++ functions / 444 byte-exact linked bytes**, preserving all other assembly and retail addresses. Individual single-function comparisons reported zero differences; the forced full-ROM build `make -B -j4 compare` passed (execution `sh_mv22yrzy_255645e2`, exit 0, `fomt.gba: OK`).

| Address range | Functions | Linked bytes |
| --- | ---: | ---: |
| `0801468C..080146FC` | 4 | 112 |
| `08014C0C..08014C34` | 1 | 40 |
| `08014D5C..08014D9C` | 2 | 64 |
| `0801589C..08015920` | 3 | 132 |
| `08015950..080159B0` | 3 | 96 |
| **Total** | **13** | **444** |

Five source sections in `fomt.lds` interleave with preserved `asm/game_state.s` sections. The retail ROM's SHA1 is unchanged: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

## Proven ABI facts

The recovered GameState-menu proxy stores a state pointer at +4. State has a save pointer at +0x8C, status at +0x9C, and a target at +0xA8. Target virtual slots +0xAC, +0x150, and +0x154 use the incoming second parameter. In `func_080146CC`, the incubation operation calls `BeginIncubation__4CoopUi` on `saveState + 0x410` and forwards the same argument to target slot +0xAC.

Target slot +0x40 returns a child. The child's operations pointer at +0x14 supplies the exact function slots +0x44, +0x64, +0x68, +0x78, +0x7C, +0x80, +0x84, +0x88, and +0x8C. Some methods return their callback's value, while action callbacks set menu status to `0x19`. The +0x68 wrapper narrows an incoming value to 16 bits.

The simplest helper, `func_0801468C`, returns a pointer to its state +0xD0. These are evidence-backed offsets and behaviors, not inferred original type names.

## Deferred targets and proof retention

The nearby loop `func_08014BD8` is behavior-recovered but nonmatching. Natural v1 compiled to 0x34 bytes with 9 differing linked bytes; v2 preserved the dynamic target reload and reduced the mismatch to **5 bytes**, while v3 differed by 6. The remaining difference concerns placement and lifetime of the target-pointer calculation. Preserve these candidates, and do not spend further time on spelling-only variants without new compiler/type evidence.

Other adjacent complex bodies (such as `func_08014C34`, `func_08014D30`, and `func_08015920`) remain unchanged assembly.

All per-function source candidates, mismatch/diff logs, exact proofs, the integration script, and original assembly/linker backups are saved at `/mnt/waydroid-hdd/home-chester-waydroid/fomt-menu-dispatch-batch3/`. No REA or compiler patch was needed to promote the 13 exact functions.

Across [menu dispatch](GAME_STATE_MENU_DISPATCH.md), [menu actions](GAME_STATE_MENU_ACTIONS.md), and this batch, **54 source functions / 1,688 linked bytes** were recovered. See the [current handoff](../tools/ches/NEXT_AGENT_HANDOFF.md) for authoritative live numbers and the next action.
