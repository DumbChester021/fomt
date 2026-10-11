# Legacy save loader 08011650 — October 4, 2026

**Current-priority correction, October 11:** The October 5 PAUSED label below is a **historical decision**, superseded by the user's October 10 save-first requirement. The loader is active again, but the 100+ already-tried compiler/source variants remain closed unless new ABI or type evidence justifies reopening them. Read `START_HERE.md`, `docs/SAVE_EVIDENCE_MATRIX.md` and `tools/ches/NEXT_AGENT_HANDOFF.md` for the live priority. This archive is retained as-is after this banner to prevent rediscovery.

## October 11: paired clock control closes the small zero oracle

This supersedes the small-oracle discriminator task below. Under current
production agbcp SHA256
`b2386033eccfad537c7efb04264b1c4d3e00fafaeb340004a0a5d916a4bc0117`,
the archived v96 still emits **740/495** and the full constructor diagnostic
**744/630** (bytes/differences). Both retain r10/r6 bindings and are
diagnostics, not promotable natural source.

The small constructor oracle's unsigned `time &= 0xF81F` creates a
**HImode zero, reg47 at RTL insn74**. First CSE redirects all three string
stores to its low byte; the first-fill scalar still uses SImode zero reg23.
The source `string_zero` variable itself does not survive independently.
Replacing that clock operation with the retail signed halfword form,
`*reinterpret_cast<i16 *>(&time) &= -2017`, leaves only SImode zero reg23:
strings and first fill merge again. Thus the old topology depended on the
non-retail clock lowering, not a demonstrated transferable lifetime boundary.
Do not reopen it with compiler zero-preservation hooks.

Removing both forced register bindings from v96 gives **748/653**.
Using real `FixedStr<15>` members for the three recovered name slots gives
the identical 748/653 binary (SHA256
`6a70e25783bc46b7dbfefa9848a261130b5648e8116884613645aee05e56de0c`).
That member-accessor family is closed. The loader stays ASM.

The productive adjacent result is the exact 68-byte saved-buffer constructor,
using the real Location member constructor. Its source and proof are in
`src/save_byte_buffer.cc` and `docs/SAVED_BYTE_BUFFER.md`. Future loader
work needs real constructor/member initialization evidence without forced
registers. Private frozen inputs/pass dumps are indexed in AGENTS.local.md.

## PAUSED by expansion-enablement pivot - October 5, 2026

This exact-match frontier is intentionally paused. The user chose to prioritize higher-throughput non-save systems needed for custom NPCs/bachelorettes, items/tools, crops, dialogue/events and assets. All findings below remain valid research and must be reused if persistence work resumes. Do not treat any older 'exact next action' in this file as the live project priority.

Live continuation is in `START_HERE.md`, `docs/CUSTOM_GAME_EXPANSION.md`, and `tools/ches/NEXT_AGENT_HANDOFF.md`.

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

## AUTHORITATIVE LATEST CONTINUATION - v96 source midpoint / first-fill CSE frontier

This section supersedes every older loader next-action section below.

- Production remains unchanged at `9078f36`. All work in this section is private loader/compiler diagnosis only.
- **v96/v97 are the strongest source-level allocation oracle found so far.** Starting from v83, change exactly one of the two initial 32-bit header zero stores to literal `0` while leaving the other on source variable `zero`. v96 and v97 are byte-identical: **0x2E8 / 597 differing linked bytes**.
- v96 naturally recovers the critical retail high-register relationship with no forced register: source old-zero pseudo27 is **4 refs / live 178 / 7 calls and allocates r9**; shared GameDate `-125` mask pseudo44 is **3 refs / live 58 / 2 calls and allocates r8**.
- v96 also naturally gets the high-to-low header-byte bridge and the later full-width state store: early `mov r9,r0`, then a low-register copy from r9 for `header[8]`, and `state_21cc+4` from r9. Low scratch identities still differ from retail (candidate header base r2 / bridge r1 versus retail header base r1 / bridge r2).
- v96's one remaining zero-identity defect is the dead first-fill const-reference scalar. Retail writes old zero r9 once to `[sp+4]` and then uses a fresh immediate zero inside the 8-byte fill loop. v96 instead writes r5 to `[sp+4]`. The three string clears correctly use separate string-zero r5.
- Pass comparison proves the first-fill difference is **first CSE, not expansion**. Both v83 and v96 initially expand a fresh SImode zero temp immediately before the const-reference stack store. First CSE rewrites v83's fresh temp to pseudo27, but rewrites v96's fresh temp to compiler temp33.
- v96 temp33 is created by the one literal initial word-zero store. CSE trace shows the fill-zero equivalence class as `C0, R33`. v83 has no corresponding ordinary hash-table zero class at that point yet resolves the scalar to pseudo27. This is the exact active CSE frontier.
- Trace-only private compiler hooks added this turn:
  - `AGBCC_TRACE_EQUIV_MODE` in `g++/reload.c` proved v90's header QI reload first sees a recent SImode r0 zero and rejects it on SI/QI mode mismatch. This reload path is no longer the primary frontier after v96.
  - `AGBCC_TRACE_ZERO_EQV_HEAD` in `g++/cse.c` records zero quantity head changes.
  - `AGBCC_TRACE_ZERO_TRIAL_CLASS` in `g++/cse.c` records the structural zero trial class for fresh const-reference scalar temps.
  These are trace-only and private.
- v98 changes v96's first fill argument directly to source `zero`. It is **0x2DC / 566** but spills/extends the zero through the loop and destroys the solved r9 lifetime. Closed, consistent with older v86.
- v99/v100 test previously untried const first-fill copies (`const int` / `const unsigned int`). They are byte-identical at **0x2E0 / 411**. They correctly seed `[sp+4]` from the old zero while allowing the loop to use immediate zero, but add too much old-zero allocation weight: pseudo27 becomes **6 refs / live 208 / 7 calls and takes r8**, while mask pseudo44 remains **3 refs / live 58 and falls to r9**. Closed as source candidates.
- `AGBCC_PRESERVE_SOURCE_NARROW_ZERO=1` alone on v96 gives **0x2E4 / 495**, but collapses old zero and string zero into r8 and pushes the mask to r9. Combined with distinct-zero it is back to v96 **0x2E8 / 597**. The source-narrow rule does not solve the required two-zero split.
- A first private structural diagnostic `AGBCC_REUSE_RECENT_FULLWIDTH_ZERO_CONSTREF=1` attempted to make the fresh const-reference zero reuse a recent full-width source-user zero. Under v96 + distinct-zero it is **byte-identical to v96** and does not change `[sp+4] = r5`. The predicate did not intercept the actual first-CSE substitution path. Do not widen it blindly.
- **Allocator boundary is now directly measured:** v96 at pseudo27 4 refs/live178 gives r9 with mask r8; v99/v100 at pseudo27 6 refs/live208 gives r8 with mask r9. The likely desired middle behavior is one CSE-added semantic use for the dead scalar without the extra source-local/reference lifetime, but that 5-ref state has not yet been produced and must not be asserted as proven.
- **Exact next action:** trace the first-CSE processing of the fresh fill-zero SET itself in v83 versus v96, including `src`, `src_const`, `src_eqv_here`, `src_related`, selected trial, and relevant quantity/`qty_const` state. Determine the exact non-hash path by which v83 selects pseudo27 while v96 selects R33. Only then test a private structural diagnostic that reproduces that v83 path on v96. Do not add another source alias/copy, do not force registers, do not change production compiler, and do not broaden the recent-fullwidth rule without trace evidence.

## AUTHORITATIVE LATEST CONTINUATION - v89-v95 / zero-family bridge isolated

This section supersedes every older loader next-action section below.

