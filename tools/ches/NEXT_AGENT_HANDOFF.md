# Current FoMT continuation - October 9, 2026

## Latest verified checkpoint: Scenes, complex Run 881EC

Workspace: /mnt/data/Github/gba/fomt
Public retail branch: main, tracking ches/main.
Starting pushed checkpoint: 8174a61. Run `git log -1` and `git status`
for the completed checkpoint's identity before work; preserve intentional dirty files.

`func_080881EC`, 0x080881EC..0x080882AC, is now exact source:
**0xC0 / 192 bytes, 0 linked-byte differences**.

- Code: **81,848 / 940,036 = 8.7069%**.
- Assembly: **858,188 bytes; 2,130 linked functions**.
- Inferred ranges: **855,492 / 858,188 = 99.6858%**.
- Unattributed assembly: **2,696 bytes; 17 parked functions**.
- Data/assets: **75,334 / 6,777,404 = 1.1115%**.
- Overall meaningful ROM: **157,578 / 7,717,440 = 2.0418%**.
- Free tail: **671,168 bytes**.

The scene lifetime layer owns **74 functions / 4,108 linked bytes**:
24 constructors, 25 destructors and all 25 Run entries.
Only scene constructor 92570 remains assembly; controller internals are incomplete.

## Proven behavior and ownership

- Call func_08086A08; status -1 moves the continuation directly into the result.
- Otherwise call func_08085EEC; mode is 1 for zero, 2 for any other result.
- Allocate a 16-byte inner request: vtable 080E5D94, moved continuation +4,
  owner context +0x10 at request +8, mode at +0xC.
- Allocate a 20-byte outer request: vtable 080E5C64, moved inner request +4,
  context +8, mode +0xC, first-controller status byte +0x10.
- Transfer the outer allocation directly through the return proxy into the result.
  Destroy the cleared inner owner before the common final return.

Retail frame: 0x14. Inner owner at sp+0; reused continuation/return source
at sp+4; nested inner-transfer slot at sp+8; return proxy at sp+0xC/+0x10.
The inner source clears immediately after its vtable store. The outer allocation
is never first stored into sp+4.

Local `SceneMovePtr881` is an explicit ABI view, scoped to this Run. Its empty
default constructor establishes the return-source lifetime without initializing
that word. The proxy sets it to null before any read/destructor. Other uses are
pointer or moving-copy construction. Do not replace it with a separate source
type or initialize the default word merely for style; those shapes do not
reproduce the retail lifetime. Global SmartPtr and the compiler are unchanged.

## Verification and closed research

- v7: historical 0xC0 / 38 frame/register oracle.
- v1-v6 and v8-v14: rejected, preserved in the existing checkpoint.
  v8-v10 reproduce the same 38-byte frontier; real SGI auto_ptr v11 is
  0xD8 / 140; raw v12 is 0xDC / 208; separate source v13 is 0xC0 / 55;
  unnamed conversion v14 is 0xD4 / 137.
- v15: 0xC0 / 16, but delayed outer owner collapses the frame to 0x10.
- v16: 0xC0 / 30; empty constructor fixes inner clear and keeps frame 0x14.
- v17: **0xC0 / 0**; direct outer pointer to proxy removes the extra store.
- v18: 0xC0 / 55; separate return-source type changes allocation/slot reuse.
- Renamed production shape and complete scene TU symbol slice: **0xC0 / 0**.
- Fresh tracked compiler install in a new detached worktree: passed.
- Isolated and production `make -B -j4 compare`: **fomt.gba: OK**.
- ROM: 8,388,608 bytes, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- All 25 destructor/Run vtable pairs and target/neighbor addresses preserved.
- Inventory removes only func_080881EC; every other assembly address/size unchanged.

Proofs: `tools/ches/checkpoints/scene-complex-runs-2026-10-09/`,
especially 881ec-v17, 881ec-production-shape-v1, 881ec-full-tu-v1,
881ec-isolated-proof.json, 881ec-production-proof.json and 881ec-checkpoint.md.
Integration worktree:
`/mnt/waydroid-hdd/home-chester-waydroid/fomt-integrations/scene-run-881ec-20261009`.
Ignored artifacts may be absent in a fresh clone; tracked source and SCENES.md
carry the complete proven behavior. Original uncommitted research handoffs are
preserved in the checkpoint as *-before-881ec.md and superseded by this exact proof.

No background executions remain.

## Exact next action

Next bounded unit: the result/scaling helpers in the SceneOwner881AC controller,
`func_08085EC4` and `func_08085EEC`, not the large controller Run.

- 85EC4: 0x08085EC4..0x08085EEC, 40 linked bytes. Retail ignores r0,
  divides unsigned r1 by 25 and returns the smaller of that value and 10
  using two stack locals. Old const-reference minimum is a plausible source
  shape. Caller: func_0808586C.
- 85EEC: 0x08085EEC..0x08085F08, 28 linked bytes. Read the word at
  controller +0x43D8; return it when <=1, otherwise return 999.
  This is the second controller query used by exact 881EC.
- Audit the +0x43D8 writes near 08087D8C/08087E50 and existing controller
  constructor func_08085584 before assigning gameplay names or a complete type.
- Reuse project types and old STL minimum semantics. Try the natural typed
  helper first, compare immediately, then use the usual isolated/production
  ROM gates and inventory/docs publication sequence.
- func_08086A08 is a 0xD08-byte controller routine, not a small leaf.
  Keep its full reconstruction separate until the controller layout is anchored.

First inspection:
`rg -n 'func_08085EC4|func_08085EEC|func_08085584|0x000043D8' asm/code_0803EE94.s src/scene_owners.cc`

## Parked boundaries

Constructor func_08092570 remains exact-size 0x54 with four r0/r1 differences.
Do not reopen it without new structural evidence. Keep the whole save loader,
resource-owner constructor/B128 frontiers, the 20 scene-change constructors and
other documented compiler-sensitive islands parked. Save layout recovery and
whole-loader source matching are separate results; neither is complete.

Stable scene architecture: docs/SCENES.md.
Compiler authority: tracked tools/install_agbcp.sh and thirteen-rule
tools/agbcp_fomt_compat.patch, unchanged.
