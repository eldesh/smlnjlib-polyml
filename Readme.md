# SMLNJ-LIB for Poly/ML

`smlnj-lib` is a collection of utility libraries for Standard ML.

The original `smlnj-lib` is distributed with SML/NJ.
But `smlnj-lib` has been ported to MLton with some adjustment. (see [MLton/SMLNJLibrary][njlib_mlton])

This repository provides re-ported `smlnj-lib` from MLton to Poly/ML.


## Build

To build `smlnj-lib`, run the default target of make.

```sh
$ make
```

`smlnj-lib` depends on `mlyacc-lib`.
Therefore, if you do not have `/usr/local/polyml/lib/mlyacc-lib/mlyacc-lib-1.0.0.poly`, please set `LIBDIR` or `MLYACC_LIB`:

```sh
$ make LIBDIR=~/.sml/polyml/5.8.1/lib
```

The path to the `mlyacc-lib` is referenced with `$(LIBDIR)/$(MLYACC_LIB)`.
By default, these variables are set to `/usr/local/polyml/lib` and `mlyacc-lib/mlyacc-lib-1.0.0.poly` each other.


## Install

To install library, run the `install` target.

```sh
$ make install
```

To change the installation directory, specify `PREFIX`:

```sh
$ make install PREFIX=~/.sml/polyml/5.8.1
```


## Load into REPL

For loading smlnjlib into Poly/ML REPL, use `PolyML.loadModule` function.

```sh
$ make
$ poly
> PolyML.loadModule "./build/smlnj-util-lib-0.0.1.poly";
```


## License

see LICENSE file for details.


[njlib_mlton]: http://mlton.org/SMLNJLibrary "smlnj-lib"

