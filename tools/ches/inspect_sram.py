#!/usr/bin/env python3
"""Read-only FoMT US 32 KiB SRAM header/slot consistency inspector.

Reproduces the retail header signature, valid-mask, selected-slot and
record length/payload checksum. File bytes are never modified.
This is structural evidence, not proof of an in-game load.
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path
import struct

HEADER_SIZE = 0x28
SLOT_SIZE = 0x3FEC
PAYLOAD_SIZE = 0x34F4
PAYLOAD_OFFSET = 4
CHECKSUM_OFFSET = 0x34F8
SRAM_SIZE = 0x8000
# Retail gUnk_080E862C, extracted from fomt.gba at ROM offset 0xE862C.
# Independent of the inspected SRAM file.
SAVE_SIGNATURE = bytes.fromhex(
    "47 42 41 96 71 8f ea 95 a8 8c ea 82 cc 53 52 41"
    " 4d 83 43 83 81 81 5b 83 57 20 30 30 30 30 30 00"
)


def inspect_sram(data: bytes) -> dict:
    if len(data) != SRAM_SIZE:
        raise ValueError(f"Expected {SRAM_SIZE} bytes of SRAM, got {len(data)}")
    valid_mask = struct.unpack_from("<I", data, 0x20)[0]
    selected_slot = struct.unpack_from("<I", data, 0x24)[0]
    signature_matches = data[:0x20] == SAVE_SIGNATURE
    mask_in_range = (valid_mask & 3) == valid_mask
    selected_in_range = selected_slot <= 1
    # Mirrors VerifySaveHeader in src/save_slot_header.cc. Hardware read
    # failures are outside this offline-file model.
    header_valid = signature_matches and mask_in_range and selected_in_range
    result: dict = {
        "sram_size": SRAM_SIZE,
        "header_size": HEADER_SIZE,
        "slot_size": SLOT_SIZE,
        "payload_size": PAYLOAD_SIZE,
        "header": {
            "signature_matches_retail": signature_matches,
            "valid_slot_mask": valid_mask,
            "valid_mask_in_range": mask_in_range,
            "selected_slot": selected_slot,
            "selected_slot_in_range": selected_in_range,
            "retail_header_fields_valid": header_valid,
        },
        "note": "Structural checks only, not hardware access or confirmed in-game load.",
        "slots": [],
    }
    for slot in range(2):
        start = HEADER_SIZE + SLOT_SIZE * slot
        stored_length = struct.unpack_from("<I", data, start)[0]
        stored_checksum = struct.unpack_from("<I", data, start + CHECKSUM_OFFSET)[0]
        payload = data[start + PAYLOAD_OFFSET: start + PAYLOAD_OFFSET + PAYLOAD_SIZE]
        calculated_checksum = sum(payload) & 0xFFFFFFFF
        length_ok = stored_length == PAYLOAD_SIZE
        checksum_ok = stored_checksum == calculated_checksum
        header_marks_valid = header_valid and bool(valid_mask & (1 << slot))
        # Decode source-backed GameState fields only for header/record-consistent
        # slots. Even that is not proof the runtime will accept the save.
        saved_state_view = None
        if header_marks_valid and length_ok and checksum_ok:
            money = 0x1AA8
            transition = 0x2C74
            daily_count = struct.unpack_from("<I", payload, money + 0x08)[0]
            seasonal_count = struct.unpack_from("<I", payload, money + 0xFC)[0]
            buffer_count = struct.unpack_from("<I", payload, 0x1CA0)[0]
            # Matches FishingRecords at GameState+0x2C80. Retail's
            # GetTotalFishCaught includes indices 8..58 and caps at 1e9.
            fish = list(struct.iter_unpack("<II", payload[0x2C80:0x2E58]))
            fish_total = 0
            for caught, _max_size in fish[8:]:
                fish_total = min(1000000000, (fish_total + caught) & 0xFFFFFFFF)
            saved_state_view = {
                "money": {
                    "balance": struct.unpack_from("<I", payload, money)[0],
                    "daily_history_count": daily_count,
                    "daily_count_within_capacity": daily_count <= 30,
                    "seasonal_history_count": seasonal_count,
                    "seasonal_count_within_capacity": seasonal_count <= 4,
                    "max_daily_income": struct.unpack_from("<I", payload, money + 0x120)[0],
                    "max_daily_spend": struct.unpack_from("<I", payload, money + 0x124)[0],
                    "max_seasonal_income": struct.unpack_from("<I", payload, money + 0x128)[0],
                    "max_seasonal_spend": struct.unpack_from("<I", payload, money + 0x12C)[0],
                },
                "saved_byte_buffer": {
                    "count": buffer_count,
                    "count_within_payload_capacity": buffer_count <= 32,
                },
                "saved_transition": {
                    "current_index": struct.unpack_from("<I", payload, transition)[0],
                    "pending_index": struct.unpack_from("<I", payload, transition + 4)[0],
                    "countdown": payload[transition + 8],
                },
                "fishing_records": {
                    "record_count": len(fish),
                    "total_fish_caught_retail_cap": fish_total,
                    "fish_entries_with_catches": sum(caught > 0 for caught, _ in fish[8:]),
                    "fish_king_entries_with_catches": sum(caught > 0 for caught, _ in fish[53:59]),
                    "largest_recorded_size_in_fish_entries": max(size for _, size in fish[8:]),
                },
            }
        result["slots"].append({
            "slot": slot,
            "offset": start,
            "stored_length": stored_length,
            "length_matches_retail": length_ok,
            "stored_checksum": stored_checksum,
            "calculated_checksum": calculated_checksum,
            "checksum_matches": checksum_ok,
            "record_shape_matches": length_ok and checksum_ok,
            "header_reports_valid": header_marks_valid,
            "header_and_record_consistent": header_marks_valid and length_ok and checksum_ok,
            "header_selects_this_slot": header_valid and selected_slot == slot,
            "saved_state_view": saved_state_view,
        })
    return result


def self_test() -> None:
    data = bytearray(SRAM_SIZE)
    data[:0x20] = SAVE_SIGNATURE
    struct.pack_into("<I", data, 0x20, 1)  # Only slot 0 marked valid
    struct.pack_into("<I", data, 0x24, 0)  # Slot 0 selected
    slot0 = HEADER_SIZE
    struct.pack_into("<I", data, slot0, PAYLOAD_SIZE)
    for index in range(PAYLOAD_SIZE):
        data[slot0 + PAYLOAD_OFFSET + index] = index % 251
    checksum = sum(data[slot0 + PAYLOAD_OFFSET:slot0 + PAYLOAD_OFFSET + PAYLOAD_SIZE]) & 0xFFFFFFFF
    struct.pack_into("<I", data, slot0 + CHECKSUM_OFFSET, checksum)

    correct = inspect_sram(bytes(data))
    assert correct["slots"][0]["saved_state_view"] is not None
    assert correct["slots"][1]["saved_state_view"] is None
    assert correct["header"]["retail_header_fields_valid"]
    assert correct["slots"][0]["header_and_record_consistent"]
    assert correct["slots"][0]["header_selects_this_slot"]
    assert not correct["slots"][1]["header_reports_valid"]
    assert not correct["slots"][1]["length_matches_retail"]
    assert correct["slots"][1]["checksum_matches"]  # Empty zero record isn't valid.

    data[slot0 + PAYLOAD_OFFSET + 100] ^= 1
    corrupt = inspect_sram(bytes(data))
    assert not corrupt["slots"][0]["checksum_matches"]
    assert corrupt["slots"][0]["saved_state_view"] is None
    data[slot0 + PAYLOAD_OFFSET + 100] ^= 1
    struct.pack_into("<I", data, slot0, 0)
    wrong_length = inspect_sram(bytes(data))
    assert not wrong_length["slots"][0]["record_shape_matches"]
    assert wrong_length["slots"][0]["checksum_matches"]
    struct.pack_into("<I", data, slot0, PAYLOAD_SIZE)

    # Bad header values are independent of an intact payload checksum.
    assert inspect_sram(bytes(data))["slots"][0]["header_and_record_consistent"]
    data[0] ^= 1
    bad_signature = inspect_sram(bytes(data))
    assert not bad_signature["header"]["retail_header_fields_valid"]
    assert bad_signature["slots"][0]["record_shape_matches"]
    assert not bad_signature["slots"][0]["header_and_record_consistent"]
    assert bad_signature["slots"][0]["saved_state_view"] is None
    data[0] ^= 1

    struct.pack_into("<I", data, 0x20, 4)
    assert not inspect_sram(bytes(data))["header"]["valid_mask_in_range"]
    struct.pack_into("<I", data, 0x20, 1)

    struct.pack_into("<I", data, 0x24, 2)
    assert not inspect_sram(bytes(data))["header"]["selected_slot_in_range"]
    struct.pack_into("<I", data, 0x24, 0)

    struct.pack_into("<I", data, 0x20, 0)
    unmarked = inspect_sram(bytes(data))
    assert unmarked["header"]["retail_header_fields_valid"]
    assert unmarked["slots"][0]["record_shape_matches"]
    assert not unmarked["slots"][0]["header_and_record_consistent"]
    struct.pack_into("<I", data, 0x20, 1)

    struct.pack_into("<I", data, 0x24, 1)
    alternate_selected = inspect_sram(bytes(data))
    assert alternate_selected["header"]["retail_header_fields_valid"]
    assert not alternate_selected["slots"][0]["header_selects_this_slot"]
    assert alternate_selected["slots"][0]["header_and_record_consistent"]
    struct.pack_into("<I", data, 0x24, 0)

    # An internally consistent synthetic save exposes typed offsets.
    # This fixture is not a real save and does not establish game acceptance.
    payload_start = slot0 + PAYLOAD_OFFSET
    money = payload_start + 0x1AA8
    struct.pack_into("<I", data, money, 1234567)
    struct.pack_into("<I", data, money + 0x08, 13)
    struct.pack_into("<I", data, money + 0xFC, 3)
    struct.pack_into("<I", data, money + 0x120, 900)
    struct.pack_into("<I", data, payload_start + 0x1CA0, 10)
    struct.pack_into("<II", data, payload_start + 0x2C74, 16, 4)
    data[payload_start + 0x2C7C] = 2
    fish = payload_start + 0x2C80
    data[fish:fish + 59 * 8] = bytes(59 * 8)
    struct.pack_into("<II", data, fish + 4 * 8, 3000, 400)  # Pre-fish entry excluded
    struct.pack_into("<II", data, fish + 8 * 8, 999999999, 200)
    struct.pack_into("<II", data, fish + 53 * 8, 7, 300)
    checksum = sum(data[payload_start:payload_start + PAYLOAD_SIZE]) & 0xFFFFFFFF
    struct.pack_into("<I", data, slot0 + CHECKSUM_OFFSET, checksum)
    view = inspect_sram(bytes(data))["slots"][0]["saved_state_view"]
    assert view["money"]["balance"] == 1234567
    assert view["money"]["daily_history_count"] == 13
    assert view["money"]["seasonal_history_count"] == 3
    assert view["money"]["max_daily_income"] == 900
    assert view["saved_byte_buffer"]["count"] == 10
    assert view["saved_transition"] == {"current_index": 16, "pending_index": 4, "countdown": 2}
    assert view["fishing_records"] == {
        "record_count": 59,
        "total_fish_caught_retail_cap": 1000000000,
        "fish_entries_with_catches": 2,
        "fish_king_entries_with_catches": 1,
        "largest_recorded_size_in_fish_entries": 300,
    }

    # The original summation is u32: a corrupt/edited high count can wrap.
    struct.pack_into("<I", data, fish + 8 * 8, 0xFFFFFFFF)
    struct.pack_into("<I", data, fish + 9 * 8, 0xFFFFFFFF)
    struct.pack_into("<I", data, fish + 53 * 8, 0)
    checksum = sum(data[payload_start:payload_start + PAYLOAD_SIZE]) & 0xFFFFFFFF
    struct.pack_into("<I", data, slot0 + CHECKSUM_OFFSET, checksum)
    overflow = inspect_sram(bytes(data))["slots"][0]["saved_state_view"]
    assert overflow["fishing_records"]["total_fish_caught_retail_cap"] == 999999999

    for invalid in (b"", bytes(SRAM_SIZE - 1), bytes(SRAM_SIZE + 1)):
        try:
            inspect_sram(invalid)
        except ValueError:
            pass
        else:
            raise AssertionError("Size check must reject malformed SRAM dumps")
    print("SRAM inspector self-test: passed (header/slot consistency, malformed files, money/buffer/transition fields, fishing totals and Fish King entries)")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("file", nargs="?", type=Path, help="Unmodified 32768-byte SRAM dump")
    parser.add_argument("--self-test", action="store_true", help="Run synthetic, non-game fixtures")
    args = parser.parse_args()

    if args.self_test:
        self_test()
        return
    if args.file is None:
        parser.error("Supply an SRAM file or --self-test")
    report = inspect_sram(args.file.read_bytes())
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
