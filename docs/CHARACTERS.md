# Character name lookup

`GetCharacterName` is a byte-matching reconstruction of the original helper at
0x0809FE3C. The original `func_0809FE3C` symbol remains as an alias for
assembly callers.

The retail character-name range is 0 through 42. IDs outside that range return
the empty string at `gUnk_08104108`. Most valid IDs read a name pointer from
the 43-entry table at `gUnk_08104258`; each entry is eight bytes, containing a
name pointer followed by a second word whose semantics remain unresolved.

ID 35 is the only dynamic-name exception. It resolves the conditional child
object in social state and returns that object's mutable name at offset 0x14.
ID 0 uses the ordinary table path and its retail name pointer also targets the
empty string.

## Expansion boundary

Appending text alone cannot add a character. Retail code validates IDs against
the fixed maximum of 42, and a complete added character also needs persistent
state, schedule insertion, runtime entity construction, scripts, and resources.
The separately documented save-slot extension tail can hold mod-owned persistent
state without changing the retail `GameState` payload.

This interface exposes the current name boundary without changing behavior or
claiming that the unresolved table word has a known meaning. Optional character
expansion should remain separate from the matching baseline.

## Matching validation

The linker places `src/character_info.cc` between the two sections of
`asm/code_809E804.s`, preserving `GetCharacterName` at 0x0809FE3C and the next
retail function at 0x0809FE74. Run `make compare` after changing this interface.
