# FoMT Session Status

## Authoritative current snapshot - October 7, 2026

This file is intentionally concise. It records current state only. Detailed chronology belongs in Git history and `tools/ches/checkpoints/`.

### Repository

- Workspace: `/mnt/data/Github/gba/fomt`
- Active retail branch: **`main`**
- Remote: **`ches/main`**
- Latest published exact code checkpoint: **`7900f82e7ba18688dd7705efc2b143d4bc89f42c`**
- Commit subject: `decompile entity animation helpers`
- Retail ROM SHA1: **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**
- Authoritative compiler: tracked `tools/install_agbcp.sh` + `tools/agbcp_fomt_compat.patch`

### Exact progress

- code: **71,948 / 940,036 = 7.6537%**
- assembly remaining: **868,088 bytes**
- data/assets: **75,334 / 6,777,404 = 1.1115%**
- overall meaningful ROM: **147,678 / 7,717,440 = 1.9136%**
- free tail: **671,168 bytes**
- full ROM gate: **`fomt.gba: OK`**

### Inventory

- remaining linked asm functions: **2,334**
- inferred function-range bytes: **866,924 / 868,088 = 99.8659%**
- unattributed asm bytes: **1,164**
- explicitly parked functions: **17**
- repeated opcode-shape clusters: **184**
- functions in repeated clusters: **864**
- exact normalized clusters: **176**

### Latest exact source

The seven-function Entity38740-family helper tail `0x0803A804..0x0803A8A4` is integrated and published exact:

`3A804`, `3A80C`, `3A814`, `3A820`, `3A840`, `3A870`, `3A8A0`.

It adds **160 source bytes** and uses the existing `EntityEffect` / `SpriteAnimator` model.

### Current frontier

Continue at **`0x0803A8A4`** in `asm/code_0803A8A4.s`.

First recover the function/TU/type family map, then scratch-prove one representative. Do not reopen `3A180`, `3A394`, `39F90`, or other parked compiler islands without new structural evidence.

### Required validation for exact promotion

1. isolated/target exact comparison
2. coupled family or TU checks where applicable
3. production integration at the correct section/linker seam
4. `make -B -j4 compare`
5. retail SHA1 confirmation
6. `make progress`
7. regenerate inventory/queue if code ownership changed
8. `git diff --check`
9. update affected canonical docs
10. commit/push and remote-ref verification

### Historical evidence

Use:
- `tools/ches/checkpoints/`
- `tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md`
- relevant failure/closed-path ledgers
- `docs/DECOMP_NOTES.md`
- `docs/FOMT_COMPILER_RESEARCH.md`
- Git history

Do not append detailed turn-by-turn chronology to this file.