- Production remains unchanged at `9078f36`. All candidates and compiler probes below are private loader research only.
- v83 remains the natural semantic oracle under `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO=1`: source old-zero pseudo27 owns `state_21cc+4` and dead first-fill `[sp+4]`; separate string-zero pseudo78 owns all three byte clears. Its allocation defect is old zero r8 / shared `-125` GameDate mask r9 instead of retail old zero r9 / mask r8.
- Retail early code is now pinned instruction-by-instruction: `mov r9,r0` after the initial zero materialization, two 32-bit stores from r0, `mov r2,r9; strb r2,[header,#8]`, then shared `-125` mask loaded into r8 and reused at the second GameDate clear. Retail keeps short `header=bytes+8` in r1.
- Local allocator evidence: v83 pseudo27 is 6 refs / live 198 / 7 calls; mask pseudo43 is 3 refs / live 58 / 2 calls. They conflict. Local allocation priority lets pseudo27 win the first viable callee-saved register r8; mask then gets r9. The mask's 58-insn lifetime is legitimate because the same `-125` value spans both packed GameDate day clears and two intervening calls. Keep the shared-mask semantics.
- v89, explicit named `clear_date_bits=-125` reused at both date sites, is **0x2E0 / 409** and keeps old-zero r8 / mask r9. Closed.
- **v90 is the key causal probe.** It changes only the first two 32-bit header zero stores from source `zero` to literal `0`. Result is **0x2E8 / 598**, but early coloring becomes retail-like: a compiler-generated zero quantity goes to r9 and the shared `-125` mask goes to r8.
- Important correction: v90's early r9 zero is **not** source pseudo27. Pass dumps show compiler temp pseudo33 (4 refs / live 198 / 7 calls) gets r9. Source pseudo27 drops to 3 refs / live 178 / 7 calls and is not allocated. Pseudo33 owns the two initial word-zero stores plus the dead first-fill `[sp+4]` scalar. Source pseudo27 owns `header[8]` plus `state_21cc+4`.
- The `header[8]` dependency on pseudo27 survives first CSE, loop, flow, combine, and local allocation as a QI subreg. It is lost only in global/reload. Because pseudo27 has no hard home and is constant-equivalent to zero, reload creates a fresh low QI zero and stores that instead. v90 therefore has `mov r9,r0` early but later `state_21cc+4` incorrectly uses r5/string-zero; only dead `[sp+4]` uses r9.
- `AGBCC_PRESERVE_SOURCE_NARROW_ZERO=1` combined with the distinct-zero diagnostic is byte-identical to v90. CSE is therefore closed for this late substitution.
- v91/v93 SImode aliases of `zero` for the header byte are both **0x2E0 / 409**; v92 QImode alias is **0x2E8 / 598**. All three aliases raise/coalesce the source-zero quantity enough to restore old-zero r8 / mask r9. Trivial alias/copy spellings are closed.
- v94 adds a redundant `zero=0` before the byte store to test multi-set/equivalence behavior. It is **0x2E8 / 598** and also reverts old-zero r8 / mask r9. Closed.
- v95 changes both missing old-zero sites (`header[8]` and `state_21cc+4`) to literal `0`, attempting to merge them into the compiler zero family. It is **0x2E8 / 598** and again makes the zero family win r8, with mask r9. A fully merged literal-zero family is closed.
- The source/RTL frontier is therefore a **two-zero-family bridge problem**. Retail needs the low-reference long-lived compiler zero family to win r9 (as v90 proves), while the source-zero semantic sites must read that same r9 value without being merged early enough to increase allocation priority. The header byte specifically needs the retail bridge `mov low,r9; strb low`.
- Local allocation `combine_regs` was inspected. Straight pseudo aliases can be tied/coalesced or add reference weight, explaining why v91-v94 perturb allocation. Do not retry simple aliases, redundant assignments, or full literal merging.
- Anti-rediscovery search found no existing compiler rule for this exact case. The tracked integrated narrow-zero rule is CSE-only. No previous experiment covers an unallocated constant-equivalent source pseudo whose value is simultaneously resident in an allocated same-value SImode hard register and then needed through a narrow QI use.
- **Exact next action:** stay read-only first. Instrument/trace reload around v90 insn50 (`header[8]`) and the later `state_21cc+4` store to determine whether `find_equiv_reg` can see pseudo33/r9 as a live zero equivalent before constant rematerialization wins. If r9 is visible but skipped, make only a private env-gated structural diagnostic that prefers an already-live allocated same-value hard register over rematerializing a constant-equivalent unallocated pseudo for the reload, then measure v90. No pseudo IDs, UIDs, function names, addresses, fixed registers, padding, or production compiler changes. Preserve v83/v90 as semantic/allocation oracles.

## AUTHORITATIVE LATEST CONTINUATION - reload trace, v88, and v83 natural-zero pivot

This section supersedes every older loader next-action section below.

- Production remains unchanged at `9078f36`. The tracked compiler/source/linker/retail ROM authority are untouched; all work here is private loader/compiler diagnosis.
- Reload tracing is now exact. Private compiler `/mnt/data/Github/agbcc-fomt-loader-zero-diag-v1` has trace-only `AGBCC_TRACE_CONST_RELOAD=1` instrumentation in `g++/reload1.c`; trace-enabled and trace-disabled generated assembly was verified byte-identical.
- The v85 Dog regression is created inside reload, not source/CSE/local allocation. For constant `0x1C70`, normal v85 has spill pool `[r0,r1,r3,r4]` with cursor after slot1 and selects r3. With `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO=1`, the pool is `[r0,r1,r2,r4]` with cursor after slot2 and selects r4. r1/r2 are valid; r4 wins only from round-robin spill order. Keeping `0x1C70` in r4 enables later `r4 + 0x5C = 0x1CCC`, deleting the retail literal.
- Same v85 source with the zero diagnostic OFF returns to the normal spill state. Therefore `state_21cc+4 = zero` is not the Dog regression source; the private `src_volatile` zero rule alone causes the spill-pool change.
- The first spill-pool divergence is later uid967, not the earlier Dog call. Pseudo267 is globally allocated to r9 in BOTH builds. Reload must construct `sp+12` in a low scratch then move it to r9: normal chooses r3; diagnostic chooses r2. That later scratch reservation changes the function-wide spill pool and reaches backward into the Dog reload.
- Root cause of that r3/r2 swap is now localized. Pseudo112 (`state_21cc` pointer) and pseudo135 (first-fill loop zero/temp family) conflict. Normal v85 has pseudo112 live length 32 and allocator order `...112,135...`, giving 112->r2 and 135->r3. Under the blunt diagnostic, pseudo112 becomes live length 33 and order flips to `...135,112...`, giving 135->r2 and 112->r3.
- The one-instruction live-length increase is exactly the fresh first-fill zero pseudo131 created by the blunt diagnostic. Normal collapsed code reuses the coalesced zero for the dead first-fill scalar; diagnostic code separates string zero correctly but emits fresh `zero -> pseudo131 -> [sp+4]`. Retail instead wants the old long-lived zero for `[sp+4]`.
- A second private diagnostic, `AGBCC_PRESERVE_SOURCE_NARROW_ZERO=1`, was added to `g++/cse.c`. It leaves SImode zero equivalence bookkeeping intact and guards only narrow QI canonicalization/equivalent-source paths, modeled after the tracked integrated narrow-zero compatibility rule. This is diagnostic only.
- v88 = candidate-v85 under only `AGBCC_PRESERVE_SOURCE_NARROW_ZERO=1`: **0x2E4 / 309 differing linked bytes**. Exact size returns without padding, but not for the desired reason: `0x1CCC` is still derived as `r4+0x5C`; an extra `0x21D4` literal restores total size. CSE keeps source `string_zero` itself and it reaches r5, but folds the three QI stores to literal byte zero; the dead `[sp+4]` scalar then reuses r5. v88 is causal evidence, not a candidate.
- **Decisive pivot:** v83 already has the exact logical zero relationship retail needs under the original distinct-zero diagnostic while using a natural ordinary early zero. First CSE shows early zero pseudo27 used for `state_21cc+4` AND the dead first-fill scalar; separate string-zero pseudo78 owns all three QI clears. This proves the hard-r9 binding in v85 is the reason the old zero cannot naturally survive the desired equivalence path.
- v83's remaining zero-family allocation defect is clean: pseudo27 is allocated r8 while the `-125` date-mask temporary takes r9. Retail wants old zero r9 and date-mask temporary r8. Do not solve this with fixed-register source or a broad allocator rule.
- **Exact next action:** pivot to v83 as the natural semantic oracle. Read-only identify the `-125` date-mask pseudo, its allocation priority/preferences/conflicts versus pseudo27, and the source operation that gives it ownership of r9. Seek a natural source-order/type spelling that makes the old zero win r9 and the date-mask value use r8 while preserving v83's proven old-zero/string-zero/first-fill relationship. Do not add more v85-specific compiler exceptions, force registers, add padding/volatile, or promote either private diagnostic rule.

