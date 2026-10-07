# FoMT Session Status

## Authoritative current snapshot - October 7, 2026

- Retail branch main, tracking ches/main. Run git log -1 for the current checkpoint.
- Integration base: 5cc430c597d063f5e641c2b28943ba515b6353b8.
- ROM: 8,388,608 bytes, SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
- Compiler and existing shared handle/container headers unchanged.
- Custom-game worktree was not modified.

## Exact production progress

- Code **73,280 / 940,036 = 7.7954%**; assembly **866,756 bytes**
- Data/assets **75,334 / 6,777,404 = 1.1115%**
- Overall meaningful ROM **149,010 / 7,717,440 = 1.9308%**
- Free tail **671,168 bytes**
- Linked assembly functions **2,329**; inferred ranges **865,592 / 866,756 = 99.8657%**
- Unattributed bytes **1,164**; generated parked **17**; runtime/library retained **33**
- Shape clusters **184**, members **864**, exact normalized clusters **176**

## Latest integrated source

Rendering-resource owners now have four exact source methods: AC78 96/0,
ACD8 382/0, AE58 72/0, and B0A8 128/0. Total source gain is 680 linked bytes
including the two-byte ACD8 alignment seam. Shared types are in
include/resource_owners.hh; methods are in src/resource_owner_cached.cc and
src/resource_owner_variable.cc.

Fresh isolated compiler installation and forced full-ROM comparison PASS.
Production forced full-ROM comparison, ROM equality/hash/size, eleven symbols,
four body sizes and contribution-input hashes PASS.
Inventory regeneration removed only those four functions; all other addresses
and sizes are unchanged. NPC class-map outputs are unchanged.

## Continuation and risks

The October 7 MCP 504 occurred before production mutation. Recovery confirmed
absent promotion/proof files, unchanged source inputs and no lingering execution.
Production was then promoted once and verified successfully by execution
sh_muy165st_11ee17fd (finished, exit 0). No execution remains pending.

AB30 constructor and B128 update retain their saved nonmatching candidates;
both constructors remain assembly. No compiler change or repeated variant work.
The user wants eventual save-structure recovery. Next inspect the saved
statistics-state initializer/consumer cluster around 0809CD78 for a typed
persistent boundary. Loader source matching remains parked pending new evidence.
The stale save-research error mapping and closed-microprobe claim were corrected
against current assembly and the authoritative loader checkpoint.

Proofs, source snapshots and inventory audit are in the existing local ignored
resource-owner checkpoint. NEXT_AGENT_HANDOFF.md owns the ordered continuation.
