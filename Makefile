
export POLYML      := poly
export POLYMLC     := polyc
export POLYMLFLAGS := -q --error-exit --use "../../script/load.sml"

export SMLNJLIB_POLYML_VER := 0.0.1

SMLNJLIB_VER := 110.82

all:
	$(MAKE) -C ./src/smlnj-lib-$(SMLNJLIB_VER)

.PHONY: clean
clean:
	$(MAKE) -C ./src/smlnj-lib-$(SMLNJLIB_VER) clean