## AUTHORITATIVE LATEST CONTINUATION - v81-v86 / first-CSE zero split isolated

This section supersedes every older loader next-action section below.

- Production remains unchanged at `9078f36`. The tracked 13-rule compiler, production source/asm/linker, retail SHA1, and source progress are unchanged. All new work in this section is private loader/compiler diagnosis.
- **`candidate-v75.cc` remains the production-toolchain whole-function authority at exact 0x2E4 / 220 differing linked bytes.** Its closed post-pool path remains untouched.
- The required retail zero model is now proven instruction-by-instruction. Retail keeps an old full-width zero in r9 for header initialization, `state_21cc+4`, and the dead first-fill const-reference stack scalar. A distinct later byte/string zero lives in r5 for the three string clears, then r5 is reused as `sp+8`. The fill loop itself writes immediate zero.
- The v80 regression was localized. v80 keeps a literal-derived `0x21F0` address alive in r3 across the string/fill transition, while retail clobbers r3 with the old r9 zero and derives the first-fill base through the other string-address chain. v81 pointer ancestry and v82 `0u` are both **0x2E4 / 446 and byte-identical to v80**. Close both spellings.
- Baseline RTL/CSE proves expansion creates an independent first-fill zero temporary, but first CSE canonicalizes equal zero values. In v70, expansion has separate early `zero` and later `string_zero` source variables; first CSE deletes the later `string_zero = 0` identity and substitutes the early zero everywhere. This is the exact pass where the retail two-zero model is lost.
- Private diagnostic compiler: `/mnt/data/Github/agbcc-fomt-loader-zero-diag-v1`, pinned base `1caa6becde5e4676b59c31c74d68f45ced79557c` plus the tracked 13-rule patch. Production compiler inputs are untouched. The opt-in flag is `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO=1`.
- The current private rule is structural and diagnostic only: preserve a source-level SImode zero from first-CSE folding when that pseudo is later consumed through QImode/byte SUBREG views. It contains no FoMT address, function, pseudo number, or hard-register identity. Do **not** promote it yet.
- v70 under the diagnostic proved causality but was globally poor: **0x2EC / 607**. It preserved two zero identities naturally, with the string zero in r5 and the older zero separately in r8.
- v83 transplanted the natural two-zero source relation onto the mature v75 family while removing the hard-r9 source binding. Under the diagnostic it is **0x2E8 / 598**. Pass dumps prove old zero pseudo27 -> r8, string zero pseudo78 -> r5, while the -125 date-mask temporary takes r9. Retail wants old zero r9 and the mask r8.
- The normal v75 control proves that hard-r9 old-zero ownership already gives the date mask retail r8. Therefore the r8/r9 swap seen in v83 is a source/allocation consequence of removing the established old-zero binding, not a reason for another allocator rule.
- v84 replaced only the header GameDate bitfield setters with the older scalar `header_date_bits` spelling. Under the diagnostic it regresses to **0x2E8 / 621**. Keep only the source-order evidence; reject it as the mature answer.
- Applying the byte-zero diagnostic directly to unchanged v75 gives **0x2DC / 485**. It separates the string zero, but because v75 still writes `state_21cc+4 = 0`, that field uses a fresh zero instead of r9.
- **v85 is the strongest new causal diagnostic:** it is v75 plus only `state_21cc+4 = zero`, under the private byte-zero rule. Result **0x2E0 / 408**. It now gets the important split through the string block: `state_21cc+4` uses r9 and all three string clears use r5. It is four bytes short and is not a production candidate.
- v86 additionally passes the old `zero` to the first `fill_n_inl`. It regresses to **0x2D8 / 593**. Reject direct source reuse of the hard-r9 zero as the fill argument.
- The required read-only retail/v75/v85 size, call-boundary, and literal-pool comparison is complete. Normal v75 contains both `0x1CCC` and `0x21F0` literal words. Unchanged v75 under the private byte-zero rule loses both words and shrinks by 8 bytes. v85 restores `0x21F0` but still loses `0x1CCC`, so **v85's entire four-byte size deficit is exactly the missing `0x1CCC` literal word**.
- Pass-level cause is localized. Normal v75 materializes Dog offset `0x1C70` in a caller-clobbered register and later materializes `0x1CCC` independently. Under the diagnostic, the same Dog offset survives in callee-saved `r4`; after the Dog/helper calls GCC emits `add r4, #0x5C` and reuses it as `0x1CCC`, deleting the literal. Retail does not do this: its sequence uses independent scratch values `0x1C70 -> r1`, `0x1CA0 -> r2`, `0x1CCC -> r3`.
- Sister initializer `func_08010358` independently confirms the architectural relationship. It loads `0x1C70` for Dog construction and later loads `0x1CCC` as a separate literal after the intervening helper call; it does not derive `0x1CCC` from the Dog offset. This makes v85's `r4 + 0x5C` reuse a compatibility-compiler allocation/rematerialization artifact rather than supported original source structure.
- v87 tests the only narrow source-semantic Dog-pointer spelling justified by this finding: a named ordinary `u8 *dog = bytes + 0x1C70` passed to `DogCtor`. Under the private diagnostic its linked binary is **byte-identical to v85: 0x2E0 / 408**. The compiler canonicalizes the pointer spelling away; v87 is closed.
- First-CSE bookkeeping is now better bounded. The distinct `string_zero` pseudo in v85 has 4 refs and a 72-insn live range, which is consistent with its definition plus three byte clears; do not try to restore the incorrect normal-v75 6-ref coalesced family. The remaining issue is the later hard-register/rematerialization choice for the one-use Dog offset.
- Existing tracked `AGBCC_PRESERVE_INTEGRATED_NARROW_ZERO` work is relevant precedent: the successful production rule guards narrow-zero wider lookup/canonicalization/equivalent-source selection instead of globally marking a source zero volatile. The loader's current `src_volatile` diagnostic remains proof-only because it perturbs allocation outside the target zero relationship.
- **Exact next action:** keep normal v75 as production-toolchain authority and v85 as the causal oracle. Read-only trace the reload/global-allocation decision that rematerializes the one-use `0x1C70` Dog-call offset into callee-saved `r4` under v85. Compare it with retail's caller-clobbered scratch sequence and sister `func_08010358`. Any next compiler experiment must be diagnostic-only and structurally prefer a caller-clobbered scratch for a one-use constant-derived call argument without naming this function, offset, pseudo, UID, or hard register. Do not force r1/r2/r3/r4 in source, add padding/volatile, retry v87, or promote the current private rule without a narrow discriminator plus the full regression ladder.

## AUTHORITATIVE LATEST CONTINUATION - v76-v80

This section supersedes every older loader next-action section below.

- **v75 remains the verified whole-function best: exact 0x2E4 / 220 differing linked bytes.** Its post-pool executable path at `080118D8..0801192F` and final `08011930` literal remain exact.
- Read-only sister comparison clarified the first-zero relationship: the old zero is one logical value reused for `state_21cc+4` and the dead first-fill stack scalar, while a distinct zero owns the three string clears. This exact combined lifetime had not previously been tested.
- v76 expresses that first zero as one ordinary long-lived source value used by early header initialization, `state_21cc+4`, and the first fill. Result **0x2E0 / 607**. Reject. Natural allocation does not recover retail r9.
- v77 keeps the proven early hard-r9 scaffold but creates one ordinary semantic alias and uses that alias for both `state_21cc+4` and the first fill. Result **0x2D8 / 659**. Reject. The alias creates the wrong lifetime/allocation family.
- Copy helper `func_08094844` and game-state copy logic prove a real narrow boundary at `+21CC/+21D0`: two adjacent u32 fields are handled together before byte arrays begin at `+21D4`.
- v78 models only that narrow 8-byte head with an inline initializer taking the first u32 and zeroing the second. Result **0x2E4 / 220** and is byte-for-byte identical to v75. Retain the type evidence; the helper is codegen-neutral and does not solve the zero split.
- v79 changes only `u8 string_zero` to plain `char` to test whether byte signedness separates the string-zero pseudo from 32-bit zero temporaries. Result **0x2E4 / 220**, byte-for-byte identical to v75. Close string-zero signedness.
- v80 transplants the earlier locally-useful v57 Location source fact, naming `map_none = 0x234`, onto v75. Result **0x2E4 / 446**. It improves Location from 55 to 54 differing bytes and the following string band from 45 to 33, while preserving the post-pool path exact, but destroys the fill/pointer lifetime: fills 22 -> 66, flags 2 -> 52, records 25 -> 112. Diagnostic only.
- Therefore the next useful problem is not another zero spelling. It is the **Location-to-fill register handoff**: v80 proves better local Location/string ownership is possible, but one live value crossing into the fill setup displaces the v75-good `r5 -> sp+8`, `r4 = state+2C48`, `r8 = state+2C4A` allocation.

