# FoMT save-first handoff | current bounded task

**Authority:** Worktree `/mnt/data/Github/gba/fomt`, retail `main` tracking `ches/main`. Verify `git status -sb` and `git log -1` before action. Last verified published baseline before this documentation audit: `ec6d61b` (after `ac239ba`). **Do not touch** the separate `fomt-custom-game-worktree` or push to `origin`.

## Exact known state

- Whole-game code reconstructed **91,388 / 940,036 bytes (9.7218%)**. Remaining assembly **848,648 bytes / 1,946 linked functions**. **Not a save-system completion percentage.**
- Retail US ROM SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`; last forced full ROM compare **passed** after typed cleanup at execution `sh_mv2utzp3_be621085`. 41 checked layout assertions; synthetic SRAM inspector passed. **No backed-up real player save/load emulator proof.**
- Exact save-source children: Farm **180 B**, Barn **296 B**, Dog **132 B**, Farmer **448 B**; GameState and nested cleanups **228 B**; additional exact header, transition, packed-flag and SRAM helpers. Full status and original bounds: [save evidence matrix](../../docs/SAVE_EVIDENCE_MATRIX.md).
- Loading an existing game cleans old nested state without freeing its allocation, copies loaded GameState **into** that existing allocation, then frees the loaded temporary. Never replace this with raw whole-GameState `memcpy` or pointer swapping.

## Next task, not a generic queue

**Primary:** the still-ASM **128-byte Rucksack active-entry copy**, `func_080D6A80`, `0x080D6A80..0x080D6B00`, using existing `FixedVec` semantics. Preserve active-count copying and inactive storage. The following **64-byte** cleanup `func_080D6B00` is **already exact C++** and was only rewritten for readability: it is *not* part of a 192-byte copy. Four natural candidates failed; read [Rucksack source-shape notes](../../docs/SAVE_RUCKSACK_COPY_RESEARCH.md) before trying new evidence.

**Other bounded blockers:** Coop `080D66A4` **292 B** (exact-sized v3/v4 still 35 differing bytes; member-operator trial also 35), MoneyState `080D6B40` **200 B** (best existing C++ 196/157 differences), parent GameState assignment `080D4178` **776 B**, loader `08011650` **740 B**, then save/load/erase UI and SRAM error paths. See [live matrix](../../docs/SAVE_EVIDENCE_MATRIX.md) for owners and links, and [loader experiment archive](checkpoints/save-loader-08011650-2026-10-04/README.md) before reopening the 100+ closed probes.

**Don't repeat:** generic whole-object copy, compiler register forcing, source-spelling roulette, or Coop member-vs-free-function variants already disproved. Dog's implicit Animal assignment ABI is compiler sensitive; Farmer's named binding to original `memcpy` is deliberate. Check relevant [per-function proofs](../../docs/SAVE_FARMER_STATE_COPY.md) only when changing that function.

## Minimal validation and context discipline

1. Read `AGENTS.md`, `START_HERE.md`, and **this** handoff only by default, plus the local decompilation skill as required. Retrieve only one current target proof or compiler history when necessary.
2. Before a candidate: verify the original symbol and exact exclusive end address against current ASM/source, check closed experiments, classify uncertainty (behavior/type/ABI/compiler).
3. Candidate must match zero linked bytes before integration. On code changes, run isolated full-ROM gate, production `make save-verify`, inventory regen and source audit, and preserve SRAM inspector tests; update impacted live docs and dated [history](HISTORY.md).
4. On docs-only changes, use `make docs-check` and `make save-check`; no forced recompilation unless build inputs changed. Commit/push vetted retail checkpoints only to `ches/main`.
5. Preserve history, do not read it automatically: previous 12 KB detailed handoff archived **verbatim** in [2026-10-11 handoff snapshot](checkpoints/documentation-audit-2026-10-11/NEXT_AGENT_HANDOFF_LEGACY.md). Audit disposition is in `tools/ches/audits/2026-10-11/REVIEW.md`.
