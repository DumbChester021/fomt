# Learning the FoMT save-system decompilation

This is a beginner-friendly companion to [SAVE_EVIDENCE_MATRIX.md](SAVE_EVIDENCE_MATRIX.md). You can help without already knowing assembly or the old Game Boy Advance compiler.

## The big picture

The GBA ROM is the original game program. A decompilation attempts to reconstruct **what source code produced that program**. For US FoMT the goal is readable C++ whose compiled bytes exactly match the reference ROM. We also want to know what the recovered code *means*, which is not the same as proving its binary matches.

FoMT's **GameState** is a large snapshot of farm, player, money, dog, relationships, fishing and other saved progress. Cartridge **SRAM** holds a 32 KiB binary image with a header and two save slots. An SRAM file is not the same thing as a `GameState` object in memory: loading verifies the file, creates/initializes objects and restores ownership safely.

## Programming words, with game examples

| Word | Plain meaning | FoMT-specific example |
| --- | --- | --- |
| Object | A collection of related data and behavior | One farmer or one Rucksack |
| Struct/class | The definition of how an object is laid out | `Farmer`, `Rucksack`, `MoneyState` |
| Constructor | Initializes a newly created object | Set up an initially empty inventory |
| Copy constructor | Creates a **new** object from another | Create a new saved data object as a copy |
| Assignment / copying routine | Updates an **existing** object using another | Copy loaded Farmer data into an existing Farmer |
| Destructor | Finishes an object's lifetime, cleaning up whatever it owns | Traverse a Rucksack's active item/tool entries |
| `memcpy` | Raw byte copy, unaware of ownership or objects | Retail copies one 2-byte ToolStack through a library call |
| Pointer | An address referring to another object | Existing GameState allocation versus loaded temporary |
| Allocation / free | Reserve or release memory | Keep a live GameState allocation during replacement, free a temporary afterward |
| ABI | Rules for parameter passing and symbol names | A function must accept the same arguments and export the original entry point |
| Register | Tiny CPU storage used while running an instruction | Old compiler may choose `r4` where our candidate chooses `r5` |
| Byte-exact match | Compiled executable bytes identical to retail | Barn assignment, 296/296 bytes exact |
| Human readable | We can explain the data and behavior accurately | Typed Rucksack cleanup instead of mysterious +0x1C38 byte-offset arithmetic |

**Important:** A destructor need not release the object's memory. FoMT's cleanup modes distinguish teardown that **keeps the existing allocation** from teardown that also frees it. The observed successful active-game load does roughly this:

```cpp
CleanupGameState(existing, 2);  // free owned contents as appropriate, keep this allocation
CopySavedGameState(existing, loaded); // still ASM; copy into the existing object
CleanupGameState(loaded, 3);     // clean up and release the temporary
```

This is explanatory pseudocode, **not** a verified replacement for the original GameState assignment.

## The Rucksack discovery, step by step

A Rucksack can hold **8 items and 8 tool stacks**, but each collection has an active item count. The original saved-state copy at `0x080D6A80` copies only *active* entries, first resetting and then restoring their count. A plain `destination = source` would also copy inactive capacity and does not preserve the original function's precise behavior.

We initially referred to `0x080D6A80..0x080D6B40` as a **192-byte copy**. Further original-symbol analysis showed two different functions:

1. `0x080D6A80..0x080D6B00`: **128-byte Rucksack copy**, still assembly.
2. `0x080D6B00..0x080D6B40`: **64-byte cleanup**, already byte-exact C++ before this discovery.

We made the cleanup source easier to read using the real `Rucksack`, `ToolStack` and `RucksackItem` types, and the forced ROM still matched. But this was **0 new exact bytes**, not a newly decompiled function. That correction matters as much as matching another function.

## A practical way to assist

You do **not** need to learn all of C++ and ARM assembly first.

1. Pick a save component you understand as a player: item inventory, money, pets, crops, fishing, or relationships.
2. Open the row in [SAVE_EVIDENCE_MATRIX.md](SAVE_EVIDENCE_MATRIX.md). Check whether it is `EXACT` or still `ASM`, the original address range, and the linked research document.
3. Ask three questions: **What is proven? What is inferred? What is unknown?** An accurate "I don't know yet" is better than an attractive invented name.
4. Check whether a new observation changes other systems: type layouts, save/load, cleanup, UI, documentation, and existing test evidence.
5. For gameplay testing, use **copies** of real saves and document exactly what changed, which in-game operation was performed, and whether the game successfully loaded afterward. Never experiment against your only original save.

Useful questions for the assistant include "Explain these ten assembly instructions," "Show me the data before and after this copy," "Why does the destructor skip freeing memory here?", "Which documentation claims about this address disagree?", and "Has this compiler hypothesis already been tried?"

## Where to look for previous work

- `START_HERE.md`: current high-level state.
- `tools/ches/NEXT_AGENT_HANDOFF.md`: live next action, blockers and known false starts.
- `docs/SAVE_EVIDENCE_MATRIX.md`: original function ranges, matching status and evidence references.
- `docs/SAVE_RUCKSACK_COPY_RESEARCH.md`: why the Rucksack copy still doesn't match; boundary correction.
- `tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md` and `FAILURES_AND_CLOSED_PATHS.md`: historical compiler and decompilation experiments.
- `tools/ches/checkpoints/save-loader-08011650-2026-10-04/README.md`: many prior loader experiments, **historical priority label superseded**.
- `tools/ches/decomp_inventory.json`: machine-generated inventory of **still-linked assembly**, not a list of all functions that ever existed.
- `docs/DECOMP_PLAYBOOK.md`: exactness rules and cross-document update obligations.

The success criteria are intentionally separate: **correct bytes, correct ownership, understood behavior, truthful evidence, and safe runtime testing**. We need all of them before saying the save system is finished.