### Exact next action

Resume from **candidate-v75.cc**. Before creating another candidate, perform a read-only side-by-side of retail vs v75 vs v80 over `080116DE..0801177C`. Identify the exact register/value that remains live in v80 across the string-clear to fill transition and causes the first divergence from v75's good fill allocation. The next candidate must alter only that source lifetime while preserving v80's local Location/string gain and v75's second-fill/pointer roles. Do not retry v76-v79, explicit late hard-r9 reuse, string-zero type changes, narrow-head helpers, or compiler changes.

## Superseded continuation - v71-v75

This section supersedes every older loader next-action section below.

- Production remains unchanged at `9078f36`; all v71-v75 work is private checkpoint research.
- The read-only v69 size audit localized its entire +4-byte excess to one extra literal-pool word, `0x000021F0`. There is no extra instruction block before the first pool. Because that word expands the pool, the otherwise-correct save/read code after it shifts by four bytes.
- v71 changes only the middle string store to `state_21cc[0x24]`. v72 uses a named/mutable-looking `0x21E0` offset for all three strings. Both compile byte-for-byte like v69 at **0x2E8 / 340**. Close simple address-expression spelling as a way to remove the `0x21F0` literal.
- v60 supplies the key pool-size control: it also carries `0x21F0`, but stays 0x2E4 because it omits a separate `0x2C4C` literal and derives that address from a live neighboring offset.
- v73 tests that principle by carrying a mutable `0x2C1C` offset through the flags block and adding 0x30 for the record array. Result **0x2E4 / 231**. It restores exact total size and exact executable code at `080118D8..08011933`, but keeping that offset live worsens the flags allocation. Diagnostic only.
- Sister initializer `func_08010358` confirms retail itself does **not** use v73's record derivation. It has the same desired `0x21CC/+0x24`, `0x21E0/+0x20` string-address lifetimes as the loader while also retaining a separate `0x2C4C` literal.
- v74 explicitly mirrors those sister offset mutations in source. Old GCC canonicalizes it into a bad **0x2E0 / 550** family. Reject this source spelling.
- **v75 is the new verified whole-function best: exact 0x2E4 / 220 differing linked bytes.** It is v69 with only the record-array base changed from `bytes + 0x2C4C` to the natural relation `state_2c48 + 4`. Candidate SHA-256: `eef1f00a61b235c303bd2997e91860c225d8be49328c7bd7d0e8fbfac3c6e3c3`.
- v75 region counts are: prologue/header 21, Farm/Farmer/Dog 34, Location 55, +21CC/strings 45, fills/setup 22, 2C flags **2**, record/subobjects 25. This beats v56's 226 globally and materially improves the +21CC/fill/flags frontier.
- v75 tail integrity is strong: `080118D8..0801192F` executable code is **0 differences** and final `08011930` literal is exact. The remaining late differences are 3 pre-pool instruction bytes plus 16 literal-pool bytes. The pool has the retail word count, but v75 substitutes `0x21F0` for retail's `0x2C4C`, shifting seven pool entries until both layouts realign at `0x2C74`.
- The still-causal zero mismatch is unchanged: retail uses the older r9-backed zero for `state_21cc+4` and the dead `[sp+4]` scalar while r5 independently owns all three string clears and is then reused as `sp+8`. v75 still lets r5 own those two earlier zero stores. Prior explicit late r9 use is already rejected and must not be retried.

### Exact next action

Use **candidate-v75.cc** as the current whole-function baseline. Do not touch the exact post-pool save/read code and do not retry v71-v74, explicit late hard-r9 reuse, placement construction, constructor helpers, or compiler changes. Before creating v76, perform a read-only lifetime comparison of the two zero births and their call crossings in retail loader vs sister `func_08010358`, with emphasis on what natural source operation keeps the first zero alive through `field_04` / dead `[sp+4]` while creating a separate string zero. The next candidate must be justified by that source-semantic fact, not by register forcing.

## Superseded continuation - v64-v70

This section supersedes older loader `Exact next action` text below.

- **v56 remains the verified whole-function best: exact 0x2E4 / 226 differing bytes.** Save/read tail `08011825..08011933` is still fully byte-exact and closed.
- v64 tests real placement construction `new (bytes + 0x1CCC) Location(MAP_NONE, 0, 0)`: **0x2E8 / 604**. The constructor body inlines, but GCC inserts a null guard for the placement-new result. Retail has no guard. Close placement-new.
- v65 tests one tiny inline 3-argument constructor-body helper: **0x2EC / 594**. It inlines, but the two zero arguments create an extra zero identity (`r8=0`) that retail does not have. Close constructor/helper semantics.
- v66 tests only `field_04 = zero` on mature v56: **0x2F0 / 609**. Even without explicit string_zero, a late source use of the hard r9 variable badly perturbs allocation. Do not force or explicitly reuse hard r9 later.
- Local Git refs/history contain no decompiled `func_08011650` or `func_08010358`. Historical commit `fa18967` only split the same assembly. Upstream `origin/main` is current locally (`b8471ae065744869f64283473ed68372f82321c9` remotely and locally). Public web search for the exact symbols/addresses returned no useful source.
- Sister initializer `func_08010358` gives decisive zero-lifetime evidence. Its first zero is `r5=0` near the early local/date setup and survives constructors/Location to `field_04` and the dead first-fill scalar. Its second zero is `r6=0` before Farm/Farmer/Dog and survives to the three string clears. Therefore retail loader's r9-zero and r5-zero are compiler-selected long-lived constant identities created before the +21CC block, not values born there.
- v67 mirrors that idea with an early `unsigned int string_zero = 0` after header time setup: **0x2EC / 630**. Reject. The second retail zero is not represented by an explicit source local of this form.
- v68 retests the explicit second-fill zero on mature v56: **0x2E0 / 516**, globally bad, but locally very important. It naturally recovers retail fill-role allocation: `r5 = sp+8` for the second-fill value, `r4 = state+0x2C48`, and `r8 = state+0x2C4A`. Keep this allocation fact even though v68 is not a baseline.
- v69 combines v68 with the explicit string-zero lifetime: **0x2E8 / 340**. It is globally non-viable, but improves several initializer regions versus v56 (`+21CC/strings` 49 vs 53 differing bytes, fills/pointer setup 22 vs 27, 2C flags 8 vs 10, record/subobjects 27 vs 30). Locally it gets the desired `r5 string-zero -> r5 sp+8` transition and keeps `r4/r8` pointer roles. Its remaining local error is that `field_04` and `[sp+4]` also use r5 instead of retail's older r9 zero. The +4-byte total size shift then destroys tail byte alignment.
- v70 removes the hard r9 binding and tries an ordinary first zero on the v69 family: **0x2E8 / 597**. Reject. The mature source still needs the earlier hard-r9 scaffold for current best matching.
- `git ls-remote origin refs/heads/main` confirms upstream has not advanced beyond local `origin/main`; there is no missed upstream solution to import.

### Exact next action

Resume with **v56 as the authoritative whole-function baseline** and **v69 only as a local-structure diagnostic**. Before creating any candidate, perform a read-only instruction/literal-pool comparison of retail vs v69 to locate the exact source of v69's +4-byte size excess (instruction vs literal word) and determine where the first post-+21CC alignment shift begins. Also compare call-boundary instruction counts v56/v69/retail. The purpose is to preserve v69's locally-correct `r5 -> sp+8` and `r4/r8` roles while removing only the one extra 4-byte unit. Do not retry placement-new, constructor helper, hard-r9 late use, natural-zero, early string_zero, or broad compiler work. Do not touch the already-exact v56 save/read tail.

