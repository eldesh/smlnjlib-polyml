POLYML      ?= poly
POLYMLC     ?= polyc
POLYMLFLAGS ?= -q --error-exit --use "../../script/load.sml"
MLLEX       ?= mllex-polyml
MLYACC      ?= mlyacc-polyml

TARGET := \
	smlnj-util-lib.poly \
	regexp-lib.poly \
	html-lib.poly \
	pp-lib.poly


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


html-lib.poly: smlnj-util-lib.poly $(wildcard ./HTML/*)
	@echo "MLYACC_LIB: $(MLYACC_LIB)"
ifeq ($(MLYACC_LIB),)
	$(error "Please set MLYACC_LIB to path to mlyacc-lib-1.0.0.poly")
endif
	$(call build-module,HTML,./$< $(MLYACC_LIB))


pp-lib.poly: smlnj-util-lib.poly html-lib.poly $(wildcard ./PP/src/* ./PP/pp-lib.cm ./PP/devices/*)
	$(call build-module,PP,./smlnj-util-lib.poly ./html-lib.poly)


%.lex.sml: %.lex
	@echo "  [MLLEX] $<"
	@$(MLLEX) $<


%.gram.sml %.gram.sig %.gram.desc: %.grm
	@echo "  [MLYACC] $<"
	@$(MLYACC) $<


.PHONY: clean
clean:
	-$(RM) $(TARGET)

