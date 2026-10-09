# Scenes: construction, cleanup and continuation transfer

The shared scene lifetime layer is exact in `include/scene_owners.hh` and `src/scene_owners.cc`: 24 constructors, 25 destructors and all 25 `Run()` entries, totaling **74 source functions / 4,108 linked retail bytes**. These are scene lifetime and transition mechanics. Concrete screen identities and controller implementations remain incomplete.

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

`func_08083B2C` proves a second old auto_ptr-style pattern. The continuation uses a one-word moving-copy slot, while each allocating branch owns a request temporary plus a two-word transfer proxy. The exact source assigns the outer result inside the branch, lets the branch-local owner destruct, and only then joins at one common return. Direct returns from both allocating branches cause GCC to tail-merge those cleanups and do not match retail.

## Nested request contract in 881EC

`func_080881EC` calls controller `func_08086A08`. Status -1 moves the
continuation directly. Otherwise it queries `func_08085EEC`, choosing mode 1
for zero and mode 2 for any other result, and creates two nested requests:

| Offset | Inner request, 16 bytes | Outer request, 20 bytes |
| --- | --- | --- |
| +0 | Vtable 080E5D94 | Vtable 080E5C64 |
| +4 | Moved scene continuation | Moved inner request |
| +8 | Scene context at owner +0x10 | Same context |
| +0xC | Mode 1 or 2 | Same mode |
| +0x10 | Outside this object | First-controller status byte |

The outer pointer transfers to the caller result; the cleared inner owner
then destructs before the common return. The owner word at +0x0C is not read
by this Run.

The local `SceneMovePtr881` describes moving-copy and return-source ABI
storage without changing global SmartPtr. The default-created return source
is not read before its proxy sets the word to null. The allocated outer pointer
flows directly to the proxy and result. This view preserves the observed
lifetime and is not a general default-initialized smart pointer.

## Constructor contract

The first 18 recovered natural constructors take a mutable continuation reference and an opaque context pointer. Four 68-byte constructors, `func_08057DD8`, `func_0805CEB8`, `func_08069E14`, and `func_0809A4D4`, take the same pair plus an unsigned byte. `func_08083A7C` additionally takes four u32 values and stores them at +0x0C/+0x10/+0x14/+0x18 while retaining context at +0x1C. `func_08088168` takes one u32 value and stores it at +0x0C with context at +0x10. All 24 exact constructors install the original scene vtable and preserve the observed ownership transfer. Controller implementations remain assembly-bound.

The 18 scenes have a 12-byte ownership layout. Seventeen audited factories allocate that scene on the heap. Factory DC3A0 constructs SceneOwner93A88 on the stack with a null continuation, runs its controller/accessor path and then destroys the temporary with mode 2.

Controller allocation sizes are independent of the shared deletion-prefix size:

| Scene class | Controller constructor | Allocated bytes |
| --- | --- | ---: |
| `SceneOwner521BC` | `func_0805143C` | `0x8c0` |
| `SceneOwner5E658` | `func_0805CF70` | `0xaf4` |
| `SceneOwner5FD04` | `func_0805ED4C` | `0x6430` |
| `SceneOwner7561C` | `func_08070B70` | `0x17c` |
| `SceneOwner7DD68` | `func_0807D194` | `0x710` |
| `SceneOwner7EE44` | `func_0807E4D4` | `0x710` |
| `SceneOwner7F5B0` | `func_0807EEA0` | `0x6b0` |
| `SceneOwner8048C` | `func_0807F63C` | `0x710` |
| `SceneOwner80DC4` | `func_080804F8` | `0x710` |
| `SceneOwner81A70` | `func_08080E20` | `0x710` |
| `SceneOwner82144` | `func_08081ACC` | `0x6b0` |
| `SceneOwner85528` | `func_08083BD4` | `0x61f4` |
| `SceneOwner8AB68` | `func_080882AC` | `0x10c` |
| `SceneOwner8C59C` | `func_0808ABC4` | `0x10c` |
| `SceneOwner8ED08` | `func_0808C5F8` | `0x10c` |
| `SceneOwner90E84` | `func_0808ED64` | `0x10c` |
| `SceneOwner931E0` | `func_08092640` | `0x10c` |
| `SceneOwner93A88` | `func_0809323C` | `0x3f0` |

Fifteen scene constructor bodies are 48 bytes. The 5E624, 5FCD0 and 854F4 entries are 52 bytes because their allocation constants use literal pools. The same natural source expresses both forms.

Only scene constructor `92570` remains assembly. It is behavior-complete at exact size 0x54 with a four-linked-byte r0/r1 codegen frontier after bounded transfer-slot variants. The recovered 57DD8, 5CEB8, 69E14 and 9A4D4 entries forward an unsigned byte to the controller; the byte's meaning remains unresolved. Complete controller layouts and concrete screen names remain unresolved.

## Recovered entries

All destructors below are 64 bytes. Parenthesized constructor sizes mark recovered source. Run sizes identify promoted bodies; other constructors and “assembly” Runs remain unrecovered.

