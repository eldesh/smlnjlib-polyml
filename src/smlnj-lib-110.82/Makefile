POLYML      ?= poly
POLYMLC     ?= polyc
POLYMLFLAGS ?= -q --error-exit --use "../../script/load.sml"
MLLEX       ?= mllex-polyml
MLYACC      ?= mlyacc-polyml

TARGET := \
	smlnj-util-lib.poly \
	regexp-lib.poly \
	html-lib.poly \
	pp-lib.poly \
	hash-cons-lib.poly \
	unsafe.poly

HTML_SRC := \
	HTML/html-sig.sml \
	HTML/html.sml \
	HTML/html-attr-vals.sml \
	HTML/html-attrs-sig.sml \
	HTML/html-error-sig.sml \
	HTML/html-attrs-fn.sml \
	HTML/html-gram.sig \
	HTML/html-elements-fn.sml \
	HTML/html-lex.sml \
	HTML/html-gram.sml \
	HTML/check-html-fn.sml \
	HTML/html-parser-fn.sml \
	HTML/html-defaults.sml \
	HTML/make-html.sml \
	HTML/pr-html.sml \
	HTML/export.sml \
	HTML/load.sml


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


html-lib.poly: smlnj-util-lib.poly $(HTML_SRC)
	@echo "MLYACC_LIB: $(MLYACC_LIB)"
ifeq ($(MLYACC_LIB),)
	$(error Please set MLYACC_LIB to path to mlyacc-lib-1.0.0.poly)
endif
	$(call build-module,HTML,./$< $(MLYACC_LIB))


pp-lib.poly: smlnj-util-lib.poly html-lib.poly $(wildcard ./PP/src/* ./PP/pp-lib.cm ./PP/devices/*)
	$(call build-module,PP,./smlnj-util-lib.poly ./html-lib.poly)


hash-cons-lib.poly: smlnj-util-lib.poly $(wildcard ./HashCons/*)
	$(call build-module,HashCons,./$<)


%-lex.sml: %-lex
	@echo "  [MLLEX] $<"
	@$(MLLEX) $<


%-gram.sml %-gram.sig %-gram.desc: %-gram
	@echo "  [MLYACC] $<"
	@$(MLYACC) $<


.PHONY: clean
clean:
	-$(RM) $(TARGET)
	-$(RM) HTML/html-gram.sig
	-$(RM) HTML/html-gram.sml
	-$(RM) HTML/html-gram.desc
	-$(RM) HTML/html-lex.sml

