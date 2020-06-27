POLYML      ?= poly
POLYMLC     ?= polyc
POLYMLFLAGS ?= -q --error-exit --use "../../script/load.sml"

SRC := $(wildcard ./Util/*.sml)

TARGET := smlnj-util-lib-$(SMLNJLIB_POLYML_VER).poly

all: $(TARGET)


$(TARGET): $(SRC)
	@echo "  [POLYML] $@"
	@echo "" | $(POLYML) $(POLYMLFLAGS) \
		--eval 'load "./Util/smlnj-lib-polyml.sml"' \
		--use ./Util/export.sml \
		--eval 'PolyML.SaveState.saveModule ("$(TARGET)", SmlnjUtilLib)'


.PHONY: clean
clean:
	-$(RM) $(TARGET)

