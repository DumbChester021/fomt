# GameState sound-player and child callbacks

## Exact batch, October 10, 2026

The two functions in `src/game_state_audio_callbacks.cc` are each proved byte-identical to US retail and together account for **48 linked bytes**.

| Original range | Behavior | Linked size |
| --- | --- | ---: |
| `080167AC..080167CC` | Retrieve the child with selector 0 and return its operation-table callback result at +0x90 | 32 |
| `080167CC..080167DC` | Ask whether the sound player stored at GameState-menu state +0xBC is busy | 16 |

The sound-player busy operation is grounded by other existing named source callers: `src/game_object_discard.cc` and `src/entity_unk_08038740.cc` both bind `func_08008CD0` to a sound-player busy check. The new wrapper calls that named function with a correctly offset, opaque player. The other child callback's gameplay meaning remains unknown: the +0x90 slot is a **verified layout fact, not a semantic function name**.

The nearby `func_08016784` checks the same sound-player state and calls the fade-out operation at `func_08008BF8` when busy; a natural typed candidate matches 40-byte size but differs by 15 bytes due to opposite branch layout (an alternate local-result form differs by 27). It **remains original assembly**. Do not promote it just because the behavior is understood.

## Verification and source boundary

Isolated proof artifacts, candidate sources, and the reversible integration script are in `/mnt/waydroid-hdd/home-chester-waydroid/fomt-audio-menu-20261010/`. The retail section uses the original `asm/game_state.s` and `fomt.lds` interleave. The initial production integration placed the new source at the wrong linker seam and failed the ROM comparison; moving it to the precise boundary **after `.text.after_gmcb_15950` and before `.text.game_state_actions_16ba4`** restored byte identity. The forced `make -B -j4 compare` passed (execution `sh_mv2471un_7d10991c`, exit 0, `fomt.gba: OK`) with SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

These functions count toward exact code recovery but do not imply every neighboring audio/menu routine is mod-ready. See [SOURCE_READABILITY_AUDIT.md](SOURCE_READABILITY_AUDIT.md) for the independent human-readable quality criteria and [NEXT_AGENT_HANDOFF.md](../tools/ches/NEXT_AGENT_HANDOFF.md) for the next target.
