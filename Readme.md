# SMLNJ-LIB for Poly/ML

`smlnj-lib` is a collection of utility libraries for Standard ML.

The original `smlnj-lib` is distributed with SML/NJ.
But `smlnj-lib` has been ported to MLton with some adjustment. (see [MLton/SMLNJLibrary][njlib_mlton])

This repository provides re-ported `smlnj-lib` from MLton to Poly/ML.


## Build

Build with `make`.

```sh
$ make
```


## Install

Install library with `make install`.

```sh
$ sudo make install
```

It is also possible specify install directory with `PREFIX` parameter.

```sh
$ sudo make PREFIX=$HOME/local install
```


## License

see LICENSE file for details.


[njlib_mlton]: http://mlton.org/SMLNJLibrary

