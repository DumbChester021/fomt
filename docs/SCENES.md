# Scenes: cleanup and continuation transfer

The shared scene ownership layer is exact in `include/scene_owners.hh` and `src/scene_owners.cc`: 25 destructors and 22 `Run()` entries, totaling **2,360 linked retail bytes**. These are scene lifetime and transition mechanics. Concrete screen identities and controller implementations remain incomplete.

## Ownership layout

| Owner offset | Observed field |
| --- | --- |
| +0 | Existing `AScene` virtual interface |
| +4 | Owned controller, `SmartPtr<SceneController>` |
| +8 | Owned continuation request, `SmartPtr<AUnk_0800080C>` |

`SceneController` describes the shared deletion prefix: an unresolved data word at +0 and a vtable at +4 under this compiler's C++ ABI. Concrete controllers contain additional state. Do not use the prefix size as a controller allocation size.

Most recovered scene declarations describe only the common ownership prefix. Constructor 83A7C also proves words at +0C/+10/+14/+18 and a context pointer at +1C for SceneOwner83AEC. Constructor 88168 proves a word at +0C and context pointer at +10 for SceneOwner881AC. Other complete scene layouts remain unclaimed.

## Destruction and continuation contract

Each natural derived destructor installs the original derived vtable, deletes the continuation at +8 through its +0 vtable, deletes the controller at +4 through its +4 vtable, then calls the existing scene base destructor. Both member deletions use virtual slot +8 and mode 3. The base receives the original incoming mode.

For 16 recovered `Run()` entries, the scene calls its controller, moves the continuation into the caller's result slot, clears the owned pointer and returns the result address. Six entries first discard and destroy a temporary request returned by the controller.

The old aggregate-return ABI passes the one-pointer result slot in r0 and the scene in r1. Explicit ABI helpers use a one-pointer result-storage view while retaining typed scene ownership and normal `SmartPtr::Move()`. Typed virtual member names are bound to those entries through linker aliases. Existing retail vtables remain authoritative.

## Recovered entries

All destructors below are 64 bytes. Run sizes identify the promoted body only; “assembly” means the entry is mapped but unrecovered.

