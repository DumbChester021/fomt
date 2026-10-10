# GameState menu actions and record helpers

## Exact retail integration (October 10, 2026)

`src/game_state_menu_actions.cc` replaces **18 assembly functions / 560 exact linked bytes** in four source islands, retaining the original surrounding assembly and addresses. All 18 individually matched retail bytes, and the clean forced `make -B -j4 compare` finished with `fomt.gba: OK` (execution `sh_mv22h75z_27840b97`, exit 0).

| Retail address range | Exact functions | Linked bytes |
| --- | ---: | ---: |
| `08016BA4..08016CEC` | 11 | 328 |
| `08016D80..08016DB0` | 2 | 48 |
| `08016E7C..08016EC4` | 2 | 72 |
| `08016EF0..08016F60` | 3 | 112 |
| **Total** | **18** | **560** |

The rebuilt ROM matches the US retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. No compiler patch, forced register, or gameplay modification was necessary.

## Verified ABI and behavior

The menu proxy has a runtime-state pointer at +4; that state holds a status word at +0x9C and target pointer at +0xA8. The target has an initial vtable pointer. Exact direct virtual slots occur at +0xFC, +0x100, +0x104, +0x10C, +0x110, and +0x164. The +0x10C/+0x110/+0x164 methods forward an incoming second argument, explaining why the retail compiler uses the r2 indirect-call helper.

The target method at +0x40 returns a child. Four exact wrappers select child ID `0x5D` before invoking `func_080387B8`, `func_080387C8`, `func_080387EC`, or `func_080387FC`. Other child-operation vtable offsets in this batch include +0x6C, +0x70, +0x74, +0x9C, +0xA8, and +0xAC. Selected calls update the status to `0x1B`, `0x1C`, or `0x19`.

The two recovered `func_08016D80`/`func_08016D9C` methods access a record at pointed-to global `gUnk_0300040C + 0x36C`, with an enabled byte at +0 and a 32-bit field at +4. The former clears enabled and writes `0x234`, and the latter returns the field. These describe machine-proven offsets and behavior, not confirmed original class names.

## Remaining work and durable evidence

The source is integrated through four independently sectioned regions in `asm/game_state.s` and `fomt.lds`. Nearby `func_08016CEC`, `func_08016D48`, `func_08016DB0`, `func_08016EC4`, and `func_08016F60` remain assembly; adjacency alone does not establish a safe common implementation.

Scratch source candidates, per-function mismatch/diff logs, proof scripts, the dry-run integration script, and the original assembly/linker backups are preserved in `/mnt/waydroid-hdd/home-chester-waydroid/fomt-menu-dispatch-batch2/`. REA was not required because the original assembly and the byte-matching compiler supplied decisive evidence.

Together with [GameState menu dispatch](GAME_STATE_MENU_DISPATCH.md), this continuation has recovered 41 exact functions / 1,244 linked bytes. See the canonical [next-agent handoff](../tools/ches/NEXT_AGENT_HANDOFF.md) for the current continuation priorities.
