
export POLYML      := poly
export POLYMLC     := polyc
export POLYMLFLAGS := -q --error-exit --use "../../script/load.sml"

# library version
SMLNJLIB_POLYML_VER := 0.0.1

# the original library version
SMLNJLIB_VER        := 110.82

# build directory
BUILD_DIR           := ./build

# install prefix
PREFIX              := /usr/local
LIB_DIR             := $(PREFIX)/lib/polyml


all: build_lib


.PHONY: build_lib
build_lib:
	$(MAKE) -C src/smlnj-lib-$(SMLNJLIB_VER)
	mkdir -p $(BUILD_DIR)
	@for lib in src/smlnj-lib-$(SMLNJLIB_VER)/*.poly; do \
		dst=$(BUILD_DIR)/$$(basename $${lib%.poly}-$(SMLNJLIB_POLYML_VER).poly) ; \
		echo "cp $$lib $$dst" ; \
		cp $$lib $$dst ; \
	done


.PHONY: install
install: build_lib
	@for lib in $(BUILD_DIR)/*.poly; do \
		echo "install -D -m 0644 -t $(LIB_DIR) $$lib" ; \
		install -D -m 0644 -t $(LIB_DIR) $$lib ; \
	done


.PHONY: clean
clean:
	$(MAKE) -C ./src/smlnj-lib-$(SMLNJLIB_VER) clean
	-$(RM) -r $(BUILD_DIR)