| Scene class / destructor | Scene constructor | Vtable | Run entry | Run bytes | Controller hook |
| --- | --- | --- | --- | ---: | --- |
| `SceneOwner521BC` | `func_0805218C` | `vtable_unk_080E7934` | `func_080521FC` | 52 | `func_08051504` |
| `SceneOwner57E1C` | `func_08057DD8` | `vtable_unk_080E7960` | `func_08057E5C` | 52 | `func_08052984` |
| `SceneOwner5CEFC` | `func_0805CEB8` | `vtable_unk_080E798C` | `func_0805CF3C` | 52 | `func_080588AC` |
| `SceneOwner5E658` | `func_0805E624` | `vtable_unk_080E79B8` | `func_0805E698` | 52 | `func_0805D170` |
| `SceneOwner5FD04` | `func_0805FCD0` | `vtable_unk_080E79F8` | `func_0805FD44` | 52 | `func_0805EE44` |
| `SceneOwner69E58` | `func_08069E14` | `vtable_unk_080E7A98` | `func_08069E98` | 28 | `func_080769A0` |
| `SceneOwner7561C` | `func_080755EC` | `vtable_unk_080E7B4C` | `func_0807565C` | 28 | `func_080769A0` |
| `SceneOwner7DD68` | `func_0807DD38` | `vtable_unk_080E7C30` | `func_0807DDA8` | 28 | `func_0807D218` |
| `SceneOwner7EE44` | `func_0807EE14` | `vtable_unk_080E7C4C` | `func_0807EE84` | 28 | `func_0807E558` |
| `SceneOwner7F5B0` | `func_0807F580` | `vtable_unk_080E7C68` | `func_0807F5F0` | 28 | `func_0807EF90` |
| `SceneOwner8048C` | `func_0808045C` | `vtable_unk_080E7C84` | `func_080804CC` | 28 | `func_0807F8C8` |
| `SceneOwner80DC4` | `func_08080D94` | `vtable_unk_080E7CA0` | `func_08080E04` | 28 | `func_08080540` |
| `SceneOwner81A70` | `func_08081A40` | `vtable_unk_080E7CBC` | `func_08081AB0` | 28 | `func_0808114C` |
| `SceneOwner82144` | `func_08082114` | `vtable_unk_080E7CD8` | `func_08082184` | 28 | `func_08081BBC` |
| `SceneOwner83AEC` | `func_08083A7C` | `vtable_unk_080E7D04` | `func_08083B2C` | assembly | `unresolved` |
| `SceneOwner85528` | `func_080854F4` | `vtable_unk_080E7D20` | `func_08085568` | 28 | `func_08084228` |
| `SceneOwner881AC` | `func_08088168` | `vtable_unk_080E7D3C` | `func_080881EC` | assembly | `unresolved` |
| `SceneOwner8AB68` | `func_0808AB38` | `vtable_unk_080E7D58` | `func_0808ABA8` | 28 | `func_0808A55C` |
| `SceneOwner8C59C` | `func_0808C56C` | `vtable_unk_080E7D74` | `func_0808C5DC` | 28 | `func_0808C0BC` |
| `SceneOwner8ED08` | `func_0808ECD8` | `vtable_unk_080E7D90` | `func_0808ED48` | 28 | `func_0808E6FC` |
| `SceneOwner90E84` | `func_08090E54` | `vtable_unk_080E7DAC` | `func_08090EC4` | 28 | `func_08090960` |
| `SceneOwner925C4` | `func_08092570` | `vtable_unk_080E7DC8` | `func_08092604` | assembly | `unresolved` |
| `SceneOwner931E0` | `func_080931B0` | `vtable_unk_080E7DE4` | `func_08093220` | 28 | `func_08092D64` |
| `SceneOwner93A88` | `func_08093A58` | `vtable_unk_080E8018` | `func_08093AD4` | 28 | `func_08093364` |
| `SceneOwner9A518` | `func_0809A4D4` | `vtable_unk_080E824C` | `func_0809A558` | 52 | `func_08094F6C` |

## Remaining scene methods

- `func_08083B2C`: a controller status selects direct continuation transfer or a new 16-byte request wrapper with scene context at +1C.
- `func_080881EC`: controller status selects direct transfer or nested 16-/20-byte requests with context at +10 and additional state.
- `func_08092604`: obtains a new request from its controller and transfers it through additional temporary-lifetime machinery.

All three remain assembly. Scene constructors, controller constructors and controller logic also remain assembly. Nearby shop/catalog or rucksack data is useful evidence but does not establish a specific screen name.

## True boundaries and verification

Six formerly inferred Run ranges also contained unnamed neighboring code. Only the real 28-byte bodies were promoted:

| Preserved unnamed span | Bytes |
| --- | ---: |
| 08069EB4..08069F14 | 96 |
| 08075678..080756B0 | 56 |
| 0807F60C..0807F63C | 48 |
| 080804E8..080804F8 | 16 |
| 080821A0..080821D0 | 48 |
| 08093AF0..08093C3C | 332 |

The **596 bytes** remain unchanged assembly and now count as unattributed. Run 93AD4 follows the separate 12-byte helper at 93AC8; destructor adjacency alone does not establish its address.

All 47 audited body comparisons have zero differences. Isolated and production forced full-ROM comparisons pass with the unchanged tracked compiler. Original entry addresses, symbol sizes and all 25 destructor/Run vtable slots are preserved. Reversing only the bounded assembly seams reproduces the prior assembly file exactly; the inventory removes exactly these 47 functions and preserves all other addresses/statuses.

ROM: **8,388,608 bytes**, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

The ignored proof checkpoint is `tools/ches/checkpoints/scene-owners-2026-10-09/`. It contains the audited manifest, matcher results, reviewed integration inputs, both full build logs and verification/inventory snapshots. `tools/ches/NEXT_AGENT_HANDOFF.md` owns the constructor continuation.
