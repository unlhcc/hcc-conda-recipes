#!/bin/bash

# Build the static lib version, shared lib is broken: https://gitlab.com/siesta-project/libraries/libpsml/-/issues/4
./configure --prefix=${PREFIX} --enable-shared=no --enable-static=yes --with-xmlf90=${PREFIX}
make
make install
