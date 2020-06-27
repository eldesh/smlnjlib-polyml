POLYML ?= poly
POLYMLC ?= polyc
POLYMLFLAGS ?= -q --error-exit --use "../../script/load.sml"

SRC := $(wildcard ./smlnj-lib/Util/*.sml)

VERSION := 0.0.1
TARGET := smlnj-util-lib-$(VERSION).poly

all: $(TARGET)


$(TARGET): $(SRC)
	echo "" | $(POLYML) $(POLYMLFLAGS) \
		--eval 'load "./smlnj-lib/Util/smlnj-lib-polyml.sml"' \
		--use ./smlnj-lib/Util/export.sml \
		--eval 'PolyML.SaveState.saveModule ("$(TARGET)", SmlnjUtilLib)'


.PHONY: clean
clean:
	-$(RM) $(TARGET)