## Superseded continuation — v57-v63

This section supersedes older loader `Exact next action` text below.

- **v56 remains the verified best: exact 0x2E4 / 226 differences.** The save/read tail `08011825..08011933` remains completely byte-exact and closed.
- Read-only alignment of retail/v56 over `08011712..0801178C`, plus sister initializer `func_08010358`, confirms three distinct zero identities in retail: the old r9-backed integer zero owns `field_04` and the dead first-fill stack temporary; a separate zero is live across the three string clears; the first 8-byte fill loop itself stores immediate zero. Retail then repurposes r5 as the second-fill stack-value pointer.
- v57 makes `MAP_NONE` an explicit integer before `clear_low_ten`: **0x2E4 / 256**. Locally it fixes the Location pointer/register family (`r1` pointer, `r4` MAP_NONE, `r3` mask), but still loads the mask before the current u16 and does not preload r5=0. Reject globally; retain the local source-order evidence.
- v58 additionally materializes the current packed Location u16 before declaring the mask: **0x2E4 / 455**. It gets the load order but steals the MAP_NONE register and badly perturbs allocation. Reject.
- v59 uses explicit MAP_NONE with literal `-1024` instead of a named mask: **0x2E4 / 397**. It gets pointer/MAP_NONE/u16 order but synthesizes the mask with mov/lsl instead of retail's literal-pool load. Reject.
- v60 combines v57's Location ordering with an explicit `u8 string_zero` created after the map store and reused for the three strings: **0x2E4 / 299**. This is important local evidence: it naturally emits retail's `movs r5,#0` at the Location boundary and improves `+21CC/strings` from 53 differing bytes to 37. However it wrongly uses r5 for `field_04` and `[sp+4]`, then keeps/reuses r5 in the fill/pointer setup, causing major downstream regressions. Do not promote.
- v61 changes only v60 `field_04` to the hard r9 zero: **0x2E8 / 507**. Reject. Hard-forcing that store on the v60 family still destroys whole-function allocation.
- v62 changes only the three string stores from integer `0` to character literal `'\0'`: **0x2E4 / 226**, byte-identical to v56. v63 additionally changes the lvalues to `char *`: **0x2E4 / 226**, also no improvement. String literal/lvalue typing does not create retail's separate zero lifetime.
- The built-in compare `--trace` path was tested on v56. `AGBCC_TRACE_ALLOC=1` still produced an empty allocation log with the tracked compiler, so there is no useful allocator trace available from the current runner. Do not turn this into compiler-tooling work.
- Sibling `/mnt/data/Github/gba/FOMT-DOC` and `/mnt/data/Github/gba/mary` have no direct hits for this US FoMT loader/layout.
- The `0x080947BC..0x080949xx` family confirms the `+0x21CC` cluster is serialized mostly as raw storage, not via a hidden copy constructor: two u32s, byte-backed flags at +21D4/+21DC, then three string-like members copied with `strcpy`.
- Crucial new type evidence from `include/actor.hh`: real `Location` is `PACKED ALIGN(2)` with inline `Location(u32 map, u32 x, u32 y) : map(map), x(x), y(y)`. The two zero constructor arguments provide a plausible natural source for retail's early zero pseudo without an explicit long-lived `string_zero` variable. This is different from rejected v47, which performed three independent field assignments.

### Exact next action

Resume from **candidate-v56.cc**. Test exactly one new constructor-semantic probe for `GameState+0x1CCC`: initialize the real recovered `Location` **in place** with `Location(MAP_NONE, 0, 0)` semantics (prefer a placement/direct-construction form that inlines the existing constructor; if placement syntax is unavailable, use one tiny inline helper with the same three parameters solely as a codegen probe). Do not combine this first probe with any string-zero, hard-r9, typed-calendar, or fill changes. Compare immediately and inspect `080116DE..08011760`. Success evidence is retail-like Location masks plus a naturally preloaded zero that can survive to the string clears without becoming the first-fill integer temporary. If the constructor form fails locally or globally, return to v56 and do not broaden constructor permutations.

## Superseded continuation — v48-v56

This section supersedes older loader `Exact next action` text below.

- v48 diagnostic forces only the short-lived header pointer to r1: **0x2EC / 655**. Reject. The first header-register mismatch is not solved by allocation forcing.
- v49 replaces the typed `GameDate` header access with one integer scalar load/mask/store: **0x2E4 / 435**. Reject; the real `GameDate` bitfield source remains better.
- Read-only comparison of v43 vs v47 over the real `Location` block proves v47 is not locally closer: v43 differs in 55/56 bytes over 080116DC..08011714, v47 in 56/56. Therefore the previously suggested Location constructor/temporary probe is not justified. Keep the semantic `Location` type evidence but the raw v43 spelling as the matching baseline for that block.
- v50 scopes the v44 typed-calendar alias tightly around the calendar writes: **0x2E8 / 330**, byte-equivalent matching family to v44. Lexical scope does not repair the global register-coloring regression.
- v51 uses one single typed `LoaderCalendarHeader *header` for both leading words/year and GameDate/GameTime: **0x2EC / 526**. Reject.
- v52 keeps v43's raw header pointer but uses direct typed cast expressions for date/time with no named calendar alias: **0x2E8 / 330**, same bad family as v44. This confirms the typed calendar operations themselves alter whole-function coloring even without a named alias.
- v53 removes the hard `r9` zero binding and lets zero allocate naturally: **0x2E8 / 594**. Reject. The controlled r9 zero remains justified.
- v43 mismatch density before the save tail: prologue/header 21, Farm/Farmer/Dog 34, Location 51, +21CC/strings 53, fills/pointer setup 27, 2C flags 10, record/subobjects 30. The save/read tail had only 10 bad bytes.
- Exact tail analysis found two independent causes: (1) checksum-read setup had the same four instructions in the wrong order because `stored_checksum` was zeroed before computing `slot+0x34F8`; (2) the time mask literal was emitted as zero-extended `0x0000F81F` instead of retail `0xFFFFF81F`.
- v54 adds a top-level `checksum_offset`, computes it before zeroing `stored_checksum`, and uses signed `-2017` for the time mask. Result **0x2E4 / 228**. It fixes the checksum-read ordering completely; only the two mask-literal bytes remain in the tail.
- v55 gives the time mask an explicit `int clear_time_bits = -2017`: **0x2E4 / 229**. Reject as baseline; it fixes sign extension but perturbs one additional byte elsewhere.
- **v56 is the current verified best: exact 0x2E4 / 226 differences.** It keeps v54's checksum-offset ordering and changes only the time-mask lvalue from `u16 *` to `i16 *`, preserving `&= -2017`. This yields retail `0xFFFFF81F` with no extra pseudo. **The entire save/read tail 08011825..08011933 is now byte-exact: 0 differing bytes.**
- Production remains untouched at `9078f36`; no source/asm/linker/compiler contribution path changed. All v48-v56 work is private checkpoint research.

### Exact next action

Resume from **candidate-v56.cc**. Treat `08011825..08011933` as closed and do not touch the save/read tail again. The densest remaining mismatch is `08011712..08011747` (`+0x21CC` through string clears, 53/54 bytes on the v43-family layout), followed by the Location block. Start with a **read-only instruction alignment of retail vs v56 over 08011712..0801178C**, side-by-side with the sister initializer `func_08010358` lines covering its +21CC/strings/fills sequence. The goal is to recover the source relationship that gives retail three distinct identities there: r9-backed zero for field +4/dead stack scalar, a separate zero for the three strings, and immediate zero for the first fill. Do not retry explicit `string_zero`, hard-r9 field forcing, first-fill-by-reference, flat `State21CC`, typed calendar, Location constructor/temporary, or compiler work. Only create the next candidate after a new source-lifetime fact is identified from that alignment.

## Superseded continuation — v38-v47

This section supersedes older loader `Exact next action` text below.

