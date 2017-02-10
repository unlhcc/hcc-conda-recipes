#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include
export LDFLAGS="-L${PREFIX}/lib"
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
./configure --prefix=${PREFIX} --with-fileio=sndfile --enable-nasm
make
make install