| Scene class / destructor | Scene constructor (bytes) | Vtable | Run entry | Run bytes | Controller hook |
| --- | --- | --- | --- | ---: | --- |
| `SceneOwner521BC` | `func_0805218C` (48) | `vtable_unk_080E7934` | `func_080521FC` | 52 | `func_08051504` |
| `SceneOwner57E1C` | `func_08057DD8` (68) | `vtable_unk_080E7960` | `func_08057E5C` | 52 | `func_08052984` |
| `SceneOwner5CEFC` | `func_0805CEB8` (68) | `vtable_unk_080E798C` | `func_0805CF3C` | 52 | `func_080588AC` |
| `SceneOwner5E658` | `func_0805E624` (52) | `vtable_unk_080E79B8` | `func_0805E698` | 52 | `func_0805D170` |
| `SceneOwner5FD04` | `func_0805FCD0` (52) | `vtable_unk_080E79F8` | `func_0805FD44` | 52 | `func_0805EE44` |
| `SceneOwner69E58` | `func_08069E14` (68) | `vtable_unk_080E7A98` | `func_08069E98` | 28 | `func_080769A0` |
| `SceneOwner7561C` | `func_080755EC` (48) | `vtable_unk_080E7B4C` | `func_0807565C` | 28 | `func_080769A0` |
| `SceneOwner7DD68` | `func_0807DD38` (48) | `vtable_unk_080E7C30` | `func_0807DDA8` | 28 | `func_0807D218` |
| `SceneOwner7EE44` | `func_0807EE14` (48) | `vtable_unk_080E7C4C` | `func_0807EE84` | 28 | `func_0807E558` |
| `SceneOwner7F5B0` | `func_0807F580` (48) | `vtable_unk_080E7C68` | `func_0807F5F0` | 28 | `func_0807EF90` |
| `SceneOwner8048C` | `func_0808045C` (48) | `vtable_unk_080E7C84` | `func_080804CC` | 28 | `func_0807F8C8` |
| `SceneOwner80DC4` | `func_08080D94` (48) | `vtable_unk_080E7CA0` | `func_08080E04` | 28 | `func_08080540` |
| `SceneOwner81A70` | `func_08081A40` (48) | `vtable_unk_080E7CBC` | `func_08081AB0` | 28 | `func_0808114C` |
| `SceneOwner82144` | `func_08082114` (48) | `vtable_unk_080E7CD8` | `func_08082184` | 28 | `func_08081BBC` |
| `SceneOwner83AEC` | `func_08083A7C` (112) | `vtable_unk_080E7D04` | `func_08083B2C` | 168 | `func_08082CEC` |
| `SceneOwner85528` | `func_080854F4` (52) | `vtable_unk_080E7D20` | `func_08085568` | 28 | `func_08084228` |
| `SceneOwner881AC` | `func_08088168` (68) | `vtable_unk_080E7D3C` | `func_080881EC` | 192 | `func_08086A08`, `func_08085EEC` |
| `SceneOwner8AB68` | `func_0808AB38` (48) | `vtable_unk_080E7D58` | `func_0808ABA8` | 28 | `func_0808A55C` |
| `SceneOwner8C59C` | `func_0808C56C` (48) | `vtable_unk_080E7D74` | `func_0808C5DC` | 28 | `func_0808C0BC` |
| `SceneOwner8ED08` | `func_0808ECD8` (48) | `vtable_unk_080E7D90` | `func_0808ED48` | 28 | `func_0808E6FC` |
| `SceneOwner90E84` | `func_08090E54` (48) | `vtable_unk_080E7DAC` | `func_08090EC4` | 28 | `func_08090960` |
| `SceneOwner925C4` | `func_08092570` | `vtable_unk_080E7DC8` | `func_08092604` | 60 | `func_0809152C` |
| `SceneOwner931E0` | `func_080931B0` (48) | `vtable_unk_080E7DE4` | `func_08093220` | 28 | `func_08092D64` |
| `SceneOwner93A88` | `func_08093A58` (48) | `vtable_unk_080E8018` | `func_08093AD4` | 28 | `func_08093364` |
| `SceneOwner9A518` | `func_0809A4D4` (68) | `vtable_unk_080E824C` | `func_0809A558` | 52 | `func_08094F6C` |

## Recovered complex Runs

- `func_08083B2C`: now exact source. Controller status 0 moves the continuation directly; status 1/fallback allocate the same 16-byte request wrapper with scene context at +1C and flags 0/1, then transfer ownership through branch-local proxies.
- `func_080881EC`: exact source. Status -1 moves the continuation directly; other statuses create the nested requests described above.
- `func_08092604`: exact source. It obtains a controller request through caller-supplied aggregate-return storage and transfers that temporary to the outer result through the recovered two-word `auto_ptr_ref`-style proxy.

All 25 scene Runs are now exact source. Constructor `92570`, controller constructors and controller logic remain assembly. Nearby shop/catalog or rucksack data is useful evidence but does not establish a specific screen name.

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

All 74 source-owned scene functions match retail. The newest Run, `func_080881EC`, matches scratch, production-shaped and complete-TU proofs at 0xC0 / 0 differences. A fresh tracked compiler install, isolated full-ROM comparison and forced production full-ROM comparison pass. Original entry aliases, target/neighbor addresses and all 25 destructor/Run vtable slot pairs are preserved. Regenerated inventory reports 2,130 linked assembly functions, 858,188 assembly bytes and the unchanged 2,696 unattributed bytes.

ROM: **8,388,608 bytes**, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

The ignored proof checkpoint is `tools/ches/checkpoints/scene-owners-2026-10-09/`. It contains the audited manifest, matcher results, reviewed integration inputs, both full build logs and verification/inventory snapshots. `tools/ches/NEXT_AGENT_HANDOFF.md` owns the current controller-helper continuation.

Constructor proofs are under `tools/ches/checkpoints/scene-constructors-2026-10-09/`: audited manifest, caller evidence, individual matches, reviewed final integration inputs, expanded full build logs and verification/inventory snapshots.

Nested Run proofs and reviewed integration inputs are under `tools/ches/checkpoints/scene-complex-runs-2026-10-09/`. The canonical handoff owns the bounded controller-helper continuation.