- v38 explicit `string_zero` from v37: **0x2E8 / 359**. It does recover a long-lived r5 zero, but incorrectly coalesces unrelated zeros into r5 and grows the function. Reject the spelling; retain only the observed retail r5-zero lifetime fact.
- v39 forces `state_21cc+4` through hard r9 zero on top of v38: **0x2EC / 608**. Reject.
- v40 moves the header alias before the hard-register bindings: **0x2E4 / 246**. It does not fix the save_context/state prologue ordering and is worse than v37.
- v41 partial typed calendar-header view from v37: **0x2E8 / 334**. Reject matching spelling; calendar type semantics remain credible.
- v42 coherent scratch `State21CC` POD view: **0x2E4 / 490**. Reject. The original source is not a flat POD spelling of the proven 0x44-byte layout.
- **v43** removes the `void * state -> u8 * bytes` alias by making the first parameter itself `u8 * bytes`. Result **0x2E4 / 236**, current verified best. This naturally fixes the retail prologue ordering exactly: `r0 -> r7` at 0801165C, then save_context spill at 0801165E. Keep v43 as the baseline.
- v44 combines v43 with the typed calendar view: **0x2E8 / 330**. Reject.
- v45 moves `+0x2C48/+0x2C4A` pointer declarations after the second fill: **0x2E0 / 563**. Reject; the compiler no longer reproduces the needed early pointer setup.
- v46 retests explicit `string_zero` on v43: **0x2E8 / 355**. Reject; corrected entry allocation does not make that spelling viable.
- Existing `include/actor.hh` proves `GameState+0x1CCC` is exactly the packed 6-byte `Location` layout (`map:10`, `x:16`, `y:16`) and `MAP_NONE == 0x234`. This is real semantic/type evidence, not a scratch guess.
- v47 replaces only the raw +0x1CCC mask block with `Location` field assignments (`map=MAP_NONE; x=0; y=0`) on v43. Result **0x2E4 / 237**. This verifies exact-size viability and the semantic type, but is one byte worse in global agreement than v43, so do not promote the direct assignment spelling.

### Exact next action

Resume from **candidate-v43.cc** as the verified best baseline. First perform a read-only local comparison of retail vs v43 vs v47 over `080116DE..08011714` to determine exactly which instructions the real `Location` spelling improves or worsens. If v47 is locally closer despite the +1 global regression, test only one narrower source form from the real type, preferably construction/temporary semantics already supported by `Location(u32 map,u32 x,u32 y)`, without changing any other v43 lifetime. If v47 is not locally closer, keep the raw v43 block and move to the next first-divergence region. Do not reopen v38-v46, typed calendar, flat State21CC, compiler research, or fixed-register diagnostics.

## Superseded continuation — v31-v38

This section supersedes older loader `Exact next action` text below.

- v31 removes the cached `State2C4AFlags *` local but is byte-identical to v30: **0x2D0 / 562**. The compiler re-caches the pointer; close this spelling family.
- v32 makes the `GameState+0x3494` loop mask an explicit signed `int clear_low_nibble = -16`. Result **0x2D4 / 558**. Locally this recovers retail's exact `mov #16; neg` mask construction and loop body. Keep this source fact.
- v33 adds `first_zero = zero` and passes it to the first 8-byte fill. Result **0x2E0 / 558**, but the source shape is wrong: it reloads `[sp+4]` inside the fill loop. Retail writes `[sp+4]` once and never reads it; the fill loop uses an immediate zero. Sister initializer `func_08010358` confirms the analogous dead-looking zero local is distinct from the second-fill zero scalar. Do not keep v33's first-fill interpretation.
- The project's current `BitArray` is not the `+0x21D4/+0x21DC` type: its exact Furniture constructor uses 32-bit `stmia` fills, while these GameState regions are initialized bytewise and have direct bit/8 byte consumers.
- v34 attempted a post-read `payload_size` declaration but old GCC rejects the goto crossing its initialization. v35 declares it earlier and assigns after the first read: **0x2D4 / 556**. This is proven useful because it naturally recovers retail's `stored_size -> r4`, compare in r4, payload-read arg4 from r4, and checksum size in r4.
- v36 adds branch-local `u16 const * global_error = &gUnk_03000400` in all three error cases. Result **0x2E0 / 526**. It recovers retail's separate `ldr r2, =gUnk_03000400` setup before the shared error tail. The remaining 4-byte size deficit was exactly one missing literal word: `0x00001CCC`.
- v37 creates the Farmer destination pointer **before** mutating the local `GameDate`, then calls the Farmer constructor through that pointer. Result **0x2E4 / 240**: first candidate with exact retail size and a large mismatch collapse. It reproduces retail's evaluation/lifetime order, ends the stale `0x1BD8` offset lifetime, and restores the missing standalone `0x1CCC` literal. **v37 is the current verified baseline.**
- Focused v37 comparison shows retail frees the old name pointer in r5 after Dog construction, emits `movs r5,#0` at `080116F2`, and keeps that zero live through the three string-slot clears at `GameState+0x21E0/+0x21F0/+0x2200`. v37 instead retains the old r5 value and emits fresh zero temporaries later. This is the next high-confidence lifetime mismatch.
- v38 was created from v37 with a distinct `u8 string_zero`, assigned `0` immediately after the first `+0x1CCC` interaction-state u16 write, and reused for the three string-slot clears. **v38 has NOT been compiled or compared yet because the Ches 50-call checkpoint fired during its creation.**

### Exact next action

Run `compare-function.py` on `candidate-v38.cc` immediately, with the same `0x08011650..0x08011934` range and tracked compiler. Then inspect only `080116E8..08011744`. Success criteria for this probe: retail-like `movs r5,#0` near `080116F2`, r5 retained into the `+21E0/+21F0/+2200` clears, and no regression from v37's exact `0x2E4` size. If v38 fails those local criteria, discard the `string_zero` spelling and resume from verified v37. Do not reopen compiler work, v33 first-fill, or the closed v25-v31 spelling families.

## Superseded continuation — v23-v30

This section supersedes older loader `Exact next action` text below.

- v23 hoisted long-lived `GameState+0x2C48` and `+0x2C4A` pointers from v22. Result **0x2D0 / 511**, the best raw byte-difference count so far. It correctly recovers the early r5/r8 ownership for those pointers, but uses a 0x1C frame because the original early `r9=0` source value remains live too long.
- v24 separates the late load/checksum zero from the early `r9` zero. Result **0x2CC / 557**. This is the current structural baseline: exact **0x18-byte frame**, early r9 zero dies, and r9 is naturally repurposed as the `sp+0x0C` pointer exactly like retail. Keep this lifetime split.
- Call-boundary instruction census against retail shows the remaining size deficit is concentrated, not global: before `func_080114F8` -1 instruction; before `func_08011510` -2; before `func_080A1A48` -1; save/read tail has additional small deficits plus missing duplicate literal ownership.
- v25 explicit second zero scalar before 2C48/2C4A pointers: **0x2D4 / 568**. It does place `[sp+8]=0` before the pointer loads, but pointer setup still precedes second-fill destination/count. v26 explicit second-fill pointer/count: **0x2CC / 560** and still schedules pointer loads before destination/count. These spellings are closed.
- v27 passing the early hard-register zero by const reference to the first fill: **0x2D8 / 652**. Reject. It spills/reloads the reference inside the loop instead of retail's `mov r3,r9; str [sp+4]` handoff.
- v28 removing only the u8 casts from the 2C4A negative masks is byte-identical to v24: **0x2CC / 557**. Compound assignment still folds to unsigned immediates.
- v29 uses one `int` temporary for the 2C4A byte: **0x2D0 / 554**. It recovers signed-mask codegen but derives -17 from -9 with `sub #8`, unlike retail.
- Direct consumer audit proves `GameState+0x2C4A` bits **3,4,5,6,7 are five independently accessed one-bit fields**. Other code explicitly tests bits 3/4/5 and sets/clears bits 6/7.
- v30 uses a scratch one-byte C++ bitfield view for those five fields. Result **0x2D0 / 562**, but its local mask sequence is extremely strong evidence: it reproduces retail exactly from `mov #9; neg` through fresh `mov #17; neg`, then `sub #16`, `sub #32`, `mov #127`, and all ANDs. The only local difference is pointer lifetime: v30 caches the bitfield pointer in r3 and stores through r3, while retail starts with `mov r0,r8`, clobbers r0 as the value, then reloads the pointer with `mov r1,r8` before the store.
- The `+0x21CC` object evidence remains: u32 +0, u32 +4, 8-byte bit storage +8, 4-byte bit storage +0x10, then three 16-byte string slots at +0x14/+0x24/+0x34; next field is +0x44 / GameState+0x2210. Direct consumers treat +0x21D4 and +0x21DC as bit-addressed byte storage; string consumers cap copied payloads around 14 bytes.

