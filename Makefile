
export POLYML      := poly
export POLYMLC     := polyc
export POLYMLFLAGS := -q --error-exit --use "../../script/load.sml"

SMLNJLIB_POLYML_VER := 0.0.1

SMLNJLIB_VER := 110.82

LIBDIR := ./lib

all:
	$(MAKE) -C src/smlnj-lib-$(SMLNJLIB_VER)
	mkdir -p $(LIBDIR)
	for lib in src/smlnj-lib-$(SMLNJLIB_VER)/*.poly; do \
		cp $${lib} $(LIBDIR)/$$(basename $${lib%.poly}-$(SMLNJLIB_POLYML_VER).poly) ; \
	done


.PHONY: clean
clean:
	$(MAKE) -C ./src/smlnj-lib-$(SMLNJLIB_VER) clean
	-$(RM) -r $(LIBDIR)

