
POLYML              := poly
POLYMLC             := polyc
POLYMLFLAGS         := -q --error-exit --use $(shell readlink -f ./script/load.sml)
MLLEX               := mllex-polyml
MLYACC              := mlyacc-polyml

# library version
SMLNJLIB_POLYML_VER := 0.0.1

# the original library version
SMLNJLIB_VER        := 110.82

# build directory
BUILD_DIR           := ./build

# install prefix
PREFIX              := /usr/local/polyml
LIBDIR              := /usr/local/polyml/lib
MLYACC_LIB          := mlyacc-lib/mlyacc-lib-1.0.0.poly

export POLYML
export POLYMLC
export POLYMLFLAGS
export MLLEX
export MLYACC
export LIBDIR
export MLYACC_LIB


all: build_lib


.PHONY: build_lib
build_lib:
	$(MAKE) -C src/smlnj-lib-$(SMLNJLIB_VER)
	@mkdir -p $(BUILD_DIR)
	@for lib in src/smlnj-lib-$(SMLNJLIB_VER)/*.poly; do \
		dst=$(BUILD_DIR)/$$(basename $${lib%.poly}-$(SMLNJLIB_POLYML_VER).poly) ; \
		cp $$lib $$dst ; \
	done


.PHONY: install
install: build_lib
	@for lib in $(BUILD_DIR)/*.poly; do \
		echo "install -D -m 0644 -t $(PREFIX)/lib/smlnj-lib-$(SMLNJLIB_VER) $$lib" ; \
		install -D -m 0644 -t $(PREFIX)/lib/smlnj-lib-$(SMLNJLIB_VER) $$lib ; \
	done


.PHONY: clean
clean:
	$(MAKE) -C ./src/smlnj-lib-$(SMLNJLIB_VER) clean
	-$(RM) -r $(BUILD_DIR)