### Exact next action

Start from `candidate-v30.cc`. Keep the scratch `State2C4AFlags` layout, but remove the long-lived local `flags` pointer. Perform the five bitfield assignments directly through `reinterpret_cast<State2C4AFlags *>(state_2c4a)` (or an equally non-cached expression) so the compiler cannot preserve a separate pointer pseudo in r3. Compare immediately. Target retail's local pattern: `mov r0,r8; ldrb r1,[r0]`, exact signed mask chain, then `mov r1,r8; strb r0,[r1]`. Do not change the compiler, restore the duplicate early zero lifetime, or reopen v25-v28 spellings. If direct non-cached bitfield access recovers the pointer reload, retain that source fact and return to the remaining size-deficit regions using the call-boundary census.

## AUTHORITATIVE LATEST CONTINUATION — v17-v22

This section supersedes older `Exact next action` text below.

- v17 moved only the `clear_date_bits` declaration after the first date mask: **0x2D4 / 632**. It recovered 4 bytes versus v15 and moved the early mask schedule toward retail.
- v18 used one `u8` scalar for header date bits: **0x2D8 / 626**. It recovered another 4 bytes but inserted byte zero-extension (`lsl/lsr`) before the store.
- v19 changed that scalar to `int`: **0x2D4 / 652**. Local instructions lost the zero-extension but whole-function allocation regressed; reject this type spelling.
- v20 uses the real `GameDate` bitfields at both the header date and Farmer local date, without the rejected whole-calendar-header struct: **0x2DC / 605**. This is retained semantic evidence because it naturally preserves/reuses the -4 and -125 masks across both date sites as retail does.
- v21 combined v10's whole calendar header with the single-base late-use model: **0x2D4 / 659**. Reject; v10's attractive early block depended on the same duplicate-base pressure that made the whole source shape wrong.
- Game-state copy code proves the contiguous `+0x21CC` cluster layout: u32 at +0, u32 at +4, 8 copied bytes at +8, 4 copied bytes at +0x10, then 16-byte strings beginning +0x14/+0x24/+0x34. The next field begins at +0x44 (`GameState+0x2210`).
- v22 starts from v20 and gives the `+0x21CC` cluster one shared base pointer for +0/+4/+8/+0x10 while leaving the three string offsets unchanged: **0x2C8 / 557**. It is too short, but it substantially improves global byte agreement and locally recovers retail's `[ptr+4]` store and `ptr+0x10` second-fill address. Keep this source-shape evidence.
- Retail's corresponding middle block precomputes the future `GameState+0x2C48` and `+0x2C4A` pointers before the 4-byte `+0x21DC` copy, then retains them across `func_080114F8` and `func_0809A8AC`. v22 declares those accesses later, so the compiler omits five early pointer-setup instructions and allocates the stack-zero pointer differently.

### Exact next action

Start from `candidate-v22.cc`. Before `fill_n_inl(state_21cc + 0x10, 4, 0)`, add only two long-lived pointer locals for `bytes + 0x2C48` and `bytes + 0x2C4A`. After `func_080114F8` / `func_0809A8AC`, rewrite only the existing `bytes[0x2C48]` and `bytes[0x2C4A]` accesses to use those two pointers; keep the `bytes + 0x2C1C` local where it currently is. Compare immediately. The purpose is to reproduce retail's early `ldr/add` setup for 0x2C48/0x2C4A and its r4/r8 lifetime across the helper calls. Do not change the compiler, restore duplicate `state`/`bytes` bases, or broaden the struct/layout experiment.

## Proven contract

`func_08011650` is `08011650..08011933`, **0x2E4 / 740 bytes**.
Production still uses assembly.

Both callers prove effective arguments:
1. destination GameState pointer (0x34F4-byte allocation),
2. save/SRAM context,
3. slot-relative offset,
4. u32 error-output pointer.

The function always returns the destination state. Error output is the status.

After constructing a full fallback/default state it:
1. clears the error output;
2. reads the 4-byte stored size;
3. requires 0x34F4;
4. reads 0x34F4 payload bytes at slot+4;
5. reads checksum at slot+0x34F8;
6. compares `func_08011588(state,0x34F4)` against it;
7. returns state with no successful-load migration/fixup.

`func_080006E4(save_context,destination,offset,size)` is the SRAM read proxy.
Error classes ORed with `gUnk_03000400`: 0x10000 generic/size/checksum,
0x20000 payload read, 0x30000 checksum read.

## Default initializer anchors

The prefix duplicates construction also visible inside `func_08010358`:
Farm +0x14, `func_0809AB8C` +0x1AA8, Farmer +0x1BD8, Dog +0x1C70,
`func_0800FF8C` +0x1CA0, social initializer `func_0809EEE8` +0x1CD4,
`func_0809C6BC` +0x214C, `func_080114F8` +0x2210,
`func_0809A8AC` +0x2214, ten 4-byte records at +0x2C4C..+0x2C73,
`func_08011510` +0x2C74, `func_0809CD78` +0x2C80,
`func_0809CE8C` +0x2E58, `func_0809C144` +0x3480, three 0x10-stride
records beginning +0x3494 with bit 0x10 cleared, then `func_080A1A48`
+0x34C8, `func_0809C4E4` +0x34D8 and `func_0809BFE8` +0x34DC.

This duplicated initialization is not a separate callable helper.

## Source experiment ledger

No production source changed.

| Candidate | Actual | Reported differences | Result |
| --- | ---: | ---: | --- |
| v1 | 0x2F4 | 600 | first plausible whole-function source |
| v2 | 0x2D4 | 659 | reject fixed-register overconstraint |
| **v3** | **0x2DC** | **529** | best raw mismatch count; structural baseline |
| v4 | 0x300 | 686 | reject |
| v5 | 0x300 | 686 | identical to v4; reject |
| v6 | **0x2E4** | 535 | exact retail size; const-reference fill shape recovers missing stack temporaries |
| v7 | 0x2D0 | 640 | reject removal of the long-lived byte-view source identity |
| v8 | **0x2E4** | **534** | exact size; natural default-name local improves one byte only |
| v9 | **0x2E4** | 540 | typed local GameDate is semantically credible but this spelling regresses allocation |
| v10 | 0x2D4 | 584 | typed calendar-header + GameDate whole-shape probe; reject as current matching source |
| v11 | 0x2D4 | 606 | replace all late `state` uses with `bytes`; correct single-base/frame direction but broad codegen regression |
| v12 | 0x2D0 | 641 | move zero initialization after base/header aliases; base-before-zero scheduling improves but overall shrinks/regresses |
| v13 | 0x2D8 | 638 | move base+header aliases before hard-register bindings; best diagnostic instruction-sequence similarity, but header lives too early in r5 |
| v14 | 0x2D4 | 606 | derive header directly from `state`; byte-identical to v11, so this extra early use canonicalizes away |
| v15 | 0x2D0 | 638 | create base before hard-register bindings but header after them; close prologue shape, still short by 0x14 |
| v16 diagnostic | 0x2D4 | 613 | force `bytes` to r7 only as a diagnostic; rejected, does not recover retail scheduling |

v3 has 521 in-range differing positions plus 8 bytes of size difference. Its
prologue naturally gets state=r7; controlled bindings recover slot_offset=sl,
error_out=r6 and zero=r9. The mismatch remains source/local-layout territory.

v4 and v5 are identical failures even though v4 used an 8-byte aggregate and
v5 separate locals. Therefore that aggregate was not causal. Both share the
bad removal of the preserved whole-state byte user variable / changed register
lifetimes. Do not repeat that family.

