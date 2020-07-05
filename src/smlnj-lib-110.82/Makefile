POLYML      ?= poly
POLYMLC     ?= polyc
POLYMLFLAGS ?= -q --error-exit --use "../../script/load.sml"

TARGET := \
	unsafe.poly \
	smlnj-util-lib.poly \
	regexp-lib.poly


define build-module
@echo "  [POLYML] $@"
@echo "" | $(POLYML) $(POLYMLFLAGS) \
	$(foreach dep,$(2),--eval 'PolyML.loadModule "$(dep)"') \
	--eval 'load "./$(1)/load.sml"' \
	--use ./$(1)/export.sml \
	--eval 'PolyML.SaveState.saveModule ("$@", $(1))'
endef


all: $(TARGET)


unsafe.poly: $(wildcard ./Unsafe/*)
	$(call build-module,Unsafe)


smlnj-util-lib.poly: unsafe.poly $(wildcard ./Util/*.sml)
	$(call build-module,Util,./unsafe.poly)


regexp-lib.poly: smlnj-util-lib.poly $(wildcard ./RegExp/*.sml ./RegExp/BackEnd/* ./RegExp/FrontEnd/* ./RegExp/Glue/*)
	$(call build-module,RegExp,./$<)


.PHONY: clean
clean:
	-$(RM) $(TARGET)

