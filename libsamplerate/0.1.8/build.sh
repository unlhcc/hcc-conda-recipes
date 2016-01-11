#!/bin/bash
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
./configure --enable-shared --prefix=${PREFIX}
make
make check
make install