v6 is the new structural anchor. Replacing only the two manual clears with
fill_n_inl(bytes + 0x21D4, 8, 0) and fill_n_inl(bytes + 0x21DC, 4, 0)
produces the retail-sized 0x2E4 function and naturally creates distinct zero
temporaries at stack +4 and +8. Stored size, stored checksum and save context
then occupy +0x0C, +0x10 and +0x14, matching retail. The remaining frame is
0x1C rather than retail 0x18 because the long-lived byte-view/state value is
additionally spilled at stack +0x18.

v7 proves that simply deleting that byte-view identity is wrong: making the
parameter itself the byte pointer removes the extra spill and gives the retail
0x18 frame, but shrinks the function to 0x2D0 and regresses to 640
differences. Preserve the byte-view source identity and solve its lifetime
naturally instead of forcing r7 or deleting it wholesale.

v8's explicit default_name local leaves the same important register rotation
and improves only 535 -> 534 differences. It does not recover retail r5 name
ownership. v9 and v10 establish useful semantic type evidence but their exact
source spellings are closed matching paths for now.

## Duplicate-initializer stack-local evidence

Comparison with the same initialization sequence inside `func_08010358`
resolves one open question:

- the larger new-game path stores one zero local at `sp+0x10`;
- it then creates a **separate zero scalar at `sp+0x14`**;
- that `sp+0x14` scalar is loaded and copied bytewise into
  `GameState+0x21DC..+0x21DF`;
- therefore the loader's analogous stack words should be modeled as separate
  temporaries, not an 8-byte aggregate.

This agrees with v4/v5: changing aggregate versus separate locals did not change
their generated failure. Their regression came from the shared
no-whole-state-user-variable/register-lifetime family.

Do not copy absolute stack offsets from `func_08010358`; its frame is much
larger and contains unrelated later locals. Reuse only the proven source
relationship and lifetime ordering.

## Calendar/header type evidence

Existing project evidence already proves the calendar fields touched by this
initializer: GameState+0x10 is the packed year counter, +0x11 is GameDate and
+0x12/+0x13 is GameTime. The raw 12-byte region beginning at GameState+8 is
therefore two leading words followed by year, GameDate and GameTime. v10 tested
a scratch typed view of that complete region plus a typed local GameDate.
The semantics are credible, but that whole typed spelling compiled to 0x2D4 /
584 differences, so do not reuse v10 as the matching candidate. Keep the type
facts separate from that rejected source shape.

## October 4 continuation: single-base lifetime proven, v11-v16 bounded

Retail disassembly resolves the base-pointer question. The actual function has
a **0x18-byte frame**, captures `state` in **r7**, keeps that same r7 base through
the initializer, payload read, checksum and final return, and has no analogue
of v6's extra `[sp+0x18]` base spill. Therefore v6's duplicate long-lived
`state`/`bytes` identities are structurally wrong even though v6 has exact size.

v11 implemented the previous handoff literally: after creating `bytes`, every
late payload/checksum/return use switched from `state` to `bytes`. This removed
the extra spill and preserved r7 as the sole base, but shrank to 0x2D4 / 606.
That failure means the duplicate spill was supplying unrelated instruction/
lifetime pressure that happened to restore size; it is not evidence to keep it.

Further narrow source-order probes:
- v12 moves zero initialization after base/header creation: 0x2D0 / 641.
- v13 creates both base/header aliases before r10/r6 bindings: 0x2D8 / 638.
  A diagnostic instruction-sequence comparison gave v13 the strongest structural
  similarity among v6/v11-v14, but it creates the header too early in r5.
- v14 computes header from `state` while keeping the v11 lifetime: byte-identical
  to v11. The compiler canonicalizes that early extra state use away.
- v15 creates only `bytes` before r10/r6 and creates header afterward: 0x2D0 /
  638. Its prologue is close to retail but still stores save_context before the
  r7 capture and uses r2 rather than retail r1 for the short header pointer.
- v16 forces `bytes` to r7 as a diagnostic: 0x2D4 / 613. It does not fix the
  ordering problem, so fixed-r7 allocation is rejected and must not be promoted.

`compare-function.py --trace` produced empty allocation logs under the current
tracked compiler even with `AGBCC_TRACE_ALLOC=1`; do not assume that trace path
is available in this installed production compiler. Use saved assembly/RTL
evidence or a deliberately prepared diagnostic compiler only if later needed.

## Exact next action

Continue from the **single-base 0x18-frame family**, using v15 as the immediate
source-order reference. Do not restore v6's `[sp+0x18]` duplicate base and do
not repeat fixed-r7 diagnostics.

The next narrow probe is directly suggested by retail instructions around
`08011674..08011686`: retail loads `header[9]`, initializes/applies the -4 mask,
then initializes -125 into r3/r8 and applies that second mask. Current v15
declares both `clear_low_two` and `clear_date_bits` before either operation,
which lets the compiler materialize -125 too early. Move only the
`clear_date_bits` declaration/initialization to **after the first
`header[9] &= clear_low_two` statement**, leaving all other v15 source unchanged,
then compare immediately. This is a source-order/lifetime probe, not compiler
research. If it does not improve the early instruction sequence, inspect the
retail/v15 first-divergence region before trying another change.


## October 5, 2026 - Dog/Farmer nested-constructor zero-boundary checkpoint

This checkpoint narrows the active zero-identity question without reopening any closed loader source family.

New exact-source oracle:
- created `dog-ctor-oracle/` from the saved exact preprocessed `src/dog.cc` input;
- compiled with the current tracked 13-rule compiler and full `-da` dumps;
- extracted `.text` is byte-identical to current production `build/src/dog.o`.

Dog constructor discriminator:
- source is `Pet(name, ActorLocation(Location(2, 0x17E, 0x52), 0), 1)`;
- initial RTL gives the ActorLocation facing zero its own source/user SImode pseudo, `reg112 = 0`;
- the inlined ActorLocation constructor performs `memcpy(..., 6)` first, then stores the low byte of that zero to the temporary at +6;
- first CSE preserves `reg112` as a distinct zero identity across that memcpy/call boundary;
- flow reports reg112 as 4 refs / live 29 / crosses 2 calls; local allocation reports 4 refs / live 58 / crosses 2 calls;
- that same user-zero identity is later reused for one Dog zero field, while a separate equal zero remains distinct for the following field.

Farmer constructor comparison:
- source is `location(Location(2, 0, 0), 0)`;
- the Location x/y zeros begin as separate SImode user pseudos (`reg47`, `reg48`);
- the outer ActorLocation facing zero begins as another separate SImode user pseudo (`reg132 = 0`);
- ActorLocation again has the same aggregate boundary: copy the 6-byte Location with `memcpy`, then store facing at +6;
- in Farmer, first CSE canonicalizes that facing value to an earlier HI zero (`reg62 = 0`), which then survives across the memcpy: flow 2 refs / live 20 / crosses 1 call; lreg 2 refs / live 40 / crosses 1 call and allocates it to r5.
- Therefore the reusable discriminator is not merely a constructor, typed Location, or a zero literal. It is a nested temporary/aggregate construction where an equal-zero constructor argument remains live across an inlined 6-byte memcpy and is consumed by a post-copy narrow field store. Dog proves the full SImode identity can survive; Farmer proves CSE may legally canonicalize its value to an earlier narrow zero while preserving the same boundary/lifetime topology.

Comparison to closed v65:
- v65 constructs Location directly in-place at `bytes + 0x1CCC`; it has no nested temporary + memcpy + post-copy field boundary and falls into the wrong extra-high-zero family.
- Do not retry v65, typed Location assignment, placement new, or broad constructor-form loader variants.

Exact next action:
- build ONE small plain-function/v96-ABI microprobe that isolates this nested temporary + 6-byte memcpy + post-copy byte-zero boundary near the `+0x1CCC` phase;
- do not make it a full typed Location rewrite: use a minimal local packed/POD six-byte payload plus an outer seven/eight-byte temporary and an inline constructor-style helper so only the proven identity boundary is tested;
- compile under the normal tracked compiler with `-da`;
- require the experiment to preserve v96's existing header/old-zero topology while creating a distinct later low zero suitable for the string/location phase and without stealing the first fill's scalar zero;
- if the microprobe does not create that topology naturally, close this boundary hypothesis before any further loader source variants.
