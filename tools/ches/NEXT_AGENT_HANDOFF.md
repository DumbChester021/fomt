# FoMT Next Agent Handoff — current retail save priority

## Verified checkpoint (October 11, 2026)

**Project:** /mnt/data/Github/gba/fomt, retail branch **main** tracking **ches/main**. The user explicitly prioritizes fully readable US retail save-system decompilation before any custom-game changes. Read AGENTS.md, the local decompilation skill, START_HERE.md, docs/DECOMP_PLAYBOOK.md, docs/SAVE_LIFECYCLE.md, and this handoff. Preserve existing edits and keep custom-game isolated. [Prior experiments and dated status](checkpoints/save-2026-10-11/HANDOFF_HISTORY.md) are archived; older numbers there are historical.

- **Full forced ROM build passed**: make -B -j4 compare, Ches sh_mv2t0b0a_4bb83627, fomt.gba: OK, SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
- **Matching C++ game code**: 90,644 / 940,036 = **9.6426%**. Remaining ASM **849,392 bytes / 1,948 linked functions**, inferred function bytes 846,356, unattributed 3,036, parked 27. Data/assets 75,554 / 6,777,404. Meaningful ROM 166,594 / 7,717,440 = 2.1587%. Free ROM tail 671,168.
- **Newest exact source:** CopySavedFarmState (180B), CopySavedDogState (132B), three GameState cleanup routines (228B), SavedTransitionState (eight methods, 120B), SavedByteBuffer (six methods, 84B), SRAM proxy/error/library methods (eight, 444B), packed flag (12B), and seven SRAM header helpers (472B). Source retains original-address aliases. See docs/SAVE_FARM_STATE_COPY.md, docs/SAVE_DOG_STATE_COPY.md, docs/GAME_STATE_SAVE_CLEANUP.md, docs/SAVE_FORMAT.md. These are milestones, **not** a save-system completion percentage.
- **Binary persisted layout:** 41 compile-time checks in include/save_persisted_layout.hh; 0x8000 SRAM, 0x28 header, two 0x3FEC slots, 0x34F4 serialized GameState. Seven typed GameState subobjects at known offsets: Farm +0x14; MoneyState +0x1AA8; Farmer +0x1BD8; Dog +0x1C70; SavedByteBuffer +0x1CA0; SavedTransitionState +0x2C74; FishingRecords +0x2C80. Some member semantics still opaque.
- **Read-only inspector:** tools/ches/inspect_sram.py verifies header signature, selected/valid slots, record length/checksum and extracts known money/buffer/transition/fishing fields only for structurally consistent slots. Synthetic tests passed, now including source-equivalent u32 overflow before 1-billion fishing count saturation. **No real player SRAM/emulator load tested.**
- **GameState load ownership:** On successful active-game load: CleanupGameState(old,2) keeps allocation; ASM func_080D4178 copies each subobject into it; CleanupGameState(temporary,3) frees the temporary. Do not replace this with raw whole-object memcpy or a pointer swap.

## Main save-code blockers (ALL STILL ASSEMBLY)

| Function | Bytes | Source recovery priority |
| --- | ---: | --- |
| func_080D4178 | 776 | Full GameState fieldwise copy; typed callgraph docs/SAVE_GAMESTATE_ASSIGNMENT_MAP.md. Farm/Dog now exact, other child copies not. |
| func_08011650 | 740 | Default init/SRAM load; Oct 4–5 compiler experiments >100; read tools/ches/checkpoints/save-loader-08011650-2026-10-04/README.md before retrying. |
| func_080D6B40 | 200 | MoneyState assignment. Best typed candidate 196 bytes /157 differing, placement-new variations did not match. Scratch /mnt/waydroid-hdd/home-chester-waydroid/fomt-money-copy-20261011/. |
| func_080D68C0; Coop func_080D66A4; Barn func_080D657C | varying | Specialized Farmer, Coop, Barn child assignments; use real types, not whole-object implicit copying. |
| func_08003F9C; func_080040A0; func_080041DC | varying | Save/load/menu and allocation/retry logic; docs/SAVE_MENU_RETRY_TRACE.md. |
| func_080006A4; SRAM erase at 08000664 | 64 each | Writer best natural candidate differs 4 bytes due register allocation; other SRAM access/relocation hardware wrappers not exact yet. |

## Methods, closed paths, validation

- **Farm 180/180 match**: src/farm_state_copy.cc and docs/SAVE_FARM_STATE_COPY.md. A whole Farm implicit assignment produced 788 bytes. True member assignments plus an eleven-word Horse placeholder loop yielded matching size; declaring loop counter between target and source pointers achieved **zero byte differences**. Proof: /mnt/waydroid-hdd/home-chester-waydroid/fomt-farm-copy-20261011/proofs/farm-production.diff.
- **Dog 132/132 match**: src/dog_state_copy.cc and docs/SAVE_DOG_STATE_COPY.md. Do NOT explicitly declare Animal::operator= in the class; it suppresses original toolchain implicit __as__6AnimalRC6Animal and breaks the full link. Use the existing external ABI alias declaration.
- **MoneyState closed natural probes**: /mnt/waydroid-hdd/home-chester-waydroid/fomt-money-copy-20261011/money-copy-v1.cc produced 196/200 with 157 differing bytes. Placement-new and generic field-copy variants failed. Avoid syntax roulette, forced registers, compiler patches, fake volatility, and nonmatching promotion.
- **Typed save/UI research**: docs/SAVE_SERIALIZED_LAYOUT.md, docs/SAVE_GAMESTATE_ASSIGNMENT_MAP.md, docs/SAVE_LIFECYCLE.md, docs/SAVE_MENU_RETRY_TRACE.md. Ownership/partial names must be evidence-backed.
- **Next:** Farmer/Coop/Barn and MoneyState copy dependencies; complete parent GameState assignment; loader; save GUI and SRAM write/erase; real backed-up SRAM/emulator tests.
- **After each exact integration:** function byte proof (zero difference), forced make -B -j4 compare, regenerate inventory, audit source readability and run inspector self-tests, update docs before commit. Verify remote identity/HEAD for pushes to **ches/main only**; never push to origin or touch custom-game.

**Publication note:** This content describes the validated source checkpoint before the user-requested documentation/push commit. Verify newest Git commit and ches/main tracking after publishing.
