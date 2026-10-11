.SUFFIXES:

# ==================
# = PROJECT CONFIG =
# ==================

BUILD_NAME := fomt

INCLUDE_DIRS := \
  tools/agbcc/include \
  tools/libagbc++ \
  tools/libsix/include

SRC_DIR = src
ASM_DIR = asm
DATA_ASM_DIR = asm/data
BUILD_DIR = build

ITEM_ICON_BANK := $(BUILD_DIR)/assets/item_icon_bank.bin
ITEM_ICON_MANIFEST := assets/item_icons/manifest.json
ITEM_ICON_ASSETS := $(shell find assets/item_icons -type f \( -name '*.png' -o -name '*.json' \) ! -name 'manifest.json' | sort)

# ====================
# = TOOL DEFINITIONS =
# ====================

TOOLCHAIN ?= $(DEVKITARM)

ifneq (,$(TOOLCHAIN))
  export PATH := $(TOOLCHAIN)/bin:$(PATH)
endif

PREFIX := arm-none-eabi-

export OBJCOPY := $(PREFIX)objcopy
export AS := $(PREFIX)as
export CPP := $(PREFIX)cpp
export LD := $(PREFIX)ld
export STRIP := $(PREFIX)strip

ifeq ($(OS),Windows_NT)
  EXE := .exe
else
  EXE :=
endif

CC1      := tools/agbcc/bin/agbcc$(EXE)
CC1PLUS  := tools/agbcc/bin/agbcp$(EXE)

OLD_CC1  := tools/agbcc/bin/old_agbcc$(EXE)

# ================
# = BUILD CONFIG =
# ================

INCFLAGS     := $(foreach dir, $(INCLUDE_DIRS), -I "$(dir)")

CPPFLAGS := $(INCFLAGS) -iquote . -iquote include -Wno-trigraphs -fno-exceptions
CFLAGS   := -g -mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm
CXXFLAGS := -quiet -fno-exceptions -fno-rtti -fvtable-thunks $(CFLAGS)
ASFLAGS  := $(INCFLAGS) -I . -I include -mcpu=arm7tdmi

ROM := $(BUILD_NAME).gba
ELF := $(ROM:.gba=.elf)
MAP := $(ROM:.gba=.map)
LDS := $(BUILD_NAME).lds

