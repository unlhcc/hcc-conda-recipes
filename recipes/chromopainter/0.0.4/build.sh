#!/bin/bash

mkdir -p $PREFIX/bin

./configure --prefix=$PREFIX CFLAGS="${CFLAGS} -Wno-error=incompatible-pointer-types"
make
make install
