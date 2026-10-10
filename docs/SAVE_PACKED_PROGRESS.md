# Saved packed-state flag at 0x08011458

**Verified exact source integration (October 10, 2026).** One originally assembly-only helper, `func_08011458`, now has natural, byte-identical C++ source at `src/save_packed_flag.cc`:

```cpp
void MarkSavedPackedFlag(u8 * flags) {
    *flags |= 0x10;
}
```

It sets bit 4 of the record's first byte, preserving all other bits. It makes no return-value or broader gameplay assumptions. The original address and alias are preserved at **0x08011458**, with **12 exact linked bytes** under `.text.saved_packed_flag`. The linker and remaining assembly are split immediately after this helper, so neighboring functions stay unchanged.

The standalone zero-difference proof is `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-transition-20261010/proofs/packed-flag-named.diff`. The forced complete ROM build `make -B -j4 compare` passed (Ches execution `sh_mv2amxjc_ee34fb1b`, `fomt.gba: OK`). Inventory `sh_mv2anl4k_e9fa68eb` shows **90,104/940,036 (9.5852%) C++ code bytes**, **849,932 remaining ASM bytes**, **1,953 linked assembly functions**, **166,054/7,717,440 (2.1517%) meaningful ROM**.

Nearby `func_08011464`, `func_08011498`, `func_080114C8`, and `func_080114F8` manipulate fields in compact/packed records, including saturating proposed values at 99. Their exact owning GameState subobject and gameplay meaning remain unconfirmed. Natural typed C++ candidates were explored in `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-transition-20261010/`; none match fully (best adjacent `packed-level4` differed 7 bytes, `level8` 5, and `packed-flags3` 3). These are *research only*, not production source. The still-assembly neighbors must not be counted as decompiled or patched with register-forcing code.

For a full save-loader model, see `docs/SAVE_LIFECYCLE.md` and `tools/ches/NEXT_AGENT_HANDOFF.md`; for the adjacent exact `GameState+0x2C74` type, see `docs/SAVE_TRANSITION_STATE.md`. This 12-byte integration does not complete any save/load/copy/erase path.