C_SRCS := $(wildcard $(SRC_DIR)/*.c $(SRC_DIR)/rt/*.c)
C_OBJS := $(C_SRCS:%.c=$(BUILD_DIR)/%.o)

CXX_SRCS := $(wildcard $(SRC_DIR)/*.cc $(SRC_DIR)/rt/*.cc)
CXX_OBJS := $(CXX_SRCS:%.cc=$(BUILD_DIR)/%.o)

ASM_SRCS := $(wildcard $(SRC_DIR)/*.s $(ASM_DIR)/*.s)
ASM_OBJS := $(ASM_SRCS:%.s=$(BUILD_DIR)/%.o)

DATA_ASM_SRCS := $(wildcard $(DATA_ASM_DIR)/*.s)
DATA_ASM_OBJS := $(DATA_ASM_SRCS:%.s=$(BUILD_DIR)/%.o)

ALL_OBJS := $(C_OBJS) $(CXX_OBJS) $(ASM_OBJS) $(DATA_ASM_OBJS)
ALL_DEPS := $(ALL_OBJS:%.o=%.d)

SUBDIRS := $(sort $(dir $(ALL_OBJS)))
$(shell mkdir -p $(SUBDIRS))

# ===========
# = RECIPES =
# ===========

compare: $(ROM)
	sha1sum -c $(BUILD_NAME).sha1
	@python3 tools/ches/save_progress.py

progress: $(ROM)
	@python3 tools/scripts/calcprogress.py $(MAP)
	@python3 tools/ches/save_progress.py
	@sha1sum -c $(BUILD_NAME).sha1
	@printf "branch: "
	@git branch --show-current
	@printf "head: "
	@git log -1 --format='%h %s'

.PHONY: compare progress docs-check save-check save-verify save-progress ci test readability-check readability-report

# Fast documentation and save-track preflight. No ROM build required.
docs-check:
	@python3 tools/ches/check_docs.py

save-check: docs-check
	@python3 tools/ches/check_save_evidence.py
	@python3 tools/ches/native_selector_map.py --check --self-test
	@python3 tools/ches/inspect_sram.py --self-test

# Fast source-only triage: show the current evidence locations on demand, and
# reject *new* hard-register / executable inline-ASM debt without review.
readability-check:
	@python3 tools/ches/audit_source_readability.py --self-test
	@python3 tools/ches/audit_source_readability.py --check

readability-report:
	@python3 tools/ches/audit_source_readability.py --details

# In CI we cannot assume a legally obtained original ROM or matching toolchain.
# These are all independently runnable source-only automated tests.
ci: save-check
	@bash tools/scripts/tests/calcrom_test.sh
	@python3 -m py_compile tools/ches/check_docs.py tools/ches/check_save_evidence.py tools/ches/save_progress.py tools/ches/audit_docs.py tools/ches/inspect_sram.py tools/ches/audit_source_readability.py tools/ches/native_selector_map.py
	@$(MAKE) readability-check
	@python3 tools/ches/save_progress.py

# Full local automated suite, requiring the original ROM and matching compiler.
# The nested compare rechecks readability deliberately because it is also a
# standalone build entrypoint; this is a small source scan, not another rebuild.
# This proves the complete built ROM, not a real interactive emulator load.
test: ci
	@$(MAKE) -B -j4 compare
	@$(MAKE) progress

save-progress:
	@python3 tools/ches/save_progress.py

# Stronger gate for actual save-code changes, retaining the original hash check.
save-verify: save-check
	@$(MAKE) -B -j4 compare


# Both ROM and ELF build targets run the fast readability regression guard,
# even when invoked directly (make fomt.gba / make fomt.elf). Order-only
# prerequisites prevent a phony source check from forcing relinks. GNU make
# runs the shared guard once per invocation, not once per compiled source.
$(ROM) $(ELF): | readability-check

# ROM from ELF
%.gba: %.elf
	$(OBJCOPY) -O binary $< $@

# ELF
$(ELF): $(ALL_OBJS) $(LDS)
	@echo "LD $(LDS) $(ALL_OBJS:$(BUILD_DIR)/%=%)"
	@cd $(BUILD_DIR) && $(LD) -T ../$(LDS) -Map ../$(MAP) -L../tools/agbcc/lib -lgcc -lc $(ALL_OBJS:$(BUILD_DIR)/%=%) -o ../$@
	@$(STRIP) -N .gcc2_compiled. $(ELF)

# C dependency file
$(BUILD_DIR)/%.d: %.c
	@$(CPP) $(CPPFLAGS) $< -o $@ -MM -MG -MT $@ -MT $(BUILD_DIR)/$*.o

# C object
$(BUILD_DIR)/%.o: %.c $(BUILD_DIR)/%.d
	@echo "CC $<"
	@$(CPP) $(CPPFLAGS) $< | $(CC1) $(CFLAGS) -o $(BUILD_DIR)/$*.s
	@tools/scripts/align_sections.sh $(BUILD_DIR)/$*.s
	@$(AS) $(ASFLAGS) $(BUILD_DIR)/$*.s -o $@ 

# C++ dependency file
$(BUILD_DIR)/%.d: %.cc
	@$(CPP) $(CPPFLAGS) $< -o $@ -MM -MG -MT $@ -MT $(BUILD_DIR)/$*.o

# C++ object
$(BUILD_DIR)/%.o: %.cc $(BUILD_DIR)/%.d
	@echo "CP $<"
	@$(CPP) $(CPPFLAGS) $< | ($(CC1PLUS) $(CXXFLAGS) -o $(BUILD_DIR)/$*.s || false)
	@tools/scripts/align_sections.sh $(BUILD_DIR)/$*.s
	@$(AS) $(ASFLAGS) $(BUILD_DIR)/$*.s -o $@

# ASM dependency file (dummy, generated with the object)
$(BUILD_DIR)/%.d: $(BUILD_DIR)/%.o
	@touch $@

# Generated item-icon bank. Converted icons come from editable PNG/JSON assets;
# unresolved portions of the packed retail bank remain preserved from baserom.
$(ITEM_ICON_BANK): baserom.gba tools/packed_sprite_bank.py $(ITEM_ICON_MANIFEST) $(ITEM_ICON_ASSETS)
	@mkdir -p $(dir $@)
	@python3 tools/packed_sprite_bank.py build-bank --manifest $(ITEM_ICON_MANIFEST) --out $@

$(BUILD_DIR)/asm/data/data_0813B288.o: $(ITEM_ICON_BANK)

# ASM object
$(BUILD_DIR)/%.o: %.s
	@echo "AS $<"
	@$(AS) $(ASFLAGS) $< -o $@ --MD $(BUILD_DIR)/$*.d

# overrides for matching
$(BUILD_DIR)/src/m4a.o: CC1 := $(OLD_CC1)

clean:
	@echo "RM $(ROM) $(ELF) $(MAP) $(BUILD_DIR)"
	@rm -f $(ROM) $(ELF) $(MAP) 
	@rm -r $(BUILD_DIR)/

.PHONY: clean

ifneq (clean,$(MAKECMDGOALS))
-include $(ALL_DEPS)
.PRECIOUS: $(BUILD_DIR)/%.d
endif
