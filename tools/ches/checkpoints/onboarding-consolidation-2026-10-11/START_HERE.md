# FoMT Zero-Context Start Here

This is the live dashboard for the US Harvest Moon: Friends of Mineral Town matching decompilation.

## Minimal read path for a new agent

1. `AGENTS.md`: standing project contract. Load the local decompilation skill for decomp work as required by that contract.
2. `START_HERE.md` (this short live dashboard): scope and current verification.
3. `tools/ches/NEXT_AGENT_HANDOFF.md`: bounded next task and links to only the relevant research.

Do **not** load the playbook, old priority maps, compiler research, onboarding or historical experiments by default. Search those when a question, failure or verification method actually requires them.

## Active branch and build authority

- Retail branch: **`main`**, tracking **`ches/main`**. Verify the current commit with Git; earlier published checkpoints and documentation SHAs are historical. Run `git log -1` and `git status -sb` for the current authority.
- **Latest verified publication at this audit (October 11): `ec6d61b`** (`Record closed Coop assignment-operator matching hypothesis`), following `ac239ba` (Barn/Farmer exact source and typed Rucksack cleanup). Both were pushed to `ches/main`; always recheck `git log -1` and `git status -sb` before relying on this snapshot. `497395f` and earlier menu SHAs are historical.
- Custom gameplay stays in the separate custom-game worktree.
- ROM: **8,388,608 bytes**, SHA1 **a2fc3574f0a65a4fcf7682fb274b9d7eebdef963**.
- Full gate: make -B -j4 compare, ending in **fomt.gba: OK**.
- Compiler: tracked tools/install_agbcp.sh plus tools/agbcp_fomt_compat.patch; unchanged thirteen-rule wrapper at tools/agbcc/bin/agbcp. Read docs/FOMT_COMPILER_FINGERPRINT.md for the compact compiler signature, external-comparison checklist and current source-coercion debt.

## Current save-only priority and authoritative state (October 11, 2026)

The user requires complete, readable, byte-exact **retail save-system** decompilation before custom-game development. The parent GameState copy, loader, many nested assignments and menu/SRAM error paths **remain original ASM**. Current source proof does not mean save mod-readiness. Do not run historical general-decompilation queues.

**Latest verified forced ROM:** make -B -j4 compare passed after Barn/Farmer exact integration and the typed Rucksack cleanup rewrite (Ches sh_mv2utzp3_be621085, fomt.gba: OK); original SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963. Check Git for the latest published SHA; historical SHA labels below are not current.

**Current verified source (check Git for publication status):** 91,388 / 940,036 = **9.7218% matching game C++**; 848,648 ASM bytes / **1,946 linked functions**, of which 845,612 are inferred function bytes, with 3,036 unattributed bytes and 27 parked functions. Data/assets **75,554 / 6,777,404 (1.1148%)**; overall meaningful ROM **167,338 / 7,717,440 (2.1683%)**; tail free 671,168.

**Exact recent save code:** CopySavedFarmerState 448B and CopySavedBarnState 296B (both verified isolated + production), CopySavedFarmState 180B, CopySavedDogState 132B, three GameState nested/parent cleanup functions 228B, eight transition-state methods 120B, six byte-buffer methods 84B, eight SRAM proxy/library methods 444B, packed flag setter 12B and seven SRAM header helpers 472B. Original ABI/link positions preserved.

**Save layout and diagnosis:** include/save_persisted_layout.hh has 41 original-compiler binary checks covering seven typed GameState subobjects. tools/ches/inspect_sram.py is read-only and checks SRAM header, slots, checksum, money, buffer, transition and fishing fields; synthetic tests pass, **no actual player save/emulator tested**. It reproduces u32 fishing overflow and cap behavior.

**Next:** source-matched 128-byte nested Rucksack copy (typed cleanup already exact), MoneyState and Coop assignments (Farmer and Barn now exact; see [Farmer proof](docs/SAVE_FARMER_STATE_COPY.md)), then 776-byte func_080D4178 GameState copy, 740-byte func_08011650 loader, save/load/erase menu and real backed-up SRAM tests. See [current handoff](tools/ches/NEXT_AGENT_HANDOFF.md) and [save lifecycle](docs/SAVE_LIFECYCLE.md).

## Current exact reconstruction

| Metric | Current verified state |
| --- | --- |
| Byte-exact C++ game code | **91,388 / 940,036 (9.7218%)** |
| Linked ASM remaining | **848,648 bytes / 1,946 functions** |
| ASM inferred ranges | **845,612 bytes** |
| ASM unattributed / parked | **3,036 bytes / 27 functions** |
| Reconstructed data/assets | **75,554 / 6,777,404 (1.1148%)** |
| Meaningful ROM | **167,338 / 7,717,440 (2.1683%)** |
| Unused ROM tail | **671,168 bytes** |

## Documentation navigation and precedence

**Default zero-context read path: three files only.** Read `AGENTS.md` for standing rules, `START_HERE.md` for the current state, and `tools/ches/NEXT_AGENT_HANDOFF.md` for the single next task. Read the relevant subsystem document **only if that task requires it**. For save work, start with `docs/SAVE_EVIDENCE_MATRIX.md`. Do not preload the playbook, tutorials, compiler histories, general maps or historical checkpoints. Consult those only when needed.

**Precedence:** verified Git, code, assembly and actual builds; then live status/handoff; then current subsystem evidence; then dated experiments and historical notes. When newer evidence invalidates an older claim, retain the original evidence, append a correction with date and reasoning to `tools/ches/HISTORY.md`, and update every affected live doc. Never count readability-only changes as newly decompiled bytes.

**Automation:** `make docs-check` checks live documentation links and status wording. `make save-check` checks save-function ownership/lengths and SRAM inspector self-tests, without rebuilding. `make save-verify` also runs the forced ROM comparison. Real player-save/emulator testing is a separate gate. Run `python3 tools/ches/audit_docs.py --out tools/ches/audits/YYYY-MM-DD` during periodic audits, **not** every decompilation session.

**Archived content:** the former menu/scene achievements and outdated general-work “Active next direction” are retained verbatim at `tools/ches/checkpoints/documentation-audit-2026-10-11/START_HERE_LEGACY.md`. The file-by-file consolidation report is `tools/ches/audits/2026-10-11/REVIEW.md`, not a startup requirement.
