# Current FoMT continuation - October 7, 2026

## Completed production boundary

Retail main tracks ches/main. This checkpoint began at
5cc430c597d063f5e641c2b28943ba515b6353b8; git log -1 identifies the saved
checkpoint. The resource-owner set is now integrated, not just scratch proof.

| Function | True body bounds | Result |
| --- | --- | --- |
| AC78 destructor | 0803AC78..0803ACD8 | 96 / 0 |
| ACD8 graphics update | 0803ACD8..0803AE56 | 382 / 0 |
| AE58 renderer forwarding | 0803AE58..0803AEA0 | 72 / 0 |
| B0A8 sibling destructor | 0803B0A8..0803B128 | 128 / 0 |

- Source: include/resource_owners.hh, src/resource_owner_cached.cc, src/resource_owner_variable.cc.
- Seam: asm/code_0803A8A4.s and fomt.lds; both constructors and B128 remain assembly.
- Source gain: 678 body bytes / 680 linked bytes, including AE56..AE58 alignment.
- Stable architecture: docs/RESOURCE_OWNERS.md.
- Existing resource_handle.hh, utility/fixed_vec.hh and compiler inputs unchanged.
- Both destructor aliases preserve the original callers and hidden ABI flags.

## Verification and current totals

Fresh tracked compiler installation in /tmp/fomt-resource-owner-integration,
isolated make -B -j4 compare, and production make -B -j4 compare all PASS.
Both complete ROMs equal retail: 8,388,608 bytes, SHA1
a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
Eleven symbol addresses, four body sizes and all five contribution-file hashes
are checked. Inventory removes only AC78/ACD8/AE58/B0A8, with no other address
or size changes. NPC class-map outputs are unchanged.

- Code: **73,280 / 940,036 = 7.7954%**; assembly **866,756 bytes**
- Data/assets: **75,334 / 6,777,404 = 1.1115%**
- Overall: **149,010 / 7,717,440 = 1.9308%**
- Linked asm functions: **2,329**; inferred bytes **865,592**; unattributed **1,164**
- Generated parked **17**; retained runtime/library **33**
- Free tail **671,168 bytes**

## Durable artifacts and transport recovery

Existing ignored checkpoint:
tools/ches/checkpoints/resource-owner-0803AB30-2026-10-07/

Final files are resource_owners.hh, resource_owner_cached.cc and
resource_owner_variable.cc. final-target-results.json records all four final
comparisons. integration-plan.json, isolated-proof.json, production-proof.json,
inventory-audit.json and the install/build/progress logs preserve full evidence.

The MCP 504 happened before production mutation. Recovery found no promotion
file, no production proof, no live matching process, and unchanged main source.
The later confirmed production execution sh_muy165st_11ee17fd finished with
exit 0. No commands remain running; do not replay setup or promotion.
The isolated worktree remains available at /tmp/fomt-resource-owner-integration.

## Next action: persistent-state type recovery

The user renewed eventual save-structure recovery as a goal. Prefer recovered
subobject initializers and their consumers over repeating the parked whole-loader
compiler puzzle. Start with a bounded assessment of the statistics-state family:

1. Read docs/SAVE_FORMAT.md and the save-system-research-2026-10-05/README.md
   checkpoint, including its October 7 corrections.
2. Read the top of save-loader-08011650-2026-10-04/README.md for the current
   failure boundary. The six-byte-copy microprobe is CLOSED, not untried.
3. Search those checkpoints, experiment registries and closed-path records for
   0809CD78 and neighboring statistics methods before creating a candidate.
4. Inspect the current inventory and asm/code_actor_0809BFE8.s around 0809CD78.
   Cross-check the loader call at GameState+2C80, the recorded 0x1D8-byte span,
   initializer, update/getter consumers and the next 2E58 boundary. Treat the
   older map's field names/counts as claims to verify, not automatic truth.
5. If coherent and not already closed, recover a shared typed statistics state
   and its initializer/consumer cluster with normal exact-target and isolated/
   production full-ROM gates. Otherwise select a higher-leverage persistent
   subobject from the same saved map. Preserve the 0x34F4 GameState payload ABI.
6. Update canonical docs and publish verified checkpoints under project rules.

No new statistics candidate was created in this checkpoint.
The save record geometry, checksum and writer are already source-owned.
The loader itself is still assembly and compiler-sensitive.

## Preserved resource-owner research

- AB30 constructor: 328 expected / 316 actual / 217 differences (V2/V3 identical).
- AEA0 constructor: still assembly, no candidate proof.
- B128 update: 382 / 2, reversed addition operands at B26A/B26C; V8 commutation
  is code-identical to V7. No compiler change is justified.
- Sibling +E6 is a live initialized byte. Existing FixedVec is raw storage;
  sibling destruction explicitly walks active entries and records.
- Private default-handle and byte-assignment headers are constructor experiments,
  not production interfaces.

Do not replay the integrated owner methods, map resolver or completed entity
tails. Other parked targets remain closed without new structural evidence.
