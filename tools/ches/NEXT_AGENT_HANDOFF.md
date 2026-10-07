# Current FoMT continuation - October 6, 2026

## CURRENT CHECKPOINT - 39F90 typed render-helper frontier; production unchanged

- Active public retail branch is now **`main`**, local branch tracks `ches/main`, and the former `Live-temp` branch has been deleted both remotely and locally after containment proof. Historical `ches-dev` remains provenance only; custom behavior remains on the separate custom-game worktree/branch.
- Migration commit: `d34efc5adaad56ce92a41bb354d1882847355438` (`consolidate public decomp documentation on main`). Push `sh_muwzf02b_fea9156d` fast-forwarded `ches/main`; independent verification `sh_muwzf82g_d1c9e8fc` showed remote `main` at the exact same hash.
- Before deletion, containment proof `sh_muwzg277_3954e956` showed local `main` and `Live-temp` both contained the full checkpoint and remote `main=d34efc5`, `Live-temp=bf45d14`. Remote deletion `sh_muwzg9tx_7a7d161b` succeeded; follow-up `sh_muwzgjmr_c4bbebf4` showed only remote `main`. Local deletion/upstream correction `sh_muwzgp9p_66615fdc` left clean `main...ches/main`.
- Forced publication verification `sh_muwze013_1fa7bcd5`: `git diff --check` PASS, `make -B -j4 compare` -> **`fomt.gba: OK`**, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`, progress **70,360 / 940,036 = 7.4848% code** and **146,090 / 7,717,440 = 1.8930% meaningful ROM**.
- Latest exact promotion replaces retail `func_080399C0` with natural `Entity398A4::~Entity398A4`, adding **112 source-owned code bytes** after the earlier 332-byte mode-4/factory/destructor batch.
- Production gate `sh_mux5eybl_9b938ee0`: `make -B -j4 compare` -> **`fomt.gba: OK`**; SHA1 `sh_mux5fpg4_966284bb` -> `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Current progress: **71,564 / 940,036 = 7.6129% code**, **868,472 asm bytes** remain; **2,338 linked asm functions**; inferred ranges **867,308 / 868,472 = 99.8660%**; unattributed asm **1,164 bytes**. Data/assets remain **75,334 / 6,777,404 = 1.1115%**; meaningful ROM is **147,294 / 7,717,440 = 1.9086%**; free tail **671,168 bytes**.
- Latest exact family added **332 retail bytes**:
  - `func_08039DA8`: 0x70 / 0;
  - `func_08039E18`: 0x70 / 0;
  - `func_08039A30`: 0x2C / 0;
  - `func_08039F50`: 0x40 / 0.
- The paired 0x70 setup helpers prove mode-4 packed state: low 16-bit timer = `func_080AB788(0x78)+0xF0`; 7-bit sub-counter = 0x3C; target-kind bit differs 0/1; top-byte facing timer = 0. Both set mode 4 through `func_0809C0C8`, call `func_08032384(owner,2,false)`, then `func_080200C4(owner,0xAA)`; energy decrement is 15 for `39DA8` and 4 for `39E18`.
- `func_08039A30` is exact typed source: `new UnknownEntityThing(owner, 2, 0x1B, 0, 8, 0, false)`.
- `func_08039F50` is exact: reset vtable 76BC, virtual-destroy optional child +0x48 with flags 3, release embedded effect +8 through `func_080A47B4(...,2)`, conditionally free self.
- `func_08039E98` is behavior-complete and parked. Best source `candidate-ctor-39e98-v2.cc` is **exact-size 0xB8 / 109**. Real provider virtual +0x0C returns the project’s **8-byte `SpriteAnimation`** temporary, recovering the retail 0x14 frame and r8/r9 save set. Remaining delta is register/lifetime allocation.
- Existing parked strategy/controller islands `39204`, `39310`, `3955C`, `39708`, `38820`, `38EE0`, and Ball mover `38110` remain closed unless new original-type/compiler evidence appears.
- Root/public documentation was fully audited for current-state drift. `README.md` is now the public project front door; `START_HERE.md`, `docs/PROGRESS.md`, branch policy, current metrics, priority docs, asset docs, character/custom docs, compiler header, repo map, and build-inventory description were aligned to the public `main` workflow. Historical commit/result records remain historical rather than being rewritten.

### Exact next action

Production remains exact at published commit `3746b6acbe90b456929e5cbd6235d350acc38b02`: **71,564 / 940,036 = 7.6129% code**, retail SHA1 unchanged. Current work is scratch/research only; no production source changed.

Target `func_08039F90`, retail `0x08039F90..0x0803A144` (**0x1B4 / 436 bytes**), is behavior-complete and structurally understood as a shared effect-render helper.

Progress this turn:
- v2: **0x1A4 / 410**, 0x44-byte frame.
- `candidate-39f90-v3.cc`, compare `sh_muxdk91p_00031291`: **0x1A6 / 408**. Grouping screen x/y/depth into a 12-byte local recovers the exact **0x48 frame** but puts locals in the wrong stack order.
- `candidate-39f90-v4.cc`, compare `sh_muxdldg9_f2229c93`: **0x1B2 / 340**. Declaring the 0x20-byte render-data local first, then separate pair/coords locals, gets within **2 bytes of retail size**. This is the best byte-score candidate, but its pair type is still semantically wrong.
- `candidate-39f90-v5.cc`, compare `sh_muxdmhno_64bb95ff`: **0x1B0 / 394**. Combining pair+coords into one aggregate proves the exact retail stack layout: render data at sp+0x14, pair at sp+0x34/+0x38, screen_x/y/depth at sp+0x3C/+0x40/+0x44. The aggregate itself is not the original source shape.
- `candidate-39f90-v6.cc`, compare `sh_muxdqm1z_c9eecee4`: **0x1AC / 356**. This corrects an important type mistake: r2 is the renderer pointer directly and r3 is the transfer-queue pointer directly. Retail's 8-byte local simply stores those two incoming values. There is no extra resources-wrapper dereference.

Recovered retail facts:
- stack frame is exactly **0x48**;
- local render data is 0x20 bytes at sp+0x14..+0x33;
- local render pair is two direct pointers at sp+0x34/+0x38: transfer queue then renderer;
- screen_x, screen_y, depth are i32 at sp+0x3C/+0x40/+0x44;
- retail initially keeps self in `sl`, coordinate source in r4, x/y/vertical_offset in r5/r6/r7, r2 in r9 and r3 in r8;
- after storing the pair, r9 becomes the pair address;
- primary and child paths both use pair[1] directly as renderer and pair[0] directly as transfer queue;
- child path independently rebuilds the replicated 2-bit draw attribute;
- primary render uses the temporary 0x20-byte SpriteRenderData; child uses its inline render-data block.

**Exact next action on Continue:** make v7 from **v5** because v5 has the exact retail stack layout, then apply only v6's corrected pair/signature model: pair = `{ GraphicsTransferVector * transfer_queue; void * renderer; }`, function r2 = renderer directly, r3 = transfer queue directly, both DrawEffect calls use `pair.renderer`, and both graphics uploads use `pair.transfer_queue`. Recompare the whole 0x1B4 immediately. If that preserves v5's exact stack offsets while removing the false indirections, inspect register ownership next. Do not register-force. Keep `39E98` and other parked allocation islands closed.

For fresh-conversation automation, do **not** resend a handoff merely because a browser/send command reports an error or omits a reply. Inspect the actual target tab first and confirm whether the user message appeared or a turn started. The previous failure mode produced a real 54-tool-call turn despite a misleading return.

## SUPERSEDED CHECKPOINT - location-bound actor island behavior-complete; move into rank-11 entity region - October 6, 2026

- Continued from pushed exact checkpoint `ec62cc90ea87e85447f4d004b4a6337cb553c643`; no production code bytes changed in this research checkpoint, so exact progress remains **68,868 / 940,036 = 7.3261%** and `fomt.gba: OK`.
- Completed the remaining +0x40 family reconstruction. Scratch member probes: 72E4 `0x08037494` **0xA8 exact size / 6 diff**, 72A0 `0x0803763C` **0xA8 / 6**, 725C `0x080377E8` **0xA4 / 6**, 7218 `0x08037958` **0x80 / 6**. All four differ in exactly the same three instructions after `func_080AB82C`: retail forms the row pointer before preserving the index; the compatibility compiler preserves the index first. Everything else matches. Treat the four as one parked compiler-sensitive family.
- Recovered the 72E4/72A0 +0x3C schedule semantics at `0x08037568` / `0x08037714`: GameObject virtual +0x144 returns a schedule-state view; packed bytes +8/+9/+10 encode 3-bit year, season/day, and 5-bit hour. Active window is 06:00-15:59. Weekday is `(day + season*30 + (year+6)*120) % 7`; 72E4 rejects weekday 0, 72A0 rejects weekday 1; both also require state word +0x00 == 0. Success builds an `ActorLocation` from the +0x44 variant (`func_080A17A0` / `func_080A1890`), sets location, and refreshes animation zero; failure moves to `MAP_NONE`. Packed-field scratch source reproduces the byte loads/bit extraction/range/modulo logic, but the full methods remain nonmatching because retail carries a different register allocation including an `r8` save/restore. Park them.
- Updated `docs/ENTITY_08037008.md`, `START_HERE.md`, `TODO.md`, and `docs/DECOMP_PRIORITY_MAP.md` so fresh agents do not reopen these bounded islands.
- **Exact next action on Continue:** enter queue rank 11 `asm/code_entities_08034CEC.s:08037C08-0803A8A4`. Skip parked variant constructors `0x08037C08/0x08037C68`; inspect from `0x08037CC4` onward for the next vtable/constructor/repeated-method family, scratch-prove one representative, then batch exact siblings.

## SUPERSEDED CHECKPOINT - class-size correction + SetBox exact; factory/+0x40 frontier bounded - October 6, 2026

- Continued from pushed documentation checkpoint `da790aaccfae1eda365d2a040aa1a061831a93ff`.
- Corrected the concrete hierarchy layout from retail allocation evidence: **7218 and 725C are 0x44 bytes**; only 72A0/72E4 are 0x48 and carry the +0x44 2-bit variant. Removing the erroneous 7218/725C tail field preserves the exact ROM.
- Promoted `UnkEntity37008::SetBox(Box const&)` at `0x08037244`: exact 0x0A source body plus normal 2-byte section alignment. Full `make compare` remains **`fomt.gba: OK`**.
- Current code reconstruction is **68,868 / 940,036 = 7.3261%**, **871,168 asm bytes** remain, data/assets **75,334**, overall meaningful ROM **144,598 / 7,717,440 = 1.8737%**, free tail **671,168**.
- Regenerated inventory: **2,380 linked asm functions / 871,168 canonical asm bytes / 870,092 function-range bytes = 99.8765% / 1,076 unattributed bytes / 135 regions / 189 repeated shape clusters / 885 participating functions / 181 exact normalized clusters**.
- 7218/725C simple factory wrappers `0x08037B80` / `0x08037B48` are now scratch **0x38 / 0 diff** when their constructors are visible as inline definitions. Standalone exact constructor copies at `0x08037BB8/0x08037BE0` have **no direct BL callers**. Do not production-promote the wrappers by manually duplicating ctor logic; first reproduce the original dual inline/out-of-line emission naturally or find stronger compiler/source evidence.
- 7218 +0x40 `0x08037958` is behavior-recovered. Best realistic member source is **0x80 exact size / 6 differing bytes**, only the three-instruction weighted-index preservation order after `func_080AB82C`; all later action-duration/facing/speed/animation code matches. Park it rather than syntax roulette.
- `func_08037098` motion-from-facing semantics are understood but first natural source shapes are nonmatching; parked for now.
- `docs/ENTITY_08037008.md` is updated with the corrected concrete sizes, SetBox, factory proof, and +0x40 behavior/matching status.
- **Exact next action on Continue:** use the recovered GameObject time accessor/action-row type to scratch-reconstruct the two location-reset +0x3C siblings `0x08037568` / `0x08037714`, then test the remaining 72E4/72A0/725C +0x40 family from the proven 7218 source model. Prefer another exact family gain over revisiting the 6-byte 7218 register-order island.

## SUPERSEDED CHECKPOINT - helper layer + two concrete constructors exact - October 6, 2026

- Continued from pushed exact checkpoint `eb59192ca17f4bc4330bc2a9824a98fa8b7d98a6`.
- Production-integrated **264 additional exact source bytes**, raising code reconstruction to **68,856 / 940,036 = 7.3248%** with **871,180 asm bytes** remaining. Overall meaningful-ROM reconstruction is **144,586 / 7,717,440 = 1.8735%**; data/assets **75,334** and tail free space **671,168** are unchanged.
- Full gate still passes: `make compare` -> **`fomt.gba: OK`**, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Newly source-owned exact methods: `UnkEntity72E4::GetAnim/GetSpeed` (`0x08037618/28`), `UnkEntity72A0::GetAnim/GetSpeed` (`0x080377C4/D4`), `UnkEntity725C::GetSpeed` (`0x080378FC`), `UnkEntity7218::GetSpeed` (`0x08037A48`). The speed bodies match naturally; trailing 2-byte section alignment accounts for retail slot sizes where applicable.
- Newly source-owned constructors: `UnkEntity7218(GameObject*, ActorLocation&)` at **`0x08037BB8`, 0x28/0 diff** and `UnkEntity725C(GameObject*, ActorLocation&)` at **`0x08037BE0`, 0x28/0 diff**. These were previously anonymous bytes inside the old `func_08037B80` inventory range.
- Previously anonymous variant constructors are now explicit assembly boundaries: `func_08037C08` (72A0, 0x60 bytes) and `func_08037C68` (72E4, 0x5C bytes). Both source probes are **exact-size** and semantically recovered but differ in temporary-Box/register allocation. They are parked rather than syntax-rouletted.
- The natural `new Concrete(...)` probes for factory wrappers `0x08037A5C..0x08037BB7` did not inline under the current scratch source shape, so those wrappers remain assembly. Do not infer missing behavior from that mismatch; constructors/class layout are proven.
- `docs/ENTITY_08037008.md` now records the helper layer, constructor signatures, Q16 speed values, and the parked variant-constructor frontier.
- Regenerated inventory summary:
- remaining linked assembly functions: **2,381**
- canonical linked assembly code: **871,180 bytes**
- bytes covered by inferred function ranges: **870,132** (**99.8797%** of linked asm code)
- assembly code not assigned to a function range: **1,048 bytes**
- asm definitions present in source but not linked as asm code: **2**
- coarse TU/region hints: **134**
- repeated opcode-shape clusters: **190**
- functions in repeated opcode-shape clusters: **887**
- exact normalized-body clusters: **181**
- explicitly parked functions: **6**
- First remaining entity-region queue line after regeneration: `| 11 | asm/code_entities_08034CEC.s:08037C08-0803A8A4 | 13908.0 | 78 | 11420 | 11420 | 0 | 23 | 33 | 7 |`
- **Exact next action on Continue:** continue this hierarchy without reopening solved helpers. Inspect the four factory wrappers `0x08037A5C..0x08037BB7` as explicit allocation+construction functions and the remaining +0x40/+0x3C virtuals (`0x08037494`, `0x08037568`, `0x0803763C`, `0x08037714`, `0x080377E8`, `0x08037958`). Use the now-source-owned GetAnim/GetSpeed helpers as type/behavior anchors. Park `0x08037C08/68` unless a structural source-shape clue appears.

## SUPERSEDED CHECKPOINT - resident specials + location-bound actor methods integrated exact - October 6, 2026

- Started from clean pushed checkpoint `82450e7a357db5f7a05ac76456a12cb2ec9842d4` and production-integrated the scratch-proven Lou/Child and adjacent `UnkEntity37008` family.
- **Full ROM gate passed on the first production splice:** `make compare` -> `fomt.gba: OK`; ROM size **8,388,608**; SHA1 **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**.
- Progress is now **68,592 / 940,036 = 7.2967% code**, **871,444 asm bytes remain**, **75,334 data/assets**, **144,322 / 7,717,440 = 1.8701% overall**, free tail **671,168 bytes**. This checkpoint added **760 exact source bytes**.
- Resident class result: **all 35 resident constructors are source-owned**. IDs **1..34** also have source-owned +0x30 effect factories. Child ID35 +0x30 at `0x08036F0C` remains assembly; Child +0x3C is source. Lou constructor/+0x30 are source.
- `tools/ches/map_npc_entity_classes.py` was fixed for source constructors whose base initializer is followed by additional member initializers (Child). It now parses source constructor metadata with a multiline regex and obtains source symbol sizes from `arm-none-eabi-nm -S`. Regenerated map succeeds for all 35 residents.
- New stable architecture doc: `docs/ENTITY_08037008.md`. `include/entity_unk_08037008.hh` / `src/entity_unk_08037008.cc` own the neutral location-bound actor base and proven concrete methods. Base layout: `ActorLocation* +0x30`, embedded `Box +0x34`, `u16 +0x3C`, `u16 +0x3E`, `bool +0x40`; pure virtual +0x3C/+0x40. Base ctor/dtor/GetBox/+0x10/+0x14/+0x34 are source.
- Concrete source-owned +0x30 factories: 72E4 `0x0803753C`, 72A0 `0x080376E4`, 725C `0x0803788C`, 7218 `0x080379D8`. 725C/7218 also own +0x3C and GetAnim helpers at `0x080378B8/EC` and `0x08037A04/38`.
- Child unresolved code remains explicit assembly functions `func_08036F0C` (0x5C bytes) and `func_08036F68` (0xA0 bytes), not anonymous raw bytes. Do not block throughput on Child +0x30; semantics are already documented in the preceding research checkpoint.
- Regenerated inventory: **2,385 linked asm functions / 871,444 canonical asm bytes / 870,396 function-range bytes = 99.8797% coverage / 1,048 unattributed bytes / 191 repeated shape clusters / 891 participating functions / 182 exact normalized clusters**.
- Raw queue rank 1 is still the parked save-loader region. The strongest structural-continuity target is now queue **rank 5**, `asm/code_entities_08034CEC.s:08037A48-0803A8A4` (**81 funcs / 11,868 bytes**), continuing the same actor/entity neighborhood.
- **Exact next action on Continue:** inspect `0x08037A48` onward as a coherent class/factory family. First prioritize the remaining +0x40/+0x3C siblings (`0x08037494`, `0x0803763C`, `0x080377E8`, `0x08037958`, helpers `0x08037618/28`, `0x080377C4/D4`, `0x080378FC`, `0x08037A48`) and concrete factory/constructor run `0x08037A5C..0x08037CC4`. Scratch-prove repeated source shapes, integrate exact-only, then regenerate queue/progress.

## SUPERSEDED CHECKPOINT - Lou solved; Child bounded; adjacent actor family class model proven - October 6, 2026

- Started from clean pushed `Live-temp` checkpoint `ad6300da19ea0e0f73b6f3cae7b4f9d723301a31` and continued queue rank 2 `asm/code_entities_08034CEC.s:08036DC4-08039E18`.
- **Lou is fully solved in scratch.** `func_08036DC4` is `LouEntity::LouEntity(GameObject*, Npc*, u32)` using schedule `gUnk_080F6B10`, animation IDs `0x8D8/0x8DC`, default `0x3FE`, vtable `0x080E6958`: **0x3C / 0 diff**. Raw +0x30 body `0x08036E00..0x08036E2C` is `new UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false)`: **0x2C / 0 diff**.
- **Child constructor is exact:** `0x08036E2C..0x08036E70`, `ANpcEntity(..., &gUnk_080F29C0, 0x267, 0x26F, 0x3E3)`, vtable `0x080E6918`, plus `u16` at `+0x48 = 0`: **0x44 / 0 diff**. Child entity size is therefore 0x4C as the factory already indicates.
- Child vtable correction: raw `0x08036EF0` is the +0x3C override; raw `0x08036F0C` is +0x30; raw `0x08036F68` is **+0x18**, not a destructor. The actual destructor slot +0x08 points to `0x080DC9A8`. Do not repeat the earlier destructor misread.
- Child +0x3C natural source `func_08034F00(this,arg); if ((i32)arg > 1) func_08036E70(this);` generates an **exact 0x1A-byte body** against the 0x1C retail slot; the only delta is the trailing 2-byte alignment pad. Treat this as solved body/layout.
- Child +0x30 semantics are understood but matching is parked for now: look up Child social state with `func_080A0384(unk_34 + 0x1CD4)`; return null if absent; call `func_08036E70`; choose effect mode 1 or 4 from low bit `func_0809EAE0(record)`; allocate `UnknownEntityThing(this,4,0x1B,0,mode,0,false)`. Correct return type of `func_0809EAE0` is effectively `u8`. Current natural probes are codegen/lifetime mismatches, not semantic uncertainty. Do not syntax-roulette this before higher-throughput family work.
- Child `func_08036E70` selects Child animation pairs using the persistent record, `func_0809EAD8`, `func_0809EAE0`, `func_08035AE0`, `func_08035908`, and `func_08035940`. Preserve neutral naming until gameplay semantics are stronger.
- The next entity family is now structurally recovered. Retail vtables `0x080E7328` (base) plus `0x080E72E4`, `0x080E72A0`, `0x080E725C`, `0x080E7218` form one `AActorEntity`-derived hierarchy. Use neutral address-derived names until identity is proven.
- Proven base layout for neutral `UnkEntity37008` (size 0x44): inherited `AActorEntity` through +0x2F; `ActorLocation * location_ref` +0x30; embedded `Box` +0x34; `u16` +0x3C; `u16` +0x3E; `bool` +0x40; padding. New pure virtual slots are +0x3C and +0x40.
- **Exact base source proofs:** constructor `0x08037008..0x08037048` = **0x40/0** with `AActorEntity(game_object, location, 2, arg3)`, stores `&location`, initializes `Box(0,0)`, +3C arg4, +3E=0, +40=true. Destructor `0x08037048..0x08037098` = **0x50/0** with natural body `*location_ref = GetLocation();`. +0x34 getter `0x08037430` = **0x4/0**. +0x14 `0x0803745C` = **0x14/0**. +0x10 `0x08037434` is exact 0x26 body + 2-byte align. `GetBox` `0x08037470` is exact 0x22 body + 2-byte align and returns a **14x14 Box centered at `(x, y-2)`**.
- Concrete +0x30 effect factories are solved: vtable 72E4 `0x0803753C` = **0x2C/0**, args `(2,9,0,7,0,false)`; vtable 72A0 `0x080376E4` = exact **0x2E body + 2-byte align**, args `(4,12,2,12,0,false)`; vtable 725C `0x0803788C` = **0x2C/0**, args `(2,0x1B,0,8,0,false)`; vtable 7218 `0x080379D8` = **0x2C/0**, same args.
- Two concrete animation-table helpers are exact: `0x080378EC` indexes `gUnk_080F161C` and `0x08037A38` indexes `gUnk_080F1644`, each **0x10/0**. Their natural return type should be `u32` despite `u16` table storage because callers use the full register without a truncation sequence.
- Simple +0x3C bodies at `0x080378B8` and `0x08037A04` are semantically recovered: obtain `ActorLocation` from `func_080A198C` / `func_080A19EC`, `SetLocation`, fetch animation index 0, and `SetAnim` if changed. The 7218 body is exact 0x32 + 2-byte align in scratch. The 725C scratch delta is only a generated Thumb thunk to the helper; production placement should remove that artificial thunk, so verify during integration rather than source-shape roulette.
- Four concrete vtables share base slots and differ at +0x30/+0x3C/+0x40: 72E4 -> `3753C/37568/37494`; 72A0 -> `376E4/37714/3763C`; 725C -> `3788C/378B8/377E8`; 7218 -> `379D8/37A04/37958`. Their distinct destructors are in code_linkonce (`0x080DCB70/64/58/4C`).
- Region inventory remains 102 functions / 12,372 bytes before production integration. No repository production source/linker/assembly was changed in this research turn; only this durable handoff/status checkpoint is being committed.
- **Exact next action on Continue:** integrate the already-proven exact bodies as one coherent source family with precise section/linker interleaving: Lou pair, Child constructor and +0x3C body (leave Child helper/+0x30/+0x18 assembly), `UnkEntity37008` ctor/dtor/GetBox/+0x10/+0x14/+0x34, four concrete +0x30 factories, two exact GetAnim helpers, and simple +0x3C bodies where full-ROM placement verifies exact. Run `make compare`; if exact, regenerate inventory/class map/progress, update relevant architecture docs, checkpoint commit/push. Then continue the same family’s +0x40 and remaining +0x3C methods.

## SUPERSEDED CHECKPOINT - 64 resident NPC methods integrated exact; Lou/Child next - October 6, 2026

- The throughput-family strategy produced its first large production promotion: **32 resident NPC constructors + 32 virtual +0x30 effect factories = 64 exact C++ methods / 3,296 code bytes** in `include/entity_resident_npcs.hh` and `src/entity_resident_npcs.cc`.
- Scratch proof was exhaustive before production mutation: one generated realistic polymorphic TU compared all 64 symbols individually and returned **64 passed / 0 failed**. The shape0024 methods generate 0x2E-byte bodies plus the retail 2-byte section-alignment pad.
- Production layout is exact through **nine source/assembly interleave runs** from `0x08035B64` through `0x08036DC3`. The eight bounded untouched assembly gaps have exact sizes `D0, D0, D0, D0, 60, E0, 68, 98`; the ninth assembly section resumes at Lou `0x08036DC4`.
- `#pragma interface` is required in `include/entity_resident_npcs.hh`; without it the compiler emits weak concrete vtables/destructors. This was caught before linking, corrected, and the final object contains only the intended source methods plus unresolved references to retail vtables.
- `fomt.lds` now aliases all 32 concrete source vtables to their original retail `vtable_unk_*` addresses and preserves all 64 legacy `func_08...` names as aliases to the readable C++ symbols.
- Full production verification: `make compare` -> **`fomt.gba: OK`**, retail SHA1 unchanged. `make progress` -> **67,832 / 940,036 = 7.2159% code**, **872,204 asm bytes remain**, **75,334 data/assets**, **143,562 / 7,717,440 = 1.8602% overall**, free tail **671,168 bytes**.
- The regenerated inventory is **2,399 linked asm functions / 872,204 canonical asm bytes / 871,156 function-range bytes = 99.8798% coverage / 1,048 unattributed bytes / 192 repeated shape clusters / 898 participating functions / 183 exact normalized clusters**.
- `tools/ches/map_npc_entity_classes.py` was upgraded to merge assembly and source constructor metadata and source vtable aliases. Regenerated `NPC_ENTITY_CLASS_MAP.md/json` now shows IDs **1..32 and 34** source-owned for constructor/+0x30; **Lou 33 and Child 35** remain assembly/unlabeled special cases.
- Current raw queue rank 1 is `asm/game_state.s:08011650-0801468C`, but it begins with the deliberately parked save-loader frontier. **Do not reopen it from score alone.** Structural-continuity target is queue rank 2: `asm/code_entities_08034CEC.s:08036DC4-08039E18`, starting with Lou/Child and adjacent entity families.
- Current docs synchronized: `START_HERE.md`, `TODO.md`, `docs/PROGRESS.md`, `docs/REPO_MAP.md`, `docs/CHARACTERS.md`, `docs/DECOMP_PRIORITY_MAP.md`, `docs/DECOMP_PLAYBOOK.md`, `docs/DECOMP_NOTES.md`, `docs/FOMT_COMPILER_RESEARCH.md`, `docs/CUSTOM_CHARACTERS.md`, `docs/ASSET_DECOMPILATION.md`, plus regenerated inventory/class-map artifacts.
- **Exact next action on Continue:** inspect Lou `0x08036DC4` and Child `0x08036E2C` together with their raw +0x30/+0x3C vtable targets, recover their extra fields/behavior honestly, then classify the remainder of `0x08036DC4..0x08039E18` against factory selectors 36..42 and neighboring vtables. Promote another coherent family only after scratch 0-diff proof.

## SUPERSEDED CHECKPOINT - resident NPC class map proven; Rick representative exact - October 6, 2026

- Added `tools/ches/map_npc_entity_classes.py`, generating `tools/ches/npc_entity_class_map.json` and `tools/ches/NPC_ENTITY_CLASS_MAP.md` from retail factory-table bytes, decoded Thumb BL calls, constructor schedule/vtable literals, the recovered character table, raw retail vtable words, ELF symbols, and the current similarity inventory.
- Factory selectors **1..35 are now directly proven** to map to the resident characters Lillia through Child. The non-obvious tail is confirmed: selector 30 Gourmet -> `func_08036CAC`, 31 H. Goddess -> `func_08036D0C`, 32 Kappa -> `func_08036D68`, 33 Lou -> `func_08036DC4`, 34 Lu -> `func_08036860`, 35 Child -> `func_08036E2C`.
- All 35 installed 0x40-byte NPC vtables are decoded from retail. Every class has a distinct destructor slot and distinct +0x30 virtual. Only 10 classes override +0x3C; the remaining classes share base `func_08034F00` there. Lou/Child +0x30 targets are real retail pointers but currently unlabeled symbols, so the generated map marks them `unlabeled`, not source-owned.
- Family leverage is now concrete. Among IDs 2..35, constructor shapes are **shape0007=19, shape0033=6, shape0118=2, shape0119=2, solo=5**. +0x30 virtual shapes are **shape0005=16, shape0026=7, shape0024=7, shape0117=2, unlabeled=2**. This means a handful of proven source templates can cover most resident NPC class methods.
- Rick was used as the first exact representative with scratch source shaped directly after exact-source Lillia. `RickEntity::RickEntity(GameObject*, Npc*, u32)` using `ScheduleInfo_Unk_080F1A80`, animation IDs `0x213`, `0x217`, and default `0x3E0` matched retail **0x38 bytes / 0 differing linked bytes** at `0x08035B64..0x08035B9C` (`rick_ctor_probe`). `RickEntity::vfunc_30()` using the same `UnknownEntityThing(this, 4, 0x1B, 1, 0, 0, false)` body as Lillia matched **0x2C bytes / 0 differing linked bytes** at `0x08035B9C..0x08035BC8` (`rick_vfunc30_probe`). No production source was changed yet.
- The prior inventory checkpoint `74d84b42496cb0c5ee2948d7a8ae111a0a3175dd` is already published on `ches/Live-temp`.
- **Exact next action on Continue:** use the proven selector/class/vtable map to parameterize and scratch-compare the remaining members of Rick's constructor family and +0x30 family, then expand to the other three dominant +0x30 shapes. Once a coherent family batch is 0-diff, integrate it exact-only, run full-ROM compare/SHA1/progress, update docs, and publish the next `Live-temp` checkpoint.

## SUPERSEDED CHECKPOINT - remaining-function inventory built; NPC/entity cluster ranks first - October 6, 2026

- Published strategy checkpoint `e68144f7055fc4896b49cc31429f90c64fef3be1` to `ches/Live-temp` before beginning this analysis.
- Added `tools/ches/build_decomp_inventory.py`, generating `tools/ches/decomp_inventory.json` plus human-readable `tools/ches/DECOMP_QUEUE.md` from current assembly, linker map, ELF symbols, direct calls, global/data refs, normalized instruction shapes, and coarse source/asm locality.
- Current linker-backed inventory: **2,463 linked assembly functions**, **875,500 canonical assembly code bytes**, with inferred function ranges covering **874,452 bytes = 99.8803%**. The remaining **1,048 bytes** are not assigned to inferred function ranges. Two `_asm` fallback definitions (`func_0802A7E0_asm`, `func_0809CF34_asm`) are present in assembly source but are not linked as assembly code and are excluded.
- Similarity pass finds **199 repeated opcode-shape clusters**, covering **960 remaining functions**, plus **190 exact normalized-body clusters**. This confirms substantial family-level leverage exists beyond one-function-at-a-time work.
- The highest-ranked coherent region is **`asm/code_entities_08034CEC.s:08035B64-08038DF0`**: **157 functions / 12,940 bytes**, all currently under the tractable-size threshold, with **107 functions in repeated families**, 28 source-anchor callees, and no giant-function penalty.
- Structural interpretation is strong: this region starts immediately after exact-source `LilliaEntity::LilliaEntity` / `LilliaEntity::vfunc_30` at `08035AFC..08035B63`. The following anonymous functions cluster into repeated families such as 19 members / 1,184 bytes (`shape0007`), 19 members / 836 bytes (`shape0005`), 4 members / 720 bytes (`shape0047`), and multiple 7-8 member families. The adjacent vtable block beginning around `vtable_unk_080E7198` contains many consecutive anonymous vtables, reinforcing the sibling NPC/entity-family hypothesis.
- The first inventory version deliberately keeps TU/region boundaries and scores labeled **heuristic**. Addresses, linker ownership, direct call edges, linked-byte totals, and exact repeated signatures are repository-derived evidence. Runtime/library helpers and giant functions are penalized so they do not dominate target selection merely by fan-out or size.
- A malformed intermediate patch to the inventory script was caught **before execution** after shifted line numbers caused edits to land in the wrong blocks. The affected build/report section was replaced cleanly; `python3 -m py_compile tools/ches/build_decomp_inventory.py` passes and the corrected generator completed successfully.
- **Exact next action on Continue:** map the `08035B64..08038DF0` functions to the consecutive vtables and the entity factory selectors/character IDs, identify the first sibling class/family boundary, then reconstruct one representative repeated family and propagate the proven source shape across its siblings. Do not fall back to manual sprite tracing or isolated function roulette.

## SUPERSEDED CHECKPOINT - whole-game throughput pivot adopted - October 6, 2026

- The user requested an external strategy audit specifically to challenge whether individual packed-sprite tracing was the fastest route to decompiling FoMT. The core recommendation is adopted: optimize for total coherent decompilation throughput and reusable understanding, not for resolving the last sprite IDs first.
- Before changing documentation, the current project charter, start-here, roadmap/playbook, subsystem docs, progress/repo maps, TODO, handoff/status, and supporting asset/custom-game documentation were read/reconciled. Historical checkpoints remain evidence, not current authority.
- **No production code, assets, compiler files, linker inputs, commits, or pushes changed in this strategy pass.** Exact reconstruction remains **64,536 / 940,036 = 6.8653% source**, **75,334 data/asset bytes**, **140,266 overall meaningful-ROM bytes**, and the prior `fomt.gba: OK` / retail SHA1 baseline remains authoritative.
- The normal work unit is now an inferred original **translation unit or coherent structural/type/similarity cluster**, not a fixed five-function batch.
- Immediate pipeline target: build one machine-readable inventory of every remaining assembly function with address/size, callers/callees, data/global xrefs, inferred TU/subsystem, vtable/class evidence, similarity cluster, exact/understood/parked status, and known compiler-difficulty evidence.
- Then infer TU boundaries from linker/address locality, padding/literal pools, static data ownership, internal-call locality, vtable and constructor/destructor groupings; normalize/cluster similar assembly; build class/vtable/global ownership maps; score coherent units by recoverable bytes, downstream unlock, type readiness, coherence, similarity and difficulty; and work the ranked queue.
- Production remains **exact-only**. Semantically reconstructed but nonmatching functions may be preserved privately as understood research, but must not replace retail assembly in `src/` unless the project later deliberately adopts a supported NONMATCHING build convention.
- Packed-bank ownership remains **416 / 493 = 405 / 450 simple + 11 / 43 multi-frame**, leaving **77** unowned animations. Those 77 are now a **parked open list**, not the main queue. Existing evidence for 173..180, 413..420, 54..57, 160/161 and all closed provider/consumer paths remains valid and must not be rediscovered.
- The durable mGBA state **`/mnt/data/Ches/runtime-saves/fomt/opening-farm.ss1`** still exists at 81,767 bytes. Its exact load command remains unverified, but it is now seed infrastructure for a future deterministic savestate + scripted-input coverage harness rather than a blocking next step.
- Runtime work should collect function-entry coverage, indirect/virtual caller-callee targets, first-hit scenario/frame, and targeted RAM before/after diffs in bulk. Watchpoints remain for focused field/ownership questions only.
- Data/assets remain code-coupled for semantic promotion, but cheap structural cataloging of pointer tables, fixed-stride arrays, palettes, tile banks, scripts, maps and M4A tables can run alongside code analysis. Only editable sources that regenerate retail bytes count as reconstructed data/assets.
- Keep `func_08011650`, `func_080455D8`, `func_08092A70`, `func_080CAC7C` / `func_080CAD18`, and `func_08092940` parked unless new structural evidence materially raises their leverage.
- Active branch is `Live-temp`; remote tracking branch is `ches/Live-temp`. **Standing checkpoint rule as of October 6, 2026:** every durable checkpoint must be committed on `Live-temp` and pushed to `ches/Live-temp` after canonical docs/artifacts and diff verification are complete. This is separate from exact retail contribution pushes to `ches-dev`.
- **Exact next action on Continue:** publish this documentation/strategy checkpoint to `ches/Live-temp`, then build the first version of the remaining-function database from existing repository/map/call-graph evidence, derive TU guesses and similarity clusters, score/rank coherent units, and select the top decompilation target. Do not resume manual sprite-ID tracing first.

## SUPERSEDED CHECKPOINT - Dog Ball 21..48 + five menu-special icons promoted exactly - October 6, 2026

- Five code/text-proven menu-special packed animations are canonical under `assets/item_icons/menu_special/`: **Water 461, Box Lunch 401, Milk 290, Spaghetti 422, Snow-cone 247**.
- Their ownership comes from `func_0807EF90` / `func_08081BBC` and presentation tables `gUnk_080FE2D8` / `gUnk_080FEB60`. Special rows bypass ordinary Food description/icon lookup and use direct packed IDs plus custom retail text.
- Menu-special gain: **544 unique bytes = 384 graphics + 160 palette**.
- Selector `0x4B` is the thrown **Ball** entity. Adult-dog play/fetch code calls `func_08038374` / `func_08038398` on it.
- Newly proven field meaning: Ball entity `+0x28` is a **packed animation resource ID**. `func_0803853C` obtains the GameObject vfunc `+0x64` packed provider and passes `[ball+0x28]` as `func_080A4A00` resource_id.
- Exact Dog Ball mapping by dog animation selector + facing: default -> 21..24; `0x33C -> 25..28`; `0x340 -> 29..32`; `0x344 -> 33..36`; `0x348 -> 37..40`; `0x34C -> 41..44`; `0x375 -> 45..48`. Facing is the four-way index 0..3.
- Canonical Dog Ball sources are under `assets/item_icons/dog_ball/`. All 28 use `packed-animation-v1`, preserving 53 total frames and exact timing/layout. Ten are multi-frame.
- Dog Ball gain: **1,024 unique graphics bytes**, zero new palette bytes due to sharing.
- Packed bank rebuild remains exact across all **196,736 bytes**; full `make -j4 compare` and `make progress` report **`fomt.gba: OK`**.
- Manifest ownership: **416 / 493 total = 405 / 450 simple + 11 / 43 multi-frame**. Remaining: **45 simple + 32 multi-frame = 77**.
- Current progress: code **64,536 / 940,036 = 6.8653%**; data/assets **75,334 / 6,777,404 = 1.1115%**; generated packed-sprite assets **44,224 = 33,664 graphics + 10,560 palette**; overall **140,266 / 7,717,440 = 1.8175%**; free tail **671,168 bytes**.
- Manifest spans: 442 frame records, 415 sprite descriptors, 264 graphics spans, 330 palette spans, 46 layout records. The remaining 45 simple animations account for up to **2,976 unique bytes = 2,592 graphics + 384 palette**.
- Closed false leads this turn: `func_080722DC` constructs the packed provider at `sp+0x48` but never consumes it directly; its only actual sprite lookup uses separate `gUnk_0858BA28`. `gUnk_080F0748`, `gUnk_080F0E88`, and schedule/actor-animation tables were numeric namespace coincidences, not packed-bank ownership.
- Active branch remains `Live-temp`, HEAD `9078f36`; preserve the intentional dirty worktree and do not commit/push from this branch.
- **Exact next action:** continue code-backed packed-provider tracing for the remaining **32 multi-frame IDs**: 54,55,56,57,60,62,77,160,161,173,174,175,176,177,178,179,180,211,279,325,392,413,414,415,416,417,418,419,420,429,434,470. Prefer proven `func_080A4A00`/GameObject +0x64 effect lanes and table-derived resource selectors; do not return to literal hunting because no remaining multi-frame ID is passed raw to GetAnimation.


## SUPERSEDED CHECKPOINT - Six Fish Kings promoted exactly - October 6, 2026

- `func_080713B8` constructs the packed `gUnk_086678A0` provider and uses exact helper `func_0809CE30` for final collection indices `0x35..0x3A`.
- Exact mapping: `0x35 -> 252`, `0x36 -> 249`, `0x37 -> 254`, `0x38 -> 253`, `0x39 -> 250`, `0x3A -> 251`.
- Retail pointer table `gUnk_08103A18` supplies the strings **Jp. Huchen, Monkfish, Catfish, Carp, Coelacanth, Squid**. These are the six Fish Kings.
- Canonical sources are under `assets/item_icons/fish_kings/`; manifest total is **383 animations**.
- Fish Kings add **800 unique bytes = 768 graphics + 32 palette**. All six share one palette.
- Packed-bank rebuild is exact across all **196,736 bytes** and full `make -j4 compare` reports **`fomt.gba: OK`**.
- Ownership: **383 / 493 total** = **382 / 450 simple** + **1 / 43 multi-frame**. Remaining: **68 simple + 42 multi-frame = 110**.
- Progress: code **64,536 / 940,036 = 6.8653%**; data/assets **73,766 / 6,777,404 = 1.0884%**; generated packed-sprite assets **42,656 = 32,256 graphics + 10,400 palette**; overall **138,698 / 7,717,440 = 1.7972%**; free tail **671,168 bytes**.
- Manifest spans: 387 frames, 387 sprite descriptors, 253 graphics spans, 325 palette spans, 30 layout records. The 68 unowned simple animations contain up to **4,032 unique bytes = 3,488 graphics + 544 palette**.
- Closed this turn: `func_08068344` uses already-owned Fishing Rod (148..152/155) and Hammer (223..227/230) upgrade icons; `func_080713B8` final six-entry family is now fully promoted.
- Active branch remains `Live-temp`, HEAD `9078f36`; preserve the intentional dirty worktree and do not commit/push from this branch.
- Fresh `func_080722DC` correction: `[sp+0x2D0]` is a reused pointer slot, not the provider object. Immediately before the packed constructor path, `r0 = sp+0xEC`, then `subs r0,#0xA4`, so `[sp+0x2D0] = sp+0x48`; at `0x080730EC`, `func_0805E6CC([sp+0x2D0], gUnk_086678A0)` therefore constructs the packed provider at **stack object `sp+0x48`**. A separate provider at `sp+0x18` is built from `gUnk_0858BA28`; do not mix their indirect calls.
- **Exact next action:** within `func_080722DC`, trace uses/aliases/copies of the concrete packed-provider object at `sp+0x48` after `0x080730EC`, then identify values passed through its vtable +0x0C `GetAnimation` or into SpriteAnimator initialization. Intersect only those values with the 42 unowned multi-frame IDs. Do not grep `[sp+0x2D0]` as if it were a persistent object.


## SUPERSEDED CHECKPOINT - Water Splash 425 promoted exactly; multi-frame authoring proven - October 6, 2026

- Animation **425 / 0x1A9 WATER_SPLASH** is now promoted under `assets/item_icons/effects/water_splash/` as a `packed-animation-v1` bundle.
- Exact code proof: `src/game_object_discard.cc` defines `EFFECT_WATER_SPLASH = 0x1A9` and constructs it on the `IsFootprintOnWaterSurface` discard path; historical Ball/generic-discard traces independently use the same fixed resource on water-surface landings.
- Water Splash has 5 animation frames beginning at frame 457. Sprite descriptors are 425, 426, 427, 428, 429 with durations 5, 6, 6, 8, 60. The final frame is blank; frames 2 and 3 are two-part OAM sprites.
- `tools/packed_sprite_bank.py` now supports generic `packed-animation-v1` export/import/build for proven multi-frame 4bpp OBJ animations with one palette, complete tile coverage, non-overlapping OBJ rectangles, raw descriptor/OAM metadata checks, and shared-byte conflict validation.
- Scratch `verify-animation` and canonical manifest build both prove the full **196,736-byte packed bank byte-for-byte exact**. Full `make -j4 compare` -> **`fomt.gba: OK`**.
- `tools/scripts/calcprogress.py` now counts graphics/palette spans across every frame of a manifest animation rather than requiring frame_count == 1.
- Manifest ownership is now **377 / 493 animations**: **376 / 450 simple** and **1 / 43 multi-frame**. **74 simple + 42 multi-frame = 116 animations remain unowned**.
- Water Splash adds **384 unique graphics bytes** and no new palette bytes because palette index 94 was already owned/shared.
- Current measured progress: code **64,536 / 940,036 = 6.8653%**; data/assets **72,966 / 6,777,404 = 1.0766%**; generated packed-sprite assets **41,856 = 31,488 graphics + 10,368 palette**; overall **137,898 / 7,717,440 = 1.7868%**; free tail **671,168 bytes**.
- Active branch remains `Live-temp`, HEAD `9078f36`. Preserve the intentional dirty worktree; do not commit/push this checkpoint as a `ches-dev` contribution from `Live-temp`.
- **Exact next action:** rank the remaining 42 unowned multi-frame animations against known `EntityEffect` / `func_080A4A00` effect/UI call sites and state tables, then trace the strongest code-backed family to its concrete `gUnk_086678A0` provider before promotion. Run the multi-frame census as separate safe read/shell calls, not inside `parallel_run` (that wrapper rejects `shell_exec`). Exclude already-closed Tool/Food/Article, cooking, Wrapped Present, Basket, Money Bag, overnight forage, Water Splash, and direct-literal false leads 21/4/7.

## SUPERSEDED CHECKPOINT - 18 overnight forage/map assets promoted exactly - October 6, 2026

- Exported all 18 code-proven 00:00-05:59 variants under `assets/item_icons/overnight/` and appended them to `assets/item_icons/manifest.json`.
- Manifest now owns **376 simple animations**; **74 simple animations remain unowned**.
- Packed-bank rebuild: `python3 tools/packed_sprite_bank.py build-bank --manifest assets/item_icons/manifest.json --out build/assets/item_icon_bank.bin` -> **EXACT: rebuilt bank matches retail (196736 bytes)**.
- Full ROM verification: `make -j4 compare` -> **`fomt.gba: OK`**.
- Measured new editable coverage is **+544 bytes**, all palette bytes: 17 unique 32-byte palettes. All 18 overnight entries reuse already-owned graphics; Blue Magic overnight shares the Apple overnight palette span.
- Current measured progress: code **64,536 / 940,036 = 6.8653%**; data/assets **72,582 / 6,777,404 = 1.0709%**; generated assets **41,472 = 31,104 graphics + 10,368 palette**; overall **137,514 / 7,717,440 = 1.7819%**; free tail **671,168 bytes**.
- Active branch is `Live-temp`, HEAD `9078f36`. Preserve the intentional dirty worktree; do not commit/push this checkpoint as a `ches-dev` contribution from `Live-temp`.
- **Exact next action:** resume indirect/table-driven ownership tracing for the remaining 74 simple animations. Start from `gUnk_086678A0` provider-bearing objects/subobjects not already closed as Tool/Food/Article, cooking, Wrapped Present, Basket, Money Bag, or overnight forage. Prefer table/state-derived IDs and promote only code-proven semantic families.

## SUPERSEDED CHECKPOINT - 18 overnight forage/map variants proven - October 5, 2026

- The post-Money-Bag indirect-owner pass found a real packed-bank family in `func_080A95A4`, vtable `vtable_unk_080E831C` slot +0x24. The method constructs a temporary `PackedSpriteAnimationProvider` from `gUnk_086678A0` and renders selected animations into the map/world graphics path.
- `func_0801A13C` calls exact hour classifier `func_0801A8C0` and passes that result into `func_080A5D14`. Exact classifier semantics: hours 06-11 -> mode 0, 12-17 -> mode 1, 18-23 -> mode 2, **00-05 -> mode 3**.
- Inside `func_080A95A4`, the lookup helper `func_080AAF28` indexes a two-column u16 table beginning at `gUnk_08107458`. Column 0 is used normally; column 1 is selected only for mode 3 / 00:00-05:59.
- The meaningful table is exactly the first **18 pairs** at ROM `0x00107458..0x0010749F`; bytes at `0x001074A0` immediately become `"bad_alloc"` runtime string data. The 18 pairs are:
  - Bamboo Shoot 50 -> **51**
  - Wild Grapes 309 -> **310**
  - Mushroom 306 -> **307**
  - Poisonous Mushroom 245 -> **246**
  - Truffle 281 -> **282**
  - Blue Grass 65 -> **66**
  - Green Grass 216 -> **217**
  - Red Grass 376 -> **377**
  - Yellow Grass 490 -> **491**
  - Orange Grass 322 -> **323**
  - Purple Grass 357 -> **358**
  - Indigo Grass 256 -> **257**
  - White Grass 473 -> **474**
  - Apple 8 -> **9**
  - Moon Drop Grass 303 -> **304**
  - Pink Cat Grass 337 -> **338**
  - Blue Magic Grass 272 -> **273**
  - Toy Flower 452 -> **453**
- Every column-0 ID is already a semantically owned Food/Article icon. Every column-1 ID above is currently unowned. Packed-bank inspection proves each pair uses the **same graphics bytes**, while the mode-3 entry swaps to a substantially darker palette and sometimes adjusts OBJ layout/offset. Therefore these are code-proven **overnight/dark map variants**, not independent item art.
- A separate indirect-owner candidate `func_0803C5B0` was closed as an already-known Tool icon path: dynamic field +0x2F2 is written only by `func_0803D404`, whose sole caller passes `GetIconId__C4Tool()`.
- `func_080BC938` was also deprioritized: its packed provider at +0x424 concretely selects animation 0 and already-owned Turnip 457; no new family was established there.
- No assets were promoted in this checkpoint yet, so validated progress remains **358 owned / 92 simple unowned**, code **64,536**, data/assets **72,038**, overall **136,970**, free tail **671,168 bytes**.
- **Exact next action:** export the 18 mode-3 IDs above as editable PNG/JSON sources under a clearly named overnight/map-forage family, add them to the packed-bank manifest with semantic tags tied to their paired item names, rebuild the packed bank, run full `make -j4 compare`, measure unique graphics/palette-byte gain, then update counts/docs. Because graphics are shared with the already-owned daytime/item entry, expect most or all new unique coverage to come from the darker palettes/layout metadata rather than new pixel graphics.


## SUPERSEDED CHECKPOINT - Money Bag 106 recovered; direct literal lane exhausted - October 5, 2026

- Animation **106** is now proven to use the packed item/UI bank. Main GameObject vtable `vtable_unk_080E5EC4` slot +0x64 is `0x0801FC60`, which returns `this + 0xDE4`; prior exact constructor research proves `func_080AC674` initializes that embedded provider with `func_0805E6CC(..., gUnk_086678A0)`.
- Semantic ownership is code-backed: `func_08025B64` case 2 computes `rand % 16 + 5`, calls `func_0802771C`, and `func_0802771C` credits that **5-20 G** through exact `MoneyState` credit `func_0809ABD8` before switching the secondary effect animator to ID 106. Neighboring dispatcher cases award the six cursed tools, Teleport Stone, and mine Food/Article rewards. ID 106 is therefore the mine **Money Bag** reward visual.
- Added exact editable sources `assets/item_icons/mine/money_bag.png` and `money_bag.json`, manifest tag `MONEY_BAG`, icon ID 106. Packed-bank rebuild is exact and full `make -j4 compare` -> `fomt.gba: OK`.
- Manifest ownership is now **358 animations**; **92** simple animations remain unowned. Money Bag adds **160 unique asset bytes** = 128 graphics + 32 palette.
- Current progress: code **64,536 / 940,036 = 6.8653%**; data/assets **72,038 / 6,777,404 = 1.0629%**; generated editable assets **40,928 bytes = 31,104 graphics + 9,824 palette**; overall **136,970 / 7,717,440 = 1.7748%**; free tail **671,168 bytes**.
- Literal false leads are closed: animation 21 uses `gUnk_0874F34C`; intro IDs 4/7 use `gUnk_08747A74`; `func_08032A30` ID 4 targets `UnknownEntityThing` providers GameObject +0x68/+0x6C, proven as embedded +0xDB4 from `gUnk_0858BA28` and +0xE74 from `gUnk_0871D51C`; `func_080E0A94` ID 7 uses provider `gUnk_0871E7A8`.
- A fresh scan against the 358-entry manifest finds only those closed IDs 21/4/7 as literal unowned animator/render candidates. The only no-`GetIconId()` direct renderer that references `gUnk_086678A0` is the already-recovered cooking family. **Do not continue immediate-value hunting.**
- **Exact next action:** trace indirect/table-driven ownership. Enumerate objects/subobjects constructed from `gUnk_086678A0` (including GameObject +0xDE4 and UI provider members), then follow methods that derive animation IDs from state/tables before provider lookup/render. Exclude known Tool/Food/Article `GetIconId()`, cooking, Wrapped Present, Basket, and Money Bag paths. Promote only when the owning code proves semantics.


## SUPERSEDED CHECKPOINT - animation 106 provider chain narrowed - October 5, 2026

- `func_0802771C` initializes animation **106** with `SpriteAnimator::Init` on the actor's `UnknownEntityThing` effect path. The provider is not a literal in this function.
- Exact pointer chain at `0802771C`: `AEntity::unk_10.Get()` -> `UnknownEntityThing::owner` -> `AActorEntity::game_object` -> `GameObject` virtual slot **+0x64**; the return value is passed as the `SpriteAnimationProvider *` for ID 106.
- The caller at `func_08025B64` is the concrete live player action dispatcher: nearby cases construct Tool/Food/Rucksack items and actor actions. `func_08024974` is the concrete player-facing actor constructor, replacing the intermediate `FarmerEntity` vtable with `vtable_unk_080E6658`; it stores GameState at +0x34 and Farmer at +0x38.
- `AEntity::game_object` is still unresolved to its concrete runtime vtable. Do **not** promote animation 106 yet. The current task is to identify the GameObject vtable used by the live player and decode its +0x64 method.
- A sweep of large vtables showed several concrete +0x64 candidates, while `vtable_unk_080E6038` and `vtable_unk_080E61A0` have `__pure_virtual` at +0x64 and are abstract/base tables. Candidate `0x8C` tables near `0x080E6284..0x080E6554` are entity/animal controllers and are not yet proven to own the player's GameObject.
- **Exact next action:** resolve the producer of the `GameObject *` passed as arg1 into `func_08024974`/`func_0802B908`, including raw `.byte`/indirect factory paths if needed. Once its concrete vtable is known, inspect raw vtable slot +0x64 and follow that function to the returned provider. Only if that provider is `gUnk_086678A0` should animation 106 re-enter the packed UI asset promotion path.


## SUPERSEDED CHECKPOINT - cooking seasoning path closed; animation 106 next - October 5, 2026

- The cooking seasoning question is now closed from code, not appearance. `func_08098CE8` renders exactly the eight top-level packed-bank icons. Its later five-row loop indexes the fixed 11-byte names Sugar, Salt, Vinegar, Soy Sauce, and Miso; `func_08099144` toggles those as selection bits 7..11. No `gUnk_086678A0` lookup occurs for those five rows. Therefore **Seasoning Set=400 is the only seasoning packed-sprite asset; Sugar/Salt/Vinegar/Soy Sauce/Miso are text/state-only entries in this UI**.
- Proven cooking data was promoted from opaque incbins to explicit semantic source while preserving old aliases: `gCookingOptionCount`, `gCookingSeasoningSetName`, `gCookingUtensilsTitle`, `gCookingElementsTitle`, `gCookingUseWhatTitle`, `gCookingUiTextRows`, `gCookingOptionNames`, and `gCookingElementNames` in `asm/data/data_080F9EB8.s`.
- Exact validation after those data conversions: `make -j4 compare` -> `fomt.gba: OK`; packed bank remains exact; `git diff --check` clean. `make progress` stays at code 64,536, data/assets 71,878, overall 136,810, free tail 671,168 bytes.
- Stronger provider-aware scanning found **no remaining unowned fixed IDs constructed directly from `gUnk_086678A0`**. `func_080522F8` uses fixed IDs 201 and 167, but they are already-owned Article icons `FRISBEE` and `FOSSIL_OF_FISH`. `Product::GetIconId()` also closes as a delegate to Food/Article and adds no namespace.
- A ROM-wide constant scan of animator/render APIs produced the next unowned-simple candidates: animation 21 in `func_080A2BA4` (already closed false lead, provider `gUnk_0874F34C`), animation **106** in `func_0802771C` via `func_0805E850`, animation 4 in `func_08032A30` / intro code, and animation 7 in intro/linkonce code. These candidates are not yet proven to use `gUnk_086678A0`.
- **Exact next action:** trace the provider supplied to `func_0805E850` in `func_0802771C` for animation **106**. If it resolves to `gUnk_086678A0`, identify the entity/subsystem owner and promote animation 106 only after semantic proof. If not, continue provider tracing for IDs 4 and 7. Do not reopen animation 21 or `func_08092A70`.


## SUPERSEDED CHECKPOINT - cooking utensil table recovered - October 5, 2026

- Direct render-helper tracing found no new unowned simple literal IDs in ordinary item UI paths; those use runtime Tool/Food/Article icon IDs. Animation 21 is a closed false lead because its animator uses `gUnk_0874F34C`, not `gUnk_086678A0`.
- The first true table-driven packed-bank family is retail `0x08100AC2`, now aliased as `gCookingUtensilIconIds`. `func_080989DC` and `func_08098CE8` index it and render through `gUnk_086678A0`.
- Proven mapping from the cooking availability mask, typed `FarmHouse::HasKitchen*()` methods, and retail UI text: Knife=265, Frying Pan=204, Pot=346, Mixer=64, Whisk=472, Rolling Pin=313, Oven=327, Seasoning Set=400. Index 7 is **Seasoning Set**, not Sugar; retail cursor code special-cases it to the literal `Seasoning Set`.
- Eight exact PNG/JSON sources now live under `assets/item_icons/cooking/`. Manifest ownership rises to **357 animations**, leaving **93 simple animations unowned**. This family adds **1,152 unique asset bytes**: 1,024 graphics + 128 palette.
- Verification: packed-bank rebuild is exact at 196,736 bytes; `make -j4 compare` reports `fomt.gba: OK`; post-rename bank rebuild remains exact; `git diff --check` is clean.
- Current progress: code **64,536 / 940,036 = 6.8653%**; data/assets **71,878 / 6,777,404 = 1.0606%**; generated editable assets **40,768 bytes = 30,976 graphics + 9,792 palette**; overall **136,810 / 7,717,440 = 1.7727%**; free tail unchanged **671,168 bytes**.
- **Exact next action:** stay in the cooking subsystem long enough to determine how seasoning-selection bits 8..11 represent Salt, Vinegar, Soy Sauce, and Miso. Do not assign animation IDs from appearance. If those entries are text/state-only, rotate to the next table-driven `gUnk_086678A0` consumer. Do not reopen `func_08092A70`.


## Code-coupled asset frontier - October 5, 2026

The user explicitly changed the asset-first strategy: **do not decompile assets in isolation**. Pair every asset family with the runtime code/subsystem that owns, interprets, loads, or renders it. The bank now has **357 semantically owned PNGs**, **450 simple animations total**, and **93 simple animations still unowned**. Do not export those 93 anonymously.

Current paired target status:

- animation **352 / 0x160** is now behaviorally identified as the **wrapped-present item-state icon**. The normal Rucksack and held-item render paths replace the item's normal icon with 352 whenever the wrapped flag is set;
- `func_08092CD0` is the wrapping/redraw helper: for ordinary Rucksack slots it gets the selected `RucksackItem`, calls `TryWrap()`, then redraws that slot with animation 352; its special slot-9 path calls `TryWrapHeldItem()` and redraws the held-item slot with 352;
- the wrapping-scene text at `gUnk_081003F4..081004BC` independently confirms the subsystem with strings such as “I suggest wrapping for your present!”, “How is this?”, “Yes”, “No”, “Just wait one second... OK, here you go!”, and “So which will it be?”;
- editable source is now `assets/item_icons/special/wrapped_present.png` plus JSON metadata and the packed-bank manifest entry. Exact icon round trip, exact bank rebuild, and full-ROM compare pass. It adds 128 unique graphics bytes; its 32-byte palette is already shared/owned;
- US ROM vtable inspection directly proves `AbstractSprite -> DefinedSprite`: `vtable_unk_080E79C8` points to destructor `080E1984`, `GetAnimation=0805E760`, and `GetFrameData=0805E790`;
- `func_080CAC7C` / `func_080CAD18` are semantically recovered as a 12-byte sprite-resource constructor/setter family. Current best natural CAC7C source is **candidate v9: exact 0x8C size / 52 differing linked bytes**. The remaining mismatch is compiler scheduling/lifetime, not missing game behavior; v8/v11/v12 are closed regressions and v13 ABI diagnostic also lands at 52.

**Completed paired units:**
- `func_08092CD0` is exact production source in `src/rucksack_wrapping.cc`, **0x94 / 0 differing bytes**, paired with animation **352 / WRAPPED_PRESENT**.
- `func_08092754` is exact production source in the concurrently created `src/rucksack_item_render.cc`, **0x1EC / 0 differing bytes**, paired with animation **53 / BASKET** at `assets/item_icons/special/basket.png`. The duplicate renderer file created in this turn was deleted after detecting the concurrent definition.
- Full post-Basket verification: `make -j4 compare` -> `fomt.gba: OK`; `git diff --check` clean; addresses remain `08092754`, `08092940`, `08092CD0`, `08092D64` exactly.
- `func_08092940` is semantically recovered as the selected-item description/message refresh routine. v1 was `0xF8`; corrected `Tool const *` ABI and repeated Rucksack getter structure in v2/v3 reach **0x128 vs retail 0x130**. Remaining delta is allocator/lifetime behavior, so park it unless new structural evidence appears.
- `func_08092A70` is now semantically recovered as the wrapping eligibility / confirmation routine. **Correct target boundary is 0x08092A70..0x08092CD0 = 0x260 bytes**. Any earlier `0x2F4` scratch result accidentally included the already-exact `func_08092CD0` and is invalid.
- Best candidate is `tools/ches/checkpoints/ui-packed-sprite-2026-10-05/candidate-wrap-eligibility-92a70-v8.cc`: **exact 0x260 size, only 3 differing linked bytes**. Every other linked byte matches retail.
- Critical source insight: use a single integer `confirmation_value` for the Rucksack item path. Food leaves `GetKind()==0`; an allowed Article assigns normalized `!CanBeDiscarded()==0`; pass that same value three times to `func_08050E30`. This reproduces retail's bool normalization and zero-value reuse.
- New causal closure: the second `ToolStack::IsEmpty()` branch is `NE -> label 206` in v8 through **CSE2, flow, local allocation and global allocation**. Only the final **`jump2` cross-jump pass** changes it to `EQ -> label 731 (cannot_wrap)`, which becomes the three differing Thumb trampoline bytes at `0x4D,0x4E,0x50`.
- The same 3-byte result occurs with both the production `tools/agbcc/bin/agbcp` wrapper and the older scratch compatibility wrapper. `-fno-thread-jumps` changes nothing, so ordinary thread-jumps are ruled out.
- Positive-condition v11 still has two distinct `IsEmpty()` calls after the early jump pass, but final `jump2` merges the whole call/check sequence and regresses to **0x254 / 518**. v8 prevents that whole-call merge; final `jump2` instead merges only the identical rejection-sound tails and inverts the edge compared with retail. v12 direct-label form is **0x254 / 570**. Closed variants v6-v12 must not be rediscovered.
- No compatibility-compiler rule is justified yet. Treat the remaining mismatch as a compiler/cross-jump reconstruction frontier, not missing gameplay semantics.

**Exact next action:** `func_08092A70` is now parked at behavior-complete **0x260 / 3** after fresh production `-da`, exact Nintendo-2003 compiler, explicit-label, and outer-`else if` diagnostics. Do not continue jump2/compiler or cosmetic source experiments without genuinely new structural evidence. Continue the code-coupled asset lane instead: enumerate the 101 unowned simple IDs, trace raw `gUnk_086678A0` consumers, identify a small/medium owner that passes a constant unowned animation ID to the animator/render helpers, then recover that code and asset as one pair. Keep CAC7C/CAD18 and 92940 parked unless new evidence appears.

## Multi-axis progress + code-coupled asset pivot - October 5, 2026

- `make progress` now tracks reconstruction across code and non-code ROM bytes instead of reporting only executable code.
- Current **code reconstruction** is **64,536 / 940,036 = 6.8653%**.
- Current **data/assets reconstruction** is **71,878 / 6,777,404 = 1.0606%**:
  - 31,110 bytes are linked typed/source non-code data;
  - 40,768 bytes are editable generated packed-sprite graphics/palettes;
  - the PNG total is 30,976 graphics bytes + 9,792 palette bytes;
  - 396 mixed source-owned `.rom_header` bytes count only toward overall reconstruction.
- Current **overall meaningful-ROM reconstruction** is **136,810 / 7,717,440 = 1.7727%**. Final ROM padding is excluded from this denominator.
- PRET-style ROM-space reporting is now included:
  - 7,717,440 / 8,388,608 bytes used = 91.9991%;
  - **671,168 bytes = 655.44 KiB = 8.0009% contiguous tail free space**.
- Asset/data progress is intentionally conservative. An opaque `.incbin` does not count merely because it was identified or extracted; an editable project-side representation must regenerate the retail bytes exactly.
- Progress implementation:
  - `tools/scripts/calcprogress.py`
  - `tools/progress_manifest.json`
  - authority/documentation: `docs/ASSET_DECOMPILATION.md`
- The current retail priority is now **code-coupled asset reconstruction**:
  1. identify the runtime owner/consumer before promoting an unowned resource;
  2. finish the first paired unit, animation 352 plus `func_08092CD0`, `func_080CC728` / `func_080CCE58`, and `func_080CAC7C` / `func_080CAD18`;
  3. once ownership/semantics are supported, promote that asset to editable source and repeat across the remaining simple and multi-frame animations;
  4. approach larger graphics/palette/tileset, map, and M4A families together with the loaders/renderers/providers that establish their meaning;
  5. never return to anonymous asset harvesting merely to raise the reconstruction percentage.
- Raw binary relocation does not count as progress. The target is editable, exact round-trip assets such as PNGs, maps, sequences, samples, palettes, fonts, and other proven source formats.
- Retail SHA1 remains the final authority.


## Item icon PNG source milestone - October 5, 2026

- The full retail Tool/Food/Article icon set is now editable source under `assets/item_icons/`: **81 tools + 171 foods + 95 articles = 347 PNGs**, each with a JSON sidecar and one manifest.
- `tools/packed_sprite_bank.py` decodes/encodes the packed `gUnk_086678A0` bank. For current item icons it round-trips GBA OBJ/OAM layout, 4bpp tile graphics, and BGR555 palettes.
- `asm/data/data_0813B288.s` now includes generated `build/assets/item_icon_bank.bin`; the Makefile builds it from the PNG manifest before assembly.
- All 347 item icons simultaneously rebuild the **196,736-byte (`0x30080`) bank exactly**. `make -B -j4 compare` still reports **`fomt.gba: OK`** and retail SHA1.
- A temporary one-pixel Turnip edit changed exactly one packed-bank byte, proving PNG edits are active build inputs rather than previews.
- Retail sharing is explicit: 347 sprite descriptors, 232 unique graphics spans, 302 unique palette spans. The builder rejects conflicting edits to shared graphics/palettes rather than silently using last-write-wins.
- Contact sheet: `tools/ches/checkpoints/item-icon-assets-2026-10-05/all_item_icons.png`.
- Across all 493 animations in this bank, **450 are simple one-frame/one-part/one-palette** and **43 are multi-frame**. The remaining hard frames are ordinary multi-part OAM sprites; sampled part tile offsets exactly partition their graphics blobs, so no new codec is indicated. All 347 named item icons are in the simple class.
- Detailed authority: `tools/ches/checkpoints/item-icon-assets-2026-10-05/README.md`.
- **Current follow-up:** do **not** export the 103 additional simple non-item animations anonymously. Resume `func_080CAC7C` from candidate v2, match `func_080CAD18`, identify the `func_08092CD0` owner/state-machine purpose for animation 352, then promote that asset with supported semantic ownership. Keep `func_0805E790` parked unless new structural evidence appears.
- Documentation synchronization to the code-coupled policy is complete across the live dashboard/charter/TODO, asset/decomp/custom/progress/repo/sprite docs, public README, item-icon README, and canonical Ches status/handoff. Validation: stale-current-priority scan clean, 26 live Markdown files with 0 missing relative links, and `make progress` retains the documented metrics with `fomt.gba: OK`.


## Historical item icon provider checkpoint - October 5, 2026 (superseded)

- Recovered the concrete packed sprite/animation provider used by item icon rendering.
- Added `include/sprite_animation_provider.hh` and `src/sprite_animation_provider.cc`.
- `func_0805E6CC` at `0x0805E6CC` is now readable source for the seven-pool parser. Its symbol body is **0x92 with an empty retail diff**, plus the exact 2-byte section alignment pad completing the retail **0x94-byte region**.
- `func_0805E760` at `0x0805E760` is now exact source, **0x30 / 0 differing bytes**. It is the provider's first indexed virtual lookup and returns a directly constructed packed animation `{frames, frame_count}`.
- Production linker placement is verified at the original addresses: `func_0805E6CC=0x0805E6CC`, `func_0805E760=0x0805E760`, assembly resumes at `func_0805E790=0x0805E790`, and existing `SpriteAnimator` source still begins at `0x0805E824`.
- Full validation passes: `make -j4 compare` -> `fomt.gba: OK`; `git diff --check` clean.
- At this superseded provider checkpoint, code progress was **63,896 / 940,036 = 6.7972% source**. Current progress is the 64,536-byte live total above. HEAD remains `9078f36`; October 5 work is uncommitted.
- The item icon bank `gUnk_086678A0` is a packed seven-pool resource blob. Its verified pool counts are **493, 500, 101, 1624, 342, 0, 532** with first-six entry strides **4, 16, 8, 32, 32, 8** bytes.
- For this bank:
  - pool 0 is the 493-entry animation index table `{u16 frame_count, u16 first_frame}`;
  - pool 1 is the 500-entry 16-byte sprite descriptor table;
  - pool 6 begins with 532 `SpriteAnimationFrame {u16 sprite_id, u16 duration}` records.
- Retail item definitions fully consume the animation-ID range: Tool max icon ID 469, Article max 489, Food max **492**. Therefore animation IDs **0..492** are all within a bank whose count is exactly 493. There is **no numeric headroom above the current retail maximum** for a new unique icon.
- The frame/descriptor chain is also saturated at the top end: animation 492 -> frame 531 -> sprite descriptor 499, while pool 6 has exactly 532 frames and pool 1 has exactly 500 descriptors. Frame sprite IDs span 0..499.
- A unique custom item icon therefore requires, at minimum:
  1. increase pool-0 animation count and append animation ID 493;
  2. append at least frame 532 and increase pool-6 count;
  3. add sprite descriptor 500 and increase pool-1 count;
  4. extend whichever graphics/palette sub-pools that descriptor references.
  Reusing an existing icon ID does **not** require provider expansion.
- `func_0805E790` (provider virtual +0x10) is semantically recovered but not integrated: best scratch V1 is **0x8A vs retail 0x8C / 36 differing bytes**, localized to evaluation/register scheduling. It resolves a 16-byte sprite descriptor into four pointer/u16 resource pieces. Explicit-local V2 regressed badly; do not resume syntax roulette without new evidence.
- Descriptor field interpretation is strongly supported:
  - +0 value0, +2 pool2 index;
  - +4 value1, +6 pool3 index;
  - +8 value2, +A pool4 index;
  - +C value3, +E pool5 index.
  The pointer strides are 8, 32, 32, 8 bytes respectively; values at +4/+8 are scaled by 32.
- **Superseded:** the packed-bank authoring/import step was completed by the PNG source milestone above. Keep this section as the provider-discovery evidence; do not resume `func_0805E790` scheduling work without new structural evidence.


## Save system research checkpoint - October 5, 2026

- Full forensic analysis of the save/load system completed. Comprehensive checkpoint at `tools/ches/checkpoints/save-system-research-2026-10-05/README.md`.
- Contains: writer/loader symmetry analysis, partial-write failure model, **audited** extension block design (magic/version/retail-binding checksum/extension checksum/sub-record registry), complete GameState offset map (0x34F4 bytes, ~30 sub-structures), all 18 helper/infra entries, and decompilation status summary.
- Audited extension design:
  - 16-byte header: magic bytes `FMTX` (`u32 0x58544D46` on little-endian GBA), version u16, payload length u16, retail-binding u32, extension checksum u32; leaves exactly 2,784 bytes.
  - Retail-binding checksum/fingerprint detects stale extension data when the retail write succeeds but the extension write does not. A sequence counter stored only in the extension was rejected as insufficient.
  - Sub-record registry enables multiple features (NPCs, items, crops, quests) to share the extension space independently.
  - Retail GameState layout (0x34F4 bytes) must NEVER change; custom persistent state goes in the extension tail.
- Error code asymmetry discovered: writer's 0x10000 = "size write failed" but loader's 0x10000 = "checksum mismatch". Document this before any custom save code.
- Social block is not a flat Npc array: resolver spans include 0x14, 0x18 and 0x24 records; the six Bachelorettes are 0x18 and HarvestSprites 0x24, while IDs 6/27/33 also occupy 0x18 spans with exact subtype semantics unresolved. ID 35 is the specially stored child.
- `func_08011650` decompilation remains **paused**. No production code changes made.
- **Exact next action:** return to the non-save expansion pivot. Follow the shop/item/provider lane per the prior checkpoint. Resume persistence work only when custom runtime/content systems are ready to require stored state.

## Typed shop catalogs + exact catalog helpers checkpoint - October 5, 2026

- Shop catalog reconstruction is now production source in `include/shop_catalog.hh`, `src/data_shop_catalog.cc`, and `src/shop_catalog.cc`.
- `ShopItemEntry` is the proven 8-byte retail shape: `{u32 item_or_service_id, u32 unit_price}`.
- Six retail catalog blobs are now typed source at their exact ROM positions with surgical rodata seams:
  - `gUnk_080FDDD8[13]`: Tool seed catalog.
  - `gUnk_080FDFA4[8]`: supermarket Food catalog, seven goods plus `{0,0}` terminator.
  - `gUnk_080FE050[4]`: Bodigizer/Turbojolt Food catalog.
  - `gUnk_080FE484[10]`: mixed catalog; entries 0-2 are Articles (Ball, Frisbee, Jewel of Truth), entries 3-9 are specialty-seed Tools.
  - `gUnk_080FE740[2]`: Wine/Grape Juice Food catalog.
  - `gUnk_080FE8FC[15]`: Article/special catalog.
- Critical semantic correction: `gUnk_080FE8FC` entry value `0x0A` at catalog index 10 is **not ARTICLE_WOOL_X** in this shop. It is `SHOP_SPECIAL_RECORD_PLAYER`; buying it calls `FarmHouse::AddRecordPlayer`. Entries other than that special value flow through Article storage.
- Five compact catalog-description helpers are exact production source:
  - `func_0807D1DC` seed Tool description: **0x3C / 0**.
  - `func_0807DE0C` supermarket Food description: **0x30 / 0**. Note that `0x0807DE08..0x0807DE0B` is the previous raw function's literal; the helper truly starts at `0x0807DE0C`.
  - `func_0807E51C` medicine Food description: **0x3C / 0**.
  - `func_0807F684` mixed Tool/Article description: **0x64 / 0**. Its filtered catalog index is signed `i32`; indices <=2 are Article, >2 are Tool.
  - `func_08081108` record/special description: **0x44 / 0**; catalog index 10 uses a dedicated Record Player description string.
- Full validation after all code/data integration: `make -j4 compare` and `make progress` report `fomt.gba: OK`; `git diff --check` is clean.
- Current exact code progress is **63,700 / 940,036 = 6.7763% source**, **876,336 assembly bytes = 93.2237%**. Typed rodata conversion does not increase the code percentage, so shop-data readiness improved more than the percentage shows.
- Filtered shop stock uses a common scene-local buffer at approximately `scene + 0x2A4`: a `u32 count` followed by up to **40 i32 catalog indices** at `+0x2A8`. Retail append sites guard with `count <= 0x27`.
- Proven retail stock-index domains:
  - seed catalog can expose indices 0..12;
  - medicine catalog 0..3 (conditionally ordered 0,2,1,3);
  - winery catalog 0..1;
  - mixed catalog 0..9 with ownership/availability gates on early special entries and specialty seed entries following;
  - record/special catalog 0..14 with gating; index 10 is the Record Player service;
  - supermarket is different and directly uses its seven-item catalog plus terminator rather than this filtered-list pattern.
- The four remaining purchase scenes previously flagged as 'missing catalogs' actually use **20-byte service records**, not 8-byte item catalogs: `gUnk_080FD988`, `gUnk_080FED8C`, `gUnk_080FF6A8`, and `gUnk_080FFB90`. Do not force them into `ShopItemEntry`; recover their service-record fields separately.
- Asset/provider probe: `func_0805E860` is a generic icon-resource loader, not an item-specific bound. It forwards the icon ID to the provider object's virtual slot `+0x0C`, stores the returned two-word resource pair, initializes frame/state fields, and contains no local Tool/Food/Article count check. The real graphics bound therefore lives in the concrete provider/table behind that virtual call.
- **Exact next action:** stay out of the giant shop scene bodies. Follow the concrete provider used by `func_0805E860` to recover the icon/resource table and its bounds. Only detour into the 20-byte service-record shops if that materially helps the custom-game goal.


## Exact money core + supermarket catalog frontier - October 5, 2026

- Added typed `MoneyState`, `MoneyHistory<Capacity>`, and `MoneyRecord` in `include/money.hh` and exact source in `src/money.cc`.
- `func_0809AB8C` constructor is **0x4C / 0**, `func_0809ABD8` credit is **0xE8 / 0**, and `func_0809ACC0` guarded debit is **0xE8 / 0**. Production linker resumes assembly at `func_0809ADA8`.
- Full validation passed: `make -j4 compare` -> `fomt.gba: OK`; `git diff --check` clean; linked addresses remain `0809AB8C`, `0809ABD8`, `0809ACC0`, `0809ADA8`.
- Current exact progress is **63,364 / 940,036 = 6.7406% source**, **876,672 assembly bytes = 93.2594%**. HEAD remains `9078f36`; October 5 work is uncommitted.
- Exact money semantics now source-proven: starting balance 500; credits saturate at 1,000,000,000; debits reject amounts above balance; daily/seasonal income and spend records saturate at 1,000,000,000. Daily threshold >99,999 sets flag bit 0; balance >99,999,999 sets flag bit 1.
- The recovered history container is `u32 count` followed by fixed 8-byte `{income, spend}` records. Exact `push_back` uses placement-new into raw storage at `count * 8 + 4`; exact `back()` decrements a copied index before indexing.
- Shop acquisition research isolated a general 8-byte catalog entry shape `{u32 item_id, u32 unit_price}`. In `func_0807DE3C`, scene `+0x6A4` indexes `gUnk_080FDFA4`; the same entry drives display, affordability, debit, held-item placement, Rucksack insertion, and Fridge overflow.
- `gUnk_080FDFA4` is the 0x40-byte supermarket food catalog: Rice Ball 100G, Bread 100G, Oil 50G, Flour/FLOWER 50G, Curry Powder 50G, Muffin Mix 100G, Chocolate 100G, then `{0,0}`.
- Data-section verification: `gUnk_080FDFA4` is at line 1077 inside the initial `.rodata` section; the next existing split is only at line 2085. A surgical data split at this symbol is therefore available.
- Additional behavior-filtered 8-byte purchase catalogs were found at `gUnk_080FDDD8`, `gUnk_080FE050`, `gUnk_080FE484`, `gUnk_080FE740`, and `gUnk_080FE8FC`; keep them provisional until each caller/type is verified.
- **Exact next action:** promote `gUnk_080FDFA4` into a typed `ShopItemEntry const` source array with a rodata split, require full-ROM SHA1 exact, then use that type to generalize sibling shop catalogs. Do not decompile the giant shop scene yet.


## Article mutation + economy frontier checkpoint - October 5, 2026

- `func_0801D7B0` (GameObject runtime vtable `+0xE4`) is now exact readable source inside `src/game_object_article_interaction.cc`. The decisive source shape used two lookup-record aliases (`result_x`, `result_y`) around the field-grid lookup. Scratch V16 has symbol size 0xDA plus the exact 2-byte section alignment pad, for a complete **0xDC-byte retail section with 0 differing bytes**.
- Production now owns the contiguous item-interaction pair in one source object: `func_0801D7B0` at `0x0801D7B0` applies the article and refreshes neighboring field visuals; `func_0801D88C` at `0x0801D88C` classifies handled/blocked/unhandled. Assembly resumes at `func_0801D8CC`.
- Full production verification passed: `make -j4 compare` -> `fomt.gba: OK`; linked symbols are exactly `0801d7b0`, `0801d88c`, `0801d8cc`; `git diff --check` is clean.
- Current exact worktree progress is **62,824 / 940,036 = 6.6831% source**, **877,212 assembly bytes = 93.3169%**. HEAD remains `9078f36`; October 5 work remains uncommitted.
- `func_0801C0F8` stays parked at semantic recovery plus **0xA0 / 4 differing bytes**. Do not reopen its equivalent lower-bound branch spelling without new evidence.
- The next item/acquisition lane was narrowed to the shared player-money object used by shops and shipping. Binary-proven anchors remain `GameState + 0x1AA8`, starting balance 500, saturating credit to 1,000,000,000, and guarded debit.
- New scratch `candidate-money-init-v1.cc` exactly matches `func_0809AB8C` at **0x4C / 0 differing linked bytes**. The recovered layout includes balance at +0x00, two flag bits at +0x04, daily count at +0x08, seasonal count at +0xFC, and four maxima at +0x120..+0x12C; constructor calls `func_0809AE6C` after initialization.
- **Exact next action:** promote the exact money initializer into a typed `MoneyState` source/header boundary and linker split at `0x0809AB8C`, full-ROM verify, then use that type to decompile the adjacent credit/debit pair `func_0809ABD8` and `func_0809ACC0`. Do not jump into giant shop/menu bodies yet.

## Item article-interaction exact checkpoint - October 5, 2026

This is a historical retail-decomp checkpoint preserved from the earlier non-save expansion pivot; the top checkpoint owns current work.

- Corrected an important vtable interpretation error: `GameObject` stores `vtable_unk_080E5EC4` itself as its vptr, so runtime slot `+0xE8` is table label `+0xE8`, not `+0xF0`. Raw retail table `0x080E5EC4 + 0xE8` contains `0x0801D88D`, so the real Thumb target is **`0x0801D88C`**. The previously documented `0x0801CFB8` is the unrelated `+0xF0` slot.
- `func_0801D88C` is now exact readable source in `src/game_object_article_interaction.cc`: **0x40 / 0 differing linked bytes** in scratch and exact at linked address `0x0801D88C` after production integration. It resolves a field plot for the supplied `Location`, returns article-interaction result 2 when no plot exists, otherwise delegates to `FieldPlot::method_0800A6C8(article)` and returns 0 for handled or 1 for blocked.
- The constructor-time `vtable_unk_080E6038` has the same 0x168 span but points `+0xE8` to the pure-virtual stub `0x08000639`; the other large `0x080E7xxx/0x080E8xxx` tables are unrelated class families. No second concrete GameObject `+0xE8` override was found.
- Production seam: `asm/game_state.s` now splits at `0x0801D88C`, `fomt.lds` inserts `src/game_object_article_interaction.o(.text)`, then assembly resumes at `func_0801D8CC`. `make -j4 compare`, `make progress`, linked-symbol checks, and `git diff --check` all pass; `fomt.gba: OK`.
- Current exact worktree progress is **62,604 / 940,036 = 6.6597% source**, **877,432 assembly bytes = 93.3403%**. HEAD is still `9078f36`; the October 5 source integrations remain uncommitted.
- The supporting field-plot resolver `func_0801C0F8` is semantically recovered: map 2 only; world coordinates divide by 8; valid tile bounds x 0x22..0x77 / y 0x16..0x47; 43x25 plot grid; output record is 12 bytes containing `FieldPlot *`, anchor x/y, and plot x/y. Scratch V2/V4 are exact size **0xA0 / 4 differing bytes**, only equivalent lower-bound branch spelling (`cmp 34; bcc` vs `cmp 33; bls`). Park this helper instead of syntax roulette.
- The immediately preceding GameObject virtual at runtime `+0xE4`, Thumb **`0x0801D7B0`**, is the article mutation partner. It is the ROM's only direct caller of `FieldPlot::method_0800A6F4`: resolve plot, apply Stone/Branch/Lumber/Golden-Lumber state, require current map match, choose vertical neighbor plots, call `FieldPlot::method_0800AF5C`, then `func_080AA6D0` for field visual/update refresh. Scratch V3/V4 reach exact retail size **0xDC** with **106 differing linked bytes**. The front half through the map check is already structurally aligned; remaining differences are register/lifetime/order in the neighbor-refresh half.
- **Exact next action:** resume from `candidate-gameobject-apply-article-v4.cc` (V3 is equivalent at 0xDC/106). Preserve the solved front half and explicit neighbor-validity boolean shape. Focus only on the post-`0x0801D7F4` live-range/register arrangement so retail can reuse r4/r5/r6 without the candidate's extra saved r7. Do not reopen `0x0801CFB8`, the exact `+0xE8` function, the 4-byte `func_0801C0F8` branch spelling, save-loader work, or compiler research without new structural evidence.

## Documentation reconciliation checkpoint - October 5, 2026

This section records the completed docs sweep after the character/social integration and item/tool pivot.

- Updated live/canonical docs: `AGENTS.md`, `START_HERE.md`, `docs/CHARACTERS.md`, `docs/CUSTOM_CHARACTERS.md`, `docs/CUSTOM_GAME_EXPANSION.md`, `docs/DECOMP_NOTES.md`, `docs/DECOMP_PLAYBOOK.md`, `docs/DECOMP_PRIORITY_MAP.md`, `docs/FOMT_COMPILER_RESEARCH.md`, `docs/PROGRESS.md`, and `docs/REPO_MAP.md`.
- `README.md` and `docs/SAVE_FORMAT.md` were reviewed and did not need a new change: README stays intentionally generic; SAVE_FORMAT already marks persistence/save-loader work paused.
- All live docs now report the exact October 5 worktree state: **62,540 / 940,036 = 6.6529% source**, **877,496 assembly bytes**, `fomt.gba: OK`, retail SHA1 unchanged. HEAD remains `9078f36`; the October 5 source integrations are still uncommitted.
- Character docs now record both exact resolver blocks, social native calls 124..133 (NPC friendship/talk/gift), 134..136 (bachelorette love), exact `func_08045584`, and parked `func_080455D8` at an exact-size five-byte setup-order mismatch.
- Expansion/priority docs now make the item/tool lane first: recover/type the GameObject article-interaction virtual at runtime `+0xE8`, base Thumb target `0x0801CFB8`, and map concrete overrides. New tool/food/article IDs fit existing u8 IDs; product-count growth is explicitly deferred because `ShippingBin::product_stats[NUM_PRODUCTS]` changes persistent state layout.
- Compiler docs now explicitly state that neither the paused save loader nor parked `func_080455D8` justifies compiler research. No compiler changes were made.
- Verification completed: focused stale-live-state grep returned no matches; `git diff --check` passed; `make progress` returned `fomt.gba: OK` at 62,540 source bytes.
- No commit or push was performed.
- **Exact next action remains unchanged:** inspect/decompile the GameObject article-interaction vtable `+0xE8` base target at Thumb `0x0801CFB8`, identify concrete overrides, type the smallest honest interface, and exact-match one bounded article-interaction implementation. Save/product persistence work remains paused.
## Item/tool expansion boundary checkpoint - October 5, 2026

This is a historical checkpoint preserved from the earlier non-save expansion pivot; the top checkpoint owns current work.

- `func_080455D8` is now **parked, not blocking**. Its behavior is fully understood and scratch V4/V6 both compile to the exact 0x60-byte size with only **5 differing linked bytes**, all from one setup-order difference: retail emits stack-argument address materialization before the u16 event-id normalize, while the tracked compiler schedules those three instructions in the opposite order. The function body after that setup is instruction-identical. Do not spin more source/compiler variants unless a later exact-match batch naturally reveals the original shape.
- Current retail item ID spaces:
  - tools: **81** entries, IDs 0x00..0x50;
  - foods: **171** entries, IDs 0x00..0xAA;
  - articles: **95** entries, IDs 0x00..0x5E;
  - products: **103** entries, IDs 0x00..0x66.
- Tool/Food/Article/Product runtime IDs are stored in u8 fields. The metadata tables and validity checks are generated from `data/item/*.def` and `NUM_*` / `*_NONE`, so there is substantial ID headroom before 255 and no immediate need to widen the basic item ID representation.
- Important split for custom-game design:
  - adding a tool/food/article ID can reuse the existing u8 inventory/held-item representation without changing those object sizes;
  - adding a **product** grows `ShippingBin::product_stats[NUM_PRODUCTS]`, which is embedded inside `Farm` / game state, so product-count growth changes persistent state layout. Treat new shippable products as persistence-sensitive and keep them out of the first non-save prototype.
- Product conversion is data-driven: `Product(Food)` and `Product(Article)` scan `gProductInfo` up to `PRODUCT_NONE`. Product names/icons delegate back to the underlying Food/Article. This automatically follows an expanded product table, but the embedded shipping-stat array remains the structural blocker.
- Held-item representation has a 3-bit **kind** but Food and Article IDs remain u8, so a new ordinary food/article does not require a new held-item kind.
- `FarmerEntity::ClassifyHeldItemAction()` is the key runtime behavior gate:
  - food defaults to throw;
  - article IDs default to throw;
  - `ARTICLE_BALL` gets the special throw-ball path;
  - only Stones, Branches, Lumber, and Golden Lumber fall through to the GameObject article-interaction virtual;
  - that virtual is called through vtable offset **+0xE8** and returns handled / blocked / unhandled (0/1/2).
  Therefore a new interactable/placeable article will require extending this hardcoded article classification or replacing it with a more extensible policy.
- `FieldPlot::method_0800A6C8` / `method_0800A6F4` are the field-side handlers for Stones, Branches, Lumber, and Golden Lumber, mapping them to field plot state IDs 0x16/0x17/0x18/0x1A.
- The typed `GameObject` declaration currently stops at vtable +0x68, so the +0xE8 article-interaction slot is still an untyped architectural boundary. The main GameObject vtable is `vtable_unk_080E5EC4`; accounting for the GCC vtable header, the +0xE8 runtime slot corresponds to vtable word at label +0xF0, currently pointer **0x0801CFB9** (Thumb target 0x0801CFB8).
- **Exact next action:** inspect/decompile the GameObject +0xE8 target at 0x0801CFB8 with Thumb disassembly, identify its semantics and adjacent overrides across concrete GameObject vtables, then decide the smallest typed interface needed to expose article interaction safely. After that, choose one small concrete article-interaction implementation as the first item-lane exact C++ contribution. Do not expand ShippingBin/product count yet; save-loader work remains paused.

## Character social + heart-event integration checkpoint - October 5, 2026

This is a historical checkpoint preserved from the earlier non-save expansion pivot; the top checkpoint owns current work.

- Production retail exactness remains intact: after all integrations below, `make -j4` ends with **`fomt.gba: OK`**.
- Newly sourced exact retail block `080A01F8..080A03B7` (**0x1C0 / 448 bytes**) now lives in `src/character_info.cc`. It contains:
  - `func_080A01F8`: fixed six-bachelorette resolver;
  - `func_080A02B0`: Harvest Sprite resolver by character ID 36..42;
  - `func_080A031C`: Harvest Sprite resolver by sprite index 0..6;
  - `func_080A0384`: child resolver;
  - `func_080A039C`: 3-bit child-state getter;
  - `func_080A03A4`: matching 3-bit setter. The exact old-GCC source uses r1/r2/r3 register constraints plus an empty r2 clobber barrier; V7 matched the entire 448-byte block at **0 differing bytes**.
- Newly sourced exact retail block `080A06B0..080A0A1B` (**0x36C / 876 bytes**) now lives in `src/character_social.cc`. Whole-block scratch proof was **0 differing bytes**, and the integrated ROM remains exact. It contains the broad NPC resolver, fixed six-bachelorette resolver, both Harvest Sprite resolvers, and duplicate child resolver.
- Newly sourced heart-event helper `func_08045584` now lives in `src/heart_event_days.cc`. Its **0x52 instruction bytes are exact**; retail's following 2-byte alignment is supplied by the linker split, and the full ROM remains exact. Semantics:
  - resolve the requested bachelorette through `func_080A0878`;
  - for player events, return days-since-player-event only when player event count == 5;
  - for rival events, return days-since-rival-event only when rival event count == 4;
  - otherwise return 0.
- Native social-script API inside `func_0803F8DC` is now mapped:
  - call 124 = get friendship
  - 125 = add friendship
  - 126 = set friendship
  - 127 = days since last spoken
  - 128 = mark spoken
  - 129 = spoken today
  - 130 = spoken just now
  - 131 = met
  - 132 = mark gifted
  - 133 = gifted today
  - 134 = get love
  - 135 = add love
  - 136 = set love
- Calls 124..133 all gate through broad NPC resolver `func_080A06B0`; calls 134..136 gate through fixed bachelorette resolver `func_080A0878`. Heart-event condition/update helpers also gate through `func_080A0878`. Therefore a future added bachelorette must extend this resolver path or be unreachable from both love and heart-event logic.
- Production files changed this turn include `src/character_info.cc`, new `src/character_social.cc`, new `src/heart_event_days.cc`, `asm/code_809E804.s`, `asm/code_0803EE94.s`, and `fomt.lds`. No commit/push was made.
- **Exact next action:** decompile and exact-match the next bounded heart-event helper `func_080455D8` (`080455D8..08045637`, 0x60 bytes). Use the now-sourced `func_080A0878` and existing `Bachelorette` methods. If it matches cleanly, integrate it with another small linker split. Do not take on `func_08045638` unless its remaining behavior is still high-leverage and bounded; otherwise document its interfaces and pivot to the item/tool extension lane. Save-loader work remains paused.

## Character social resolver throughput checkpoint - October 5, 2026

This is a historical decomp checkpoint preserved from the earlier non-save expansion pivot; the top checkpoint owns current work.

- Scratch exact matches under the tracked compiler:
  - `func_080A06B0`: **0x1C8 / 0 differing bytes**. It is the broad NPC/social-record resolver and matches the already-proven `GetCharacterNpc` source shape when the child case calls `func_080A0A04`.
  - `func_080A0878`: **0xB8 / 0**. Fixed six-bachelorette resolver.
  - `func_080A0930`: **0x6C / 0**. Harvest Sprite resolver by character ID 36..42.
  - `func_080A099C`: **0x68 / 0**. Harvest Sprite resolver by sprite index 0..6.
- The earlier contiguous resolver block immediately after `character_info.cc`, retail `080A01F8..080A03B7` (**0x1C0 / 448 bytes**), was reconstructed as six C++ functions. V3 is exact size with only **7 differing linked bytes**, all inside the final 20-byte setter `func_080A03A4`.
- Therefore the first five functions in that block are already instruction-exact:
  - `func_080A01F8` bachelorette resolver, 0xB8;
  - `func_080A02B0` Harvest Sprite resolver by character ID, 0x6C;
  - `func_080A031C` Harvest Sprite resolver by index, 0x68;
  - `func_080A0384` child resolver, 0x16 instruction bytes plus retail alignment;
  - `func_080A039C` 3-bit child-state getter, 0x08.
- `func_080A0A04` is a later byte-for-byte duplicate child resolver. Its V2 scratch emits the exact retail instruction sequence; compare reports 0x16 symbol bytes versus the 0x18 bounded region solely because the following retail function alignment contributes two zero bytes.
- `func_080A03A4` semantics are solved: preserve byte 3 except bits 2..4 and replace those bits with `value & 7`. V3 differs only by register assignment. Retail keeps the incoming value in r1, uses r2 for mask/result, and r3 for the old byte; V3 swaps the r1/r2 roles after the initial `mov r2,#7`.
- Saved artifacts: `tools/ches/checkpoints/custom-expansion-2026-10-05/`, especially `candidate-character-social-block.cc`, `candidate-npc-resolver.cc`, and `match/character-social-block-v3.*`.
- **Exact next action:** perform only a small source-shape adjustment for `func_080A03A4` to keep the masked input in r1 and mask/result in r2. Once the whole `080A01F8..080A03B7` block is 0-diff, integrate that block into `src/character_info.cc`, trim the corresponding bytes from `.text.after_character_info`, and run the authoritative full-ROM compare. Then return to the later exact resolver family `080A06B0..080A0A04` for a second integration split. Do not reopen save-loader work.

## Non-save custom-game expansion pivot - October 5, 2026

This is the authoritative live direction and supersedes the save-loader exact-next-action sections below.

- Production remains `ches-dev` at `9078f36`; the retail ROM remains exact. No retail code/compiler change is made by this pivot.
- Legacy save loader `func_08011650` is **paused, not abandoned**. Preserve its checkpoint and do not spend more time on its compiler-sensitive zero/register problem unless explicitly resumed or required by a later persistence feature.
- Active goal: recover the non-save retail boundaries that let the separate custom-game branch add/extend NPCs, bachelorettes, items, tools, crops, dialogue/events, inventory/shops and assets.
- Use throughput-first target selection. Prefer coherent small/medium clusters and semantic/type leverage. A hard function may remain assembly after its behavior/interface is understood; checkpoint compiler archaeology and rotate.
- Character first frontier is now concrete: `func_080A0878` is the fixed six-bachelorette social-state resolver. Analyze/decompile it first, then the broader NPC resolver `func_080A06B0` and the bounded call sites in giant dispatcher `func_0803F8DC` that implement friendship/gift/love/event operations. Do not attack `func_0803F8DC` monolithically.
- Item/tool lane is already relatively mature: item definition tables, wrappers, rucksack/tool chest, held-item helpers, and `FarmerEntity::ClassifyHeldItemAction` are readable. Its next need is a fixed-ID/bounds/consumer audit and unresolved action/provider/shop helpers, not basic item-class reconstruction.
- Crop lane follows: recover semantic `FieldPlot` planting/growth/harvest/tool transitions and their item/product links.
- Dialogue/event/asset lane follows: native trigger/call registration plus Mary/script and portrait/display/provider round trips.
- Cross-system roadmap: `docs/CUSTOM_GAME_EXPANSION.md`.
- First pivot result: `func_080A0878` is confirmed as a fixed six-entry `Bachelorette *` resolver. Character IDs 3/12/19/21/25/31 map to social offsets 0x098/0x154/0x1E4/0x210/0x264/0x2E4 respectively; every other ID returns null. These offsets exactly match the existing Popuri/Mary/Karen/Elli/Ann/Harvest-Goddess social records.
- **Exact next action:** create one private scratch C++ candidate for `func_080A0878` using the existing `Bachelorette` type and character-ID constants, compile/compare it against 0x080A0878..0x080A092D, and promote only if exact. Then evaluate `func_080A06B0` as the broader NPC resolver and batch adjacent resolver helpers if straightforward. Do not attack `func_0803F8DC` monolithically.

## Nested ActorLocation boundary microprobe closure - October 5, 2026

This is the authoritative live loader checkpoint and supersedes the Dog/Farmer microprobe action below.

- Production remains unchanged at `9078f36`; no retail source, assembly, linker input, or tracked production compiler input changed.
- The one authorized source probe, `nested-actorlocation-zero-boundary-probe.cc`, was compiled under the normal tracked compiler with full `-da` dumps. It does produce a useful later ownership split: the early/source zero becomes r5, the post-copy narrow zero becomes r6 and owns the three later string clears, while `state+4` and the first-fill const-reference scalar remain on r5.
- Retail disassembly closes literal transplantation of that mechanism: the real `+0x1CCC` block has direct mask/field operations and no six-byte `memcpy` call. The aggregate-copy shape can only be an oracle, not the loader's literal source shape.
- **Important correction to the prior gate:** `proof-v96-da-current` is the private `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO=1` oracle, not stock tracked-compiler v96. Stock v96 is the recorded `proof-v96-stockzero-detail` result at exact size **0x2E4 / 495 differing bytes**; its generated code collapses the early/source/string zero family into r8 and sends the shared -125 mask to r9. The private v96 oracle instead creates the retail-like early r9 / later r5 split but still wrongly gives the first-fill scalar to r5.
- The exact same microprobe source was also compiled once under the existing private distinct-zero oracle only to compare environments, not as a second source experiment. It still fails the retail bridge: early/source zero stays r5; the post-copy facing zero is r6; the explicit later string zero is preserved separately in r4; the first-fill scalar remains r5. It never creates retail's initial low-zero -> high-r9 bridge.
- Therefore the **nested temporary + six-byte memcpy + post-copy zero field hypothesis is CLOSED as a transferable loader mechanism**. Do not spin variants, add a loader memcpy, reopen typed Location/placement forms, or reinterpret the private v96 oracle as stock behavior.
- The strongest remaining natural-source evidence is the existing stock `loader-constructor-zero-oracle.cc`, which already reproduces the complete desired ownership topology, versus stock `diagnostic-loader-constructor-full.cc`, whose first CSE over-merges the later `string_zero`. Typed `GameTime` was already tested and closed.
- **Exact next action:** read-only compare those two existing constructor artifacts at RTL -> first CSE around the later `string_zero` birth and first-fill const-reference temporary. Identify the precise source/RTL discriminator that lets the small stock oracle keep the later zero separate but makes the full stock constructor merge it. Focus on scope/lifetime, intervening calls, addressability/addressof, mode, and initializer/member boundaries. Do not create a new full loader candidate or compiler rule until that discriminator is isolated.

## Dog/Farmer nested ActorLocation zero-boundary checkpoint - October 5, 2026

This is the authoritative live loader checkpoint and supersedes older exact-next-action sections below.

- Production remains unchanged at `9078f36`; no retail source, assembly, linker input, or tracked production compiler input changed. New work is private save-loader oracle/research material only.
- Built `tools/ches/checkpoints/save-loader-08011650-2026-10-04/dog-ctor-oracle/` from the saved exact preprocessed Dog source and compiled it with the normal tracked 13-rule compiler plus `-da`. Extracted `.text` is byte-identical to `build/src/dog.o`, so these pass dumps are a trusted exact-source oracle.
- Dog's source `Pet(name, ActorLocation(Location(2,0x17E,0x52), 0), 1)` creates an independent SImode facing zero (`reg112 = 0`). The inlined ActorLocation construction copies the six-byte Location with `memcpy`, then writes the low byte of that zero at +6. CSE preserves the zero identity; flow is **4 refs/live29/crosses 2 calls**, lreg **4 refs/live58/crosses 2 calls**. That identity is later reused for one Dog zero field while a separate equal zero remains for another.
- Farmer source `location(Location(2,0,0), 0)` shows the same nested temporary/copy/post-copy pattern. Its facing argument begins as independent SImode `reg132 = 0`; first CSE canonicalizes that value to earlier HI zero `reg62`, which survives the six-byte memcpy at **2 refs/live20 -> 2 refs/live40**, crosses one call, and naturally allocates to **r5**.
- This identifies the missing discriminator more tightly than the prior handoff: the promising mechanism is **nested aggregate temporary + six-byte memcpy + post-copy narrow zero field**, not merely constructor syntax, typed Location, or literal zero spelling.
- v65 is closed more strongly by this comparison. It constructs Location directly in place and therefore lacks the exact boundary above. Do not retry v65, typed Location assignment, placement new, broad constructor-form loader rewrites, typed calendar/time, v90 reload work, v95 all-literal merging, hard registers, volatile/padding, or compiler-family hunting.
- **Exact next action:** make one and only one small v96/plain-function ABI microprobe for the proven boundary. Use a minimal six-byte POD inner value and seven/eight-byte outer temporary, copy six bytes, then store a zero byte after the copy. Compile under the normal tracked compiler with full pass dumps. Accept the hypothesis only if it preserves v96's good header/old-zero ownership, naturally creates the later low zero needed around +0x1CCC/string clearing, and does not steal the first-fill scalar from the earlier zero. If it fails, record the failure and close this boundary hypothesis before creating any new full loader candidate.

## Constructor-zero / natural distinct-zero checkpoint - October 5, 2026

- Production remains unchanged at `9078f36`. No retail source, assembly, linker input, or tracked production compiler input changed. This continuation added only private research/oracle artifacts.
- **ResourceManager exact-source oracle is decisive.** `ResourceManager::ResourceManager()` has zero-valued member initializers and `fill_inl(..., 0)`. Initial RTL creates a fresh zero pseudo for the literal fill argument, but first CSE deletes that fresh pseudo and rewrites the fill const-reference slot to the earlier constructor-generated zero. By flow, one zero owns the constructor member zeros and the fill argument. This is normal tracked-compiler behavior, not a diagnostic rule.
- This proves the loader's desired first-fill ownership can arise naturally from constructor/member-initializer source shape. It also explains why plain literal `fill_n_inl(...,0)` in v96 creates the wrong competing zero when the earlier zero is modeled as a source user variable rather than constructor-generated compiler state.
- A focused constructor microprobe `loader-constructor-zero-oracle.cc` was built under the normal tracked compiler. Its zero-valued member initializers naturally produce one long-lived zero that survives four calls, owns two early word clears, year, a later full-width zero field, and the first `fill_n` const-reference scalar. A later `string_zero` remains separate. This is the first normal tracked-compiler microprobe to reproduce the complete desired ownership topology without a private zero-rewrite hook.
- A private full-loader structural diagnostic `diagnostic-loader-constructor-full.cc` was then built. Under the **normal tracked compiler**, its prologue is structurally retail-exact:
  `mov r0,#0; mov r8,r0; str r0,[this+8]; str r0,[this+0xC]; mov low,r8; strb low,[this+0x10]`.
  Thus constructor/member initialization naturally explains the retail low-zero -> high-copy -> two word stores -> high-to-low year bridge. The only allocation difference is long-lived zero r8 instead of retail r9.
- In that full constructor diagnostic, tracked CSE over-merges the later `string_zero`: state+4, all three string clears, and the first-fill const-reference scalar all use constructor zero r8. Flow/lreg show constructor zero reg26 at **9 refs/live102 -> 9/live204**. This is too merged.
- With the existing private `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO=1` diagnostic, the same full constructor source immediately restores retail-like string separation: constructor zero remains r8 for state+4 and first fill, while a distinct r5 clears the three strings. This is causal evidence only; the private flag is not production authority.
- Linked comparison of the whole constructor-form diagnostic is poor as a final candidate (tracked **0x2E8 / 630**, private **0x2EC / 633**) because changing the entire function into a C++ constructor perturbs ABI/register allocation far beyond the zero islands. Treat it as a structural oracle, not a v104/source candidate.
- A constructor + typed `GameTime` full-loader probe was tested because the small oracle's later zero appeared near the calendar update. It does **not** separate the strings under the tracked compiler and is closed. Retail binary also proves the loader's halfword clock mask literal is signed `0xFFFFF81F`; the small oracle's unsigned `0x0000F81F` helper-zero behavior is diagnostic only.
- Direct typed `Location` assignments were re-audited read-only and remain closed: v47 does not naturally materialize the retail r5 in the Location block. Historical v64 placement construction and v65 inline 3-argument constructor helper already tested Location constructor semantics; placement adds a null guard and the helper creates the wrong extra high zero. Do not repeat them.
- v90 was re-read as an allocation oracle. Its two literal weather stores naturally create the low-reference compiler zero in r9 and first fill already uses r9, but header year rematerializes a fresh low zero and state+4 collapses to the later string zero. Historical reload tracing already demoted this path; do not reopen broad reload work.
- v95 fully merged literal-zero source is still closed: merging year/state into the compiler zero makes the family too heavy and sends it back to r8.
- **New exact-source corpus result:** automated first-CSE scanning of the 54 exact-source Call238 modules found **59 functions where two or more equal zero pseudos survive CSE simultaneously**. Therefore distinct equal-zero identities are routine production behavior and do not require a Nintendo-only special rule.
- Constructor examples are especially relevant: BarnAnimal, Chicken, Dog, Horse, Farmer, Rucksack, and `Unk_Actor_0809BFE8` all retain multiple zero identities of SI/HI/QI modes.
- `Dog::Dog(char const*)` is a strong exact-source precedent. Source `: Pet(name, ActorLocation(Location(2,0x17E,0x52), 0), 1)` creates a distinct SImode zero pseudo for the nested `ActorLocation(..., facing=0)` argument. Flow keeps that zero as a user variable across the nested constructor/memcpy boundary while other zero-valued Dog fields later use separate zero identities. This proves constructor-argument/member boundaries can naturally preserve equal zeros under the stock tracked compiler.
- The loader's remaining source problem is therefore no longer “can GCC preserve separate zeros?” It can. The narrow question is **which real source boundary around the +0x1CCC Location/string phase gives retail's later r5 zero a distinct identity while allowing the earlier compiler/constructor zero to own weather/year/state+4/first-fill**.
- **Exact next action:** stay source-structural and read-only first. Compare the exact Dog/Farmer constructor pass patterns that preserve multiple zero identities against historical v65's inlined Location-helper zero lifetime. Identify the discriminator (constructor parameter, nested temporary, mode, call/memcpy boundary, or lifetime/death notes) that keeps Dog's later zero distinct without making it a long-lived high-register family. Only then create one small microprobe in the mature v96/plain-function ABI. Do not retry typed Location assignments, placement new, the v65 helper itself, typed calendar/time, v90 reload diagnostics, all-literal v95, hard registers, volatile/padding, or compiler-family hunting. Do not promote the whole constructor-form loader as v104.

## Natural post-flow ref-drop evidence - October 5, 2026

- Production remains unchanged at `9078f36`. No retail source, assembly, linker input, or tracked production compiler input changed. This pass added only private research artifacts under the save-loader checkpoint.
- The five-ref/r9 conclusion from the prior checkpoint still stands. Do not resume work on old-zero allocation itself.
- Separate-year pass history was traced through RTL/CSE/combine/flow/lreg/greg. Its independent year pseudo is allocated directly to low `r0`; global allocation then deletes its explicit zero materialization because the weather-store `r0=0` is still available. This explains why separate-year cannot naturally emit retail's `mov low,r9; strb year`.
- v96 remains the best natural explanation for the retail header bridge. Its source shape naturally emits `mov r0,#0; mov r9,r0; str r0,[state+8]; str r0,[header+4]; mov low,r9; strb year`. Its only causal defect is that a later compiler-created zero identity steals the dead first-fill const-reference scalar.
- The saved private v96 flow-lifetime oracle was re-verified: it combines the retail-correct header/year bridge with old zero at **5 refs/live200 -> r9**, mask -> r8, and first-fill `[sp+4]` sourced from r9. It remains diagnostic only.
- A byte-exact `m4aMPlayStart` pass oracle was generated at `m4a-mplaystart-oracle/`. Exact FoMT source proves a high-register zero can later be copied low for a byte store, but that example requires an intervening `TrackStop()` call and therefore does not by itself explain the loader's call-free year bridge.
- A ROM-wide high-zero/low-reload census found many call-free retail examples, but the call-free examples are still assembly-only in the current decomp; no already-source-matched call-free analogue was found.
- The existing Call238 `full-flow-regression` corpus contains 54 preprocessed exact-source C++ modules. Those exact `.i` snapshots were compiled once with the tracked production compatibility compiler and `-da` into `natural-refdrop-corpus/`; all **54/54** compiled successfully. `natural-refdrop.tsv` records the automated comparison.
- The corpus proves post-flow reference loss with preserved or doubled lifetime is ordinary production compiler behavior: **54 register cases across 34 functions in 18 modules** have `flow refs > lreg refs` while `lreg live >= flow live`.
- `FarmHouse::FarmHouse()` provides several exact-source constant precedents where one reference disappears and the live length doubles, e.g. `-3: 3 refs/live44 -> 2/live88`, `-5: 3/42 -> 2/84`, `-9: 4/40 -> 3/80`, through `-65: 4/34 -> 3/68`. Therefore stale/doubled lifetime after a physical-use reduction is not unique to the private loader diagnostic.
- Two exact-source **zero** precedents were found in `src/code_actor_0809BFE8.cc`:
  - `func_0809C32C`: source `unsigned int result = 0`; flow **4 refs/live39/set2**, lreg **3 refs/live78/set2**.
  - `func_0809C38C`: source `unsigned int result = 0`; flow **4 refs/live29/set2**, lreg **3 refs/live58/set2**.
- The responsible natural transformation is **combine**. In `func_0809C32C`, flow still contains a boolean-normalization tail using `result` twice (`neg`, `or`, `>>31`); combine collapses that tail to a copy/self form. Local allocation later sees one fewer reference while the older lifetime accounting survives and doubles. This is the same class of accounting event modeled by the successful v96 flow-lifetime diagnostic.
- The focused diagnostic hook was inspected directly. It rewrites the first-fill full-width zero store from the compiler-created zero pseudo to the recent source/user zero, while deliberately preserving the compiler-zero's flow lifetime bookkeeping. Normal v96 combine has `[sp+4] <- reg33`; diagnostic combine has `[sp+4] <- reg27` while stale reg33 dead/equivalence notes remain. This is causal evidence, not a production rule.
- The frontend origin of the competing v96 zero is now explicit. `fill_n_inl(I,S,V const&)` binds literal `0` through a const-reference temporary. Initial RTL creates a fresh zero temporary and an addressable slot for that argument; CSE later canonicalizes it to the competing compiler-zero family. That is why v96's literal first fill steals the dead scalar.
- Explicitly passing source `zero` to the first `fill_n_inl` is already closed and was **not** retried: v98 (0x2DC/566), v76, v86 and v27 cover that family and spill/extend the source zero incorrectly.
- Direct exact-source template precedents were checked. `Barn::Barn()` uses `fill_n_inl(...,-1)`; the literal is materialized as its own const-reference temporary and carried into the fill loop rather than being replaced by an older equal constant. This agrees with the v96 competing-zero behavior.
- A newer exact source oracle for `ResourceManager` was started at `resource-fill-zero-oracle/`. Its constructor uses `fill_inl(occupied.begin(), occupied.end(), 0)`, making it the closest exact-source literal-zero const-reference analogue. Pass dumps were generated successfully, but detailed pass comparison was intentionally deferred at the checkpoint boundary.
- **Updated frontier:** the historical mechanism should be sought in normal post-flow/combine simplification around the const-reference temporary, not in another year-zero spelling and not in old-zero allocation. Exact FoMT code now proves that the required ref-drop/stale-lifetime accounting class is real.
- **Exact next action:** inspect `resource-fill-zero-oracle/resource_handle.i.{rtl,flow,combine,lreg}` around source line 94 and the inline `fill_inl` body. Determine whether its literal-zero const-reference temporary loses/replaces a reference after flow and whether an earlier equal zero identity participates. Then classify the 54 natural-refdrop corpus cases by the first pass where the reference disappears, prioritizing constructor/template/MEM cases. Do not create a new loader candidate until a normal compiler transformation from these exact-source oracles explains how v96's first-fill store could become old-zero27 while retaining the compiler-zero lifetime.

## Separate-year full-loader checkpoint - five-ref r9 achieved - October 5, 2026

- Production remains unchanged at `9078f36`. No retail source, assembly, linker input, or tracked production compiler input changed. This pass added only private research/oracle artifacts.
- A byte-exact real-source compiler oracle was created from `src/farmer.cc` at `farmer-ctor-oracle/`. Recompiling the current exact `Farmer::Farmer(char const *, GameDate const &)` with `-da` produced machine instructions/relocations identical to `build/src/farmer.o` for that constructor. Whole-object bytes differ only because the private artifact has different metadata/debug context. This makes its pass dumps a trustworthy source-style/compiler oracle.
- The Farmer oracle confirms original FoMT source style heavily uses member-initializer lists and nested temporary constructors. It also shows old GCC naturally creates multiple independent zero pseudos for distinct member initializers/nested objects rather than requiring one hand-written zero local.
- The MFoMT-derived nested calendar probe `game-data-nested-calendar-probe.cc` was tested. A nested 4-byte calendar subobject after the two weather words is semantically plausible, but old GCC collapses weather/year/later-state/first-fill zeros into one family. Closed as a matching mechanism.
- A ROM-wide pattern census found many generic low-zero/high-register-copy patterns, but the strongest loader-like examples `func_0807865C` and `func_080AC674` remain assembly-only. Exact source-matched `m4aMPlayStart` proves a literal zero can be hoisted into r8 across a call and later copied low for a byte store, but does not explain the loader's pre-call year bridge.
- **Most important new experiment:** `diagnostic-v83-separate-year.cc` changes only v83's year initialization from `header[8] = zero` to an independent `u8 year_zero = 0; header[8] = year_zero;`. This exact full-function case had not previously been tested. It was compiled only under the existing private distinct-zero diagnostic compiler.
- Full loader pressure gives the quantitative allocation target exactly:
  - semantic/source old zero pseudo27 = **5 refs / live200 / 7 calls -> r9**
  - independent year-zero pseudo33 = **2 refs / live4 -> r0**
  - shared `-125` mask pseudo44 = **3 refs / live58 -> r8**
  This is the first source-shaped full loader experiment to obtain the retail old-zero r9 / mask r8 allocation without hard-register forcing.
- The later zero ownership is also correct. Generated assembly uses `mov r0,r9; str r0,[state_21cc,#4]` and later `mov r0,r9; str r0,[sp,#4]`, while the three string clears remain on the separate r5 zero and the first fill loop still materializes its own immediate zero.
- The only critical early zero mismatch is now extremely specific. Candidate prologue is:
  `mov r0,#0; mov r9,r0; str r0,[state+8]; str r0,[header+4]; strb r0,[header+8]`.
  Retail is:
  `mov r0,#0; mov r9,r0; str r0,[state+8]; str r0,[header+4]; mov low,r9; strb low,[header+8]`.
  Thus the independent year source reaches the correct five-ref allocation but reload keeps using the still-live low r0 instead of rematerializing/copying the equal zero from r9.
- Linked comparison for the private separate-year full loader is exact size **0x2E4 / 221 differing bytes**. This is only one linked byte worse than v75's 220 despite changing the entire early allocation family. The raw count overstates the semantic regression because omitting retail's two-byte `mov low,r9` shifts the immediately following Farm/Farmer/Dog instruction stream by two bytes until later compensation realigns the total size.
- Therefore the earlier claim that an independent year zero could be dismissed solely from its low-pressure microprobe is superseded. Full loader pressure proves it is a highly useful causal model: it fixes old-zero allocation and all later old-zero ownership. It is still **not** a production/v104 candidate because the year bridge and early instruction length are wrong.
- `game-data-weather-pair-probe.cc` tested the remaining obvious constructor-boundary hypothesis suggested by MFoMT: a nested two-word WeatherPair constructor followed by outer year/date/time initialization. Under the distinct-zero oracle the weather constructor gets one zero family and the outer constructor gets another, but first CSE still assigns the dead first-fill scalar to the weather zero. Constructor scope alone therefore does not kill the early weather-zero equivalence. Closed.
- **Updated frontier:** stop trying to change old-zero reference count or r8/r9 allocation; that part is now empirically solved by the separate-year source model. The remaining question is narrower: why retail's independent/equivalent year-zero store uses the already-allocated r9 zero through `mov low,r9` instead of directly reusing the low r0 that performed the two weather stores.
- **Exact next action:** compare `diagnostic-v83-separate-year` pass history around the year store against retail-compatible source-matched examples where a distinct zero is forced/reloaded from a high register, with emphasis on lifetime/death of the low weather-zero temp at an inline/member-constructor boundary. Reuse the Farmer oracle and existing reload/CSE traces. Do not alter the old-zero allocation, do not add another compiler family, and do not retry aliases/copies, independent year scalar width variants, WeatherPair/nested-calendar constructors, chained assignments, literals/aggregates, hard registers, or broad compiler rules. A future full candidate is justified only by a natural mechanism that preserves the proven 5-ref r9 state while inserting the retail two-byte `mov low,r9` before the year byte store.

## GameData constructor-mode / five-reference checkpoint - October 5, 2026

- Production remains unchanged at `9078f36`. No retail source, assembly, linker input, or tracked compiler input changed. This pass added private microprobes and research evidence only. No v104/full-loader candidate was created.
- Caller topology now strongly establishes `func_08010358` and `func_08011650` as paired GameData/GameState construction modes. Every observed call first allocates exactly `0x34F4` bytes with `__builtin_new`, passes that pointer in r0, and stores/uses the returned pointer. Both functions return their original state pointer.
- Their construction prefixes match at the subsystem level and call the same first fifteen recovered constructors/helpers in the same order: Farm, `func_0809AB8C`, Farmer, Dog, `func_0800FF8C`, social/support initializers, `func_080114F8`, `func_0809A8AC`, `func_08011510`, `func_0809CD78`, `func_0809CE8C`, `func_0809C144`, `func_080A1A48`, `func_0809C4E4`, and `func_0809BFE8`. After that common construction, `func_08010358` performs new-game/randomization work while `func_08011650` performs SRAM size/payload/checksum reads.
- The sole known `func_08010358` caller `func_080D6C58` supplies four configuration values with clear roles: config+4 becomes the Farm string pointer, config+0x14 becomes the Farmer string pointer, config+0x24 supplies the one-byte GameDate passed to Farmer, and config+0x28 becomes the Dog string pointer. The special packed `sp+8..+0xB` Year 1 / Spring 2 / 6:00 calendar temporary is independent of those four inputs. This strengthens the interpretation that the sister constructor's second zero is born from internal calendar/date-time construction, not user configuration.
- `weather-chain-probes.cc`: `current_weather = forecast = zero` and the reverse produce a five-reference source-zero quantity, but first CSE still gives the dead first-fill scalar to the separate string/compiler-zero family. Five refs are therefore achieved for the wrong ownership reason. Closed.
- `weather-memset-probe.cc`: clearing the 8-byte weather pair with `memset` emits an actual `bl memset`, not retail's two word stores. Closed.
- `game-data-split-member-ctor-probes.cc`: letting an inner member constructor initialize only one weather field while the outer GameData constructor initializes the other separates the zero families, but the inner-constructor zero becomes the dead first-fill owner. This is the wrong direction and is closed as the matching source shape.
- `year-zero-narrow-probe.cc` is a new and useful near miss. An independent `u8 year_zero = 0` reduces the semantic/source zero to exactly **5 refs**, preserves that source zero for both weather words, the later full-width state zero, and the dead first-fill scalar, and keeps the string zero separate. However it emits a fresh low `mov #0; strb` for year instead of retail's `mov low, old-zero; strb`.
- Pass dumps show why that near miss will not become retail merely from full-function pressure. The independent year-zero is already represented as its own SImode user pseudo before the QI subreg store. Global allocation keeps it separate from the five-ref semantic zero; in the probe, semantic zero is reg23 (5 refs/live70) and year-zero is reg24 (2 refs/live4), with separate dispositions. There is no equivalence/copy bridge to the semantic zero. A same-width `unsigned int year_zero` would therefore restate the same RTL mechanism and is not a new experiment.
- Existing v91-v93 narrow/SI aliases are still closed: aliases/copies of the semantic zero either coalesce reference weight back into the bad allocation family or hit the known QI reload/rematerialization problem. Existing v95 fully merged literal-zero family is also closed.
- Existing later-state experiments v61/v66/v76/v77/v85 and explicit hard-r9 variants already cover attempts to manipulate `state_21cc+4` or late first-fill ownership. Do not repeat them.
- The exact semantic oracle remains v83 under the private distinct-zero diagnostic: source pseudo27 has six identifiable refs (definition, weather word 1, weather word 2, year byte, `state_21cc+4`, dead first-fill scalar), while separate string-zero pseudo78 owns the three string clears. Retail visibly uses that same semantic relationship but allocates the old zero to r9 and the shared -125 mask to r8.
- **Updated interpretation:** the new constructor-mode evidence makes v83's six-use semantic relationship more plausible as the original source model, not less. Source-shape probes that remove a weather/year reference consistently either create the wrong zero family or lose retail's high-to-low year bridge. The remaining question is therefore narrower: what genuine frontend/lifetime/accounting difference lets this six-use old zero receive retail's r9 allocation without re-opening broad compiler-version hunting?
- **Exact next action:** use the paired constructor evidence to compare the early zero/calendar lifetime of `func_08010358` against the loader and the saved v83/v96 pass histories, looking specifically for a natural temporary lifetime or frontend bookkeeping event shared by the two GameData constructors that changes allocation priority without changing semantic uses. Reuse the existing flow/lreg/combine evidence and failure ledgers first. Do not rerun compiler families, aliases/copies, Weather literals, memset/aggregate clears, chained assignments, split-member constructors, independent year-zero variants, typed/placement Location, hard registers, padding/volatile, or v95 literal merging. Only authorize v104 when a new mechanism preserves v83 ownership and retail's year bridge while explaining r9 naturally.

## Constructor/frontend checkpoint - nested GameData member model

- Production remains unchanged at `9078f36`. No retail source, assembly, linker input, or tracked compiler input changed. This pass added only private microprobes/research evidence.
- Historical MFoMT notes in `/mnt/data/Github/fomt-doc-call238/GameData.txt` explicitly describe the object constructed by MFoMT `0x08011730` as `GameData`, with a member object at `GameData+0x08` and its datetime at inner `+0x08`. The MFoMT address is only `+0xE0` from FoMT `func_08011650`, strengthening the interpretation of the FoMT loader as the sister GameData construction/load path.
- No MFoMT ROM/binary is present in the local GBA workspace. Public research found MFoMT script tooling but no maintained native MFoMT decomp suitable for a direct constructor comparison. Do not acquire or assume a sister ROM.
- The naturally aligned early member layout remains the only source-shape compatible with retail word stores: two 32-bit weather values at +0/+4, year byte +8, GameDate +9, and aligned GameTime +10. Marking the 12-byte object `PACKED` makes the old compiler emit byte stores for the Weather words and is closed.
- `weather-calendar-struct-probes.cc`: ordinary member initializer methods preserve aligned weather stores, but either collapse all semantic zeros together or create the same v96 competing-zero family that steals the first fill. Closed.
- `weather-calendar-copy-probes.cc`: `forecast = current_weather` and the reverse spelling do not remove a weather reference. CSE folds the copied field value back to the same source zero; the apparent five-use quantity is five for the wrong reason because the first-fill scalar is owned by a second zero family. Closed.
- `weather-narrow-bridge-probes.cc`: an 8-bit zero feeding one Weather store still becomes the zero family reused by the three string clears and first-fill const-reference slot. Closed.
- `weather-constructor-frontend-probes.cc`: real C++ member-initializer lists were tested. `current=SUNNY, forecast=SUNNY` and `forecast(current_weather)` compile identically. A constructor parameter used for weather/year gives the same split as earlier source forms: parameter zero owns both weather stores/year/later semantic store, while compiler zero owns strings/first fill. Closed.
- `weather-inline-parameter-probes.cc`: explicit inline Weather parameters, copy-through-field parameters, and a default Weather argument were tested. Old GCC inlines them to the same two zero families; none preserve first-fill ownership on the semantic zero while removing one early weather reference. Closed.
- `game-data-nested-ctor-probes.cc`: a real outer `GameData` constructor containing an inline default-constructed weather/calendar member at +0x08 is the first probe that mirrors the historical class structure. It restores the desired semantic ownership cleanly: one zero owns both weather words, year, the later full-width state zero, and first-fill stack scalar, while string zero is separate. However local allocation still reports the semantic zero as **six uses**, i.e. the same v83 family; nesting alone does not cross the r8/r9 priority boundary.
- A ROM-wide pattern census found an independent retail analogue in assembly-only `func_08027BFC`: `movs r0,#0; mov r8,r0; str r0,...; str r0,...; str r0,...`, later reusing r8. This proves the compiler naturally emits the visible low-zero/high-copy pattern, but the function has no recovered source and cannot identify the frontend form.
- Native symbol/string inspection exposes no original `Weather` or `Forecast` type name. Existing weather strings/debug names are gameplay text/current-project data symbols, not evidence for a wrapper class. Do not invent a Weather class solely to shape codegen.
- The v83 allocation target remains unchanged: semantic/source zero at six refs/live198 outranks the -125 mask; the desired source relation must either remove exactly one counted semantic-zero reference without creating a reusable competing const-zero family, or provide equally strong natural evidence for an allocator-lifetime change. So far every extra zero family steals the first fill during first CSE.
- **Exact next action:** stay in frontend/source-structure research, not compiler-family work. First test the remaining natural constructor expression relationship `current_weather = forecast = zero` / `forecast = current_weather = zero` as a tiny RTL microprobe, after confirming it is not already in the ledger. If chained assignment also retains two semantic-zero store references or creates the v96 family, close it immediately. Then inspect the FoMT new-game and save-load paths specifically as GameData constructor overloads/callers to recover any real member-construction source relationship before authorizing a full v104. Do not create v104 merely from constructor nesting because the five-reference gate has not been met.

## External save-format/weather research checkpoint - October 4, 2026

- Production source remains unchanged at `9078f36`; this continuation changed only documentation and private save-loader research artifacts. No v104/full-loader candidate was created.
- External research was deliberately cross-checked against retail binary behavior. Historical FoMT RAM documentation identifies WRAM `0x020025E0` as current weather, `0x020025E4` as tomorrow's forecast, and `0x020025E8..EB` as year/day/hour/minute. With the GameState base implied by the same map, these are GameState `+0x08`, `+0x0C`, and `+0x10..+0x13`.
- These names are now independently **binary-proven** in our ROM. `func_08010F54` performs `[state+0x08] = [state+0x0C]` at daily rollover, generates a new 0..4 weather value into `+0x0C`, then passes `[state+0x08]` as the `int weather` argument to `Farm::DayUpdate(int weather, GameDate const &)`.
- The old local `/mnt/data/Github/fomt-doc-call238/GameData.txt` independently describes a GameData subobject beginning at +0x08 with its game datetime at inner +0x08. Combined with current binary proof, the early 12-byte region is best modeled semantically as current weather (inner +0), tomorrow forecast (+4), then the four-byte packed calendar (+8).
- New-game sister `func_08010358` strongly confirms that grouping: it separately constructs a four-byte Year 1 / Spring 2 / 6:00 calendar temp, then writes zero to GameState+0x08, zero to +0x0C, and copies the calendar word to +0x10.
- Since `WriteSaveSlotRecord` writes the entire 0x34F4-byte GameState payload byte-for-byte, these runtime fields are also direct save fields. Relative to a slot record (after its four-byte size word): current weather starts at +0x000C, forecast +0x0010, packed calendar +0x0014.
- Public research repo HM-Studio was cloned to `/mnt/data/Github/hm-studio-research` (HEAD `9f6039a`), but its save-editor implementation is effectively empty and supplies no layout evidence.
- Public FOMT Studio was cloned to `/mnt/data/Github/fomt-studio-research` (HEAD `21fa005`). Its `Banco_de_Datos/Gestor_Saves.py` assumes SRAM offset = WRAM address - 0x02000000, which conflicts with our binary-proven retail record format (0x28 SRAM header, 0x3FEC slot stride, size word, 0x34F4 payload, checksum). Treat that save module as unreliable for this decomp.
- Research-backed Weather frontend microprobes were run before any full loader candidate:
  - `weather-zero-bridge-probe.cc`: `unsigned zero=0; Weather weather=(Weather)zero` makes the long-lived zero address-taken/stack-resident. Informative but wrong family.
  - `weather-source-bridge-probe.cc`: `Weather=SUNNY; unsigned zero=weather` with explicit `fill_n(...,zero)` also spills the long-lived zero because the const-reference argument requires an address.
  - `weather-source-literal-fill-probe.cc`: correcting the fill to literal `0` causes Weather and old zero to collapse into one quantity; no useful split.
  - `weather-fields-literal-probe.cc`: direct typed `WEATHER_SUNNY` writes create a separate weather-zero family, but first CSE then uses that family for the dead first-fill const-reference scalar, reproducing the known v96 ownership defect.
- Therefore simple enum spelling is **closed**. The new semantics are valuable, but the winning source relation must be structural rather than merely changing raw u32 stores to `Weather` assignments.
- The v83 quantitative target remains authoritative: old/source zero pseudo27 = 6 refs / live198 (~606 priority), shared -125 mask = 3 refs / live58 (~517). A five-ref old-zero quantity at similar lifetime would fall to ~505 and should naturally yield mask r8 / zero r9.
- **Exact next action:** reconstruct/microprobe a small weather/calendar subobject initializer or inline constructor matching the binary-proven layout `{current_weather, forecast, packed_calendar}`. Do not retry simple Weather locals/literals, v96 scalar-literal zero, arrays/aggregates, signed zero, wide-zero, fixed registers, padding/volatile, or compiler-family hunting. Gate any v104 test on a microprobe that produces the retail-like low-zero two weather stores while keeping year/later semantic zero/first-fill ownership on the old source-zero family and lowering its allocation priority below the -125 mask.

## Source/frontend continuation checkpoint - v103 and five-ref allocation target

- Production remains unchanged at `9078f36`; no retail source, assembly, linker, or tracked compatibility compiler input changed. New work is confined to private save-loader research artifacts.
- The four configuration values forwarded by `func_080D6C58` / hidden constructor `08010268` into sister initializer `func_08010358` are now semantically bounded from named constructor use: config `+4` is the Farm name string, `+0x14` is the Farmer/player name string, byte `+0x24` is the packed birthday `GameDate`, and `+0x28` is the Dog name string.
- Sister `func_08010358`'s `sp+8..+0xB` temporary is a 4-byte packed start calendar: year byte = 1, `GameDate` = Spring day index 1 (Spring 2), and `GameTime` = 6:00. The strange r4/r6 inputs are preserved unused bitfield bits from read-modify-write lowering, not hidden arguments.
- Immediately after completing that packed `GameTime` RMW, r6 becomes free and retail materializes `movs r6,#0`; that zero survives the Farm/Farmer/Dog/helper calls and later clears the three string bytes. This supports the second/string zero being a compiler-hoisted constant born after a real temporary-object phase, not necessarily an explicit source `string_zero` local.
- Re-centering the loader evidence: mature v75 already creates retail's r5 zero at the Location boundary and uses it for the three string clears. The unsolved defect is that v75 also uses r5 for `state_21cc+4` and the dead first-fill scalar, while retail uses the older r9 zero for those two sites.
- Historical v83 under the private distinct-zero oracle remains the clean semantic ownership model: pseudo27 owns both initial word clears, header byte, `state_21cc+4`, and the dead first-fill scalar; pseudo78 owns the three string clears. Its only critical local defect is allocation: pseudo27 -> r8 and shared `-125` mask pseudo43 -> r9.
- The exact local-allocation formula is now pinned from this compiler's `local-alloc.c`: priority is proportional to `floor_log2(refs) * refs / live_length`. For v83 pseudo27, 6 refs / 198 gives about **606**; mask43, 3 refs / 58 gives about **517**. If pseudo27 had **5 refs at roughly the same lifetime**, its priority would be about **505**, naturally placing mask43 first in r8 and old zero next in r9. No user-variable bonus is involved.
- The six pseudo27 references are identifiable: its defining set, two initial 32-bit word stores, the header byte, `state_21cc+4`, and the dead first-fill scalar. Therefore the source/frontend target is precise: make exactly one of the two initial word clears cease to count as a pseudo27 reference while preserving the later semantic ownership and avoiding a competing zero equivalence class.
- Early-header frontend microprobes were tested before a full loader candidate. Plain two-word struct zero and direct u64 zero materialize two distinct low zero registers. A local `u32[2] = {0,0}` reuses one low zero for both stores, but the bridge probe under the distinct-zero oracle creates a separate compiler-zero pseudo and first CSE uses that compiler zero for the later `fill_n` const-reference slot. This reproduces the v96 defect, so the array/aggregate route is closed.
- **v103** changes only v83's old-zero declaration from `unsigned int zero = 0` to `int zero = 0`. Result under the same private distinct-zero environment is **0x2E0 / 409**. Early allocation remains old zero r8 / mask r9, and the dead first-fill scalar becomes a fresh literal-zero stack store rather than the old zero. Signedness is closed.
- A derived 64-bit form (`unsigned long long wide_zero = zero`) was tested only as a microprobe for five-ref accounting. The tracked production compiler itself ICEs on this source, so it cannot be a viable original source form and is closed.
- **Exact next action:** do not add compiler rules and do not create another loader candidate blindly. First map the semantic/use evidence for the two leading GameState words at `+0x08/+0x0C` to determine what real source object or relationship could make one clear non-pseudo27-derived. Then use a microprobe to require all three gates before a v104/full-loader test: (1) one low zero produces both retail-like word stores, (2) old source zero remains the owner of header byte, later semantic store, and first-fill scalar, and (3) local allocation reports pseudo27 at five refs or an equivalent priority below mask43 without creating another zero family. Do not retry scalar literal v96, early arrays/aggregates, signed zero, wide zero, explicit string-zero locals, aliases/copies, fixed registers, padding/volatile, or compiler-family hunting.

## Source/frontend continuation checkpoint - v101/v102 closed; sister constructor context identified

- Production remains unchanged at `9078f36`; no retail source, assembly, linker, or tracked compiler input changed in this continuation. All new files are private save-loader research artifacts.
- Reproduced the v96 private-oracle environment exactly before testing anything new: the 13 tracked compatibility behaviors plus private `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO=1` still give **0x2E8 / 597** for `candidate-v96.cc`. This confirms the comparison environment has not drifted.
- Retail loader assembly itself already shows the desired visible early-zero sequence: `movs r0,#0; mov sb,r0; str r0,[state+8]; str r0,[header+4]; mov low,sb; strb ...`. The v96 private oracle emits the same visible prologue, so reproducing that assembly sequence alone does not identify the missing frontend relationship.
- **v101** tested one narrowly justified source relationship: declare `zero` without an initializer and initialize it inside the first header-word store, `header_word = (zero = 0)`. This was intended to model one zero expression feeding both the short compiler value and long-lived source variable. Result: private oracle **0x2E8 / 597**, production tracked compiler **0x2E4 / 495**. Both are byte-family identical to v96. Assignment-chain spelling is therefore **CLOSED**.
- **v102** retested only the recovered typed `Location` boundary on top of the current v96 frontier, because retail creates the later r5 zero exactly inside the `0x1CCC` Location block. It uses `Location *`, `map = MAP_NONE`, `x = 0`, `y = 0`, then literal-zero string clears. Production tracked compiler result: exact size **0x2E4 / 496**. This does not naturally preserve the retail zero split and is **CLOSED**. Do not reopen v47/v64/v65 typed/placement Location forms from this result.
- Sister initializer `func_08010358` remains the stronger source oracle. It creates old zero r5 early, then creates a second zero r6 while constructing a packed local header/date-time object at `sp+8`; that r6 survives across Farm/Farmer/Dog/helper calls and later clears the three string bytes. Old r5 still owns `state_21cc+4` and the dead first-fill stack scalar, while the fill loop itself creates immediate zero.
- The sister call context is now bounded. `func_080D6C58` allocates the 0x34F4 GameState and calls `func_08010358`, forwarding configuration fields from its input object: +4, +0x14, byte +0x24, and +0x28. The containing heap object installs vtable `vtable_unk_080E5BF8`; its two virtual methods resolve to `func_0801004C` and deleting/destruction path `func_08010158` in `asm/game_scene.s`. This is a game-scene/new-game construction path, not an isolated string-clear helper.
- **Exact next action:** do not create v103 yet. Recover the semantic roles/types of the four configuration inputs passed by `func_080D6C58` into `func_08010358`, especially the values that form the packed `sp+8` header/date-time local immediately around the sister's second-zero birth. Determine what real source object/member/local could naturally create that independent zero. Only then test one source-shape candidate. Do not retry explicit early `string_zero`, assignment chains, typed/placement Location, compiler-family hunting, new CSE/allocator exceptions, fake USEs, fixed registers, or UID/address rules.

## Research checkpoint - hidden post-flow/copy bridge closed

- Production remains unchanged at `9078f36`. This continuation was research-only apart from one private causal compile; no production source, asm, linker, or tracked compatibility compiler input changed.
- Nintendo's archived `src_patch021206.zip` was inspected directly. Its `combine.c`, `flow.c`, `local-alloc.c`, and `regmove.c` are byte-for-byte identical to the preserved May-2000 ARM/Cygnus sources already studied. There is no hidden Nintendo patch in those passes that can explain the loader zero bridge.
- The October-2003 Nintendo THUMB compiler was not rerun. The Call238 ledger already proves that exact vendor binary and the coherent May-2000 compiler are codegen-equivalent on the hard compiler candidates; broad compiler-version hunting remains closed.
- Camelot GCC 2.96 regmove was inspected as additional historical context. Its REG_EQUAL-aware paths handle remote constants and `src = const; src += n`, while its replacement machinery follows explicit copy relationships. It has no generic same-constant pseudo substitution that could rewrite zero33 to zero27.
- GCC 2.8.1 predates the later regmove pass. Its extra `get_last_value` equivalence behavior is confined to field-assignment recognition and does not provide an ordinary memory-store source bridge.
- Plain v96 RTL confirms the two zero pseudos are independently defined: source user zero27 is `const_int 0`; compiler zero33 is separately `const_int 0` with REG_EQUAL 0. They are not connected by an explicit copy before flow.
- The proposed early-copy mechanism `zero33 <- zero27` is now closed for the known compiler family. Existing v96 CSE trace at uid39 under `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO=1` shows only literal zero: `src=0`, `src_const=0`, no `src_eqv`, no `src_related`, and no hash-table equivalent. There is no stock tie-breaker that could choose zero27 there.
- The reason is explicit in the private diagnostic: `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO` marks the source-level single-set SImode user zero's source volatile to CSE, deliberately keeping it out of ordinary equivalence lookup. This is how the diagnostic preserves the old-zero/string-zero identity split.
- One narrow causal control was run with the same v96 source and the same 13 compatibility rules but with only `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO` omitted. The first attempt ICE'd solely because the trace-only ZERO_TRIAL hook dereferenced a null `src` after stock CSE had already canonicalized it; no compiler behavior conclusion was taken from that failed trace.
- The safe rerun with only ZERO_SET_DETAIL completed: **expected 0x2E4, actual 0x2E4, 495 differing linked bytes**, evidence `proof-v96-stockzero-detail/`, execution `sh_mutw8taa_72633c1c`.
- That control proves stock CSE does not preserve a useful compiler-zero/user-zero copy bridge. Instead it collapses the zero families globally. Final assembly has one zero family in r8: both initial word stores use it, `header[8]` uses r8, `state_21cc+4` uses r8, all three string clears reuse r8, and the first-fill `[sp+4]` scalar also uses r8. The shared -125 mask therefore takes r9. This is the already-known wrong allocation family.
- Therefore the successful **2 refs / live198** flow-live state remains a causal oracle, not a recovered historical mechanism. Preserved compiler history does not support either a hidden Nintendo post-flow pass or an older early-CSE copy behavior that naturally creates it.
- Strongest next direction is original source/frontend shape, not another compiler-family permutation. Specifically, research source forms that could naturally make retail's old full-width zero and later byte/string zero distinct while still letting the first-fill scalar consume the old zero without increasing its pre-allocation priority. Use sister initializers and recovered type/API boundaries as evidence first. Do not add another allocator/CSE exception, fake USE, forced register, or UID/address rule.

## Research checkpoint - 2-ref/live198 pipeline explained, original transform still unproven

- Research-only turn requested by the user. No new source candidate, compiler behavior experiment, rebuild, or production mutation was performed in this research pass.
- The successful private flow-lifetime probe is now understood much more precisely. In `proof-v96-flow-live-da`, flow reports compiler-zero pseudo33 as **3 refs / live99 / 7 calls**. Before allocation, `.lreg` reports **2 refs / live198 / 7 calls**.
- The 3 -> 2 reference transition is a real historical compiler mechanism, not an artifact of the diagnostic. Immediately before register class/local allocation, this Cygnus compiler calls `recompute_reg_usage()`. That routine explicitly clears and rebuilds only `REG_N_SETS` and `REG_N_REFS` from physical instruction patterns/call usage and explicitly does **not** recompute `REG_LIVE_LENGTH`. Thus a liveness effect that is no longer a physical RTL use can survive while its reference count disappears.
- Historical provenance is strong: `recompute_reg_usage` was added to the Cygnus/GCC line in June 1998 and exists in EGCS 1.1.2, GCC 2.95.3, the May-2000 ARM/Cygnus source, and the recovered FoMT compiler family.
- `local-alloc.c::update_equiv_regs` then explains **99 -> 198** exactly. When a register has a `REG_EQUIV`, it executes `REG_LIVE_LENGTH(regno) *= 2`. This behavior is present in GCC 2.81, EGCS 1.1.2, GCC 2.95.3, May-2000 ARM/Cygnus, and the recovered compiler. Call238's water work already independently proved this doubling mechanism in real FoMT compiler analysis.
- The user-supplied GCC 3.x `PROP_EQUAL_NOTES` lead was checked. Upstream GCC added `PROP_EQUAL_NOTES` in January 2002 and could mark registers inside `REG_EQUAL/REG_EQUIV` expressions as uses. However normal final allocation propagation omits that flag, and the preserved Nintendo/Cygnus `flow.c` sources do not contain `PROP_EQUAL_NOTES` at all. It is useful historical precedent for metadata-driven liveness, but **not evidence of FoMT's mechanism**.
- Cygnus live-range splitting was also checked and is closed for this target. The built private compiler uses `arm/telf.h`, which explicitly sets `PREFERRED_DEBUGGING_TYPE DWARF2_DEBUG`. At `-O2`, `flag_live_range` is enabled by default only for DBX targets, so it is off here. The empty `.range` dump is only a dump artifact.
- A stronger pipeline hypothesis was identified: flow could first see the late first-fill store as `[sp+4] <- compiler-zero33`, creating the 3-ref/live99 state and death point; a later post-flow transformation could then rewrite that physical store source to old-zero27; `recompute_reg_usage` would naturally recount only two physical reg33 refs while preserving live99; `REG_EQUIV` would then double it to live198. This sequence exactly reproduces the useful accounting shape without adding a fake RTL USE.
- The actual post-flow pass order is flow -> combine -> regmove -> optional scheduler/LRS -> usage recount -> regclass/local allocation. There is no post-flow CSE before allocation.
- Ordinary current/May-2000 combine is **plausible in accounting terms but not yet the proven transform**. Its own source explicitly states that combine does not update `reg_live_length` and can leave `reg_n_refs` stale when a register disappears, which fits the required bookkeeping followed by `recompute_reg_usage`. However plain v96's uid341 remains `[sp+4] <- reg33` through flow, combine, regmove and local allocation; current combine does not perform the desired rewrite. Its note-distribution code also normally relocates/deletes a `REG_DEAD` when the corresponding use disappears.
- Historical combine research found one notable precedent: GCC 2.81's `rtx_equal_for_field_assignment_p` recursively compared `get_last_value` of distinct registers; EGCS 1.1.2 and later removed that behavior because it could import a register that was already dead. This proves older combine code did sometimes treat equal-valued register identities more aggressively, but that exact helper is field-assignment specific and does **not** directly explain uid341's simple memory store.
- Regmove has only narrow REG_EQUAL handling and no evidence yet of substituting unrelated same-zero pseudos. Scheduler does not provide a credible value-identity rewrite. These are currently weak candidates.
- Reload-only explanations were checked against the existing loader ledger before any new work. Earlier v90/v85 reload tracing already localized separate zero/rematerialization behavior, and the v96 frontier was explicitly moved back to first-CSE/lifetime identity. Do not repeat broad reload experiments without a new structural reason.
- Most important caution: the **2 refs / live198** state is now proven to be a sufficient compiler state that yields the clean 0x2E8/596 improvement. It is **not yet proven to be the original Nintendo compiler's internal state**. A different historical mechanism, including late reload equivalence, could theoretically produce the same final store with different pre-allocation bookkeeping.
- Strongest next research direction, before any experiment: compare the older GCC 2.81/early-Cygnus combine and regmove history for transformations of ordinary SET sources, not field assignments, especially changes involving `get_last_value`, equivalent constants, and death-note redistribution. Also search preserved Nintendo patch archives for any combine/reload local patches absent from the May-2000 source. Only if a historically supported structural mechanism emerges should a new private diagnostic be written.

## Checkpoint - no-extra-instruction zero lifetime gives new best 0x2E8 / 596

- Production remains unchanged at `9078f36`. No production source, asm, linker, or tracked compatibility compiler input changed.
- The previous diagnostic RTL `USE` was fully explained. Its extra instruction lengthens pseudo115 from 32 to 33 live instructions, which flips global allocation priority from `...115, 138...` to `...138, 115...`. Because 115 and 138 conflict, their hard registers swap: plain has 115 -> r2 and 138 -> r3, while the fake-USE build has 115 -> r3 and 138 -> r2.
- That single allocator-order swap explains the two retail-wrong optimizations in the `0x2E0 / 408` fake-USE build. Reload keeps the earlier 0x1C70 temporary in callee-saved r4 and synthesizes 0x1CCC as `r4 += 92`, deleting retail's 0x1CCC literal. Reload also keeps the first low copy of r8 live through the later byte store and deletes retail's second high-to-low copy. The fake USE is therefore closed as a solution and remains diagnostic-only.
- A new private diagnostic was added only in `/mnt/data/Github/agbcc-fomt-loader-zero-diag-v1`: `AGBCC_KEEP_REWRITTEN_ZERO_FLOW_LIVE=1`. CSE still discovers the rewritten first-fill store and its non-uservar compiler-zero peer structurally, but instead of inserting RTL it passes those two RTL pointers to flow. Flow marks compiler-zero live at the existing store without adding another instruction. No UID/address check is used.
- This no-extra-instruction diagnostic produces the new best result: **expected 0x2E4, actual 0x2E8, 596 differing linked bytes**. Evidence: `proof-v96-flow-live/` and `proof-v96-flow-live-da/`. Executions: `sh_mutpe9g2_0ce9cb94` and `sh_mutpf7cz_39b0514d`. Diagnostic compiler rebuild: `sh_mutpdx78_6b5907fb`.
- Final assembly comparison against plain v96 is exceptionally clean: the flow-live build changes exactly one instruction island. Plain v96 has `str r5, [sp,#4]`; flow-live has `mov r0,r9; str r0,[sp,#4]`. This is the desired retail semantic family. The early header remains the retail-correct direct `str r0,[r2,#4]`; the 0x1CCC literal remains in the literal pool; and the later r8 byte-pointer sequence still rematerializes r8 for the store instead of over-reusing the first low copy.
- The verified allocator profile is now:
  - old-zero pseudo27: **5 refs / live200 / 7 calls**
  - compiler-zero pseudo33: **2 refs / live198 / 7 calls**
  - shared -125 mask pseudo44 remains in the established r8 family
  - pseudo115: **4 refs / live32**
  - allocation order is restored to plain v96: `... 115 138 ...`
  - hard-register dispositions are restored to plain v96: 115 -> r2, 138 -> r3
- This proves the missing behavior is not “emit another use.” The useful state is more specific: compiler-zero33 needs its long live range preserved to the first-fill store **without adding an RTL instruction and without adding a normal reference count**, while the physical store source remains old-zero27 and carries constant-zero value knowledge.
- Exact next action: do not normalize the private flow hook. Trace how a real compiler could create the proven **2-ref / live198** compiler-zero state. Inspect `cse_process_notes` plus `local-alloc.c:update_equiv_regs` and the REG_EQUAL/REG_EQUIV path to determine whether an older/different compiler preserved an equivalence-driven live range without a counted pattern use. If current code cannot express that path, search historical GCC deltas around equivalence-note and flow lifetime handling before writing another diagnostic. Do not add source aliases, fake USEs, forced registers, UID/address rules, or production compiler changes.

## Checkpoint - compiler-zero lifetime causally proven with diagnostic USE

- Production remains unchanged at `9078f36`. No production source, asm, linker, or tracked compiler input changed.
- The narrow `REG_EQUAL 0` store note was confirmed to affect only the structurally rewritten first-fill store, yet its final binary is byte-identical to the earlier broad memory-zero bookkeeping probe: **0x2E8 / 598**. The unrelated broad matches were not the source of the extra mismatch.
- Final assembly comparison against plain v96 isolates exactly two changed islands. The narrow note fixes the desired later first-fill scalar from `str r5,[sp,#4]` to a move from old-zero r9 followed by `str [sp,#4]`, but it also regresses the early second header word from retail's direct `str r0,[r2,#4]` to `mov r1,r9; str r1,[r2,#4]`.
- Retail assembly proves the required split: the two initial 32-bit header stores use compiler zero r0; the following header byte uses old-zero sb/r9. Much later both `state_21cc+4` and the first-fill stack scalar use sb/r9, while the byte-fill loop starts from a fresh immediate zero.
- Pass dumps localize the early regression to lifetime/allocation, not CSE value choice. Plain and narrow builds are identical at header insns 39/40/44 through CSE2. In plain v96 compiler-zero pseudo33 is **3 uses / 99 insns / 7 calls**; in the narrow-note build it is **2 uses / 2 insns**. Old-zero pseudo27 moves from **4 uses / 178 insns / 7 calls** to **5 uses / 200 insns / 7 calls**.
- The missing third pseudo33 use in the narrow build is exactly the first-fill store. Plain CSE2 has uid341 storing pseudo33; narrow uid341 physically stores user zero27 with `REG_EQUAL 0`. This explains why pseudo33 dies near the header and global allocation no longer reuses r0 for the second header word.
- A private `REG_EQUAL pseudo33` experiment is closed. The rewrite correctly found non-uservar SImode compiler-zero reg33 structurally, but the next CSE pass canonicalizes the note to `REG_EQUAL 0` via `cse_process_notes`, so flow still sees pseudo33 as only 2 uses / 2 insns. Result remains **0x2E8 / 598**. Evidence: `proof-v96-eqv-reg-note/` and `proof-v96-eqv-reg-note-da/`.
- Flow inspection proves arbitrary REG_NOTES do not contribute ordinary register liveness; liveness is computed from instruction patterns and call usage. Therefore there is no obvious existing note kind that can preserve pseudo33 lifetime without changing semantics.
- One deliberately diagnostic-only RTL USE test was added under `AGBCC_KEEP_REWRITTEN_ZERO_EQV_USE=1`: at the exact structural rewrite it inserts a zero-cost `USE` of the existing compiler-zero pseudo and keeps `REG_EQUAL 0` on the physical user-zero store. This is a proof tool only, not a candidate compatibility rule.
- That diagnostic produces **0x2E0 / 408**, the lowest differing-byte count seen so far but the wrong function size/family. Crucially, it proves the lifetime hypothesis: early header assembly returns to retail-correct `str r0,[r2,#4]`, old zero remains r9, mask remains r8, and the later first-fill scalar is sourced from r9 while CSE2 still folds the subsequent stack reload to literal zero.
- Saved evidence: `proof-v96-narrow-note/`, `proof-v96-narrow-note-da/`, `proof-v96-eqv-reg-note/`, `proof-v96-eqv-reg-note-da/`, and `proof-v96-use-diagnostic/`. Relevant executions: `sh_mutofaq5_aa6ba8d5`, `sh_mutoh9cw_1a9f7b56`, `sh_mutonc6d_de7f4112`, `sh_mutoo1fi_3c6770ee`, `sh_mutotkmm_fb6d46e7`.
- Exact next action: run the diagnostic USE variant once with `-da`, compare its flow/lreg/greg/reload data against plain v96 and narrow-note v96, and identify exactly which lifetime/allocation change removes four bytes and yields 0x2E0. The goal is to learn the missing compiler behavior, not to retain the fake USE. Do not create a new source candidate, force registers, key on UIDs/addresses, or touch production.

## Checkpoint - hybrid store/register zero semantics proven

- Production remains unchanged at `9078f36`; no production source, asm, linker, or tracked compiler input changed.
- The CSE2 load difference is now proven directly. Plain v96 at uid979 has `src_const = CONST_INT 0`, hash-entry cost 0, and trials literal `0`. Store-only v96 has no `src_const`, hash-entry cost 1, and trials source user zero27. This is why the store-only probe adds a second zero27 use and falls into the bad `0x2E0 / 411` allocation family.
- A temporary trace ICE was diagnosed with gdb, not guessed: by the trial loop local `src` can legitimately be nulled after matching the hash class. The safe trace now uses preserved `sets[i].src`. No production behavior was involved.
- Added private diagnostic `AGBCC_RECORD_DEFINED_ZERO_STORE_CONST=1`. After normal source processing it may place an SImode memory destination into the constant-zero equivalence class when its physical source is a single-set user variable whose defining SET/REG_EQUAL proves zero. It does **not** merge the source register itself into the zero class or rewrite the physical store.
- Combined with the existing store-only rewrite, this proves the desired hybrid mechanism: the physical first-fill store stays `zero27`, while CSE2 uid979 again sees `src_const = 0` and trials literal `0`.
- Result is **0x2E8 / 598**, not exact. This escapes the bad 0x2E0/411 family but is one mismatch count worse than plain v96's 0x2E8/597. The broad diagnostic also retags unrelated structurally matching stores (trace hits include uid44, uid303, uid341, uid732, uid829; source registers include 27 and 222), so the broad rule is rejected as a final compatibility rule.
- Saved evidence: `proof-v96-cse2mem-plain4/`, `proof-v96-cse2mem-store2/`, and `proof-v96-storeconst/`. Relevant executions include `sh_mutny67o_0ea24131`, `sh_mutnye0x_32b53f2c`, and `sh_muto1czs_311c8947`.
- Strongest next experiment: remove/disable the broad `AGBCC_RECORD_DEFINED_ZERO_STORE_CONST` behavior and instead attach constant-zero equivalence metadata only at the exact structural event where `AGBCC_REUSE_RECENT_FULLWIDTH_ZERO_CONSTREF` rewrites the immediately-following first-fill store from the fresh zero temp to the proven recent user zero. A narrowly attached `REG_EQUAL 0` (or equivalent CSE metadata) should survive into CSE2, preserve the physical register store, and make only that later reload fold to literal zero. First verify the store note survives the addressof/flow path and affects only the rewritten store. Do not key on UID, address, pseudo number, hard register, or function identity.
- Before changing that mechanism, compare `proof-v96-storeconst` against plain v96 at the first-fill assembly and, if needed, one `-da` run to confirm r9/r8 allocation stayed in the v96 family. Do not create a new source candidate yet.

## Checkpoint - v96 store-only zero rewrite / CSE2 frontier

- Production remains unchanged at `9078f36`. No production source, asm, linker, or tracked compiler input changed.
- The old 12-real-insn backward search limit was measured, not guessed. In v96 the prior `state_21cc+4 = zero27` store is reached at scan step 14 after first-CSE deletions; there is no call, jump, or label between it and the fresh first-fill zero SET. The private diagnostic scan was therefore changed to run to the existing control-flow boundary instead of an arbitrary 12-insn cap.
- That exposed the next failed predicate exactly: the prior store source is pseudo27, SImode, user variable, single-set, quantity-valid, but `qty_const` is intentionally absent under `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO`. Trace: `RECENT_ZERO_SCAN target_uid=340 seen=14 prev_uid=303 src=27 user=1 sets=1 qty_valid=1 ... qty_const_code=-1`.
- Added private helper `single_set_uservar_defined_zero_p` in diagnostic `g++/cse.c`. It proves zero structurally from the source variable's single defining instruction or its `REG_EQUAL 0` note, without pseudo/function/address/register identity.
- First causal test used that proof to make the fresh zero SET reuse source zero27. It produced **0x2E0 / 411**. First CSE had the desired extra `[sp+4] <- zero27` use, but local-allocation data became zero27 **6 refs / live 210 / 7 calls**, allocating r8 while mask44 moved to r9. This matches the bad const-copy family.
- A narrower private test then rewrote only the immediately following SImode memory store to the proven recent source zero while allowing the fresh temp itself to stay on the compiler-zero family. It still produced **0x2E0 / 411**.
- Pass dumps explain why. First CSE now has exactly one additional zero27 occurrence, the desired store at uid341. However the second CSE pass sees the later loop setup as a load from that stack slot and folds the load to zero27. In plain v96 CSE2 folds the same load to literal `0`. Thus zero27 gains the second extra use only in CSE2, becoming 6 refs/live210 and flipping r8/r9.
- This is the required hybrid behavior: retail physically stores the old zero register to the first-fill stack scalar, but the later reload/fill value must still be treated as constant zero, not as a live continuation of that user register.
- Private diagnostic compiler currently contains the trace hooks from the previous checkpoint plus: unlimited-to-control-boundary recent-zero scan, `single_set_uservar_defined_zero_p`, and the store-only future-store rewrite under `AGBCC_REUSE_RECENT_FULLWIDTH_ZERO_CONSTREF=1`. These remain private experiments only.
- Saved evidence: `proof-v96-bbscan/` = unchanged 0x2E8/597 and proves missing `qty_const`; `proof-v96-definedzero-da/` = 0x2E0/411 with 6 refs/live210; `proof-v96-storeonly-da/` = 0x2E0/411 and localizes the second extra use to CSE2. Relevant executions: `sh_mutn4bom_879200ff`, `sh_mutn794w_07583bbf`, `sh_mutncc20_a95e6c95`.
- Exact next action: do not create another source candidate. Add trace-only CSE2 logging for a non-uservar SImode destination loading from MEM when `src_const == 0`, and print the full trial/equivalence class before selection. Compare plain v96 versus store-only. Determine why store-only CSE2 prefers zero27 while plain v96 selects literal zero. Only then test a private structural preference that keeps the earlier physical store on the proven user zero but chooses literal zero for the later reload. Do not force registers, target UIDs, or touch production.

## Checkpoint - v96 first-CSE source split isolated

- Production remains unchanged at `9078f36`; no production source, asm, linker, or tracked compiler input changed.
- Archived v83 pass evidence is now the authoritative comparator for the old behavior. Historical v83 is `0x2E8 / 598`; the current private diagnostic tree has drifted and now compiles v83 as `0x2E0 / 409`, so that current v83 result is diagnostic-tree drift, not a new source frontier.
- The decisive source difference is one line. Historical v83 uses source `zero` for both initial 32-bit header clears, so no separate compiler SImode zero pseudo exists there. v96 changes only the first header clear to literal `0`, creating compiler temp pseudo33 very early.
- Historical v83 expansion creates a fresh first-fill zero temp (pseudo133) and first CSE deletes it, rewriting the dead `[sp+4]` store directly to source old-zero pseudo27.
- Current v96 expansion creates the analogous fresh first-fill zero temp (pseudo134). First CSE merges it into the earlier compiler-zero quantity created by pseudo33; `canon_reg` then rewrites the `[sp+4]` store to pseudo33. Direct trace: fresh pseudo134 joins the zero quantity whose canonical first register is 33.
- This explains why v96 gets the desired old-zero r9 / mask r8 allocation yet still gives the dead first-fill scalar to the wrong zero family. The problem is no longer source semantics or expansion; it is first-CSE zero-family selection caused by the one early literal header clear.
- Private trace-only hooks added in `/mnt/data/Github/agbcc-fomt-loader-zero-diag-v1/g++/cse.c`: `AGBCC_TRACE_ZERO_SET_DETAIL`, `AGBCC_TRACE_ZERO_CANON_STORE`, and `AGBCC_TRACE_RECENT_FULLWIDTH_ZERO_CONSTREF`. Private `cc1plus` rebuilds passed. These hooks are not production compiler changes.
- Existing private diagnostic `AGBCC_REUSE_RECENT_FULLWIDTH_ZERO_CONSTREF=1` still leaves v96 byte-identical at `0x2E8 / 597`. New entry tracing proves the rule does enter for the first-fill zero, but its bounded backward scan does not reach a qualifying prior SImode source-zero store on the pre-CSE stream. Therefore the failure occurs before its `qty_const` predicate can help.
- Saved evidence: `proof-v96-da-current/`, `proof-v96-cse-detail/`, `proof-v96-canon-store/`, and `proof-v96-recentzero-enter/` under the save-loader checkpoint directory. Relevant executions include `sh_mutm3p7q_09879e2f`, `sh_mutm5x5t_db8ce7d4`, and `sh_mutmgrfh_7f7bef3a`.
- Exact next action: stay private/read-only first. Instrument the recent-zero backward scan by step to measure the exact pre-CSE distance/barrier between the fresh first-fill SET and the prior `state_21cc+4 = zero27` store. Then test only a structural recognition/search change justified by that trace, preferably recognizing a recent single-set source user variable whose defining SET or REG_EQUAL proves constant zero. Do not widen the scan or change `qty_const` semantics blindly, do not force registers, and do not modify production.

## Save-loader checkpoint - v96 source midpoint / first-fill CSE frontier

- Production remains `9078f36`; no production source/compiler/linker changes.
- **v96/v97 are byte-identical at 0x2E8 / 597 and are the strongest current source-level allocation oracle.** Exactly one of the first two header word-zero stores is literal `0`; the other remains source `zero`.
- v96 naturally gets source pseudo27 -> **r9** (4 refs/live178/7 calls), shared `-125` mask pseudo44 -> **r8** (3 refs/live58/2 calls), the header byte high-to-low bridge, and `state_21cc+4` from r9.
- Remaining zero defect: dead first-fill scalar `[sp+4]` comes from r5/temp33 instead of old-zero r9. String clears correctly remain separate r5.
- Expansion is not the cause. Both v83 and v96 create a fresh zero temp for the first-fill const-reference scalar. First CSE rewrites v83's temp to pseudo27; v96 rewrites its temp to compiler temp33 from the one literal initial word store.
- v96 zero-class trace at that point is `C0, R33`. v83 has no corresponding ordinary hash class but still resolves to pseudo27. The missing behavior is now specifically the v83 first-CSE selection path.
- Closed this turn: v98 direct fill `zero` = 0x2DC/566 and spills/extends the zero through the loop; v99/v100 const copies = byte-identical 0x2E0/411 and correctly seed the dead scalar but raise pseudo27 to 6 refs/live208, flipping old zero back to r8 and mask to r9.
- v96 under source-narrow-only = 0x2E4/495 but incorrectly merges old/string zero in r8 and mask r9. Both zero flags = ordinary v96 0x2E8/597.
- Private trace-only hooks now present: `AGBCC_TRACE_EQUIV_MODE` in reload.c, `AGBCC_TRACE_ZERO_EQV_HEAD` and `AGBCC_TRACE_ZERO_TRIAL_CLASS` in cse.c.
- Private `AGBCC_REUSE_RECENT_FULLWIDTH_ZERO_CONSTREF=1` probe has no effect and is byte-identical to v96. Do not widen it without tracing why it missed.
- Exact next action: trace v83 versus v96 first-CSE fresh fill-zero SET through `src/src_const/src_eqv_here/src_related` and trial selection to identify how v83 reaches pseudo27 without the ordinary zero hash class. Then test only the narrow structural discriminator that reproduces that path on v96. No source aliases, fixed registers, target identity, padding, or production compiler mutation.

## Save-loader checkpoint - v90 zero-family bridge frontier

- Production remains `9078f36`; no production source/compiler/linker changes.
- v83 still proves the correct semantic zero split but allocates source old zero r8 and shared `-125` mask r9.
- Retail requires old zero r9, mask r8, and an explicit low-register bridge `mov low,r9` for the header byte store.
- v90 changes only the first two 32-bit header zero stores to literal `0`. It is **0x2E8 / 598**, but exposes the right allocation mechanism: compiler zero temp pseudo33 gets r9 while the shared mask gets r8.
- Correction: v90 source pseudo27 is not r9. It is unallocated. Pseudo33 owns the two initial word-zero stores and dead first-fill `[sp+4]`; pseudo27 owns `header[8]` and `state_21cc+4`. The QI pseudo27 use survives CSE/loop/flow/combine/local allocation and is replaced only during reload by a fresh low constant zero. `state_21cc+4` then incorrectly falls onto r5/string-zero.
- v89 is 0x2E0/409. v91 and v93 are 0x2E0/409; v92, v94, and v95 are 0x2E8/598. Named mask, simple SI/QI aliases, redundant multi-set zero, and fully merging the two missing sites into literal zero are closed because they restore the zero family's priority enough to steal r8 from the mask.
- `AGBCC_PRESERVE_SOURCE_NARROW_ZERO=1` plus distinct-zero is byte-identical to v90, so the late problem is not CSE.
- The active problem is now a **reload-time two-zero-family bridge**: keep pseudo33's low-reference allocation so it wins r9, but let pseudo27's semantic uses consume the live r9 zero without merging early and changing allocation priority.
- Exact next action: trace reload/find-equivalent handling for v90 insn50 and later `state_21cc+4`. Determine whether pseudo33/r9 is visible as a live same-value equivalent before reload rematerializes constant zero. Only if proven, test a private structural env-gated diagnostic preferring the live allocated equivalent over constant rematerialization. No identity targeting and no production mutation.

## Loader reload/allocation checkpoint - v88 and v83 pivot

- Production remains unchanged at `9078f36`; all work below is private diagnosis.
- `AGBCC_TRACE_CONST_RELOAD=1` was added trace-only to the private compiler's `reload1.c`; trace/no-trace assembly is byte-identical.
- v85's missing `0x1CCC` literal is downstream of reload spill selection. Normal same-source v85 uses spill pool `[r0,r1,r3,r4]` and Dog `0x1C70` scratch r3. The blunt distinct-zero diagnostic changes the pool to `[r0,r1,r2,r4]`, and reload's round-robin cursor then chooses r4, enabling `r4+0x5C -> 0x1CCC`.
- First spill-pool divergence is uid967. Pseudo267 is r9 in both builds; reload constructs `sp+12` through r3 normally versus r2 diagnostically. The real upstream change is pseudo112/pseudo135 allocation order: pseudo112 live length 32 -> 33 because the blunt diagnostic creates fresh first-fill zero pseudo131 for `[sp+4]`. This flips 112/135 and therefore r2/r3 ownership.
- New private diagnostic `AGBCC_PRESERVE_SOURCE_NARROW_ZERO=1` keeps SImode equivalence and guards narrow-QI substitutions. v88 (candidate-v85 under that rule) is **0x2E4 / 309**. It restores exact size only because an extra `0x21D4` literal appears; `0x1CCC` is still derived from r4. Its string byte stores still fold to literal zero and `[sp+4]` reuses r5. Diagnostic only.
- **Key correction/pivot:** v83 already has retail's complete logical zero relationship: ordinary old zero pseudo27 owns `state_21cc+4` and dead first-fill `[sp+4]`; separate string zero pseudo78 owns the three byte clears. v83's problem is allocation, not zero semantics: pseudo27 -> r8 while the `-125` date-mask temporary takes r9.
- Exact next action: use v83 as the natural semantic oracle. Read-only identify the `-125` date-mask pseudo and compare its allocation priority/preferences/conflicts against pseudo27. Find a natural source-order/type spelling that makes old zero r9 and date-mask r8 without fixed registers or allocator forcing. Do not continue adding v85 compiler exceptions.

## Loader first-CSE diagnostic checkpoint - v81-v86

- Production remains unchanged at `9078f36`; retail SHA1/progress and the tracked 13-rule compiler are unchanged.
- Normal `candidate-v75.cc` remains the production-toolchain best at **0x2E4 / 220** with the closed post-pool tail exact.
- Retail's zero relationship is now pass-level proven: old full-width zero in r9 owns header initialization, `state_21cc+4`, and the dead first-fill stack scalar; a separate later byte/string zero owns the three clears in r5; the fill loop itself uses immediate zero.
- v81 and v82 are byte-identical to v80 at 0x2E4 / 446 and are closed.
- RTL/CSE proves first CSE collapses distinct early `zero` and later `string_zero` identities. Private diagnostic tree `/mnt/data/Github/agbcc-fomt-loader-zero-diag-v1` preserves promoted byte-zero identity under opt-in `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO=1`; production compiler is untouched.
- v83 0x2E8 / 598 proves the distinct split but assigns old zero r8/string zero r5; v84 scalar header spelling regresses to 0x2E8 / 621.
- Unchanged v75 under the diagnostic is 0x2DC / 485. **v85**, v75 plus only `state_21cc+4 = zero`, reaches **0x2E0 / 408** and correctly gives that field r9 while the three string clears remain r5. It is the strongest private causal oracle, not a production candidate. v86 direct old-zero fill argument regresses to 0x2D8 / 593.
- The retail/v75/v85 comparison is complete: **v85's exact four-byte deficit is the missing `0x1CCC` literal word**. Normal v75 has both `0x1CCC` and `0x21F0`; unchanged v75 under the diagnostic loses both; v85 restores `0x21F0` only.
- Cause is pass-level proven. The private rule changes allocation so Dog offset `0x1C70` survives in callee-saved r4, then `r4 + 0x5C` becomes `0x1CCC`. Retail instead independently materializes `0x1C70 -> r1`, `0x1CA0 -> r2`, `0x1CCC -> r3`. Sister `func_08010358` also keeps Dog `0x1C70` and later `0x1CCC` as separate literals across the intervening helper.
- v87 adds only an ordinary named Dog destination pointer on v85. Its diagnostic linked binary is **byte-identical to v85, 0x2E0 / 408**. Close that source spelling.
- Exact next action: keep v75 production authority and v85 causal oracle. Read-only trace the reload/global-allocation scratch choice for the one-use `0x1C70` Dog-call offset. If a compiler probe is needed, it must be diagnostic-only and use a structural one-use constant-derived call-argument discriminator, never function/offset/pseudo/UID/hard-register identity. Do not force registers, add padding/volatile, retry v87, or promote the current `src_volatile` zero rule.

## AUTHORITATIVE CURRENT SNAPSHOT — factory mapped; legacy loader reconstruction active

Date: 2026-10-04

## Active investigation checkpoint — factory mapped; legacy loader reconstruction active

- Production retail branch `ches-dev` remains at **`9078f368c02d861f7cd71685e1f9dd1d95c7c384`**, pushed to `ches/ches-dev`; no production source changed during this research turn. Retail ROM authority remains SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Landed lifecycle source remains exact: `579c16c` GameObject entity lookup and `9078f36` teardown. Source progress remains **61,132 / 940,036 = 6.5032%**.
- Factory mapping is complete. `selector-map-v4.json` SHA256 `3db29284c66aadbeb4357410777fc14aa839cc6ae1ecc63d5c38cd99cd079eef`; CSV SHA256 `c4e61956556cb636a81ed566f448e76c0fe0f8699595934e72a5df04437feb5a`. All **94 selectors / 58 unique targets** are classified.
- Corrected factory boundary: assembler symbol `sub_0801B464` is a false semantic split inside the epilogue. Coherent factory region is **`0801A8E0..0801B497`, 0xBB8 = 3,000 bytes**; next observed prologue is `0801B498`.
- Success join `0801B462` copies returned `AEntity *` to r5. Tail `0801B464` consumes the live factory frame: non-null r5 is installed at `GameObject+8+selector*4`, entity virtual +0x10 is called, then the frame unwinds; abort paths enter with r5 == 0 and only unwind. Never model `sub_0801B464` as a normal standalone helper.
- Selectors **1..34 are exactly character IDs 1..34**: each fixed factory persistent pointer is `GameState+0x1CD4 + documented social offset`, all allocate 0x48, and each calls its resident-specific constructor. Selector **35 is Child** (resolver `080A0A04`, 0x4C, constructor `08036E2C`). Selectors **36..42 are Staid/Nappy/Bold/Chef/Aqua/Hoggy/Timid** (0x44, shared `08033928`, variant 0..6).
- Remaining v4 families: 43 occupied special, 44 horse, 45 unique, 46..53 chickens, 54..69 cows/sheep from Barn, 70..73 global-record family, 74 special, 75 article-ID-53 route, 76..83 eggs, 84 direct factory, 85..92 helper-driven families, 93 unique. **Selector 43 is occupied.**
- Do not restart table discovery. Full factory C++ is deferred until remaining family callees/types can be named without invented certainty.
- Active persistence frontier: `func_08011650` spans **`08011650..08011933`, 0x2E4 / 740 bytes**. Both callers allocate 0x34F4 bytes and effectively pass `(GameState *state, save_context, slot_offset, u32 *error_out)`. It always returns `state`; status is `*error_out`.
- Loader first builds fallback/default state, then reads stored size, requires 0x34F4, reads the entire payload, reads checksum, validates `func_08011588`, and performs no successful-load migration/fixup.
- `func_080006E4(save_context,destination,offset,size)` is the four-argument SRAM read proxy. Error classes, ORed with `gUnk_03000400`: `0x10000` generic/size/checksum, `0x20000` payload read, `0x30000` checksum read.
- Loader checkpoint: `tools/ches/checkpoints/save-loader-08011650-2026-10-04/README.md`.
- Loader source experiments now extend through **v86**. **`candidate-v75.cc` remains the production-toolchain authority at 0x2E4 / 220 differing linked bytes**; its post-pool executable tail remains exact.
- First-CSE diagnosis proves the remaining zero-lifetime problem: retail keeps an older full-width zero in r9 for header initialization, `state_21cc+4`, and the dead first-fill stack scalar, while a distinct later byte/string zero owns the three string clears in r5; the fill loop itself uses immediate zero.
- v81/v82 are byte-identical to v80 and closed. v83/v84 prove the split but regress allocation/source shape. Unchanged v75 under the private diagnostic is 0x2DC / 485. **v85**, changing only `state_21cc+4 = zero` under the diagnostic rule, reaches 0x2E0 / 408 and correctly gives that field r9 while the three string clears remain r5. v86 direct old-zero fill reuse regresses to 0x2D8 / 593 and is closed.
- The private `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO` compiler remains diagnostic only and is not production authority. Production source/compiler inputs are unchanged.
- Duplicate-initializer evidence from `func_08010358` remains proven: separate zero identities, not an 8-byte aggregate. Existing project types also prove GameState+0x10 year, +0x11 GameDate and +0x12/+0x13 GameTime.
- Exact next action: perform a **read-only retail/v75/v85 size, call-boundary, and literal-pool comparison** to locate v85's exact four-byte deficit and identify where the diagnostic rule perturbs code outside the solved +21CC zero/string relationship. Do not create another source/compiler variant until that four-byte cause is localized; do not promote the private rule or reopen v81/v82/v84/v86.

## Documentation audit checkpoint — October 4, 2026

- Re-read the authored project documentation before resuming decomp work: top-level project guides, all `docs/*.md`, both canonical `tools/ches` continuation files, and the small vendored libsix readme. Historical chronology is preserved where explicitly marked historical/superseded.
- Corrected stale live-state claims to production HEAD `9078f36`, progress 61,132 / 940,036 = 6.5032%, current 13-rule compiler patch SHA256 `aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`, completed GameObject lookup/teardown, complete 94-selector / 58-target factory mapping, and active loader `func_08011650`.
- Updated stable character/progress/repository/custom-character/SpriteAnimator docs plus current roadmap/compiler dashboards. Old resource/NPC/metadata snapshots that remain are explicitly historical milestones rather than current next actions.
- Local Markdown link audit reports 0 broken relative links. No gameplay/source/asm/linker/compiler files were changed by this documentation audit.
- Final audit verification passed: `git diff --check` is clean, the focused live-state markers point to `9078f36` / 61,132 / 6.5032%, local Markdown link audit has 0 broken relative links, and no source/asm/include/linker/compiler path changed. Follow-up reconciliation relabeled stale October 2/3 current/next headings as historical and aligned the live loader bullets with v81-v86. Documentation audit is complete. Exact next action is the read-only retail/v75/v85 four-byte-deficit comparison above. Do not redo the documentation read or factory/lookup discovery.

## Loader continuation checkpoint - v76-v80

- Production remains unchanged at `9078f36`; all work remains private loader research.
- **candidate-v75.cc remains the best at exact 0x2E4 / 220 differing linked bytes.** Post-pool executable code `080118D8..0801192F` and final `08011930` literal remain exact.
- Sister comparison proves the first zero is one logical value reused for `state_21cc+4` and the dead first-fill scalar, distinct from the string-zero value.
- v76 tests one ordinary long-lived first zero across header + field_04 + first fill: **0x2E0 / 607**, reject.
- v77 keeps the early r9 scaffold but uses an ordinary alias for field_04 + first fill: **0x2D8 / 659**, reject.
- Copy helpers prove a narrow two-u32 head at `+21CC/+21D0` before byte arrays at `+21D4`. v78 models only that head with an inline initializer and is **byte-identical to v75 (0x2E4 / 220)**. Type evidence retained; helper codegen-neutral.
- v79 changes only `u8 string_zero` to plain `char`; it is also **byte-identical to v75**. Signedness does not separate the zero pseudos.
- v80 adds only a named `map_none = 0x234` on v75: **0x2E4 / 446**. It improves Location 55 -> 54 and strings 45 -> 33, while preserving the post-pool path exact, but fills 22 -> 66, flags 2 -> 52, records 25 -> 112. Diagnostic only.
- **Exact next action:** resume from v75. Read-only compare retail/v75/v80 over `080116DE..0801177C`. Identify the value/register that stays live in v80 across the string-clear -> fill transition and displaces v75's good `r5 -> sp+8`, `r4 = state+2C48`, `r8 = state+2C4A` roles. Only then create the next candidate, changing that one lifetime while trying to preserve v80's local Location/string gain. Do not retry v76-v79, hard-r9 late reuse, narrow-head helper, string signedness, or compiler work.

## Loader continuation checkpoint - v71-v75 (superseded by v76-v80)

- Production remains unchanged at `9078f36`; retail SHA1 and source progress are unchanged. All new work is private under the loader checkpoint.
- **candidate-v75.cc is the new whole-function best: exact 0x2E4 / 220 differing linked bytes**, improving v56's 226. Candidate SHA-256 is `eef1f00a61b235c303bd2997e91860c225d8be49328c7bd7d0e8fbfac3c6e3c3`.
- v69's +4-byte size excess was proven to be one extra literal word `0x21F0`, not extra pre-pool instructions. v71 (`state_21cc[0x24]`) and v72 (named string offset) compile identically to v69 at 0x2E8 / 340 and are closed.
- v73 derives the record array from a mutable `0x2C1C + 0x30` offset: 0x2E4 / 231. It proves pool-size recovery but perturbs the flags allocation. v74 tries the sister initializer's explicit offset-mutation shape and regresses to 0x2E0 / 550. Both are diagnostic only.
- v75 changes only the record-array base to the natural `state_2c48 + 4` relationship. This removes the separate `0x2C4C` pool word without carrying a new offset through the flags block. Region counts are: header 21, Farm/Farmer/Dog 34, Location 55, +21CC/strings 45, fills/setup 22, flags **2**, record/subobjects 25.
- v75's executable code at `080118D8..0801192F` and final `08011930` literal are exact. Remaining late differences are 3 pre-pool bytes plus 16 pool bytes. The pool has the correct word count but substitutes `0x21F0` for retail `0x2C4C` and realigns at `0x2C74`.
- Sister `func_08010358` independently confirms retail's desired string address lifetimes: live `0x21CC` derives +0x24, live `0x21E0` derives +0x20, while a separate `0x2C4C` literal remains. Therefore v75's pool substitution is a matching artifact, not the retail source model.
- The next causal mismatch is still the two-zero lifetime split. Retail uses the older r9-backed zero for `state_21cc+4` and dead `[sp+4]`, while a distinct r5 zero owns the three string clears and later becomes `sp+8`. v75 still uses r5 for all four roles. Explicit late hard-r9 use has already been rejected and must not be retried.
- **Exact next action:** resume from `candidate-v75.cc`. Before creating v76, compare the natural source operations around the two zero births and their call-crossing lifetimes in retail loader vs sister `func_08010358`. Identify what semantic construction keeps the first zero alive while producing the independent string zero. Do not force registers, do not alter the exact post-pool save/read path, do not retry v71-v74 or earlier closed zero/Location/compiler families.

## Loader continuation checkpoint - v64-v70 (superseded by v71-v75)

- Production remains unchanged at `9078f36`; all work is private checkpoint research. **v56 remains the verified whole-function best at exact 0x2E4 / 226**, and its save/read tail `08011825..08011933` remains fully exact.
- v64 placement `Location(MAP_NONE,0,0)` is **0x2E8 / 604** and emits a non-retail null guard. v65 inline 3-arg constructor-body helper is **0x2EC / 594** and creates an extra r8 zero. Constructor avenue closed.
- v66 only `field_04 = hard-r9 zero` on v56 is **0x2F0 / 609**. Explicit late source use of the hard r9 zero is wrong.
- Sister `func_08010358` proves two long-lived zero identities are created much earlier than +21CC: one survives to field_04/dead fill temp, a separate one survives to the three string clears. v67 early explicit 32-bit string_zero is **0x2EC / 630**, so that source spelling is not original.
- v68 explicit second-fill zero is **0x2E0 / 516** globally, but locally recovers the exact desired fill roles: r5=sp+8, r4=state+2C48, r8=state+2C4A.
- v69 = v68 + explicit string_zero is **0x2E8 / 340**. It is not a baseline, but is the strongest local allocation diagnostic: r5 handles the three string clears then becomes sp+8 exactly like retail, with r4/r8 pointer roles correct. It locally improves +21CC/fills/2C/record regions. Wrong piece: field_04 and [sp+4] also use r5 instead of the older r9 zero. Its total is +4 bytes, which shifts/breaks the previously exact tail.
- v70 ordinary first zero on v69 is **0x2E8 / 597**; reject.
- No local branch/history/upstream update contains a solved loader/sister source. `origin/main` remote and local are both `b8471ae065744869f64283473ed68372f82321c9`.
- Exact next action: keep v56 authoritative and v69 diagnostic-only. Read-only locate v69's exact +4-byte excess by comparing instruction counts and literal pools against retail/v56, including call-boundary census and first alignment shift. Only after identifying whether the extra unit is an instruction or literal should another candidate be created. Goal: preserve v69's r5->sp+8 and r4/r8 roles while removing exactly that unit. No compiler changes and do not touch v56's exact tail.

## Loader continuation checkpoint — v57-v63

- Production remains unchanged at `9078f36`; all work is private checkpoint research. **v56 remains best: exact 0x2E4 / 226**, and save/read tail `08011825..08011933` is fully exact/closed.
- Retail/sister alignment proves three zero identities: r9-backed integer zero for field_04/dead first-fill temp, a separate zero across the three string clears, and immediate zero inside the first fill. Retail then reuses r5 for the second-fill stack-value pointer.
- v57 **0x2E4 / 256** locally fixes Location pointer/MAP_NONE/mask register family but not mask-load order or r5 zero. v58 **0x2E4 / 455** gets load order with too much register pressure. v59 **0x2E4 / 397** synthesizes -1024 instead of literal-load. Reject all as baselines.
- v60 **0x2E4 / 299** is key local evidence: explicit string_zero plus v57 emits retail-like r5=0 and improves +21CC/strings from 53 to 37 differing bytes, but r5 then incorrectly owns field_04/[sp+4] and poisons fills/2c/tail. v61 hard-r9 field_04 is **0x2E8 / 507**; reject.
- v62 `'\0'` literals and v63 `char *` string lvalues are both **0x2E4 / 226**, effectively same as v56. String type spelling does not create the separate zero pseudo.
- `--trace` allocator diagnostic on v56 produced an empty log even with `AGBCC_TRACE_ALLOC=1`; no useful trace is available. Do not pursue compiler-tooling changes.
- `0x080947BC..0x080949xx` confirms +21CC is raw-ish serialized storage, not a hidden copy-constructor object.
- New strong evidence: `include/actor.hh` defines real inline `Location(u32 map,u32 x,u32 y) : map(map), x(x), y(y)`. Retail's mysterious r5=0 appears exactly where the two zero constructor args could become live. This constructor-semantic hypothesis is distinct from v47's rejected independent field assignments.
- Exact next action: from candidate-v56.cc, test one in-place/direct-construction spelling equivalent to `Location(MAP_NONE, 0, 0)` at GameState+0x1CCC using the existing recovered constructor (or one tiny inline 3-arg helper only if placement construction is unavailable). Make no other change. Compare immediately and inspect 080116DE..08011760. Keep only if it naturally explains the r5 zero while preserving retail Location masks and does not poison later allocation. Otherwise return to v56.

## Loader continuation checkpoint — v48-v56

- Production remains unchanged at `9078f36`; all loader work remains private checkpoint research.
- v48 r1-header diagnostic **0x2EC / 655**, v49 scalar header date **0x2E4 / 435**, v50 scoped typed calendar **0x2E8 / 330**, v51 single typed header **0x2EC / 526**, v52 direct typed calendar casts **0x2E8 / 330**, and v53 natural zero allocation **0x2E8 / 594** are closed matching paths.
- v47 was not locally closer than v43 in the Location block (56/56 differing bytes versus 55/56), so do not pursue the previously proposed Location constructor/temporary. Keep only the proven semantic fact that +0x1CCC is `Location`.
- v54 **0x2E4 / 228** fixes checksum-read setup by computing a declared `checksum_offset` before zeroing `stored_checksum`; this makes the four instructions at 0x080118D8..DF match retail ordering. Its signed -2017 mask still zero-extends through a u16 lvalue.
- v55 explicit int time-mask local gives **0x2E4 / 229** and is not the baseline.
- **v56 is current verified best: 0x2E4 / 226.** It is v54 plus an `i16 *` lvalue for the `&= -2017` GameTime mask, yielding retail `0xFFFFF81F` without extra register pressure.
- **The save/read tail 0x08011825..0x08011933 is now completely exact: 0 differing bytes. Do not touch it again.**
- Remaining mismatch is entirely in the default initializer. The densest known region is +0x21CC/strings (53/54 bytes on the same layout family), followed by Location and earlier register-coloring bands.
- Exact next action: start from `candidate-v56.cc`. Read-only align retail/v56 over `08011712..0801178C` and compare with sister initializer `func_08010358` at its +21CC/strings/fills sequence. Recover a new source-lifetime fact before mutating. Specifically preserve the evidence that retail distinguishes the r9-backed zero used for field +4/dead stack scalar, a separate string zero, and immediate zero inside the first fill. Do not retry explicit string_zero, hard-r9 forcing, fill-by-reference, flat State21CC, typed calendar, Location constructor, or compiler changes.

## Loader continuation checkpoint — v38-v47

- Production remains unchanged at `9078f36`; all loader work remains private checkpoint research.
- v38 **0x2E8 / 359**, v39 **0x2EC / 608**, v40 **0x2E4 / 246**, v41 **0x2E8 / 334**, v42 **0x2E4 / 490** are closed matching spellings.
- **v43 is current verified best: 0x2E4 / 236.** Its critical change is making the first parameter `u8 * bytes` directly and removing the state->bytes alias. This recovers the retail prologue exactly through state capture/save_context spill ordering.
- v44 **0x2E8 / 330** rejects typed calendar on v43. v45 **0x2E0 / 563** rejects moving 2C48/2C4A declarations after the second fill. v46 **0x2E8 / 355** rejects explicit string_zero on v43.
- `include/actor.hh` proves GameState+0x1CCC is the real packed `Location` (`map:10`, `x:16`, `y:16`), with MAP_NONE=0x234. v47 uses direct Location field assignments and gives **0x2E4 / 237**: semantically correct and exact-size, but one byte worse than v43, so type evidence is retained but direct assignment spelling is not promoted.
- Exact next action: resume from candidate-v43.cc. Read-only compare retail/v43/v47 over 080116DE..08011714. If v47 is locally closer, test exactly one Location constructor/temporary spelling using the existing `Location(u32,u32,u32)` semantics and no other source changes. Otherwise keep v43 raw Location masks and move to the next first divergence. No compiler work.

## Loader continuation checkpoint — v31-v38

- Production remains unchanged at `9078f36`; all loader work remains private checkpoint research.
- v31 is byte-identical to v30. v32 **0x2D4 / 558** proves signed `-16` is the correct `+0x3494` loop mask source. v33 **0x2E0 / 558** is a size improvement but rejects using the dead `[sp+4]` zero as first-fill value; retail never reads it.
- Current project `BitArray` is not the `+21D4/+21DC` container: its exact Furniture ctor emits 32-bit stores, while these GameState fields initialize bytewise and have bit/8 byte consumers.
- v35 **0x2D4 / 556** proves a distinct `payload_size` copy after the first read: it recovers retail's long-lived r4 size value. v34 is compile-invalid because its declaration crosses goto targets.
- v36 **0x2E0 / 526** proves branch-local pointers to `gUnk_03000400`; this recovers the separate global-address loads in each error branch. Its only size deficit was the missing `0x1CCC` literal.
- v37 computes `farmer = bytes + 0x1BD8` before the local GameDate bitfield writes. Result **0x2E4 / 240**, exact retail size and current verified baseline. This restores retail's Farmer argument evaluation order and the standalone `0x1CCC` literal.
- v37 retail comparison shows a distinct mid-function zero lifetime: retail sets r5=0 at `080116F2` after Dog construction and reuses it for the three string-slot clears at +21E0/+21F0/+2200. This likely explains a large remaining register-allocation band.
- `candidate-v38.cc` has been created from v37 to test exactly that: declare `u8 string_zero`, assign it zero immediately after the first +1CCC u16 write, and use it for the three string clears. **v38 is unverified because the 50-call checkpoint fired during creation.**
- Exact next action: compare `candidate-v38.cc` immediately over `08011650..08011934`. Inspect `080116E8..08011744`. Keep it only if it naturally emits retail-like `movs r5,#0` around `080116F2`, retains r5 for the three string clears, and preserves exact 0x2E4 size. Otherwise resume from v37. No compiler change.

## Loader continuation checkpoint — v23-v30

- Production remains unchanged at `9078f36`; all work is private checkpoint research.
- v23 **0x2D0 / 511** is the best raw byte-difference result, but its 0x1C frame is structurally wrong because the early r9 zero remains live too long.
- v24 **0x2CC / 557** is the current structural baseline: exact 0x18 frame and correct natural reuse of r9 as the `sp+0x0C` pointer after the early zero lifetime ends.
- v25 **0x2D4 / 568** and v26 **0x2CC / 560** prove explicit second-zero/fill locals do not recover retail's destination/count-before-pointer scheduling. v27 **0x2D8 / 652** rejects passing the early hard-register zero by reference. v28 is byte-identical to v24.
- v29 **0x2D0 / 554** with an int temporary recovers signed negative-mask codegen at GameState+0x2C4A but over-reuses -9 to derive -17.
- Consumer audit proves +0x2C4A bits 3..7 are five independent one-bit fields. v30 **0x2D0 / 562** with a scratch bitfield struct reproduces retail's entire signed mask chain exactly. Its only local mismatch is pointer caching: v30 keeps the pointer in r3, while retail uses r0 as the initial pointer/value and reloads `r8` into r1 before the final store.
- `+0x21CC` is a proven 0x44-byte cluster: u32/u32, 8-byte bit storage, 4-byte bit storage, three 16-byte string slots; next field +0x2210. +21D4/+21DC have direct bit-index consumers.
- Call-boundary census localizes remaining size deficits to a few regions rather than the whole initializer; preserve that measurement and do not return to broad syntax permutations.
- Exact next action: start from `candidate-v30.cc`, keep `State2C4AFlags`, remove the cached `flags` local, and perform all five bitfield assignments through direct non-cached `reinterpret_cast<State2C4AFlags *>(state_2c4a)` expressions. Compare immediately. Target the retail `mov r0,r8 ... mov r1,r8; strb` pointer reload around the now-exact mask chain. No compiler change or duplicate-base/early-zero rollback.

## Loader continuation checkpoint — v17-v22

- Production remains unchanged at `9078f36`; all v17-v22 work is private checkpoint research.
- v17 **0x2D4 / 632**; v18 **0x2D8 / 626**; v19 **0x2D4 / 652** (reject int-temp); v20 **0x2DC / 605** with real `GameDate` bitfields; v21 **0x2D4 / 659** (reject whole-header/single-base hybrid); v22 **0x2C8 / 557** with a shared `+0x21CC` pointer.
- Game-state copy code proves the `+0x21CC` contiguous cluster: u32 +0, u32 +4, 8 bytes +8, 4 bytes +0x10, then 16-byte strings at +0x14/+0x24/+0x34; next field is +0x44 / GameState+0x2210.
- v20 proves typed `GameDate` assignments are meaningful source evidence: they naturally reuse the same -4/-125 masks for the header and Farmer local date. v22 proves the `+0x21CC` shared-base shape is meaningful: it recovers `[ptr+4]` and `ptr+0x10` addressing and improves byte agreement despite being too short.
- Exact next action: start from `candidate-v22.cc`. Hoist only pointer locals for `bytes + 0x2C48` and `bytes + 0x2C4A` to just before the second `fill_n_inl(state_21cc + 0x10, 4, 0)`. Reuse those pointers for the existing 0x2C48/0x2C4A operations after `func_080114F8` and `func_0809A8AC`; leave `bytes + 0x2C1C` where it is. Compare immediately. This targets retail's five early pointer-setup instructions and r4/r8 lifetimes. No compiler change, duplicate base, or broader layout experiment.

## Loader continuation checkpoint — v11-v16 bounded

- Production `ches-dev` is unchanged at `9078f36`; no source/asm/linker/compiler contribution path changed in this turn. All new work is private under `tools/ches/checkpoints/save-loader-08011650-2026-10-04/`.
- Retail disassembly proves `func_08011650` uses a **0x18-byte stack frame**, captures the destination base in **r7**, keeps that r7 base through initialization/read/checksum/return, and has no v6-style `[sp+0x18]` duplicate base spill.
- v11 implemented the prior non-overlap hypothesis exactly: all late payload/checksum/return uses switch from `state` to `bytes`. Result **0x2D4 / 606**. It removes the spill and gets the single-base model right, but loses unrelated codegen pressure. Do not restore the duplicate spill merely to recover size.
- v12 zero-after-header: **0x2D0 / 641**. v13 base+header-before-hard-bindings: **0x2D8 / 638** and best diagnostic instruction-sequence similarity among v6/v11-v14, but header is too early in r5. v14 header-from-state is byte-identical to v11, proving that early extra state use canonicalizes away. v15 base-before-hard-bindings/header-after: **0x2D0 / 638**, close prologue shape but save_context still spills before r7 capture and header uses r2. v16 fixed-r7 diagnostic: **0x2D4 / 613**, rejected; forcing r7 does not solve scheduling and must not be promoted.
- `compare-function.py --trace` generated empty allocation logs with the current tracked compiler even with `AGBCC_TRACE_ALLOC=1`; do not rely on that trace path unless a deliberate diagnostic compiler with the hook is prepared.
- Exact next action: start from `candidate-v15.cc`. Move only `clear_date_bits` (`-125`, r8) declaration/initialization to immediately **after** `header[9] &= clear_low_two`. Retail `08011674..08011686` loads header[9], initializes/applies -4, then initializes -125 into r3/r8 and applies it. Compare immediately. Do not change the compiler, restore v6's duplicate spill, or repeat fixed-r7.

## Active scope — October 4, 2026

The user explicitly narrowed this work to making future custom NPCs possible
through retail decompilation, typed data, recovered interfaces and documentation.
Recover the necessary identity, entity/factory/lifecycle, scheduling,
interaction, asset/provider and persistence boundaries while preserving the
byte-identical retail ROM. Custom NPC creation and new gameplay, registry,
asset or save-extension behavior are deferred. Proposed implementation notes
below are reference material; completing their prerequisites does not start
implementation automatically. This overrides the earlier prototype plan.


## Superseded pre-lifecycle snapshot (historical)

### Exact data milestone: character metadata

- All 43 existing `CharacterInfo` records are editable C++ in
  `src/data_character_info.cc`, with a bounded public table declaration.
- All 344 data bytes match. Six layout assertions and the complete 956-byte
  identity-helper canary pass. Original name pointers, birthday bytes, padding,
  `gUnk_08104258` alias, name pool and `bad_alloc` neighbor are preserved.
- Fresh tracked isolated installation and both corrected `make -B -j4 compare`
  builds exited 0. Both reproduce all 8,388,608 retail bytes and SHA1
  `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
  All 16 checked addresses and two data boundaries pass; compiler unchanged.
- Executable source remains **61,072 / 940,036 = 6.4968%**. This unit recovers
  **344 readonly data bytes and 0 executable bytes**. Custom-game code is unchanged.
- Proof: `tools/ches/checkpoints/character-enablement-2026-10-04/`, including
  the data/layout proof, helper canary, V2 integration plan, fresh installer,
  forced build logs and both full-ROM proofs.
- V1 placed the exact table after the wrong parent section, causing 6,341
  differences. Preserved failure/ROM/map/plan explain the rejected placement.
  V2 places it after `.rodata.after_cursed_tool_requirements`; the corrected
  inputs are promoted, with no source or compiler permutations.

Contribution saved as `56f343454bcb98d2712b9043b8c5d410cb22cc98` (`56f3434 decompile character metadata table`), committed, pushed to `ches/ches-dev` and independently remote-verified. Index empty.

### Last executable-code unit: NPC support (565529c)

- Retail branch `ches-dev`; last executable contribution `565529c3e521db9eaaf75e0a75253ce9d68044de`.
- Five functions recovered: `GetCharacterLocation` (080A03B8,100/0),
  `ApplyNpcSchedule` (0803D688,348/0), `InitializeCharacterSchedules`
  (0803D7E4,576/0), Lillia constructor (08035AFC,60/0) and effect factory
  (08035B38,44/0). Existing `ANpcEntity` module remains exact across 1,684 bytes.
- Source **61,072 / 940,036 = 6.4968%**; assembly **878,964 = 93.5032%**.
  This unit adds **1,128 linked source bytes**.
- Both isolated and production `make -B -j4 compare` exit 0 and reproduce
  all **8,388,608 bytes**, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
  Isolated compiler was freshly installed from the tracked pinned installer.
- `include/entity_npc.hh` exposes the existing base and proven 0x48-byte Lillia
  class. Normal ABI aliases preserve callable symbols and retail vtable
  ownership. All 34 checked addresses and six linker boundaries pass.
- Current compiler remains the same 13-flag reconstruction, patch SHA256
  `aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`.
  No compiler changes, forced registers, volatile or new inline assembly.
- Private proof: `tools/ches/checkpoints/npc-support-2026-10-04/`, including
  baseline/backups, first candidates, `results-v1.json`, combined candidates,
  `combined-results.json`, `production/`, `integration-plan.json`, both forced
  logs, `isolated-proof.json`, `production-proof.json` and the reproduction
  scripts/commands. Detached `/mnt/data/Github/gba/fomt-npc-support-integration`
  preserves the exact isolated result.
- The custom-game source stays at `60eaccafa2c92056ee56283ea4ee8f5d6c59377c`.
  Custom NPC implementation is deferred. The 43-entry retail metadata is now
  exact typed source; factory/lookup,
  loader and asset-authoring boundaries remain open.

Contribution saved as `565529c3e521db9eaaf75e0a75253ce9d68044de` (`565529c decompile character location, schedules and Lillia entity`), committed, pushed to `ches/ches-dev` and independently remote-verified. Index empty.

### Historical next continuation (completed and superseded)

1. Read the final metadata proof/save record in
   `tools/ches/checkpoints/character-enablement-2026-10-04/`; this 43-record data
   unit and the previous five functions are complete. Do not repeat their
   matching/builds. Scope is retail support/interface recovery; custom NPCs
   and new registry/save/asset behavior remain deferred.
2. Audit raw indexed lookup `0801FD00`, every caller and the owner/return-type
   layout before native source. Then recover factory `0801A8E0` ownership,
   setup/teardown loops, interaction routing and legacy loader `08011650`.
   Preserve separate ID domains and the fixed social/save layouts; selector 43
   is occupied. Choose coherent five-function units where feasible.
3. Recover original asset/provider/display/script formats and verify unchanged
   round trips as retail support evidence. Document remaining capacity/bounds
   and engine consumers, without creating a new character or save extension.
4. Original name strings remain a bounded incbin pool; recover exact typed
   strings when their alignment/aliases/consumers are audited. Metadata is
   already source, so widening it is not the next task.
5. Preserve private README/docs, prior checkpoints/worktrees and deferred
   allocator/compiler evidence. Completing prerequisites does not start a
   custom-game implementation automatically.

## Archived research handoff — superseded for current task

# Historical FoMT continuation — October 3, 2026

## HISTORICAL SNAPSHOT — custom-character pivot (superseded by the October 4 snapshot above)

Research and documentation requested by the user are complete. No character
implementation has started. Planning assumption: one added ordinary NPC with
original cast and save compatibility; replacement NPCs and farmer customization
remain alternative scopes. No answer to the optional category question was
received, so this is an explicit research assumption.

- Retail branch `ches-dev`, HEAD `0514b05ec4a1dbfab37f49a377e27163923d8429`;
  source **59,944 / 940,036 = 6.3768%**. Last exact full-ROM build remains intact,
  SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`; no new source bytes claimed.
- Custom-game branch/source remains HEAD `60eaccafa2c92056ee56283ea4ee8f5d6c59377c`
  in `/mnt/data/Github/gba/fomt-custom-game-worktree`. The character/save/plan
  docs are shared there and its expansion progress rows aligned, without
  merging any source or build changes.
- Stable facts: [CHARACTERS.md](../../docs/CHARACTERS.md); proposed implementation
  stages: [CUSTOM_CHARACTERS.md](../../docs/CUSTOM_CHARACTERS.md); persistence:
  [SAVE_FORMAT.md](../../docs/SAVE_FORMAT.md). Dashboard/roadmap/map/notes/playbook
  and contribution-facing progress are aligned with this pivot.
- Character metadata is 43 entries at 08104258, now decoded in evidence and
  correctly documented as name pointer + birthday bytes + padding. Source data
  remains `.incbin`; the header is a typed view. Fixed social block is 0x478
  bytes at GameState+1CD4, separate from an added-NPC state design.
- **Corrected inherited research:** 0803D7E4 makes **31 unconditional schedule
  applications plus conditional child = 32 total**, for IDs1..29,33,34,35.
  AEntity+30 creates an effect; it does not construct the NPC. GameObject+30 is
  map height, so 0802CDCC is not the NPC factory. Call233 is annotated/corrected.
- True factory: `func_0801A8E0`, indexed pointer storage at owner+8, jump table
  0801A924. Case1 at 0801AEE4 allocates Lillia's **0x48-byte entity**, passes
  GameState+1D44, calls 08035AFC. Entity vtable080E7198+30 -> 08035B38 creates
  its distinct **0x8C-byte effect**. Getter at0801FD00 is unchecked; selector43
  is already occupied. Preserve character/entity/resource/script ID domains.
- Native display-bank0852D984 has **184 animation selections**; verified pool
  counts184,184,1037,11586,52,0,184. Complete expression mapping and new-asset
  import/encode/relocation workflow are still open.
- Retail leaves **0xAF0 / 2,800 bytes per save slot** unused. No extension
  serializer, registry, loader, migration or combined save transaction exists.
  Legacy loader08011650 still needs recovery/lifecycle validation.
- Evidence: `tools/ches/checkpoints/character-expansion-2026-10-03/`, including
  `audit_evidence.py`, decoded roster/registration/factory/source JSON, exact
  disassembly, display-bank metadata, script994 extract, baseline and code/build
  preservation manifests. No editor installation, source change, toolchain
  experiment, commit, push, PR or external message occurred in this pivot.

The previous allocator five and its compiler frontiers are **deferred**; all
saved candidates, exact contributions, old worktrees and private README remain.
The next support batch is a proposal; none of its functions is newly matched.

## Exact next continuation

1. Read the three stable docs and this checkpoint, including the corrections to
   old factory/count claims. Choose the ordinary added-NPC reference already
   traced (Lillia) unless the user steers the category differently.
2. Begin the proposed retail support unit: **080A03B8, 0803D688, 0803D7E4,
   08035AFC, 08035B38**. Inspect saved/source bodies, callers, receiver classes,
   ownership and ABI before candidates. Their total bounded extent is0x468
   bytes including literals/alignment, not a demonstrated source gain.
3. Prepare exact typed character metadata while preserving all43 IDs/offsets,
   child behavior, packed birthdays and aliases. Expose shared class/interfaces
   only when proven; use the existing matching toolchain and isolated full-ROM
   gates. Five-function cadence applies when actual matching work resumes.
4. Then audit/recover the main entity factory/lookup and every array/lifecycle
   consumer, interaction triggers and legacy save loading. Do not treat unused
   character ID43 as an unused entity selector or widen packed GameState.
5. Prove original asset/script round trips and the display/portrait mapping.
   The custom implementation starts only after the boundaries are understood:
   one independent NPC, correct daily/map lifecycle, dialogue/art, friendship,
   stable-key state and versioned save tail; use the plan's gameplay/failure
   checklist. New romance and farmer customization are separate later units.
6. This completed request was research/docs first. No speculative implementation
   or publishing was performed. Maintain separate retail exact contributions
   and custom-game behavioral changes on future continuation.

## Archived retail allocator snapshot before the character pivot

All current/next statements below are chronological evidence. The snapshot and
continuation above own current work; do not resume the allocator merely because
an older section calls it immediate or next.

- Repo `/mnt/data/Github/gba/fomt`, retail branch `ches-dev`. Contribution save: `0514b05ec4a1dbfab37f49a377e27163923d8429` (`0514b05 decompile resource subtree ranges and release`), committed, pushed to `ches/ches-dev`, and independently remote-verified. Index empty.
- Both isolated and production plain `make -B -j4 compare` builds exit0 and reproduce all8,388,608 retail bytes; SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. Isolated compiler was freshly built by the tracked installer.
- Source **59,944 / 940,036 = 6.3768%**; assembly **880,092 = 93.6232%**. Five-function subtree unit adds436 linked bytes:434 body bytes plus2 ordinary alignment bytes.
- New exact functions: order-8 full fill `080D6ECC`32/0, full clear `080D6F3C`30/0; order-9 range fill `080D7118`148/0, range clear `080D734C`152/0; order-8 release `080D7678`72/0. All15 previous resource functions stay exact:20 recovered functions share `src/resource_handle.cc`.
- Compiler unchanged: tracked `tools/install_agbcp.sh`, pinned base `1caa6becde5e4676b59c31c74d68f45ced79557c`,13 structural flags; patch SHA256 `aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`. Compatibility reconstruction, not recovered historical Nintendo compiler. No diagnostic, new rule or source forcing promoted.
- Evidence: `tools/ches/checkpoints/resource-subtrees-080D7094-2026-10-03/`: `candidate-combined-v3.cc`, `production-candidate-v3.cc`, `combined-all-v3/results.json`20/20 exact, `isolated-proof-v3.json`, `production-proof-v3.json`, successful fresh-install/forced-build logs, `verification-commands-v3.json`, `integration-plan-v3.json`, `verify_batch_v3.py`. All46 checked addresses/aliases/neighbors and14 source-section seams pass.
- Four contribution paths: `src/resource_handle.cc`, `asm/code_linkonce.s`, `fomt.lds`, `docs/RESOURCE_HANDLES.md`. Stable architecture covers the full/partial subtree geometry, release dispatch, flags and exact seams. Raw copy/query/helper islands, root allocation/reservation, and both mismatching order-8 partial functions retain assembly positions.
- Detached `/mnt/data/Github/gba/fomt-resource-subtree-integration` is exact. Old worktrees/checkpoints, custom-game and private README remain intact; README SHA256 `7933c9e5448719a24198b6e6e11efbaab3f597a24e8784eea324cdaf67207754`.
- Next coherent five: order-9 full fill `080D6EEC` and clear `080D6F5C`, order-7 full fill `080D6EAC` and clear `080D6F1C`, and order-7 release `080D7634`. Use the exact order-8 helpers and release as source anchors. These next five are still assembly; no new match is claimed. `next-batch-selection-v3.json` records body/alignment bounds and expected196-byte linked gain if exact.
- Order-8 partial fill `080D7094` is130/50 versus132 expected; partial clear `080D72C4` is132/50 versus134 expected. V1 and explicit-copy V2 converge. Fill V2 RTL copy134 survives CSE, but CSE substitutes end for remaining in subtraction137; the copy becomes unused and is deleted in flow. Saved `rtl-v1/`, `rtl-v2/`, and `rtl-slices/` own the causal evidence. Do not repeat source-spelling variants or add a compiler rule without new structural evidence. Root allocation remains126/10, all13 genuinely unset-rule ablations unchanged; reservation best300/211 with aggregate-reference ABI unproven.

## Exact next actions

1. The four-path V3 subtree unit is saved as0514b05, pushed and independently remote-verified. Read contribution-save-v3.json and documentation-audit-v3.json for final evidence; do not repeat its matching, integration, build, commit or push. Proceed directly to the next five below.
2. Next coherent five: order-9 full fill `080D6EEC` and clear `080D6F5C`, order-7 full fill `080D6EAC` and clear `080D6F1C`, and order-7 release `080D7634`. Use the exact order-8 helpers and release as source anchors. These next five are still assembly; no new match is claimed. Start from current production source and `next-batch-selection-v3.json`, inspect their retail bodies/callees, then create a fresh private checkpoint. Full clears have30-byte bodies plus2 alignment; order7 release has68 bytes through080D7678. Expected next gain196 is only a plan.
3. Reuse the same typed ResourceBlock geometry and rawu8 getters. Preserve forward child visitation for fill, backward for clear, conditional child pointer for release and the original start passed to the child. Keep remaining leaf/order6 operations in assembly until exact.
4. The two order8 partial ranges are a documented CSE/flow frontier, not the next syntax search. Read `targets-v1/results.json`, `targets-v2/results.json`, V2 source and pass slices before any new investigation. Explicit remaining=end; remaining-=half; remaining-=offset did not survive canonicalization. No compiler change was made.
5. Preserve Allocate126/10 and Reserve300/211 investigations in the previous allocator checkpoint. After the next coherent dependency batch, rerank shared infrastructure using `tools/ches/checkpoints/decomp-leverage-2026-10-03-resource-subtrees-v3.md`. Do not let one unresolved compiler frontier stall unrelated exact reconstruction.

## Closed paths and reusable lessons

- Initial planned640-byte range batch is superseded by final436-byte V3 batch; two partial ranges stay assembly and their proven full reset dependencies replace them. Baseline/targets-initial.json retain initial estimates; targets.json and integration-plan-v3.json own final scope.
- V1/V2 order8 partial ranges omit retail's end r0 -> remaining r2 copy, shifting later addresses by2. V2 creates that copy in initial RTL; CSE rewrites its following self-modification to use the source, and flow deletes the now-unused copy. Existing uservar rule does not establish an independent quantity across the intervening branch. Stop broad source permutations at this measured frontier.
- Flat comparison must expand the shared header before removing every SECTION annotation. Combined V3 is20/20 /0. Full-ROM proof uses the real sectioned source and validates all14 seams.
- Order8 full clear has30 body bytes plus2 alignment. Order8 Free is72 bytes without padding. The full ROM verifies all literals and preserved neighboring positions.
- Existing root range, Free and pool lessons remain authoritative: reference-returning min, semantic half-size, two subtracts, rawu8 flag getters, conditional child pointers, backward initialization and entries+(count-1). Do not restart the already-exact order9 fill V15 or original V14 wrong-bound candidate.
- Existing13 switch ablations require actual unsetting: getenv value0 is enabled. The pointer-tie rule is not causal for root allocation. Constructor PRE, acquisition late threader and entity/renderer/SpriteAnimator investigations are closed without new counterevidence.

## Historical checkpoints (superseded for current state)

### Superseded entity snapshot and in-flight resource integration

# Historical FoMT continuation - October 3, 2026

This section preserves the then-current work at that checkpoint. It is historical evidence and must not be replayed as an active task; the October 4 snapshot at the top owns current work.

- Repo `/mnt/data/Github/gba/fomt`, branch `ches-dev`. Current contribution HEAD is `9a6a26fc50ec4dde8536fa982ba84c2a6c59e2a0` (`9a6a26f decompile entity effect lifecycle`); the complete verified unit is committed, pushed, and remote-verified.
- Production ROM is **byte-identical across all 8,388,608 bytes**, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Exact progress: **57,712 / 940,036 = 6.1393% source**, 882,324 assembly. The new four bodies add 520 executable bytes; the typed 20-byte table is data and does not change that metric.
- Completed five-method unit: constructors `080324BC` (0xA4) and `08032560` (0xAC), update `0803260C` (0x84), renderer `08032690` (0x270), destructor `080DC8F8` (0x34), all / 0. Typed vtable `080E68B4` is 0x14 / 0.
- Shared type/layout: `include/entity_effect.hh`; core: `src/entity_effect.cc`; explicit destructor-flags boundary: `src/entity_effect_dtor.cc`; minimal data unit: `src/entity_effect_vtable.cc`. Existing actor and draw-helper source use the shared types. The former standalone renderer file is removed.
- Stable architecture: `docs/ENTITY_EFFECTS.md`. Higher-level identity of UnknownEntityThing and some renderer/resource fields remain unresolved; retain neutral names.
- Compiler authority is tracked `tools/install_agbcp.sh` and patch SHA256 `5d6c6a891453f5939749499bfb5ca0db3f6f5a1bffd4a881809bf546e6e511ec`, pinned base `1caa6becde5e4676b59c31c74d68f45ced79557c`, eleven flags. New structural rule is `AGBCC_PRESERVE_INTEGRATED_NARROW_ZERO`; no diagnostics or identity-specific rules are promoted.
- Validation: clean pinned compiler rebuild, 11 hard/batch target checks, 54/54 saved modules unchanged (five focused canaries included), combined typed batch, isolated full ROM, and freshly installed plain production full ROM all PASS. Evidence: `v21-package-provenance.json`, `v25-final-batch-results.json`, `v27-isolated-proof.json`, `production-proof-v27.json` in the entity checkpoint.
- Required onboarding is complete: all 56 pre-existing authored documents read through EOF; frozen inventory/read state in `documentation-read-2026-10-03/` within that checkpoint. The new architecture and current-doc reconciliations preserve the resulting knowledge.
- Preserve private README/AGENTS/docs/research and all archived worktrees. Compiler backups are under `production-compiler-before-v21/`. No custom-game change, PR, external message, or unrelated project mutation.

## Exact next actions

1. The entity unit is saved as `9a6a26f`, pushed, and remote-verified. Do not replay its integration, CSE probes, or contribution save. Preserve the private dirty state and start from the next batch below.
2. Start the next coherent five-function batch: shared handle-manager/client constructor `08007874`, destructor `080079E8`, acquisition `08007B54`, release `08007C28`, and lookup `08007D4C`. Refreshed ranking: `tools/ches/checkpoints/decomp-leverage-2026-10-03.md`.
3. Read `docs/ENTITY_EFFECTS.md`, existing `UnkHandleBase`/`UnkHandle` in `src/code_080A46AC.cc`, `EffectHandle` in the shared header, and all five retail bodies in `asm/hardware.s`. Audit hidden destructor flags before replacing the imported alias.
4. Trace callers and `gUnk_03000408`. The first constructor lazily allocates 0x92C bytes; destruction decrements shared count at +0x924. Acquisition/release/lookup use global occupancy and packed-handle validation. Recover exact entry/generation/slot layouts before semantic naming. The lookup's VRAM use in `080A480C` is a useful anchor, not proof of every manager field.
5. Keep new candidates isolated, reconstruct a coherent typed five-function unit, and apply the same target/corpus/full-ROM/reproducibility gates. Do not restart compiler-version hunts or closed entity/renderer syntax families.

## Closed paths from this unit

- V17 selected-register uservar filter: ineffective; aliases canonicalize back to the multi-set user-variable quantity.
- V19 wider lookup alone: first CSE succeeds, second canonicalization undoes it.
- V20 coherent quantity preservation: update exact; cleaned/reproduced as the eleventh tracked rule in v21.
- V22 unpacked nested byte state: old compiler aligned it to four bytes. Packed proven ABI representation fixes it.
- V22 generated virtual destructor: adds a derived-vtable store absent from retail. Use the verified explicit flags boundary and linker alias.
- V26 entire destructor `.rodata` for the vtable: includes `<new>`'s 12-byte `bad_alloc` string and shifts data. V27 uses a minimal table translation unit and is full-ROM exact.

## Active resource-handle integration — October 3

Private checkpoint: `tools/ches/checkpoints/resource-handles-08007874-2026-10-03/`.
Production contribution HEAD remains `9a6a26f`. The eight proven paths have been
promoted; plain production full-ROM rebuild is running. Prior ROM/source baseline
is exact at 57,712 bytes.
Five coherent methods are exact: destructor `080079E8` 0x40, release `08007C28`
0xB0, retain `08007CD8` 0x74, start query `08007D4C` 0x6C, order query `08007DB8`
0x6A plus two section-alignment bytes. Typed flat final source proof is
`candidate-flat-v15.cc` / `v15-flat/results.json`, all five /0.

Caller correction is exact: V14 inline `UnkHandle::GetStart()` passes both client
and packed value while preserving pointer provenance. Both effect constructors
are 0x94/0 and 0x74/0; the existing effect destructor is 0x58/0. Direct outer
handle.value argument V12/V13 adds a reload and rotates register allocation;
preserve the natural inline forwarding method rather than the wrong one-arg ABI.

Isolated worktree `/mnt/data/Github/gba/fomt-resource-handle-integration` is
prepared at detached `9a6a26f`. Fresh tracked pinned compiler install completed
successfully; evidence `isolated-fresh-install.log`. Integrated code paths:
`asm/hardware.s`, `fomt.lds`, `include/resource_handle.hh`, `src/resource_handle.cc`,
`src/code_080A46AC.cc`, `src/code_080A480C.cc`. Stable architecture is written as
`docs/RESOURCE_HANDLES.md` in that worktree. Isolated plain `make -B -j4 compare` passes complete 8,388,608-byte equality and
retail SHA1; all 14 exact target/neighbor/alias symbol checks pass. Saved proof
`isolated-proof-v16.json` also records every contribution input hash and preserved
private README hash. Eight paths are promoted. Next: finish running production
`make -B -j4 compare`, verify full ROM/progress/diff, document, commit/push only
these paths. Compiler inputs remain unchanged.

Recovered owner is 0x92C: occupancy at +0, free pool at +0x20, 1024-unit tree
+0x824, active count +0x920, generation +0x922, clients +0x924, reserved interval
+0x928/+0x92A. Generations and occupancy reject stale values; Retain restores
count on u16 overflow. Destructor hidden flags remain compiler-generated.

Deferred ctor `08007874` is 0x15C/5 (global allocation r4/r5 swap between two
PRE-created values with equal 8refs/18live length). Saved dumps `ctor-diag/`.
Deferred acquire `08007B54` is **true body 0xD2/1** in `candidate-v6-manager.cc`:
first null guard goes through redundant second comparison rather than rollback.
Preserve constructor-copy island and both deferred retail bodies. All closed
variants and measurements are in checkpoint README/results. Do not repeat pool
source variants or compiler flag ablations; no compiler change has occurred.



### Entity-effect proof chronology (superseded by the snapshot above)

# Historical FoMT continuation - October 3, 2026

This section preserves the then-current next work at that checkpoint. It is superseded by the October 4 snapshot at the top; the preserved entries are evidence, not active tasks.

- Repo `/mnt/data/Github/gba/fomt`, branch `ches-dev`, local/remote HEAD `daab719c1324ac0d17e727f5c96b784d021655f3`.
- Production is retail-exact: 8,388,608 bytes, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`, source 57,192 / 940,036 = 6.0840%.
- Build authority: tracked `tools/install_agbcp.sh` and `tools/agbcp_fomt_compat.patch` SHA256 `8f75608013b1fee6e20a11fbe7bac26d1e65b92747402415e5f0c9caf628579b`; ten installed wrapper flags.
- User-required onboarding is complete: all 56 authored documents read continuously through EOF. Frozen manifest/read state: `tools/ches/checkpoints/entity-base-080324BC-2026-10-02/documentation-read-2026-10-03/`.
- Renderer `08032690` is integrated/pushed. Constructors `080324BC` (`candidate-ctor1-v8-unified-initializer.cc`) and `08032560` (`candidate-ctor2-v6-both-helper.cc`), plus deleting destructor `080DC8F8` (`candidate-dtor-v1.cc`), are exact scratch candidates pending integration.
- Active target: `UnknownEntityThing::vfunc_0C`, retail `0803260C..0803268F`, candidate `candidate-vfunc0c-v13-bool-reset.cc`, symbol `UpdateUnknownEntityThingTyped`, current 0x82 / 42 versus retail 0x84.
- Private compiler `/mnt/data/Github/agbcc-fomt-vfunc0c-cse-diag-v1`; original diagnostic binary is `agbcp`, new trace build is `g++/cc1plus`. No production compiler/source change.
- New v18 trace proves why v17 failed: at the second reset store CSE skips user pseudo 57 but accepts equivalent temporary 64/73/84. Their quantity's first register is still 57, so later canonicalization returns to `clear_mode`. The canonical source variable has two sets; unrelated fresh zero temporaries have one.
- Baseline metadata corpus: `cse-zero-corpus-v18/`, all 54 saved modules unchanged, 818 traced zero-reuse events; none has an integrated QI-zero event whose canonical quantity register is a user variable with multiple sets.

- Private v19 quantity-level wider-mode filter fires and preserves a separate zero through first CSE, GCSE, and loop. Second CSE canonicalizes the byte-store SUBREG back to `clear_mode`; flow deletes the separate zero. Target remains 0x82 / 42; v19 is not a complete solution. Provenance `v19-invocation.json`, artifact prefix `entity-base-vfunc0c-v19-quantity-zero`.
- Private v20 extends the same quantity guard to narrow SUBREG canonicalization and equivalent-source trials: **vfunc_0C is 0x84 / 0 exact** with the unchanged v13 source. Artifact prefix `entity-base-vfunc0c-v20-quantity-canon`, provenance `v20-invocation.json`. This is target proof only; compiler/source are not promoted. Current private `g++/cc1plus` is v20; saved binaries `agbcp-v18-zero-trace` and `agbcp-v19-quantity-zero` preserve earlier experiments.
- v20 regression proof passed: existing hard targets/batch exact, 54/54 modules unchanged, isolated production-ROM build exact. Fresh clean v21 packaging removes all trace/rejected hooks and exposes only `AGBCC_PRESERVE_INTEGRATED_NARROW_ZERO`. Pinned tracked installer built into detached `/mnt/data/Github/gba/fomt-entity-base-v20-integration`; clean 11 target checks, 54/54 modules, and plain `make -B -j4 compare` all PASS. Patch SHA256 `5d6c6a891453f5939749499bfb5ca0db3f6f5a1bffd4a881809bf546e6e511ec`; provenance `v21-package-provenance.json`. Production is still unchanged.

- Final typed layout is now in isolated `include/entity_effect.hh`; existing `UnknownEntityThing` owns two `EntityEffect` objects and a packed single-byte state union. Candidate v25 proves all five methods exact; combined four-method `.text` is 0x444 and destructor `.text` is 0x34. Shared renderer/draw helper target checks also pass.
- Isolated code integration v25 passes full ROM under a freshly installed tracked candidate compiler. The first build caught three old actor field names (`unk_86/87/88`), then the corrected typed accesses passed. Raw destructor blob split preserves all neighboring bytes.
- Typed vtable v26 initially pulled the destructor object's 12-byte `bad_alloc` string from `<new>` into `.rodata`, shifting downstream data. All function addresses remained correct. The table is now in its own minimal `src/entity_effect_vtable.cc`; v27 full-ROM verification is running. Production remains unchanged.

Exact next action: finish v27 table/full-ROM proof, document the shared entity/effect architecture, promote only reviewed exact files and the clean eleventh compiler rule to production, freshly install there, prove plain full ROM, then explicit-path commit/push under the standing charter. Do not repeat source variants, the register-only filter, closed compiler-version hunts, or renderer experiments. Preserve all private dirt and archived worktrees.




### SpriteAnimator checkpoint - October 2, 2026

Batch is now **5/5 byte-perfect, detached integration-exact, and contribution-safe tracked compiler proof is PASS**. All five methods are integrated as readable C++ in `/mnt/data/Github/gba/fomt-sprite-integration-call238`, the two readable `entity_actor.cc` callers use typed `SetAnimation`, the tracked compatibility patch includes the ninth pointer-only post-dead rule, the tracked installer enables all nine switches, and a plain `make -B -j4 compare` with no private compiler override produces the retail ROM exactly. Production `ches-dev` promotion/commit/push has not occurred yet.

Exact methods remain:
- func_0805E824: 0x2A / 0 true body
- func_0805E850: 0x0E / 0 true body
- func_0805E860: 0x34 / 0
- func_0805E894: 0x5C / 0

New source/compiler frontier:

1. v27a moves Count() after the previous-sprite read and result|=1.
   - result: 0xA6 / 112
   - removes the v26b spill
   - restores step naturally to ip
   - allocation becomes result=r5, frames=r7, count=r6, index=r1
   - this proves the shorter count lifetime is directionally correct.

2. v28a explicitly preserves the two retail-looking identities:
   - count starts at zero
   - frames is copied from the short-lived Begin() result
   These identities survive RTL, CSE, combine, and flow.
   - normal result: 0xA6 / 129
   - allocator gives index=r2 and frames=r6 exactly
   - remaining cycle is result=r5, step=r7, count=r8, constant4=ip
   - retail wants result=r7, step=ip, count=r5, constant4=r8

3. v28 allocation preference trace proves the remaining four pseudos have no hard-register preferences. Their placement is driven by allocation priority and conflicts only.

4. Proof-only allocation ordering count -> frames -> result on unchanged v28 RTL recovers all important retail homes:
   - this=r4
   - index=r2
   - frames=r6
   - count=r5
   - result=r7
   - step=ip
   - constant4=r8
   Proof execution: sh_muqf70k6_0763c3dd
   Result remains 0xA4 / 111, not exact.

5. The residual reason is now concrete:
   - retail first keeps &animation in r5
   - later reuses r5 for final count
   - v28 has no independent descriptor-base lifetime, so even with correct final homes it loads frame_count directly from [this+8]
   - v15 does preserve exactly the desired identity sequence: descriptor base, frame pointer copy, zero count temp, conditional count load, final count copy
   - but v15 uses u16 index and emits unwanted truncation shifts.

6. Narrow v29 tests:
   - v29a = v15 identity setup + u32 index/count + local frame pointer: 0xAE / 161
   - v29b = v15 identity setup + u32 index only + local frame pointer: 0xAE / 161
   Therefore simple widening of the v15 source is closed.

Compiler evidence:
- AGBCC_PRESERVE_USERVAR_COPIES protects relevant user-variable copies from CSE/combine deletion.
- It does not impose distinct hard-register homes or allocation order.
- v28 frame-copy and count-zero identities survive middle-end optimization and are lost/reassigned only during allocation/reload.
- proof-only count-priority boost moved count earlier but was insufficient: 0xA4 / 119.
- proof-only relative order count -> frames -> result recovered the retail hard-register cascade but still lacked descriptor-base lifetime.

Exact next step:
Start from v29b/v15 RTL, not broad C++ permutations.
1. Trace v29b pseudos for descriptor base, frames, count temp, final count, result, step, index, and constant4.
2. Apply a proof-only relative allocation order to v29b's semantic roles.
3. Determine whether v29b plus retail allocation removes the remaining truncation/control-flow differences or whether one specific live-range split is still needed.
4. Compare that against v28 orderproof. The goal is a model that combines v15's descriptor/count lifetime split with v28's exact index/frame homes.
5. Any final compiler rule must be structural and general. No function address, pseudo ID, UID, or hard-register-specific rule is acceptable.
6. Treat each successful experiment as if it could be the last run in the conversation: immediately save decision-relevant artifacts/results and update the canonical handoff/index when the best next action changes.
7. When SpriteAnimator reaches exact integrated retail source, create/update a contribution-facing dedicated animation/SpriteAnimator architecture document under `docs/` covering the proven 0x14-byte layout, five-method API, frame/count/timer semantics, caller-facing behavior, unresolved fields, and validation boundaries. Keep vXX candidates/allocator experiments out of that tracked architecture page.
8. Closed path: v30a = v15 descriptor/count identity graph + u32 index + direct repeated `frames[index]`, with no local frame pointer. Result 0xBA / 175. Old GCC converts the loop to pointer induction, carrying/updating the frame address. Retail instead preserves index, computes `index << 2`, and reuses that scalar offset for two separate `frames + offset` address formations. Do not retry direct indexing as the complete fix.
9. v31a breakthrough: v15 descriptor/count identity graph + u32 index + explicit scalar `frame_offset = index << 2`, reused for both duration and sprite-id address formation. Result 0xAA / 33. This recovered the retail integer-index/scalar-offset body strategy.
10. Current best source candidate is **v31b**, changing only the zero-duration branch polarity to `if (duration != 0) { timer += ...; if (timer <= 0) continue; } else { timer = 0; }`. Result **0xAA / 25**. Remaining differences are overwhelmingly the result/descriptor-count/frames hard-register rotation plus one equivalent timer-positive branch orientation.
11. Critical size clarification: retail functional code ends at `bx r1` at 0x0805E998. The halfword at 0x0805E99A is `0x0000` (`movs r0, r0`) padding before the next function begins at 0x0805E99C. Therefore v31b's 0xAA symbol body is the correct functional instruction budget; the expected 0xAC comparison window includes 2 bytes of retail inter-function padding. Do not invent another functional instruction merely to reach 0xAC.
12. v31b allocator trace confirms all non-cycle homes are already retail-correct: this=r4, step=ip, timer=r3, index=r2, previous-sprite=r9, constant4=r8. Normal cycle is result=r5, final-count=r6, frames=r7. A proof-only pseudo-specific allocation order final-count -> frames -> result recovers the retail cycle result=r7, final-count=r5, frames=r6 and drops the target from 25 to **10 differing linked bytes**.
13. Under that proof, only two mismatch islands remain: (a) retail `movs r0,#0` then `adds r6,r1,#0` at 0x0805E936..938, while v31b emits those in reverse order; (b) retail `bgt join; b loop` at 0x0805E976..978, while v31b emits equivalent `ble loop; b join`. Everything else in the 0xAA functional body matches.
14. v32a tested the obvious explicit source order `count=0; frames=Begin(); if(frames) count=frame_count`. It regressed badly to **0xA8 / 126** under both normal and the old v31 proof hook (the pseudo identities/order changed enough that the proof hook did not apply meaningfully). CLOSED: do not retry this direct explicit rewrite.
15. **Resume from v31b**, not v32a. v31b remains the best source candidate at normal 0xAA/25 and proof-order 0xAA/10. The remaining instruction-order island must be explained through preserved inline/source identity or compiler allocation/scheduling behavior, not by flattening Count/Begin into the obvious explicit code.
16. v31b middle-end mapping proves the first mismatch is present before allocation/scheduling: the frontend RTL has frames-copy p45 before Count's zero-temp p52, matching source order. It is not a late scheduler accident.
17. v33a tested an explicit descriptor/begin/count/frames identity chain (`animation_`, `begin`, `count=0`, `frames=begin`, conditional frame_count). It regressed to **0xAE / 132** under both normal and the prior proof hook. CLOSED: this spelling over-materializes identities and is not the retail source shape.
18. **New canonical source oracle: v34b.** Moving sprite-change comparison/index store after the loop and spelling the nonzero-duration path as `if (duration != 0) { timer += ...; if (timer > 0) break; continue; } timer=0; break;` recovers retail CFG and allocator homes naturally. Normal compatibility-v4 result: **0xAA body / 6 differing linked bytes**, with no proof allocator hook. The only functional mismatches are four bytes at 0x0805E936..939: retail `movs r0,#0; adds r6,r1,#0`, v34b `adds r6,r1,#0; movs r0,#0`. The other 2 counted bytes are the known retail padding at 0x0805E99A.
19. v34c (swap only to Count-before-Begin) regresses to 0xAA/28. v35a (also swap Count helper's local declaration order) remains 0xAA/28. CLOSED as exact solutions. They prove declaration-order reversal alone changes the allocation/dataflow too much.
20. Scheduler matrix on v34b: `-fno-schedule-insns` and `-fno-schedule-insns2` remain 0xAA/6; forcing either scheduler is unsupported for this Thumb target (compiler exit 33). Therefore the final swap is not explained by enabling/disabling GCC scheduling.
21. v36a (`count=0; frames=Begin(); if(frames) count=frame_count`) regresses to 0xA8/128. v36b (`frames=Begin(); count=0; if(frames) count=Count()`) regresses to 0xAE/131. CLOSED. Manual setup shaping is exhausted without new evidence.
22. Existing-compiler ablation is complete. v34b remains 0xAA/6 with all eight v4 switches, without `AGBCC_PRESERVE_USERVAR_COPIES`, without `AGBCC_RESTORE_COMBINE_COPY_REFS`, and with **all eight compatibility env switches unset** on the patched v4 binary. The last swap is independent of prior compatibility behaviors.
23. v37a hoisted `frames = Begin()` before the previous-sprite read and reused that local, based on older v13/v14/v25 patterns. It regressed to **0xA8 / 106**. CLOSED. Artifact mining confirms older zero-before-copy examples do not transplant cleanly into v34b's exact u32/scalar-offset loop.
24. RTL on v34b proves p45 (persistent frames user-var copy) is emitted before p52 (Count zero user-var) from the **initial RTL pass onward**, with only notes between them; p45's first real use is immediately after p52. Thus the swap is dependency-safe and frontend/early-middle-end ordering, not scheduler behavior.
25. Scratch compiler `/mnt/data/Github/agbcc-spritealloc-diag-call238` now contains proof-only env rule `AGBCC_HOIST_ZERO_BEFORE_DEFERRED_USER_COPY` in `g++/cse.c`. Intended pattern: user-var pseudo copy, next real instruction zero-initializes another user-var pseudo, copied value first used immediately after zero. Build succeeded (`sh_muqgy5rp_5844701d`) but target stayed **0xAA / 6** (`sh_muqgyzch_13c02932`). A `-da` verification (`sh_muqh0czf_0223ed1e`) proves `.cse` and `.cse2` order remained p45-copy then p52-zero, so the matcher **never fired** rather than firing and being undone.
26. RESOLVED. The original matcher failed because it ran inside CSE before two dead Count temporaries were deleted. Moving the proof point to immediately after `delete_trivially_dead_insns` makes the p45/p52 relationship visible.
27. Broad post-dead rule made SpriteAnimator exact, but an old contaminated allocator scratch tree was unsuitable for regression. A fresh copy of the validated v4 package tree was created at `/mnt/data/Github/agbcc-fomt-compat-package-call238-v4-postdeadproof` and used for clean A/B testing.
28. Clean v4-copy baseline: `func_080A480C` remains 0x138/0 with rule off; v34b remains 0xAA/6. With the broad post-dead rule on, clean `func_080A480C` still remains 0x138/0 and v34b becomes 0xAA/0 over the true body.
29. The broad rule changed one saved corpus module, `src/farm` (53 bytes). Trace showed both farm matches copied non-pointer loop-control value 1, while Sprite p45 is explicitly marked `user var; pointer`.
30. Generalized pointer guard added: require `REGNO_POINTER_FLAG(REGNO(copy_dest))`. This preserves Sprite exactness and prevents both farm matches from firing.
31. Final clean proof ladder with the pointer guard PASSED: hard targets exact, five focused canaries exact, saved 54-module corpus **54/54 changed 0 / total diff 0**, and full source-converted retail ROM `fomt.gba: OK`. Full validator execution: `sh_muqi2jdy_c96633ee`. Standalone 54-module proof: `sh_muqi264x_d0b14c02`.
32. One-source five-method proof: `sprite-animator-v34b.cc` gives 5/5 exact under the clean pointer-guard compiler: 5E824 0x2A/0, 5E850 0x0E/0, 5E860 0x34/0, 5E894 0x5C/0, 5E8F0 0xAA/0. Execution: `sh_muqi3y3p_baf45410`.
33. EXACT NEXT ACTION: the private compatibility-v5 package is complete and validated. Integrate all five methods from v34b in a detached retail worktree using v5, preserve the known padding at 0x0805E84E/85E/99A, and prove full-ROM SHA1. Then create the contribution-facing SpriteAnimator architecture doc, promote the ninth behavior into the contribution-safe tracked compiler/install path, prove a fresh-checkout build, apply the identical production seam, revalidate, update docs, and under the standing retail rule commit/push only once the tracked compiler path and integrated ROM are reproducibly exact.

Closed this turn:
- v27b/v27c variants as complete solutions
- v28 raw alias/declaration-order variants as complete solutions
- count-only priority boost
- forced relative allocation order as a complete solution
- v29a/v29b simple widening

## Current repository state

- branch: `ches-dev`
- HEAD: `c2cfa8f decompile renderer helper routines`
- remote: `ches/ches-dev` verified at `c2cfa8fda20046d03370a4002e3c2830eab43f47`
- retail SHA1: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`
- progress: **55,556 / 940,036 = 5.9100% source**
- last completed batch: `080A5A9C, 080A5EA0, 080A601C, 080A6420, 080A6640`, fully exact, integrated, committed, pushed, and remote-verified

## Strategic rule

Target selection is now **leverage-first rather than purely address-adjacent**.

Mandatory roadmap:
`docs/DECOMP_PRIORITY_MAP.md`

Raw analyzer:
`tools/ches/analyze_decomp_leverage.py`

Current raw snapshot:
`tools/ches/checkpoints/decomp-leverage-2026-10-02.md`

Standing cadence:
**5 completed retail functions per user-facing batch when feasible.**

A high-fanout function is not automatically high priority. Prefer coherent type/API clusters that unlock many later functions. Preserve local candidates when pivoting.

## Historical 5-function batch: SpriteAnimator core

## Historical SpriteAnimator matching checkpoint

At this checkpoint the batch status was 4/5 byte-perfect and only `func_0805E8F0` remained. The batch was subsequently completed and production-integrated; do not treat this section as current work.

The authoritative current frontier is the LATEST SpriteAnimator checkpoint at the top of this file. The key current models are v15/v29 for descriptor/count source identity and v28 for allocator-isolated source identities. v28 proof-order recovers all important retail hard-register homes but still lacks the descriptor-base lifetime that v15 naturally emits.

Do not resume broad syntax permutations. Next work is v29b RTL mapping plus proof-only allocation ordering, then structural compiler/source reconstruction from the difference.

## Batch objective

Do not merely translate five anonymous functions.

By the end of this batch:
1. recover the real `SpriteAnimator` field layout;
2. replace the 0x14-byte placeholder with typed fields;
3. use semantic method/field names only where evidence is strong;
4. update readable actor/entity call sites if contribution-safe and exact;
5. exact-match all five functions;
6. isolated full-ROM validate using the tracked compiler installer;
7. production full-ROM SHA1 validate;
8. update the leverage map because recovering this type changes future priorities;
9. document successes, failed source shapes, proven facts, inferences, and new process lessons;
10. commit/push the exact retail contribution under the standing rule.

## Exact execution sequence

1. Read `docs/DECOMP_PLAYBOOK.md` and `docs/DECOMP_PRIORITY_MAP.md`.
2. Search for any existing candidates/research for 5E824/850/860/894/8F0 before writing new ones.
3. Inspect all `SpriteAnimator` declarations/call sites and neighboring 5E6xx-5E9xx routines.
4. Build one realistic scratch translation unit containing the class and all five methods. Class-level ABI/codegen matters.
5. Exact-compare 5E824, 5E850, and 5E860 first.
6. Use their proven layout to reconstruct 5E894 and 5E8F0.
7. Keep unfinished candidates under `tools/ches/checkpoints/`, never `src/`.
8. Record every meaningful failed source shape in the experiment/failure docs.
9. Once all five are exact, integrate in a detached worktree.
10. In the integration worktree use `tools/install_agbcp.sh`; do not copy a stale generated compiler directory.
11. Run plain `make -B -j4 compare`, explicit SHA1, progress, and symbol/map checks.
12. Promote only the proven integration to production.
13. Re-run the complete production proof.
14. Update `START_HERE`, this handoff, `SESSION_STATUS`, `DECOMP_NOTES`, `REPO_MAP`, `DECOMP_PRIORITY_MAP`, experiment index, and failure ledger where relevant.
15. Stage contribution-safe explicit paths only, commit, push `ches-dev`, verify remote.

## Architectural priorities after SpriteAnimator

### Central owner/manager accessors

Investigate the containing type before merely converting the accessors:
- `08008918`: 116 unique callers, 397 calls, returns owner subobject +0x34
- `08008910`: 86 callers, 384 calls, returns +0x24
- `08008940`: 90 callers, 200 calls, returns +0x494
- `08008920`: 78 callers, 222 calls, returns +0x8C

### DMA/transfer abstraction

High-leverage shared helpers:
- `08008E64`
- `08008EB8`
- `08008F0C` (96 unique callers, 431 calls)

### Common container/list infrastructure

`080098AC` is a common intrusive-node/base destructor already called from exact source.

## Preserved renderer work

Do not delete, overwrite, or restart these from zero:
- `next-080A5CC0-v1.cc`: 0x58 vs 0x54, 72 diffs
- `next-080A5DB8-v1.cc`: 0x40 vs 0x44, 50 diffs
- `next-080A5D14-v1.cc`: 0xA0 vs 0xA4, 153 diffs
- `next-080A58EC-v2.cc`: 0x7C vs 0x74, 83 diffs
- `next-080A5960-v2.cc`: exact 0x5C size, 52 diffs
- `next-080A5760-v1.cc`: 0x180 vs 0x18C, 301 diffs
- `func_080A4F50`: 0x720 deferred analysis preserved

These move behind shared infrastructure because the new types should make them easier later.

## Documentation rule

Record more than progress:
- why this target was selected;
- fan-out/architectural evidence;
- exact ranges and sizes;
- candidates and mismatch counts;
- source shapes tried;
- why failed variants failed;
- proven vs inferred fields/names;
- cross-subsystem impact;
- exact integration/full-ROM evidence;
- how the result changes the priority map;
- exact next action.

If a no-context agent cannot understand why `SpriteAnimator` superseded the closer renderer addresses, the documentation is incomplete.

## October 2, 2026 - SpriteAnimator detached integration + tracked compiler gate PASS

Authoritative continuation state:
- detached integration worktree: `/mnt/data/Github/gba/fomt-sprite-integration-call238`, detached from clean `c2cfa8f`;
- new typed files: `include/sprite_animator.hh`, `src/sprite_animator.cc`, `docs/SPRITE_ANIMATOR.md`;
- `include/unknown_types.hh` now uses the real 0x14-byte SpriteAnimator type;
- `asm/code_0803EE94.s` is split immediately before `func_0805E99C` into `.text.after_sprite_animator`;
- `fomt.lds` places `src/sprite_animator.o(.text)` between the assembly prefix and the new suffix section;
- `src/entity_actor.cc` uses typed `SpriteAnimator::SetAnimation` at its two readable call sites;
- combined source object `.text` is exactly 0x178 bytes and links symbols at 0805E824 / E850 / E860 / E894 / E8F0 with next assembly symbol still at 0805E99C;
- alignment halfwords are 0x0805E84E..84F, 0x0805E85E..85F, and 0x0805E99A..99B. They are alignment, not functional source.

Exact integration proofs:
- private-v5 integrated full ROM before typed caller cleanup: `sh_muqkocen_d8cb9aa8` PASS, `fomt.gba: OK`;
- private-v5 after typed caller cleanup: `sh_muqkpllz_7f9694a1` PASS, `fomt.gba: OK`;
- retail SHA1 confirmed `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`, size 8,388,608 bytes;
- tracked compiler patch regenerated from the pinned clean source while preserving contribution-safe `compat_*` naming instead of copying private `call238_*` research names;
- new tracked `tools/agbcp_fomt_compat.patch` SHA-256: `1c40c992bb6cad109a3fcecd0fb9cc09c072343e6f624679706d0d99d5426c73`;
- new tracked `tools/install_agbcp.sh` SHA-256: `6a1a8de9ae69940cf62fc8405eb8a90d3e08b317ab47d7a4a75576e4c128b2eb`;
- fresh tracked installer execution from pinned local agbcc source: `sh_muqktwa4_1035a60c` PASS;
- installed tracked wrapper contains all nine switches including `AGBCC_HOIST_ZERO_AFTER_DEAD_COPY=1`;
- plain tracked-path `make -B -j4 compare` with no `CC1PLUS` override: `sh_muqkxriz_ed73fb00` PASS, `fomt.gba: OK`.

Important integration gotcha:
A detached Git worktree does not inherit ignored/local FoMT inputs. Missing `baserom.gba` and `tools/agbcc` caused the first proof build `sh_muqkmu9g_52c0f9df` to fail with unrelated missing-ROM errors and a misleading modern devkitARM `stddef.h/nullptr` parser failure. For isolated integration proof, explicitly provide the local baserom and install the tracked compiler inside the detached worktree. Do not interpret that failure as a SpriteAnimator source mismatch.

EXACT NEXT ACTION:
Review the detached contribution diff and run progress/diff hygiene. Then apply the exact contribution-safe changes to production `ches-dev`, install/rebuild the tracked compiler there, run the full retail validation ladder, update all current docs/progress, stage only contribution-facing files, and under the standing exact-retail rule commit/push once the production ROM remains byte-identical.

## October 2, 2026 - production SpriteAnimator exact, contribution commit pending

Production `ches-dev` now contains the exact detached SpriteAnimator contribution candidate and final minimized tracked compiler patch.

Production proof:
- final tracked compiler patch SHA-256: `863af8d8692e45b94e40f6e5b57b778fd35c56bc2c4f171a38322054adf339ec`;
- installer SHA-256: `6a1a8de9ae69940cf62fc8405eb8a90d3e08b317ab47d7a4a75576e4c128b2eb`;
- production compiler install from pinned source: `sh_muql3qy2_babf67ad` PASS;
- plain production `make -B -j4 compare`: `sh_muql8c0t_10159bcb` PASS, `fomt.gba: OK`;
- explicit retail SHA1: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`, size 8,388,608 bytes;
- progress: **55,932 / 940,036 = 5.9500% source**, 884,104 bytes assembly;
- symbol addresses remain exactly E824/E850/E860/E894/E8F0 with following E99C unchanged;
- contribution diff check passes.

The two exactness gates are satisfied. The standing retail rule now authorizes contribution-only stage/commit/push. Stage only these nine paths: `asm/code_0803EE94.s`, `fomt.lds`, `include/unknown_types.hh`, `src/entity_actor.cc`, `tools/agbcp_fomt_compat.patch`, `tools/install_agbcp.sh`, `docs/SPRITE_ANIMATOR.md`, `include/sprite_animator.hh`, `src/sprite_animator.cc`. Keep README, AGENTS, START_HERE, private decomp docs, and all `tools/ches` material unstaged.

Exact next action after commit/push: reconstruct the central owner/manager type behind `0x080088B8..0x08008940` using callers/vtables/layout first, then decompile/name its high-fanout accessors only when the containing type evidence supports it.

## October 2, 2026 - SpriteAnimator contribution COMPLETE

Contribution commit: `5d95827 decompile sprite animator` (`5d95827210863a8fe28f2c3f00c093fec726d27a`).
Remote `ches/ches-dev` was independently verified at the same full hash by `git ls-remote` in `sh_muqlefc5_18907c59`.

Final contribution contains exactly nine paths:
- `asm/code_0803EE94.s`
- `docs/SPRITE_ANIMATOR.md`
- `fomt.lds`
- `include/sprite_animator.hh`
- `include/unknown_types.hh`
- `src/entity_actor.cc`
- `src/sprite_animator.cc`
- `tools/agbcp_fomt_compat.patch`
- `tools/install_agbcp.sh`

Final exact state:
- retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`;
- ROM size 8,388,608 bytes;
- progress 55,932 / 940,036 = 5.9500% source;
- five SpriteAnimator methods source-integrated and exact;
- typed SetAnimation callers exact;
- tracked nine-behavior compiler path exact and reproducible;
- following `func_0805E99C` remains at its retail address;
- private README/AGENTS/START_HERE/decomp research/tools/ches files remained unstaged and were not pushed.

NEXT LEVERAGE-FIRST WORK: reconstruct the central owner/manager type behind high-fanout accessors `0x080088B8..0x08008940`. Begin with owner pointer provenance, callers, vtables, and returned subobject offsets (+0x24, +0x34, +0x8C, +0x494). Do not assign renderer/audio/entity-manager names or merely convert the tiny accessors until the containing type evidence supports those identities. Target a coherent five-function batch when feasible.

## October 2, 2026 - hardware context architecture recovered, accessor gate 5/5 exact

The next leverage target has advanced substantially. The high-fanout cluster at `0x080088B8..0x08008940` is proven hardware infrastructure, not a gameplay manager.

Proven layout and VBlank evidence are recorded in:
- `docs/DECOMP_NOTES.md`, newest hardware-owner section;
- `tools/ches/checkpoints/hardware-context-2026-10-02/README.md`.

First five selected accessors are already source-exact with the current tracked compiler:
- `080088DC` Hardware::GetContext = 0x4/0
- `08008910` Hardware::GetTransferQueue = 0x8/0
- `08008918` Hardware::GetDisplayRegisters = 0x8/0
- `08008920` Hardware::GetOam = 0x8/0
- `08008940` Hardware::GetVBlankCallbacks = 0xC/0

Exact candidate execution: `sh_muqm8hqh_bbd31966`.

Important boundary rule:
Preserve all unnamed duplicate/raw functions at 0x080088E0..0x0800890F, 0x08008928..0x0800893F, and 0x0800894C onward. The clean integration requires only three source seams, documented in the checkpoint README.

EXACT NEXT ACTION:
Detached integration from HEAD `5d95827210863a8fe28f2c3f00c093fec726d27a`: add contribution-facing `include/hardware.hh` + `src/hardware_context.cc`, split `asm/hardware.s` at the three documented seams, update `fomt.lds`, install the tracked compiler in the detached worktree, and run plain `make -B -j4 compare`. Do not touch production until that full-ROM gate passes.

## October 2, 2026 - 50-call checkpoint during hardware detached integration

Detached proof worktree exists at `/mnt/data/Github/gba/fomt-hardware-integration-call239`, clean base `5d95827210863a8fe28f2c3f00c093fec726d27a` plus only two new source files so far:
- `include/hardware.hh` SHA-256 `5969056ce0e466c59e446ac31336387aea59b8e46906f4893a9db782db2aebe1`
- `src/hardware_context.cc` SHA-256 `15f88975f22696b7ee6300bf0cb88cb9efcfbfa9a8db2898cbd1a3c9991dcbfc`

The baserom is explicitly symlinked into the worktree. No `asm/hardware.s` or `fomt.lds` mutation has occurred yet and no detached compiler install/build has started. Production remains unchanged.

EXACT NEXT ACTION: apply the three documented source/assembly seams at 080088DC, 08008910..08008927, and 08008940 plus the linker order from the hardware-context checkpoint README; then inspect diff, install the tracked compiler in the detached worktree, and require plain full-ROM `make -B -j4 compare` before any production promotion.
## October 2, 2026 - hardware context accessor contribution COMPLETE

Production/remote HEAD is now:
`408d497089ec9fc2daa32f85d394d7c8545343d8 decompile hardware context accessors`

The central high-fanout owner target is solved as shared hardware infrastructure, not a gameplay manager.

Final exact batch:
- `080088DC` `Hardware::GetContext` = 0x04 / 0
- `08008910` `Hardware::GetTransferQueue` = 0x08 / 0
- `08008918` `Hardware::GetDisplayRegisters` = 0x08 / 0
- `08008920` `Hardware::GetOam` = 0x08 / 0
- `08008940` `Hardware::GetVBlankCallbacks` = 0x0C / 0

Final production state:
- retail SHA1: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`;
- ROM size: 8,388,608 bytes;
- progress: 55,972 / 940,036 source bytes = **5.9542%**; 884,064 asm bytes = 94.0458%;
- detached full-ROM proof `sh_muqms4ou_3126a4e0` PASS;
- production full-ROM proof `sh_muqmtbwk_15ccb128` PASS;
- explicit progress/SHA1/symbol/diff proof `sh_muqmvrh4_2c3fa83b` PASS;
- remote verification `sh_muqmwxvp_e6f40ea0` matched local `408d497089ec9fc2daa32f85d394d7c8545343d8`.

Important process gotcha preserved:
Detached `tools/install_agbcp.sh` execution `sh_muqmkbaq_20b9cf85` was killed by the 120-second Ches shell timeout while GCC was still building. Inspecting state proved it left no detached compiler tree, so it was not blindly rerun. The detached worktree safely reused the already-proven production tracked toolchain via a local ignored symlink. The only integration failure was old-GCC syntax on out-of-class `SECTION(...)` declarations (`sh_muqmr7ly_fb6256f2`); placing the attributes on the in-class member declarations fixed it without changing bodies.

Stable public architecture: `docs/HARDWARE.md`.
Detailed private architecture/process: newest `docs/DECOMP_NOTES.md` section and `tools/ches/checkpoints/hardware-context-2026-10-02/README.md`.

EXACT NEXT ACTION:
Begin A3 DMA/transfer descriptor infrastructure around `func_08008F0C`, `func_08008E64`, and `func_08008EB8`. First reconstruct the 16-byte descriptor fields and the relationships among constructor variants, `func_08008FE4` execution, DMA3 control encoding, and the `HardwareContext +0x24` queue. Use caller families to choose a coherent five-function batch only after semantics are supported. Do not re-open the completed hardware accessor batch unless a downstream type fact requires a correction.

## October 2, 2026 - DMA/transfer A3 target 5/5 exact, integration next

The next leverage-first batch is now 5/5 byte-perfect in isolated target proof under the tracked compiler.

Canonical source:
`tools/ches/checkpoints/dma-transfer-2026-10-02/candidate-v7.cc`
SHA-256 `6ca3adee00b6d68ab9d8a784bacf4d8bf1dec71bae842a6a8064cf64860268b9`.

Proof `sh_muqnl5jl_75b14d71`:
- `08008E64` 0x54 / 0
- `08008EB8` 0x54 / 0
- `08008F0C` true body 0x52 / 0; `08008F5E..5F` is alignment
- `08008F60` 0x58 / 0
- `08008FE4` 0x38 / 0

Proven architecture:
- `080D0EBC` is only `stm r3!, {r0,r1,r2}; bx lr`, so DMA helpers write source/destination/control straight into DMA3 registers at `0x040000D4`;
- 8E64 = DMA copy, 8EB8 = fixed-source DMA fill;
- descriptor is 16 bytes: mode, source-or-value, destination, count/control;
- modes 0/1 mean pointer copy vs immediate fill;
- 8F0C/8F60 are exact as overloaded descriptor constructors;
- 8FE4 executes a range through DMA3;
- 809094 executes the same descriptor layout through CpuFastSet/CpuSet, proving shared transfer infrastructure.

Do not absorb raw neighbors 8E28..8E63, 8FB8..8FE3, or 901C..9093 into this batch.

EXACT NEXT ACTION:
Create detached integration from HEAD 408d497. Preserve raw islands and 8F0C alignment, integrate the five exact functions plus a shared descriptor type, and require plain full-ROM compare before production promotion. Full failure ladder and seam constraints are in `tools/ches/checkpoints/dma-transfer-2026-10-02/README.md`.

## Detached integration exact - 50-call checkpoint

Detached worktree:
`/mnt/data/Github/gba/fomt-dma-integration-call240`

Base:
`408d497089ec9fc2daa32f85d394d7c8545343d8`

Integrated candidate files:
- `include/hardware_transfer.hh`
- `src/hardware_transfer.cc`
- `asm/hardware.s`
- `fomt.lds`
- `src/code_080A480C.cc` now uses the shared `GraphicsTransfer` / `GraphicsTransferVector` type and constructor rather than a duplicate private layout

Only two assembly seams are required:
- after the first four source functions, preserving raw `08008FB8..08008FE3`;
- after source `08008FE4`, preserving raw `0800901C..`.

First detached build `sh_muqnqfzy_93998b9b` failed only because the out-of-class executor needed `GraphicsTransfer::MODE_FILL`; no byte mismatch was reached. After that one qualification fix:
- full detached compare `sh_muqnqy44_562909bf`: PASS
- shared-caller cleanup full compare `sh_muqnszlx_89b41510`: PASS
- explicit proof `sh_muqntlsn_1b736f03`: PASS
- ROM size 8,388,608
- SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`
- progress 56,368 / 940,036 = 5.9964% source
- symbols remain exactly 08008E64 / 08008EB8 / 08008F0C / 08008F60 / 08008FE4; following named `08009094` remains at its retail address
- raw `08008FB8..08008FE3` bytes remain intact
- `git diff --check` passes

Production is intentionally still untouched at this checkpoint.

EXACT NEXT ACTION:
Review the detached contribution diff and stable public documentation impact, then promote the exact detached contribution to production `ches-dev`. Run plain production `make -B -j4 compare`, explicit SHA1/size/progress/symbol/raw-boundary/diff checks, update final docs, stage only contribution-facing files, and under the standing exact-retail rule commit/push only if production remains byte-identical.

## October 2, 2026 - DMA/transfer production exact, commit gate ready

Production `ches-dev` now contains the detached-reviewed A3 DMA/transfer contribution and is byte-identical to retail.

Final production proof `sh_muqw1ljv_75f4dc76`:
- `make -B -j4 compare` PASS, `fomt.gba: OK`;
- ROM size 8,388,608;
- SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`;
- progress 56,368 / 940,036 = **5.9964% source**;
- symbols `08008E64`, `08008EB8`, `08008F0C`, `08008F60`, `08008FE4`, and following `08009094` remain at retail addresses;
- raw `08008FB8..08008FE3` byte island matches baserom;
- `git diff --check` passes.

Architecture finalized for this batch:
- shared `GraphicsTransfer` is 16 bytes with copy/fill modes;
- `GraphicsTransferVector` is the typed `HardwareContext +0x24` transfer container;
- `src/code_080A480C.cc` reuses the shared type/constructor;
- stable docs: `docs/HARDWARE_TRANSFER.md` and `docs/HARDWARE.md`.

Contribution files only:
`asm/hardware.s`, `fomt.lds`, `include/hardware.hh`, `include/hardware_transfer.hh`, `src/hardware_context.cc`, `src/hardware_transfer.cc`, `src/code_080A480C.cc`, `docs/HARDWARE.md`, `docs/HARDWARE_TRANSFER.md`.

Private docs/research remain unstaged.

EXACT NEXT ACTION:
Stage only the nine contribution files above, review `git diff --cached --check`, cached names/stat/diff, commit as one retail-exact DMA/transfer unit, push `ches-dev`, verify remote hash, then begin B1 `func_080098AC` intrusive/list-family reconstruction.
## October 2, 2026 - DMA/transfer contribution COMPLETE

Contribution commit and remote:
`589b8f8c69b52b12db903b87c02abcc19d1aa15b decompile hardware transfer routines`

Push/remote proof: `sh_muqw60n6_2fd6fe8b` showed local and `ches/ches-dev` both at the exact full hash.

Final exact state:
- source 56,368 / 940,036 = **5.9964%**;
- assembly 883,668 = 94.0036%;
- ROM size 8,388,608;
- retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`;
- production full-ROM proof `sh_muqw1ljv_75f4dc76` PASS;
- post-commit progress/hash proof `sh_muqw6h4g_56019f58` PASS.

Contribution contains only the nine reviewed files documented in the previous handoff; private docs and the pre-existing README modification stayed out.

Tooling gotcha encountered and closed:
`sh_muqw4529_39427ad8` placed `git add --` and path arguments on separate shell lines, so no paths were staged and `asm/hardware.s` was interpreted as a shell script, producing command-not-found noise. Follow-up `sh_muqw4k70_9917c9e9` proved the index was empty and contribution working hashes were intact. Correct one-line staging `sh_muqw4tjz_42109e8e` succeeded. This rule is now in `AGENTS.md`.

EXACT NEXT ACTION:
Begin B1 common intrusive/list infrastructure around `func_080098AC`. Trace its installed vtable, object offsets, neighboring constructor/destructor/list methods, and high-fanout caller families. Use existing exact source `src/code_080A4A94.cc` as the first typed anchor. Choose the next five-function batch only after the shared base-class boundary is evidenced.
## October 2, 2026 - B1 intrusive callback-list architecture recovered

After completing/pushing DMA commit `589b8f8`, B1 analysis proved the shared list model.

Key facts:
- base node is 12 bytes: +0 `pprev` pointer-to-link, +4 `next`, +8 vtable; `080098AC` unlinks as `*pprev = next; next->pprev = pprev` and optionally deletes;
- base vtable `080E5BE8`: pure virtual callback at +8, `080098AC` destructor at +0xC;
- concrete list vtable `080E5BB4` (0x24): `09908` process, `098DC` destructor, `09940` append, `09968` remove, `09984` clear, `099B0` splice/move, `099D4` swap;
- concrete list owns embedded sentinel at +0x10 with vtable `080E5BD8`; sentinel callback `080098D8` always returns true; sentinel destructor wrapper `080D7B44` delegates to `080098AC`;
- raw `09A04..09A2B` is list constructor/init; `099EC..09A01` is Empty(); `09A2C..09A35` is node IsLinked(); `09A38..09A47` is base-node init;
- hardware `080087C8` and game-state `08011CD8` both construct/use the same list, proving it is generic callback/update infrastructure rather than VBlank-specific.

Full layout/vtable evidence and batch strategy:
`tools/ches/checkpoints/intrusive-list-2026-10-02/README.md`

EXACT NEXT ACTION:
Build scratch natural C++ for shared node/list types and isolated-match `080098AC`, `080098DC`, `08009940`, `08009968`, `08009984` first. Keep raw constructor/query helpers untouched and do not integrate production until the coherent five-function boundary is 5/5 exact.
## Canonical v2 exact proof - 50-call checkpoint

Canonical candidate:
`tools/ches/checkpoints/intrusive-list-2026-10-02/candidate-v2.cc`

SHA-256:
`59e445b370d6f6319f21b4908fdf5d0b9799be952c711482935b3b67d2edc6ac`

Canonical proof execution:
`sh_muqwh683_4fe405b5`

Five exact true bodies:
- `func_080098AC`: 0x2C / 0 differences;
- `func_080098DC`: 0x2C / 0;
- `func_08009940`: true body 0x26 / 0; the wider 0x28 address window includes two-byte alignment;
- `func_08009968`: true body 0x1A / 0; the wider 0x1C address window includes two-byte alignment;
- `func_08009984`: 0x2C / 0.

Candidate v1 already made `98AC`, `98DC`, and the true bodies of `9940`/`9968` exact. Its only substantive miss was `9984` because GCC kept the list object/sentinel in the opposite registers and used the current node directly.

v2 made `9984` exact by expressing the natural source as:
- a preserved `list` pointer;
- `current` and `sentinel` locals;
- an explicit old `node = current`, then `current = current->next`, then clear old node links;
- restore head/sentinel pprev after the loop.

This yields retail's list=r2, current=r1, sentinel=r3, old-node=r0 shape naturally. No register variables, volatile matching hacks, inline assembly, or compiler changes are used.

Batch status:
**5/5 isolated target exact. No production source integration has been attempted yet.**

Production remains clean at contribution HEAD:
`589b8f8c69b52b12db903b87c02abcc19d1aa15b decompile hardware transfer routines`

EXACT NEXT ACTION:
Create a detached integration worktree from `589b8f8`. Introduce one shared generic intrusive callback node/list header and source for these five exact bodies, preserve raw helpers/sentinel constructor/query routines, update the existing `code_080A4A94.cc` local node to reuse the shared base only if its own bytes remain exact, and require plain full-ROM SHA1 proof before any production promotion.
## Detached B1 integration complete - promotion-ready

Detached integration worktree:
`/mnt/data/Github/gba/fomt-intrusive-list-integration-call241`

Base HEAD:
`589b8f8c69b52b12db903b87c02abcc19d1aa15b`

Final detached proof:
`sh_muqx9o84_8eda5ee7` PASS

Detached exact state:
- source: 56,568 / 940,036 = **6.0176%**;
- assembly: 883,468 = 93.9824%;
- ROM size: 8,388,608;
- SHA1: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`;
- target and adjacent symbols remain at retail addresses;
- raw seams `080098D8..080098DB`, `08009908..0800993F`, and sampled `080099B0` onward match baserom;
- `git diff --check` passes.

Exact integrated functions:
- `080098AC` base-node unlink/deleting destructor;
- `080098DC` concrete list destructor;
- `08009940` append;
- `08009968` remove;
- `08009984` clear/reset.

Shared source model:
- `IntrusiveCallbackNode` is 12 bytes: `pprev`, `next`, `vtable`;
- `IntrusiveCallbackList` is 0x1C bytes: base node, head, embedded sentinel;
- `Append`, `Remove`, `Clear` are normal methods;
- ABI-sensitive destroy paths remain semantic free functions with retail asm labels.

Method-style isolated candidate:
`tools/ches/checkpoints/intrusive-list-2026-10-02/candidate-v3-methods.cc`
SHA-256 `7a2ea1848b73fdb42f5aea4f0be35218afc5333ad3bd1dbc4046ad09f1c6c327`
Proof `sh_muqx0xvq_dc93f761`: 5/5 exact.

Integration ladder:
- `sh_muqx2qzm_26a0fd08`: minimal five-function source/linker integration full-ROM exact;
- `sh_muqx4jsn_fe7d9372`: REJECTED typed caller flattening; replacing `node.Init()` with direct assignments shortened `func_080A4A94` by 4 bytes and shifted downstream code;
- `sh_muqx5u4c_71b3d15a`: restoring `080A4A94` proved `HardwareContext +0x494` typing as `IntrusiveCallbackList` is byte-neutral;
- `sh_muqx71gk_f2d3e1f6`: exact typed caller cleanup using `struct UnkNode_080A4A94 : IntrusiveCallbackNode` while preserving the original inline `Init()` shape;
- `sh_muqx9o84_8eda5ee7`: final docs + source detached proof, full ROM exact.

Contribution-facing detached files:
`asm/hardware.s`, `fomt.lds`, `include/hardware.hh`, `include/intrusive_callback_list.hh`, `src/hardware_context.cc`, `src/intrusive_callback_list.cc`, `src/code_080A4A94.cc`, `docs/HARDWARE.md`, `docs/INTRUSIVE_CALLBACK_LIST.md`.

EXACT NEXT ACTION:
Production preflight those nine targets for unrelated edits/new-file collisions, copy only these reviewed detached files to `/mnt/data/Github/gba/fomt`, verify source hashes match detached, run full production `make -B -j4 compare`, progress/SHA1/symbol/raw-seam gates, then update durable docs and explicitly stage/commit/push only the nine contribution files if production remains exact.
## Production B1 promotion exact - commit-ready

Promotion preflight:
`sh_muqxeuuu_5d60b0dd` PASS
- six existing contribution targets were byte-identical to `HEAD` before promotion;
- three new contribution paths were absent; no collisions;
- production branch/head was `ches-dev` / `589b8f8c69b52b12db903b87c02abcc19d1aa15b`.

Promotion copy:
`sh_muqxf3ps_cb90ef5e` PASS
- all nine promoted production files exactly match the detached proven hashes.

Production full-ROM proof:
`sh_muqxfbgt_d5c64a43` PASS
- `make -B -j4 compare`: `fomt.gba: OK`;
- source **56,568 / 940,036 = 6.0176%**;
- assembly 883,468 = 93.9824%;
- ROM size 8,388,608;
- SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`;
- target and adjacent symbols remain at retail addresses;
- raw seams `080098D8..080098DB`, `08009908..0800993F`, and sampled `080099B0` onward compare exact.

Contribution-safe production files:
`asm/hardware.s`, `docs/HARDWARE.md`, `docs/INTRUSIVE_CALLBACK_LIST.md`, `fomt.lds`, `include/hardware.hh`, `include/intrusive_callback_list.hh`, `src/code_080A4A94.cc`, `src/hardware_context.cc`, `src/intrusive_callback_list.cc`.

Private docs updated before commit:
`START_HERE.md`, `docs/DECOMP_NOTES.md`, `docs/DECOMP_PRIORITY_MAP.md`, `docs/REPO_MAP.md`, `tools/ches/SESSION_STATUS.md`, this handoff/checkpoint.

EXACT NEXT ACTION:
Review the nine-file contribution diff including the three new files, scan for private research markers, stage those nine explicit paths only, run cached diff/check/stat/name-status, commit with project-style message, push `ches-dev`, verify `git ls-remote`, then replace pre-commit HEAD references in private docs with the new commit and select the next leverage target.
## B1 complete - committed, pushed, remote verified

Contribution commit:
`77b459045ec0500b82b185ece77ab1c4dccaecc5 decompile intrusive callback list`

Commit contents:
exactly nine contribution-safe files; private coordination/research files were not staged.

Push:
`sh_muqxk1di_1749a7e4` succeeded (`589b8f8..77b4590 ches-dev -> ches-dev`).

Independent remote verification:
`sh_muqxkbq9_54f16dea` confirmed local HEAD and `refs/heads/ches-dev` both equal `77b459045ec0500b82b185ece77ab1c4dccaecc5`.

Final exact progress:
**56,568 / 940,036 = 6.0176% source**, retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

B1 is CLOSED/COMPLETE. Do not repeat isolated matching, detached integration, promotion, or commit work unless regression evidence appears.

EXACT NEXT ACTION:
Run current leverage analysis at HEAD `77b4590`, compare the entity/UI constructor family around `080324BC`, common allocator/retry wrapper around `080D3BC0`, and preserved renderer targets, then document one coherent next five-function batch before starting candidates.
## Next batch selected - entity base around 080324BC

Fresh leverage run `sh_muqxmqck_b268143b` was evaluated by semantic leverage rather than raw fan-out.

Selected coherent five-function class boundary:
`080324BC`, `08032560`, `0803260C`, `08032690`, deleting destructor `080DC8F8`.

Why: both constructors build the same 0x8C base object; vtable `080E68B4` contains exactly the destructor plus the two methods; 43 unique callers construct this base and many immediately install derived vtables. This bridges engine infrastructure into entity/UI object construction.

Full evidence and exact ranges:
`tools/ches/checkpoints/entity-base-080324BC-2026-10-02/README.md`

EXACT NEXT ACTION:
Scratch-match deleting destructor `080DC8F8..080DC92B` first using the existing `UnkPoly` destructor alias and `vtable_unk_080E65E0`. Keep naming conservative until the class semantics are stronger.
## First source probes

Deleting destructor `080DC8F8..080DC92B`:
- candidate: `candidate-dtor-v1.cc`;
- SHA-256 `8812959fed0faadcd2f5b459dc5453f1d884b8ed2ff1313b616355ca49533bf4`;
- proof `sh_muqxvg7r_861b0562`;
- result **0x34 / 0 differences**, exact on first natural free-function probe.

Destructor source uses only proven behavior:
- destroy embedded `UnkPoly` subobject at +0x48 with flag 2;
- destroy embedded `UnkPoly` subobject at +0x08 with flag 2;
- install lower-base vtable `080E65E0` at +0x04;
- optional `operator delete(this)` when flags bit 0 is set.

Constructor overload 1 `080324BC..0803255F`:
- candidate: `candidate-ctor1-v1.cc`;
- SHA-256 `bf5db7c3d28363fe9e9292a42a6d05b478f85e47eacd502f63aa653a38cbc992`;
- proof `sh_muqxwz1g_02445b6e`;
- result **0xBC actual vs 0xA4 retail, 177 differing linked bytes**; REJECTED source shape.

Mismatch classification from `sh_muqxxbb4_f6790b08`:
- retail saves only r8/r9 and allocates 12 bytes of locals;
- v1 saves sl/r9/r8 and allocates 24 bytes;
- v1 eagerly loads/zero-extends typed byte stack parameters and spills them;
- retail delays the state_88/state_8A/state_8B stack reads until the final stores and only loads the refresh byte early;
- v1 preserves virtual-call results in r6 named locals; retail moves each return directly to r1 before the embedded constructor call.

Do not retry v1 spelling.

EXACT NEXT HYPOTHESIS:
Build constructor v2 with ABI-wide `u32` stack scalar parameters (even when only the low byte is eventually stored), keep refresh as a late/explicit low-byte load matching retail, inline the owner vfunc +0x68/+0x6C results directly into `func_080A4A00`, and avoid named `effect_context`/resource temporaries where retail does not preserve them. Recompare only `080324BC` first.
## Semantic identification and constructor v3

Existing exact source proves the selected 0x8C class is `UnknownEntityThing`, not merely an unnamed entity/UI base:
- `AActorEntity` places `GameObject * game_object` at +0x00, `facing` at +0x20, and `anim_id` at +0x22;
- retail `080324BC` reads exactly those fields from its second argument;
- `UnknownEntityThing` is already declared as 0x8C-ish entity render/effect state with `SpriteAnimator` fields at +0x30 and +0x70;
- the constructor's two 0x40 embedded effect objects start at +0x08 and +0x48, placing their internal animator at exactly +0x30/+0x70;
- existing `AActorEntity` methods access the same object fields at +0x44/+0x47/+0x70/+0x84/+0x87/+0x88/+0x8A;
- `AEntity::unk_10` is `SmartPtr<UnknownEntityThing>` and `AEntity::vfunc_30()` returns `UnknownEntityThing *`.

`UnknownEntityThingBase` is also a real lower base: deleting destructor `080DC8F8` destroys +0x48/+0x08 and restores base vtable `080E65E0`; standalone base destructor `080DC65C` restores the same vtable and conditionally deletes.

Constructor v2:
- `candidate-ctor1-v2.cc`, SHA-256 `9347065355c28f952fdec935e67c7293c6cdd9d4f5bd4b9b05a238e403a787ca`;
- result 0xA0 vs 0xA4, 125 differing bytes.

Constructor v3 changed only the final parameter from `u8 refresh` to `bool refresh` while keeping state_88/state_8A/state_8B ABI-wide `u32`:
- `candidate-ctor1-v3-bool.cc`, SHA-256 `e8dfe76f350692f7ad11e6613ee1136ed0747cef8866566219103a9146a51063`;
- proof `sh_muqy8bae_2114203e`;
- result **exact size 0xA4, 28 differing linked bytes**.

This proves retail's stack signature shape is strongly consistent with `(u32 state_88, u32 state_8A, u32 state_8B, bool refresh)`.

Remaining v3 mismatches are instruction scheduling only:
- first effect call: retail computes actor `anim_id + facing`, reloads game_object, then forms destination `this+0x08`; candidate forms destination first;
- second effect call: retail reloads game_object before destination `this+0x48`; candidate reverses them;
- final state writes: retail increments the state destination pointer before loading/shifting state_8A; candidate performs load/shift first.

Next experiments should alter only expression/declaration order for those three regions. Do not reopen parameter-width or class-identity hypotheses.
## Constructor 080324BC exact

Exact candidate:
`candidate-ctor1-v7-state8a-ptr.cc`

SHA-256:
`3e815378d416b8d1e13c524bc0a1b1770359ee6f45401a09d67934ac8800afae`

Proof:
`sh_muqydq69_1960df78`

Result:
**expected 0xA4, actual 0xA4, differing linked bytes 0**.

Exact source-shape ladder:
- v3 (`bool refresh`, ABI-wide state scalars) reached 0xA4 / 28;
- v5 proved real `AActorEntity`/`GameObject` typing compiles identically to v3;
- v6 introduced short-lived `effect_context`, `resource_id`, and `game_object` locals around each embedded effect construction and reached 0xA4 / 6;
- full tail pointer-walk v4 was rejected at 0xA0 / 77;
- v7 kept direct state_88/state_89/state_8B stores but introduced only `u8 * state_8A_ptr = &self->state_8A; *state_8A_ptr = state_8A << 2;`, producing exact retail order and **0 differences**.

Reusable lesson: when old GCC schedules an independent RHS load before a byte-field address advance, a narrowly scoped pointer to that one semantic field can recover the original pointer provenance/lifetime without disturbing the whole object.

Constructor 1 is CLOSED/EXACT. Do not retry earlier spellings.

Exact next action: reconstruct `08032560..0803260B` using the same proven `UnknownEntityThing`/`AActorEntity` model, call-local ordering, `bool refresh`, ABI-wide final state scalars, and the narrow state_8A pointer. Its first embedded effect uses `func_080A49A0` with extra args/count.
## Late-turn ctor2 and vfunc_0C frontier

### Constructor overload 08032560

Retail ABI/caller evidence:
- r0 self;
- r1 `AActorEntity * owner`;
- r2 `u32 value`;
- r3 `u32 const * args`;
- stack: `u32 count`, `u32 state_88`, `u32 state_8A`, `u32 state_8B`, `bool refresh`.

`candidate-ctor2-v1.cc`:
- SHA-256 `41d7d757a055b5a51217fbc2bddd7f259de8c48774548173d35bb83ed066b4a8`;
- proof `sh_muqyfezt_c1598da4`;
- result **0xAC exact size / 111 differing linked bytes**.

Main measured mismatch: retail eagerly loads count into r6 at entry and allocates owner=r5, value=r4, args=r9, refresh=r8. Free-function candidate leaves count on stack until the first call, yielding owner=r4, value=r8, args=r9, refresh=r5 and broad downstream register renaming.

`candidate-ctor2-v2-count-local.cc` added `u32 count_arg=count`; result remained **0xAC / 111** because the local optimized away. Closed.

`candidate-ctor2-v3-member.cc` expressed the same body as a real member method; result remained **0xAC / 111**. Free-vs-member shape is not the cause. Closed.

Best next ctor2 hypothesis: model the actual embedded `DiscardEffect` constructors and `UnknownEntityThing` as a genuine C++ constructor/initializer-list. The frontend-generated constructor argument lifetimes may explain retail's eager count promotion. Do not retry count-local or member-wrapper-only variants.

### Virtual 0803260C / UnknownEntityThing::vfunc_0C

Proven behavior:
- if `unk_47==0`, update animator +0x30 and set `unk_44=1` when Update result bit1 is set;
- else clear `unk_47` itself to 0;
- read low two bits of +0x8A as mode; if zero, return;
- if `unk_87==0`, update animator +0x70, set `unk_84=1` on result bit1, preserve raw update result;
- else clear `unk_87` and use synthetic result 2;
- if result bit2 is set and mode != 2, clear low two mode bits at +0x8A.

`candidate-vfunc0c-v1.cc` mistakenly cleared `unk_44` on the first else path and measured 0x88 / 120. Semantic mistake closed.

`candidate-vfunc0c-v2-fix-reset.cc` corrected that path to `unk_47=0`: **0x86 vs 0x84 / 108**.

Unsigned and signed Update-result bitfield wrappers (`v3` and `v4`) both compiled identically at **0x86 / 108**. Closed.

Broad retail caller scan proves Update result flags are commonly tested by shifting the target bit into the sign position, e.g. bit1 `lsls #30; cmp 0; bge/blt` and bit2 `lsls #29`. This is a repeated FoMT idiom, not target-specific.

`candidate-vfunc0c-v5-shift-tests.cc`:
- SHA-256 `6f48b46a1abe16de5a0365c640aefbad5d39212360909830e05fb91c381f4a7c`;
- proof `sh_muqyt8iu_074375ed`;
- result **0x80 vs 0x84 / 47 differences**, best vfunc0C frontier.

v5 gets the flag-test instruction form right. Remaining differences are in lower-half register identities/control-flow merging: retail mode=r5, mode-byte pointer=r6, clear flag=r7, and copies secondary raw Update result r2 into a merged r0 before the wrapped-bit test.

`candidate-vfunc0c-v6-lifetimes.cc` attempted explicit mode pointer plus separate `animator_result` and merged `result`. Initial form failed compilation because C++ cannot take a bitfield address; corrected byte-pointer form compiled to **0x80 / 52**, worse than v5. Closed as-is.

EXACT NEXT ACTION:
At next continuation, keep vfunc0C v5 shift-test semantics. Before generating more syntax variants, search for the closest retail structural twin among the many `func_0805E8F0` callers that use the same bit1/bit2 tests and state-byte pattern, or recover the project-native Update flag-test abstraction. Use that source-shape evidence to restore the missing 4 bytes and retail r5/r6/r7 lifetimes. Ctor2 remains secondary until the likely real initializer-list constructor model is tested.
## Constructor 08032560 exact

Real C++ member construction was the missing structural clue.

Exact candidate:
`candidate-ctor2-v6-both-helper.cc`

SHA-256:
`bfd1ecba314f53e3a8a7db117277cbb20973c857cf9cf17651ec9f6e1cdd97c6`

Result:
**expected 0xAC, actual 0xAC, differing linked bytes 0**.

Source-shape ladder:
- v1 explicit free-function calls: 0xAC / 111;
- count-local and member-wrapper-only variants: unchanged 111, closed;
- v4 true `DiscardEffect` member initializer list: 0xAC / 22;
- v6 resource helper only: 0xAC / 12;
- v6 game-object helper only: 0xB0 / 157, rejected;
- v6 both helpers: **0xAC / 0 exact**.

Exact helpers:
- `GetActorResource(AActorEntity * owner) { return owner->anim_id + owner->facing; }`
- `GetActorGameObject(AActorEntity * owner) { return owner->game_object; }`

Exact ctor2 source therefore strongly supports the original object model as a real class containing two 0x40 `DiscardEffect` members, not raw byte arrays. The frontend-generated initializer list is what eagerly promotes `count` into r6 at entry; the two small inline helpers recover retail argument evaluation/provenance for the member constructor calls.

Constructor 08032560 is CLOSED/EXACT. Do not retry older ctor2 variants.
## October 2 continuation - vfunc_0C allocator/CSE diagnosis and DiscardEffect layout

New best vfunc candidate:
- `candidate-vfunc0c-v8-result-merge.cc`
- proof `sh_muqznpcy_3ae6ab6e`
- result **0x82 actual vs 0x84 retail / 42 differing linked bytes**
- improvement came from preserving the secondary `SpriteAnimator::Update()` raw return in `animator_result`, then merging it into a separate `result` before the bit-2 test, matching structural retail twins such as `func_080ACAF0`.

Closed experiments after v8:
- v7 explicit mode-pointer declaration-order attempt: **0x7E / 48**, reject;
- v9 scalar-width family (`mode` u8/fu8, clear flag u8/u32, combinations): all code-identical to v8 at **0x82 / 42**, scalar width is not the cause;
- v10 delayed `clear_mode=false` until after the `unk_87` branch: **0x88 / 75**, reject.

Full `-da` pass dumps for v8 were generated with the ordinary tracked compiler, no compiler mutation:
`tools/ches/function-match-artifacts/entity-base-vfunc0c-v8-da.i.*`

Global allocator proof from `.greg`:
- pseudo48 = `mode`, 3 refs / live_length 29 / user var / crosses one call -> **r6**;
- pseudo55 = `clear_mode`, 4 refs / live_length 56 / user var / crosses one call -> **r5**;
- pseudo90 = preserved pointer to byte +0x8A, 3 refs / live_length 37 / pointer / crosses one call -> **r7**;
- allocator order is therefore pseudo55 -> pseudo48 -> pseudo90, yielding candidate `clear=r5, mode=r6, mode_ptr=r7`;
- retail requires `mode=r5, mode_ptr=r6, clear=r7`.

Critical pass diagnosis:
- initial `.rtl` contains a separate QI zero pseudo for the `+0x87 = 0` byte store;
- first CSE substitutes that byte-store zero with `(subreg:QI clear_mode)`, creating the fourth reference to pseudo55;
- that reuse persists through later passes;
- therefore the missing retail `movs r0,#0` and the r5/r6/r7 rotation share the same cause: early `clear_mode=0` is CSE-equivalent to the independent byte-store zero in the current source shape.

The tracked compatibility rule `AGBCC_HOIST_ZERO_AFTER_DEAD_COPY` is NOT the direct cause. Its patch is guarded to pointer user-variable copies via `REGNO_POINTER_FLAG`; no compiler change is justified here while source/object-model explanations remain.

New architectural identification:
- `UnknownEntityThing +0x08..+0x47` and `+0x48..+0x87` are two complete **0x40-byte `DiscardEffect` objects**;
- existing exact `DiscardEffect` constructors `080A49A0/080A4A00` prove layout:
  - `+0x00..+0x27` `EffectBase`,
  - `+0x28` `SpriteAnimator` (0x14 bytes),
  - `+0x3C` active/dirty byte,
  - `+0x3D` refresh flag,
  - `+0x3E` existing unknown byte,
  - `+0x3F` previously missing runtime byte;
- consequently `UnknownEntityThing +0x47` and `+0x87` are each the corresponding embedded `DiscardEffect +0x3F` byte;
- `src/code_080A480C.cc` currently stops the recovered `DiscardEffect` definition at +0x3E, so that private/public type knowledge is incomplete;
- structural twin `func_080ACAF0` operates on the same DiscardEffect pattern: +0x3F skip flag, animator +0x28 Update, +0x3C dirty flag, synthetic result 2, then bit-2 test.

Best next source experiment:
Build a private scratch v11 where `UnknownEntityThingCandidate` owns two fully typed 0x40-byte `DiscardEffect` members (including neutral `unk_3F`) and express vfunc_0C through those members while preserving v8 control flow/result-merge/shift tests. Do not change production headers yet. If machine code changes favorably, follow the member provenance. If it compiles identically, nested typing is proven neutral and the next credible source shape is an inline DiscardEffect-level update helper matching the structural twins.
## Superseding reconciliation - unified constructor model proven

Canonical status on disk contained newer work than the older handoff slice used at continuation. The newer state wins. Constructor work must not be repeated.

Unified typed ctor1 candidate:
`candidate-ctor1-v8-unified-initializer.cc`

SHA-256:
`2cd54c43494fd988028491553c501b11027126fd2fb3ebe7a6f6d0bcdfaefe9c`

Saved mismatch artifact:
`tools/ches/function-match-artifacts/entity-base-ctor1-v8-unified-initializer.mismatch.txt`

Result:
**080324BC expected 0xA4 / actual 0xA4 / 0 differences**.

This uses the same coherent object model already proven exact by ctor2:
- two real 0x40-byte `DiscardEffectCandidate` members;
- inline `GetActorResource(owner)`;
- inline `GetActorGameObject(owner)`;
- member initializer-list construction;
- narrow state_8A pointer write retained for the exact final state-store order.

Constructor status is therefore:
- `080324BC`: exact under unified typed model;
- `08032560`: exact under unified typed model (`candidate-ctor2-v6-both-helper.cc`);
- `080DC8F8`: exact destructor;
- remaining batch work: virtuals `0803260C` and `08032690`.

vfunc0C later typed experiments already existed before this continuation and must not be rediscovered:
- v11 typed effect: 0x80 / 47;
- v12 typed effect + result merge: 0x82 / 42;
- v13 bool reset: 0x82 / 42; same result under clean/package/active tracked compiler;
- v14 hard-register diagnostic: 0x86 / 82, reject and never promote;
- v15 late-clear: 0x88 / 75, reject;
- v16 explicit mode-state view: 0x82 / 42, no improvement.

Current credible vfunc0C source frontier remains v13/v12 at **0x82 / 42**, with behavior/object model strongly proven. The next productive path is to work the other virtual `08032690` in the same unified class model, then return to vfunc0C with any new neighboring source-shape evidence.
## Renderer 08032690 local-frame breakthrough

Scratch ladder after the unified constructor reconciliation:
- v1 `candidate-vfunc10-v1.cc`: 0x232 / 595 diffs;
- v2 typed handle + resource wrapper: 0x22A / 591;
- v3 explicit draw-result if/else merge: 0x22C / 584;
- v4 keep original context live through final draw: 0x236 / 584;
- v5 real member method: 0x236 / 587, closed;
- v6 position aggregate: 0x238 / 582, but wrong stack placement;
- v7 context reference instead of pointer: identical to v4 at 0x236 / 584, closed;
- v8 five-word render-state aggregate: exact 0x50 frame, 0x242 / 582;
- v9 state initialization before resource copy: 0x242 / 565;
- v10 combined seven-word render locals: **0x240 / 579**, but proves the complete retail local frame and field order exactly.

Critical v10 architecture proof:
`candidate-vfunc10-v10-combined-locals.cc`
SHA-256 `81c4f13e4aedb2806a71f0d13b9dbe74528076eeca180a50dbfe3cf1a9184525`.

The 0x50-byte retail stack frame is now structurally explained without padding/volatile/register forcing:
- outgoing call args: sp+0x00..0x13;
- one 0x20-byte sprite render record: sp+0x14..0x33;
- seven-word render-local record at sp+0x34..0x4F:
  - +0x00 / sp+0x34 transfer queue;
  - +0x04 / sp+0x38 renderer;
  - +0x08 / sp+0x3C owner GameObject;
  - +0x0C / sp+0x40 screen x;
  - +0x10 / sp+0x44 screen y;
  - +0x14 / sp+0x48 depth (`0x8000 - world_y`);
  - +0x18 / sp+0x4C secondary-effect x.

This matches the retail stack geometry exactly. The render record remains at sp+0x14 as retail. Therefore do not reopen missing-local/frame-size hypotheses.

v9 still has the best current byte-difference count (565), while v10 has the strongest exact local-layout proof. The next task is to combine v10's exact local record with retail register/lifetime ordering, especially `owner=r8`, context=`sl`, self=`r6`, and later render-data/effect temporaries. Use `-da` allocator evidence before source variants.
## Renderer v11-v14 structural results

These supersede older renderer candidates where they conflict.

### Fixed IWRAM draw-call contract

Existing exact source `src/code_080A4A4C.cc` proves calls to IWRAM renderer address `0x030004DC` are expressed as a typed fixed-address function pointer:
`reinterpret_cast<Fn>(0x030004DC)(...)`.

`candidate-vfunc10-v11-iwram-call.cc`:
- based on v9 individual/aggregate local frontier;
- SHA-256 `8d08ec54529f32a28dab632df014fa84f6574e3afde7e7027316640a5a980c33`;
- result **0x24C vs 0x270 / 572 diffs**;
- emits the retail structural form `ldr r4, =0x030004DC; bl _call_via_r4` at both effect draws.

`candidate-vfunc10-v12-locals-iwram.cc`:
- combines v10 exact 0x50 local-frame geometry with fixed-address IWRAM calls;
- SHA-256 `e396c7ac87674ad4f2b34892c13308b520222e5286b4da9eafa34a9d345ed718`;
- result **0x24E / 575 diffs**.

Future credible renderer candidates must use the fixed-address function-pointer call. Do not return to a normal `extern func_030004DC` direct call.

### +0x8A mode field typing

`candidate-vfunc10-v13-mode-bitfields.cc`:
- changes raw +0x8A byte to the project-native layout `u8 state_8A_0 : 2; u8 state_8A_2 : 6;`;
- SHA-256 `3315c9d8a3a844034da6ea4134a016dd37b2d1755a22685d5f06a55ccfcbe73f`;
- result **0x24E / 573 diffs**.

Critically, v13 emits the exact retail extraction:
`ldrb raw; lsl #30; lsr #30`, then reuses the same raw byte with `lsr #2` for the upper six bits.

Therefore +0x8A 2/6 bitfield typing is validated and should be retained.

`candidate-vfunc10-v14-mode-enum.cc`:
- wraps the low two bits in an enum and performs enum range comparisons;
- SHA-256 `c6a37ff6e1ed6b9e489a615e8aac8c470df858ad228cec1b508a179676fac711`;
- result unchanged **0x24E / 573**;
- does not restore retail's redundant signed lower-bound `cmp 0; blt` check.

Enum-only mode spelling is CLOSED as no improvement.

### Current renderer frontier

Best raw difference count remains v9 at 565, but the strongest proven source ingredients are cumulative and should guide the next candidate:
- two real `DiscardEffect` objects;
- exact 0x50 frame/local geometry proven by v10;
- fixed-address IWRAM draw call proven by v11/v12;
- +0x8A project-native 2/6 bitfields proven by v13;
- v14 enum wrapper adds no value.

Next source-shape work should target the remaining control-flow/lifetime mismatches, especially the `state_8B` attribute-selection branch and the repeated effect upload block. Do not reopen frame size, IWRAM call form, or +0x8A typing.
## Renderer v21 major draw-helper breakthrough

`func_080A4A4C` exact source was recognized as the same handle-gated IWRAM draw primitive inlined twice inside `08032690`.

Offset proof:
- `Unk_080A4A4C_State +0x08 enabled` == `EffectBase::handle.value`;
- `+0x0C` == `EffectBase::unk_0C`;
- `+0x10 data` == address of `EffectBase::count` / start of trailing data;
- its fixed-address `0x030004DC` argument order matches the renderer draw calls exactly.

`candidate-vfunc10-v21-exact-draw-helper.cc`:
- transplants the exact recovered `func_080A4A4C` source shape into a `static inline DrawEffectBaseExact` helper;
- both renderer hand-written handle/IWRAM blocks are replaced by this inline helper;
- SHA-256 `81fa193255a8fc6283f3231698b0f6e9066dff58fcfccabd40692d9a1689db47`;
- result **expected 0x270 / actual 0x266 / 559 differing linked bytes**.

This is the best credible renderer result so far and only 10 bytes short of retail.

Conclusion: future renderer candidates should retain the exact recovered draw-helper abstraction. Do not revert to hand-written handle tests or direct fixed-address calls.

Exact next refinement: combine v21 draw-helper shape with the locally proven late transfer-queue load (`active` check before loading sp+0x34) and inspect the remaining size/register gap with `-da`.
## Checkpoint: renderer v34 natural C++ frontier and frontend-fold evidence

Checkpoint authority for `08032690` now supersedes earlier v21-only guidance.

### v34 natural C++ renderer base

Candidate:
`candidate-vfunc10-v34-resource-before-state.cc`

SHA-256:
`6c1a41dc3d9d95a9fad674fc7a7dbd91247ced8790855903d4892227bee3a7de`

Result:
**retail 0x270 / candidate 0x26A / 559 differing linked bytes**.

Why v34 is stronger than v21 even though both have 559 diffs:
- exact 0x50 retail stack frame;
- exact long-lived register identities: self=r6, context=sl, owner=r8, secondary effect_y=r9;
- real constructor-lowered local objects rather than one permanent seven-word aggregate-base pointer;
- exact inline `func_080A4A4C` draw primitive retained;
- project-native +0x8A 2/6 bitfield extraction retained;
- fixed-address IWRAM draw call retained.

v33 first introduced a constructor on the 20-byte `RenderStateCandidate` and reached **0x26A / 562**. Swapping local construction order to `RenderResourcesCandidate resources(context); RenderStateCandidate state(owner, context);` produced v34 **0x26A / 559** and the exact retail long-lived register map.

### Diagnostic stack-residence proof

`candidate-vfunc10-v30-volatile-spill-proof.cc` is DIAGNOSTIC ONLY:
- forcing only screen y and secondary effect_x to memory reached **0x25A / 505 diffs**;
- immediately recovered self=r6, owner=r8, context=sl, effect_y=r9 and an 0x50 frame;
- local offsets were not retail-correct, so this is not a source candidate;
- proves those two stack residences are a dominant allocator cause.

Reordering the render record around the volatile diagnostic (`v32`) regressed to 0x24E/586. Volatile is CLOSED and must never enter production.

### Frontend-fold evidence from v34 -da

Full pass dumps:
`tools/ches/function-match-artifacts/entity-base-vfunc10-v34-da.i.*`

Critical finding: the missing retail signed range checks are already absent in **initial RTL**, before CSE/jump/global allocation.

Mode gate source contains `if (mode >= 0 && mode <= 2)`, but initial RTL after the exact +0x8A bitfield extraction contains only:
- compare mode == 0 for outer guard;
- compare mode > 2 using unsigned `gtu`.

There is no `mode < 0` RTL branch to preserve. The front end has already folded it from the proven zero-extended 2-bit value.

`state_8B` initial RTL likewise zero-extends the +0x8B byte and emits only:
- compare == 1;
- compare == 2.

Retail instead contains the longer signed ladder `cmp 1 / beq / cmp 1 / ble / cmp 2 / beq`.

Therefore four of the retail instructions missing from current candidates are not being deleted by later optimization passes; the current frontend never emits them from the credible source shapes tested.

### Anti-rediscovery / closed renderer variants

- v22 draw-helper + late queue load: 0x266/561;
- individual exact draw-helper family: 0x242/584;
- old two-aggregate exact draw: 0x26A/583;
- old tail aggregate: 0x25E/573;
- old three-aggregate ordering: 0x25E/562;
- current screen-pair aggregate: 0x24C/585;
- current tail3 aggregate: 0x25E/573;
- accessors, enum bitfields, plain char, enum field, int local, signed/unsigned int 2-bit mode variants: no credible improvement over their base;
- state8B signed i8/bitfield variants add non-retail sign-extension and are diagnostic only.

### Renderer instruction-gap accounting

v21 had 292 instructions vs retail 297, net five instructions short. Structural comparison identified six retail instructions absent from v21:
- two instructions for signed lower-bound mode check;
- two instructions in the signed state8B compare ladder;
- two instructions rebinding sp+0x34 into r8 before primary rendering.

v34 recovers the correct long-lived register model and more source structure, leaving a net three-instruction / six-byte size gap. The exact remaining accounting must be done from v34, not v21.

EXACT NEXT ACTION:
Resume from v34 only. First compare v34 instruction landmarks against retail to account for the remaining three instructions precisely. Then run a bounded PRIVATE compiler/frontend diagnostic to determine whether preserving the two folded signed ladders requires a generalized compatibility behavior. Do not mutate the tracked compiler, do not reopen compiler-family hunting, and do not promote any compiler change unless it is structural, generalized, regression-safe, and independently validated.

## October 2 checkpoint: renderer layout correction, v43/v44, and bounded compiler diagnostics

This section supersedes earlier statements that called v34's local field layout exact.

### Retail local layout, re-verified directly

Retail `08032690` uses a 0x50 frame with:
- outgoing args: `sp+0x00..0x13`;
- `SpriteRenderDataCandidate`: `sp+0x14..0x33`;
- transfer queue: `sp+0x34`;
- renderer: `sp+0x38`;
- game object: `sp+0x3C`;
- screen x: `sp+0x40`;
- screen y: `sp+0x44`;
- depth: `sp+0x48`;
- secondary effect x: `sp+0x4C`.

Retail initialization order is game object, x, y, depth, then queue and renderer.

v34 has the correct 0x50 frame SIZE but places the 20-byte state object at `sp+0x34..0x44` and resources at `sp+0x48..0x4C`. Therefore v34 is not field-layout exact.

### v43 / v44 natural source frontier

`candidate-vfunc10-v43-combined-constructor.cc`
SHA-256 `d7f48fb2b0deb64c3fe447cbb86c207e64c3e94af5e640b1aaf30dadc9bfe779`
Result: **0x26A / 557 diffs**.

v43 uses one seven-word `RenderLocalsCandidate` with a real constructor body assigning in retail order. It recovers exact retail stack field placement and initialization order, plus `context=sl`, `owner=r8`, and secondary `effect_y=r9`. The combined locals base takes r6, moving self to r7.

`candidate-vfunc10-v44-combined-constructor-nested-mode.cc`
Tracked compiler result: **0x26E / 536 diffs**.

v44 adds natural nested signed range checks and emits the exact retail mode ladder:
`cmp 0; beq; cmp 0; blt; cmp 2; bgt`.
It preserves v43's exact stack placement/order, but still keeps the combined locals base in r6 and self in r7.

### Private compiler diagnostics

Private tree:
`/mnt/waydroid-hdd/home-chester-waydroid/agbcc-renderer-frontdiag-v1`

Base is pinned `1caa6becde5e4676b59c31c74d68f45ced79557c` plus the current tracked FoMT compatibility patch. No tracked compiler source changed.

Private, OFF-by-default diagnostics:
- `AGBCC_TRACE_NARROW_CONTROL`;
- `AGBCC_PRESERVE_PROMOTED_SIGNED_COMPARE` (neutral);
- `AGBCC_KEEP_SINGLE_RIGHT_BOUND`;
- `AGBCC_DISABLE_SHORT_CIRCUIT_RANGE_FOLD` (broad diagnostic only);
- `AGBCC_SKIP_PRE_FRAME_ADDR` (diagnostic only).

`AGBCC_KEEP_SINGLE_RIGHT_BOUND` restores the generic single-right-leaf switch lower-bound branch and reproduces retail:
`cmp #1; beq; cmp #1; ble default; cmp #2; beq`.
On unchanged v34: baseline 0x26A/559, switch rule **0x26E/530**. Strong evidence, not validated/promoted.

`fold_range_test()` is the mechanism merging `mode >= 0 && mode <= 2`. Broadly disabling that fold restores the mode ladder but rotates allocation, so the broad rule is closed:
- v34 range-off: 0x26E/538;
- v34 range-off + switch: 0x272/586.

Natural nested source v37 and equivalent v38/v40/v41 forms also emit the exact mode ladder at the same 0x26E/538 family, confirming source semantics but not final allocation.

GCSE/PRE analysis proved the nested control blocks add an extra copy of the frame-relative combined-locals base. Its reaching pseudo gains enough references to outrank self in global allocation.

`AGBCC_SKIP_PRE_FRAME_ADDR` skips PRE replacement for frame-pointer-relative `PLUS(REG FRAME_POINTER_REGNUM, CONST_INT)` expressions in `pre_delete()`, so no reaching pseudo is created and later insertion phases safely skip it.

Measurements:
- v43 + PRE-frame exclusion: 0x264/558;
- v43 + PRE-frame exclusion + switch: 0x268/558;
- v44 + PRE-frame exclusion: 0x268/579;
- v44 + PRE-frame exclusion + switch: **0x26C/563**.

The v44 PRE-off + switch result is structurally valuable despite worse raw diff count:
- exact retail stack field layout and initialization order;
- exact mode ladder;
- exact state8B ladder;
- `self=r6`;
- `context=sl`;
- `owner=r8`;
- secondary `effect_y=r9`.

Remaining visible mismatch: it still materializes `sp+0x34` into a short-lived r4 through the secondary draw, while retail performs direct sp-relative loads/stores. This points toward a more granular natural local model rather than promoting the PRE exception.

Historical May-2000 and Oct-2003 vendor C++ compilers compile v34 byte-identically at 0x268/585, binary SHA-256 `344d410191b8c702ed48f78cc35b46f6ac968e34ac6305fde80b2d09e79a94ab`. The 2003 signedness fix does not explain this target. Do not reopen compiler-family hunting.

Existing compatibility-rule ablation: of the nine tracked FoMT rules, only `AGBCC_DELAY_CONST_INDIRECT_CALL_ADDRESS` affects v34.

Closed branches:
- v37/v38/v40/v41 exact mode ladder but same allocation rotation;
- v39 boolean helper 0x27E/602;
- v42 individual locals + nested mode 0x246/584;
- v31 tail3 aggregate rechecked and found to use non-retail field positions.

EXACT NEXT ACTION:
Resume from v43/v44. Preserve the verified retail field order and nested mode control shape. Search for a natural granular local model yielding `queue+34, renderer+38, game_object+3C, x+40, y+44, depth+48, effect_x+4C` while avoiding a combined locals base live through the secondary draw. Use the PRE-frame exclusion only as diagnostic evidence. Do not promote either private compiler rule until natural source work is exhausted and any generalized rule passes the full regression ladder.


## October 2 renderer checkpoint: scalar-layout breakthrough and v59 frontier

This section supersedes older renderer guidance that treated v43/v44 as the active natural-source frontier.

### Natural stack model is now strongly evidenced

The retail renderer behaves like:
- a real 2-word resources object at `sp+0x34/+0x38`;
- independent scalar `game_object/x/y/depth/effect_x` values at `+0x3C/+0x40/+0x44/+0x48/+0x4C`;
- a real `SpriteRenderDataCandidate` at `sp+0x14`.

Historical May-2000 and Oct-2003 vendor compilers compile the scalar v42 source identically at **0x24C / 589 diffs**, and naturally place:
`resources +34/+38, game_object +3C, x +40, y +44, depth +48`.
This is strong independent evidence for the scalar layout.

The current tracked compatibility compiler changes that allocation only because of the already-validated `AGBCC_DELAY_CONST_INDIRECT_CALL_ADDRESS` rule:
- v42 with no compatibility flags: **0x24C / 589**;
- v42 with all tracked flags: **0x246 / 584**;
- omitting any other single tracked flag is neutral;
- omitting only `AGBCC_DELAY_CONST_INDIRECT_CALL_ADDRESS` returns **0x24C / 589**.

Do NOT disable that rule globally. It is required for the exact production `080A4A4C` 9-argument fixed-IWRAM wrapper, and the renderer uses the same structural call form to `0x030004DC`. Retail renderer also clearly delays the target load until immediately before `_call_via_r4`.

### Register-pressure source recovered

Retail keeps additional real-object address lifetimes:
- after each `GetSpriteRenderData`, `r7 = &render_data`;
- before the SECOND getter/draw, after owner is no longer needed, `r8 = &resources`.

Adding those natural aliases to the scalar source is the major breakthrough.

#### v50
`candidate-vfunc10-v50-render-resource-aliases.cc`
Tracked result: **0x26C / 342 diffs**.

Natural aliases:
- `SpriteRenderDataCandidate *render = &render_data` after each getter;
- `RenderResourcesCandidate *resources_ptr = &resources` before the second getter.

This recovers naturally:
- exact 0x50 frame;
- stack slots `+34/+38/+3C/+40/+44/+48/+4C`;
- `self=r6`, `context=sl`, `owner=r8`;
- `r7=&render_data` after each getter;
- second-phase `r8=&resources`.

v50 initially kept effect_x in r9 and spilled effect_y.

#### v52
Initializing effect_y before effect_x flips the pair to the retail identities but reverses the two table halfword loads. Result: **0x26C / 338**. Useful proof only.

#### v53
`candidate-vfunc10-v53-offset-temps.cc`
Tracked result: **0x26C / 328 diffs**.

Explicit full-width offset temporaries:
```
i32 offset_x = offset->x;
i32 offset_y = offset->y;
i32 effect_x = x + offset_x;
i32 effect_y = y + offset_y;
```

This naturally reproduces the retail primary effect island:
- load offset x, then offset y;
- load x from `sp+0x40`;
- compute/store effect_x at `sp+0x4C`;
- load y from `sp+0x44`;
- compute effect_y into r9;
- materialize `r7=&render_data` after the getter.

The i16-temp v54 regresses to 342 and is closed.

#### v56
`candidate-vfunc10-v56-late-effect.cc`
Tracked result: **0x26C / 317 diffs**.

Moving `DiscardEffectRenderCandidate *effect = &self->effect_48` until AFTER both offset loads matches retail's source/evaluation order and improves 11 more bytes.

#### v55 / v57 helper evidence
Passing the whole resources object into `QueueEffectGraphicsV2` rather than pre-evaluating the queue pointer moves the queue load after the effect-active test, matching retail's evaluation order:
- v55 resource-helper only: 329 diffs;
- v57 resource-helper + late effect: 318 diffs.
Useful evidence, but v56 remains better than v57.

#### v58
`candidate-vfunc10-v58-table-order.cc`
Explicit facing/variant offset temporaries move the table arithmetic into a more retail-like order but raw result stays **0x26C / 317 diffs**. v56 and v58 are tied local oracles.

### Current strongest natural source: v59

`candidate-vfunc10-v59-resource-two-arg.cc`
Tracked result: **0x26C / 309 diffs**.

Change from v56:
```
RenderResourcesCandidate(GraphicsTransferVector *queue, void *render)
    : transfer_queue(queue), renderer(render)
{
}

RenderResourcesCandidate resources(
    context->transfer_queue,
    context->renderer);
```

This causes old GCC to evaluate/load both context fields before storing either resource field and makes the renderer prologue/resource construction match retail instruction-for-instruction:
- exact prologue and 0x50 frame;
- self/context/owner = r6/sl/r8;
- game object, x, y, depth stores exact;
- `add r2, sp, #0x34`;
- load queue then renderer;
- store queue to `sp+0x34`;
- store renderer to `[r2,#4]`;
- exact nested signed mode ladder follows.

v59 is the current natural-source authority.

#### v60
`candidate-vfunc10-v60-resource-two-arg-table-order.cc`
v59 + explicit retail-like table arithmetic ordering.
Result: **0x26C / 311 diffs**, two worse than v59. Keep as a local table-order oracle only.

### Closed aggregate/object variants from this continuation
- v45 resources-before-tail3 aggregate: 0x25E/577, aggregate allocated before render data and destroys layout.
- v46/v47 reversed state/resources declaration: old GCC keeps the same object stack order, no solution.
- v48 one-word y object: optimized back into a register, identical family.
- v49 x/y pair object: 0x258/547, aggregate shifts the frame.
These reinforce that the retail model is resources object + scalar render state, not a larger aggregate.

### Private switch rule refinement required

Current private `AGBCC_KEEP_SINGLE_RIGHT_BOUND` still proves the missing retail state_8B ladder, but it is too broad.

On v53:
- natural source: 0x26C and 295 decoded entries;
- with current switch rule: 0x274 and 299 entries;
- retail: 0x270 and 297 entries.

The rule adds the desired two instructions to the 2-case `state_8B` switch, but also adds two unwanted instructions recursively inside the later 4-case `state_88` switch.

Therefore the next compiler experiment must refine this structurally to the true two-case/root-style switch shape. No function address, symbol, UID, pseudo, or hard-register discriminator is allowed.

### Exact next action

Resume from **v59**, not v34/v43/v44.

1. Re-run retail-v59 alignment now that the prologue and primary effect structure are substantially corrected.
2. Test v59 combined with the resources-reference queue-helper shape, because v59's exact two-argument resources constructor may change that interaction.
3. Continue matching the primary/secondary queue helper evaluation order and the final state_88/final func_0803AE58 islands from retail evidence.
4. In the private compiler only, refine `AGBCC_KEEP_SINGLE_RIGHT_BOUND` so it applies structurally to the true 2-case switch but not recursively to state_88. Test v59 first.
5. If the switch refinement is promising, run the established hard targets, five canaries, 54-module corpus, and full-ROM validation before any tracked compiler promotion.
6. No production renderer integration, commit, or push until the renderer target is exact and any compiler refinement passes the full regression ladder.


## October 2 renderer checkpoint: v92 reaches 8 tracked diffs, private exact proof

This checkpoint supersedes the earlier v59/309 renderer frontier.

### Source reconstruction breakthrough

The renderer has now reached exact retail size and instruction count under the normal tracked compiler.

Key progression:
- v68 active-value + active-pointer helper: **0x26C / 301**.
- v74 explicit draw enabled value as the LAST inline helper parameter: **0x26C / 299** and exact renderer/game_object/enabled evaluation order.
- v75 combines the facing-offset table form: **0x26C / 297**.
- v78/v79 natural state_8B rewrites recover exact 0x270 size and collapse the cascading mismatch to **65 diffs**.
- v81 explicit state_8B CFG reproduces the retail state_8B ladder instruction-for-instruction: **0x270 / 30 diffs**.
- v82 independently proves an exact state_88 CFG.
- v83 combines both exact CFGs: **0x270 / 22 diffs**.
- v84 changes the default attr mask from `value = owner->unk_21 & 3` to load then `value &= 3`, matching the retail r0/r1 mask sequence: **0x270 / 20 diffs**.
- v92 is the current source authority: **0x270 / 8 diffs**.

### v92 exact table model

File:
`tools/ches/checkpoints/entity-base-080324BC-2026-10-02/candidate-vfunc10-v92-table-shape.cc`

The table is modeled as:
```cpp
EC EffectOffsetCandidate gUnk_080F1328[][4];

u32 facing = owner->facing;
EffectOffsetCandidate const * offset =
    &gUnk_080F1328[self->state_8A_2][facing];
```

This makes the full table-address island retail-exact:
- packed state byte remains in r1;
- facing is loaded into r0;
- variant shifts happen after facing;
- facing is scaled by 4;
- base literal is loaded into r2;
- base + facing, then variant row offset, matches retail.

Under the normal tracked compiler v92 differs only at:
- 0x08032728..0x0803272B;
- 0x08032808..0x0803280B.

Both are the same ordering difference:
retail:
```
add r0, sp, #20
ldr r3, [r3, #16]
```
tracked candidate:
```
ldr r3, [r3, #16]
add r0, sp, #20
```

Everything else in the 0x270-byte renderer is linked-byte exact.

### Private compiler proof

A private opt-in rule was added to:
`/mnt/waydroid-hdd/home-chester-waydroid/agbcc-renderer-frontdiag-v1/g++/calls.c`

Initial diagnostic:
`AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS`
delayed non-symbol/non-constant indirect call-address preparation when:
- `fndecl == 0`;
- register parameters are present;
- `num_actuals > 1`;
- target is neither CONST_INT nor SYMBOL_REF.

With all established tracked compatibility flags plus this private rule, v92 became **0x270 / 0**:
execution `sh_murityir_2779a434`.

This also left the already-exact final 1-argument GameObject virtual call unchanged.

### Broad >1 rule rejected by regression

Full validator attempt:
`sh_muriun3m_fedea107`

Results before abort:
- terrain exact;
- water exact;
- lifecycle main regressed from exact 0x94 to **0x98 / 71 diffs**.

Cause:
`src/code_080A46AC.cc` contains a 2-argument virtual call:
`provider_arg->vtable->get_value(provider_arg, value)`.
The broad >1 rule delays that call target too and changes exact lifecycle scheduling.

Therefore `num_actuals > 1` is CLOSED / REJECTED.

### Refined private rule saved, not yet tested

The private rule has now been narrowed to:
`num_actuals > 2`

This structurally separates:
- renderer getter: 3 arguments, candidate for delayed target preparation;
- lifecycle get_value: 2 arguments, should remain baseline;
- final GameObject virtual call: 1 argument, should remain baseline.

Current private source:
`/mnt/waydroid-hdd/home-chester-waydroid/agbcc-renderer-frontdiag-v1/g++/calls.c`

Current calls.c SHA-256 after correction:
`49bbcaf9360db1d5c8691be218dd3a2e6975ad8c47b2d97f72658605cabae817`

Private compiler rebuild:
`sh_murivufx_d623638d` PASS.

IMPORTANT: the refined >2 rule has NOT YET been tested against v92 or the validator because the harness forced the 50-call checkpoint.

### Switch diagnostic status

The earlier private `AGBCC_KEEP_SINGLE_RIGHT_BOUND` root-depth experiment is CLOSED. A root-only discriminator still fires for state_88 because GCC's switch-tree preprocessing can produce the same simple-right-root shape there.

Do not promote that switch rule. Source CFG work already reproduces both state_8B and state_88 exactly without it.

### Production status

Production is untouched:
- branch: ches-dev
- HEAD: `77b459045ec0500b82b185ece77ab1c4dccaecc5`
- no renderer source/asm/linker integration;
- no commit/push;
- tracked compiler patch unchanged.

### Exact next action

1. Test v92 using the rebuilt private compiler with `AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS=1` and the refined `num_actuals > 2` condition.
2. Require v92 **0x270 / 0**.
3. Re-test lifecycle main immediately and require **0x94 / 0**.
4. If both pass, run the complete established compatibility validator: hard targets, five canaries, 54/54 corpus, full source-converted ROM.
5. If the full ladder passes, create a clean pinned compiler authoring tree from the contribution-safe tracked authority and add ONLY the generalized >2 indirect-call rule. Rebuild/package independently and validate again.
6. Only after fresh reproducibility gates pass should the tracked compiler patch/install path be updated.
7. Then integrate the renderer in a detached retail worktree, prove full retail SHA1, apply the identical production seam, update architecture/progress docs, contribution diff review, and commit/push only if every retail gate is exact.


## October 3, 2026 - 50-call checkpoint after complete documentation read and renderer rule refinement

This checkpoint is the newest handoff and supersedes the October 2 renderer next-action text above where it conflicts.

### Documentation prerequisite complete

The user required every human-maintained repository document to be read before further work.

- Inventory: **51 human-maintained documents**, about 1.14 MB total.
- Complete authored-doc stream: `sh_murlz3dp_92a79b75`.
- The stream was read through `eof:true`.
- Generated mismatch/pass dumps remain evidence artifacts, not authored documentation.
- Current/top snapshots and newest handoff own current truth. Older chronological “next” instructions are historical evidence only.
- Anti-rediscovery conclusion is unchanged: do not reopen compiler-version hunting, old switch rules, closed source families, or prior Call238 experiments without new causal evidence.

### October 3 compiler results

Production remains untouched at branch `ches-dev`, contribution HEAD `77b459045ec0500b82b185ece77ab1c4dccaecc5`. No renderer source/asm/linker integration, tracked compiler change, commit, or push occurred.

1. **Arity-only `num_actuals > 2`**
   - renderer v92: `sh_murlf9zh_aab2c077` = **0x270 / 0**;
   - lifecycle main: `sh_murlft1c_c379cf1e` = **0x94 / 0**;
   - full validator `sh_murlg3ll_3f635a71` kept the earlier hard targets/canaries exact but failed the saved corpus:
     - 52/54 exact;
     - total diff 132;
     - `src__farmer_entity_item_action`: 8 bytes;
     - `src__game_object_discard`: 124 bytes;
   - full-ROM stage did not run.
   - **CLOSED / REJECTED as too broad.**

2. **First-argument `ADDR_EXPR` refinement**
   - renderer returned to **0x270 / 8** in `sh_murllu6q_b3e30b7f`.
   - **CLOSED as too narrow.**

3. **Call-shape tracing**
   - renderer getter arg0 reaches `expand_call` as `PARM_DECL`;
   - farmer callback is `VAR_DECL`;
   - discard callbacks are `VAR_DECL` and `NOP_EXPR`;
   - corpus-wide trace `sh_murls43v_6404ae2a` found exactly three qualifying 3-argument indirect-call shapes in the saved 54-module corpus and **zero `PARM_DECL` hits**.

4. **Current private `PARM_DECL` candidate**
   - source: `/mnt/waydroid-hdd/home-chester-waydroid/agbcc-renderer-frontdiag-v1/g++/calls.c`;
   - rule: non-symbol/non-constant indirect call, register parameters present, `num_actuals > 2`, and `TREE_CODE(args[0].tree_value) == PARM_DECL`, mirrored before/after argument register loads;
   - current calls.c SHA-256: `918b730bbfc0e4c14710e0041515042959a79a2e7f593ac28be5fb3e7909466c`;
   - renderer v92: `sh_murlt7d4_3cbc388a` = **0x270 / 0**;
   - lifecycle main: `sh_murltg5l_34ab9a55` = **0x94 / 0**;
   - saved `tools/ches/checkpoints/call238/full-flow-regression/package_v5_results.tsv` now records **54/54 exact / total diff 0**, including both modules regressed by arity-only `>2`.

### Important unresolved gate

The current `PARM_DECL` candidate has **not yet passed the complete established validator/full-ROM ladder** after this refinement. The saved corpus is exact, but do not infer full-ROM validation from that.

Also treat `PARM_DECL` as a candidate discriminator, not established compiler truth. It may encode source/front-end spelling rather than a sufficiently general behavioral class. Passing the regression ladder is necessary but not sufficient for promotion.

### Exact next action

1. Do **not** change the private rule first.
2. Run the complete established compatibility validator with the current private compiler and `AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS=1`.
3. Require all hard targets, all five canaries, the saved corpus **54/54 / total diff 0**, and the source-converted full ROM `fomt.gba: OK`.
4. If the full ladder passes, inspect whether the `PARM_DECL` discriminator can be explained/reconstructed as a general inline/call-role provenance behavior rather than source spelling.
5. Only after a contribution-safe generalized rule exists, reconstruct it in a clean pinned compiler authoring tree, build/package independently, and repeat the complete fresh validation ladder.
6. Only after fresh reproducibility succeeds may the tracked compiler patch/install path be updated.
7. Then integrate renderer v92 in a detached retail worktree, prove full retail SHA1, apply the identical production seam, update architecture/progress docs, review the contribution diff, and commit/push only if every retail gate is exact.
8. The five-function batch is still not complete even if renderer becomes exact: `vfunc_0C` remains at the typed **0x82 vs 0x84 / 42-diff** frontier.

No commit or push occurred in this continuation.


## October 3, 2026 - full-ROM rejection of PARM_DECL and validated inline-body rule

This is the newest renderer/compiler handoff and supersedes the prior October 3 next-action section where it conflicts.

### PARM_DECL candidate failed the actual full-ROM gate

The previously saved candidate used:
- non-symbol/non-constant indirect call;
- register parameters present;
- `num_actuals > 2`;
- `TREE_CODE(args[0].tree_value) == PARM_DECL`.

Complete validator execution:
`sh_murn68xn_bc4c8efd`

Results:
- terrain exact;
- water exact;
- all established lifecycle/hard targets exact;
- all five SpriteAnimator canaries exact;
- saved corpus **54/54 exact / total diff 0**;
- full source-converted ROM **FAILED SHA1**.

Direct binary comparison against `baserom.gba` localized the entire ROM regression to exactly **5 differing bytes**:
- ROM offsets `0x0A5720..0x0A5725`;
- addresses `0x080A5720..0x080A5725`;
- inside exact `Unk_080A56DC::SetPacked` (`func_080A56DC`).

That function contains:
`ops->func_14(this, arg2, arg3, arg4)`

It is another 4-argument indirect call whose first argument reaches `expand_call` as `PARM_DECL`. Therefore first-argument declaration class was an overfit and is now **CLOSED / REJECTED**.

### Proven compiler-internal discriminator

Temporary front-end tracing compared the renderer getter against the newly exposed ROM regression.

Renderer:
`AGBCC_MULTI_CONTEXT current=GetSpriteRenderData arg0=out same_current=1 context=GetSpriteRenderData inline=1`

SetPacked:
`AGBCC_MULTI_CONTEXT current=SetPacked arg0=this same_current=1 context=SetPacked inline=0`

The relevant distinction is therefore not parameter spelling or DECL context ownership. The renderer indirect call is expanded while compiling the explicit `static inline GetSpriteRenderData` helper, while `SetPacked` is a non-inline function.

Temporary trace code was removed after collecting this evidence.

### Current private generalized candidate

Private source:
`/mnt/waydroid-hdd/home-chester-waydroid/agbcc-renderer-frontdiag-v1/g++/calls.c`

Current SHA-256:
`dd5a68e54be221890344ff493e582cac9d568a2279d996e1bc3070608bec0a37`

The `AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS` branch now delays `prepare_call_address` only when:
- `fndecl == 0`;
- register parameters are present;
- `num_actuals > 2`;
- `current_function_decl && DECL_INLINE(current_function_decl)`;
- target is neither `CONST_INT` nor `SYMBOL_REF`.

The condition is mirrored before and after argument-register loads. It contains no FoMT address, symbol, pseudo ID, UID, hard register, or source argument declaration identity.

Targeted proofs:
- renderer v92 `sh_murne2qw_0ab62bc3`: **0x270 / 0**;
- `func_080A56DC` `sh_murne7wb_a767f246`: **0x84 / 0**.

### Complete validation success

Full established validator:
`sh_murnehak_aee9d9af`

Result:
- terrain exact;
- water exact;
- all lifecycle and other hard targets exact;
- all five SpriteAnimator canaries exact;
- saved 54-module corpus **54/54 exact / total diff 0**;
- source-converted full ROM **`fomt.gba: OK`**;
- validator exit code 0.

This is the first complete regression-ladder and full-ROM success for the renderer call-address scheduling behavior.

Treat the rule as a compatibility reconstruction, not recovered Nintendo compiler fact, until stronger historical evidence exists.

### Production remains untouched

FoMT contribution state remains:
- branch `ches-dev`;
- HEAD `77b459045ec0500b82b185ece77ab1c4dccaecc5`;
- no renderer source/asm/linker integration;
- tracked compatibility patch/package unchanged;
- no commit or push from this research continuation.

The working `fomt.gba` was left exact by the passing full validator.

### Exact next action

1. Start from the pinned clean compiler authority used by compatibility-v5:
   - base commit `1caa6becde5e4676b59c31c74d68f45ced79557c`;
   - existing authority patch `tools/ches/checkpoints/call238/generalized-compiler-candidate-v5.patch`.
2. Reconstruct ONLY the validated inline-body multi-argument indirect-call scheduling behavior on top of that clean v5 authority in a fresh compiler authoring/package tree. Do not copy the dirty diagnostic tree wholesale.
3. Add a package wrapper flag for `AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS=1`.
4. Build the compiler independently from the pinned clean base.
5. Rerun the complete validator from that fresh compiler and require hard targets, five canaries, 54/54 corpus, and `fomt.gba: OK`.
6. Only after fresh reproducibility passes may the tracked compatibility patch/package be updated.
7. Then integrate renderer v92 through a detached retail worktree, prove exact full retail SHA1, apply the identical production seam, update architecture/progress docs, review the contribution diff, and commit/push only if every retail gate is exact.
8. The five-function `UnknownEntityThing` batch is still not complete after renderer adoption. Return to `vfunc_0C`, whose credible typed frontier remains **0x82 vs 0x84 / 42 diffs**.


## October 3, 2026 - clean v6 package reproducibility gate passed

This is the newest compiler handoff and supersedes the prior clean-package next action where it conflicts.

### Clean reconstruction

Fresh authoring tree:
`/mnt/data/Github/agbcc-fomt-inline-authoring-v1`

Base:
`1caa6becde5e4676b59c31c74d68f45ced79557c`

Process:
1. cloned the clean pinned `cp` branch from `/mnt/data/Github/agbcc-fomt-reference`;
2. verified/applied existing `generalized-compiler-candidate-v5.patch`;
3. changed ONLY `g++/calls.c` to add the validated `AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS` inline-body behavior;
4. verified no temporary `AGBCC_TRACE_MULTI_INDIRECT_CONTEXT` hook exists;
5. generated a fresh combined v6 patch from this clean tree.

v6 patch:
`tools/ches/checkpoints/call238/generalized-compiler-candidate-v6.patch`

SHA-256:
`46fc3cf514043e950ecabdf94d4c6e42f74ce440320ff92ef64323697509bfff`

The added behavior is structural:
- `fndecl == 0`;
- register parameters present;
- `num_actuals > 2`;
- `current_function_decl && DECL_INLINE(current_function_decl)`;
- target is neither `CONST_INT` nor `SYMBOL_REF`;
- `prepare_call_address` is delayed until after argument-register loads.

No FoMT address, function name, symbol, pseudo ID, UID, hard-register identity, or source argument declaration class is encoded.

### Fresh private package v6

Package:
`tools/ches/checkpoints/call238/compat-compiler-v6/`

Independent build tree:
`/mnt/data/Github/agbcc-fomt-compat-package-call238-v6`

The v6 wrapper enables the nine established v5 behaviors plus:
`AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS=1`

Precondition checks passed:
- shell syntax for build/wrapper/validator;
- Python regression-script parse;
- v6 patch SHA check;
- clean base HEAD exactly pinned;
- clean base status empty.

Fresh package build:
`sh_murnupcv_3333dddf`
- cloned from the pinned clean base;
- verified/applied the v6 patch;
- configured/built `g++/cc1plus`;
- exit code **0**.

### Independent full validation

Fresh-package validator:
`sh_murnxdav_0c308b04`

Result:
- terrain exact;
- water exact;
- all lifecycle and other hard targets exact;
- all five SpriteAnimator canaries exact;
- `tools/ches/checkpoints/call238/full-flow-regression/package_v6_results.tsv`: **54/54 exact / total diff 0**;
- full source-converted ROM: **`fomt.gba: OK`**;
- validator exit code **0**.

The clean reproducibility gate for the generalized inline-body call scheduling behavior is therefore satisfied.

### Tracked production compiler authority

No tracked compiler adoption mutation has occurred in this continuation.

`docs/FOMT_COMPILER_RESEARCH.md` currently identifies the contribution/build authority as:
- pinned compiler base `1caa6becde5e4676b59c31c74d68f45ced79557c`;
- tracked patch `tools/agbcp_fomt_compat.patch`;
- installer `tools/install_agbcp.sh`;
- current tracked wrapper with nine validated behaviors;
- final no-private-override proof: `make -B -j4 compare`.

Production FoMT renderer/source/asm/linker remain untouched at HEAD:
`77b459045ec0500b82b185ece77ab1c4dccaecc5`

### Exact next action

1. Inspect the exact current tracked patch/installer/wrapper seam.
2. Update tracked compatibility authority with ONLY the v6 inline-body behavior and `AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS=1`.
3. Regenerate/verify tracked patch provenance and any documented SHA.
4. Install/build through the tracked pinned path, not the private v6 build tree.
5. Require plain `make -B -j4 compare` with no private compiler override to end in `fomt.gba: OK`.
6. Only after that tracked adoption gate passes, integrate renderer v92 in an isolated/detached retail worktree and prove full retail SHA1.
7. Apply the identical renderer seam to production, update architecture/progress docs, review explicit contribution diff, and commit/push only if every retail gate remains exact.
8. Then return to unresolved `UnknownEntityThing::vfunc_0C`, currently **0x82 vs 0x84 / 42 diffs**.

No contribution commit or push occurred in this continuation.


## October 3, 2026 - tracked compiler adopted, renderer isolated seam prepared

This is the newest renderer/compiler handoff and supersedes older next actions where they conflict.

### Tracked compiler adoption complete

Production compiler authority was reconstructed from pinned clean base `1caa6becde5e4676b59c31c74d68f45ced79557c` in fresh authoring tree:
`/mnt/data/Github/agbcc-fomt-tracked-v6-authoring`

Tracked patch:
`tools/agbcp_fomt_compat.patch`

Current SHA-256:
`8f75608013b1fee6e20a11fbe7bac26d1e65b92747402415e5f0c9caf628579b`

`tools/install_agbcp.sh` now generates the prior nine compatibility flags plus:
`AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS=1`

The added rule is structural: non-symbol/non-constant indirect target, `fndecl == 0`, register parameters present, `num_actuals > 2`, and `current_function_decl && DECL_INLINE(current_function_decl)`. No FoMT address/name/symbol/pseudo/UID/hard register or first-argument declaration class is encoded.

Tracked production install:
`sh_murpost4_59c54a8d`
PASS, exit 0.

Required default production proof:
`sh_murps4s1_68b7eeb2`
command `make -B -j4 compare`, no `CC1PLUS` override/private compiler.
PASS, `fomt.gba: OK`.

`docs/FOMT_COMPILER_RESEARCH.md` top authority and newest October 3 section were updated with the tenth behavior, patch SHA, installation proof, and plain-ROM proof.

### Detached renderer integration worktree

Created:
`/mnt/data/Github/gba/fomt-renderer-v92-integration`

Detached base:
`77b459045ec0500b82b185ece77ab1c4dccaecc5`

Renderer source authority copied from:
`tools/ches/checkpoints/entity-base-080324BC-2026-10-02/candidate-vfunc10-v92-table-shape.cc`

Isolated production source:
`src/code_entity_08032690.cc`

Only export-name adaptation was made:
`RenderUnknownEntityThingV2` -> `func_08032690`

Source SHA-256:
`41cc940a4bdb5cd4476de919f6d81e43fed20c0c805fb25f525b0ce828259101`

Isolated asm/linker seam:
- removed the complete original 0x270-byte `func_08032690` assembly body from `asm/code_entities_080320DC.s`;
- inserted `.section .text.after_func_08032690, "ax", %progbits` immediately before existing `func_08032900`;
- `fomt.lds` now links:
  1. `asm/code_entities_080320DC.o(.text)`
  2. `src/code_entity_08032690.o(.text)`
  3. `asm/code_entities_080320DC.o(.text.after_func_08032690)`
- copied the exact tracked compiler patch/installer into the worktree.

Current isolated worktree status:
- `M asm/code_entities_080320DC.s`
- `M fomt.lds`
- `M tools/agbcp_fomt_compat.patch`
- `M tools/install_agbcp.sh`
- `?? src/code_entity_08032690.cc`

### Isolated compiler installation finished

Worktree-local pinned-source installer execution:
`sh_murpwp3c_ce89bb6a`

Final:
- FINISHED
- exit code **0**
- duration about 129.6s
- no fatal compiler error

Generated isolated wrapper:
`/mnt/data/Github/gba/fomt-renderer-v92-integration/tools/agbcc/bin/agbcp`

Verified SHA-256:
`4a594705b4d15b59474a366e452e8084859a51f8d35bf9ee140c39f5e9ac8f8a`

Verified it enables all ten flags, including:
`AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS=1`

### Safety checkpoint boundary

The Ches 50-call safety checkpoint arrived while the isolated compiler installer was still in flight. The installer was monitored to completion, but NO isolated ROM build was started after the checkpoint.

Production renderer source/asm/linker remains untouched. Production currently contains only the already-proven tracked compiler patch/installer adoption plus prior intentional working docs/state.

### Exact next action

1. In `/mnt/data/Github/gba/fomt-renderer-v92-integration`, run plain:
   `make -B -j4 compare`
   with no compiler override.
2. Require `fomt.gba: OK`.
3. Explicitly verify the renderer region `0x08032690..0x080328FF` is byte-exact and the next symbol remains at `0x08032900`.
4. If exact, apply the identical three-file renderer seam to production:
   - `src/code_entity_08032690.cc`
   - `asm/code_entities_080320DC.s`
   - `fomt.lds`
5. Run plain production `make -B -j4 compare` again.
6. Update architecture/progress docs and verify progress from build tooling.
7. Review contribution diff explicitly. Do not include private research docs or unrelated pre-existing README/docs dirt.
8. Commit/push the coherent retail renderer/compiler unit only if exact target and full-ROM gates remain satisfied under standing authorization.
9. Then return to `UnknownEntityThing::vfunc_0C`, credible frontier **0x82 vs 0x84 / 42 diffs**.

No renderer commit or push occurred in this turn.


## October 3, 2026 - renderer integrated, committed, pushed; vfunc_0C is sole batch remainder

This is the newest handoff and supersedes the prior renderer-integration next action where it conflicts.

### Renderer integration complete

Detached integration worktree:
`/mnt/data/Github/gba/fomt-renderer-v92-integration`

Initial isolated compare:
`sh_murqi9tj_36529faf`

It failed because the detached worktree did not contain ignored `baserom.gba`; assembler `.incbin` inputs could not resolve. This was not a renderer/compiler regression.

Canonical production baseline was verified first:
`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`

The isolated worktree then received a symlink:
`baserom.gba -> /mnt/data/Github/gba/fomt/baserom.gba`

Corrected isolated plain compare:
`sh_murqiv60_def0d0e6`

Result:
- exit 0;
- no compiler override;
- `fomt.gba: OK`.

Isolated seam proof:
`sh_murqjqll_61c2d661`

Confirmed:
- linked `func_08032690` at `0x08032690`;
- linked `func_08032900` at `0x08032900`;
- `build/src/code_entity_08032690.o` supplies `func_08032690`;
- renderer ROM region `0x08032690..0x080328FF` is exact;
- renderer-region SHA-256 on both rebuilt and retail ROM is `0925803ca6e8fa3c055d67c10348233f540431e5ddb983019e9619f9031d3930`;
- first 16 bytes at next symbol `0x08032900` also match.

### Production integration complete

Applied only the proven renderer seam:
- `src/code_entity_08032690.cc`, SHA-256 `41cc940a4bdb5cd4476de919f6d81e43fed20c0c805fb25f525b0ce828259101`;
- removed original renderer assembly body from `asm/code_entities_080320DC.s` and inserted `.text.after_func_08032690` before `func_08032900`;
- linked `src/code_entity_08032690.o(.text)` between the before/after assembly sections in `fomt.lds`.

Production plain compare:
`sh_murqmxt5_97f7b3e4`

Result:
- exit 0;
- `fomt.gba: OK`.

Production seam proof:
`sh_murqneqt_1fa32ae6`

Confirmed the same exact renderer-region hash and symbol boundaries as the isolated worktree.

### Progress and contribution review

Project-native `make progress` after integration:
`sh_murqohci_47830a39`

Result:
- 940,036 total code bytes;
- 57,192 source bytes = **6.0840%**;
- 882,844 assembly bytes = **93.9160%**;
- `fomt.gba: OK`.

Previous source total was 56,568 bytes, so this integration adds exactly 624 bytes = `0x270`.

Contribution staging explicitly included only five production files:
1. `asm/code_entities_080320DC.s`
2. `fomt.lds`
3. `src/code_entity_08032690.cc`
4. `tools/agbcp_fomt_compat.patch`
5. `tools/install_agbcp.sh`

`git diff --check` and `sh -n tools/install_agbcp.sh` passed before staging. Private `tools/ches` research, untracked no-context docs, and unrelated pre-existing `README.md` dirt were not staged.

### Commit and push

Commit:
`daab719c1324ac0d17e727f5c96b784d021655f3`
subject:
`decompile entity effect renderer`

Commit contains exactly the five files above.

Post-commit proof:
`sh_murqsjxf_9839b759`

Result:
- `fomt.gba: OK`;
- 57,192 / 940,036 = 6.0840% source;
- HEAD `daab719 decompile entity effect renderer`.

Push:
`sh_murqso90_f9a8266e`

Result:
`77b4590..daab719  ches-dev -> ches-dev`

Explicit ref verification:
- HEAD `daab719c1324ac0d17e727f5c96b784d021655f3`;
- `refs/remotes/ches/ches-dev` same exact hash.

### Five-function batch status

Exact:
- ctor1 `080324BC`: 0xA4 / 0;
- ctor2 `08032560`: 0xAC / 0;
- renderer `08032690`: 0x270 / 0, now integrated/committed/pushed;
- deleting destructor `080DC8F8`: 0x34 / 0.

Unresolved:
- `UnknownEntityThing::vfunc_0C` at `0803260C`;
- credible typed v12/v13/v16 frontier: **0x82 vs retail 0x84 / 42 linked differing bytes**.

### Exact next action

Return directly to `UnknownEntityThing::vfunc_0C`.

1. Read only the focused `entity-base-080324BC-2026-10-02` artifacts and failure/experiment entries that apply to `vfunc_0C`.
2. Preserve exact ctor1/ctor2/destructor/renderer conclusions; do not reopen renderer/compiler families already closed.
3. Re-establish the exact retail `0x84` disassembly and current typed `0x82/42` candidate diff.
4. Classify the remaining mismatch by instruction/RTL/source role before trying syntax changes.
5. Prefer a source-level explanation. Only consider compiler behavior if evidence demonstrates a structural generalized rule and run the full regression ladder for any compiler change.
6. Once `vfunc_0C` reaches 0x84 / 0, integrate the remaining coherent batch according to the standing exactness/commit rules.



## October 3, 2026 - vfunc_0C CSE cause confirmed; first structural discriminator rejected

This is the newest vfunc_0C handoff and supersedes the prior generic next action where it conflicts.

### Confirmed causal pass behavior

The current credible typed v12/v13/v16 source family remains **0x82 vs retail 0x84 / 42 linked differing bytes**.

Clean retail/candidate disassembly confirms the first meaningful divergence is the second-effect reset-store zero:
- retail keeps `clear_mode` zero in its own long-lived register and emits a fresh `movs r0, #0` before storing `reset_update = 0`;
- the candidate reuses the low byte of the long-lived `clear_mode` zero, eliminating that 2-byte move;
- downstream allocation then rotates mode / mode-pointer / clear-mode registers because the clear-mode pseudo gains another reference.

Saved RTL/CSE evidence confirms first CSE performs this rewrite:
an independent QImode `CONST_INT 0` source becomes a low-part SUBREG of the wider SImode zero-valued register.

The generic compiler mechanism is in `g++/cse.c` in the block documented as:
"See if we have a CONST_INT that is already in a register in a wider mode."
It looks up the same constant in a wider mode and uses `gen_lowpart_if_possible` on a same-value register.

### Private diagnostic experiment v17

Fresh diagnostic compiler tree:
`/mnt/data/Github/agbcc-fomt-vfunc0c-cse-diag-v1`

Base:
`1caa6becde5e4676b59c31c74d68f45ced79557c`

Current tracked FoMT compatibility patch applied first:
`8f75608013b1fee6e20a11fbe7bac26d1e65b92747402415e5f0c9caf628579b`

Private-only change in `g++/cse.c`:
under env flag `AGBCC_CSE_AVOID_USERVAR_NARROW_CONST_REUSE`, skip a wider same-value register when `REG_USERVAR_P (const_elt->exp)` is true.

Compiler build:
`sh_murr1duy_adaa2c14`
Result: exit 0.

Target compare used all ten established compatibility flags plus the new private flag:
`sh_murr52r0_e7098259`

Candidate:
`candidate-vfunc0c-v13-bool-reset.cc`
symbol:
`UpdateUnknownEntityThingTyped`
range:
`0x0803260C..0x0803268F`

Result:
**expected 0x84, actual 0x82, 42 linked differing bytes**.

Therefore the `REG_USERVAR_P` discriminator is **REJECTED / INEFFECTIVE**. Do not promote it and do not spend time validating it against the wider corpus.

### Exact next action

1. Instrument or otherwise inspect only the wider-mode CONST_INT same-value lookup in private `g++/cse.c`.
2. For the reset-store decision, record the candidate same-value REG entries and structural metadata needed to explain why the reused zero survives the `REG_USERVAR_P` filter.
3. Establish whether:
   - the chosen wider zero register has `REG_USERVAR_P == 0`, or
   - another equivalent zero register is selected after the user-var candidate is skipped.
4. Compare that structural metadata against unaffected narrow constant stores in the saved exact corpus before proposing another rule.
5. Keep all compiler changes private/diagnostic until a general structural predicate is evidenced.
6. Do not return to source-syntax variants: v12/v13/v16 already converge to the same first-CSE shape.
