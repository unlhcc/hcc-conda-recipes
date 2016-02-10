#!/bin/bash

export LD_LIBRARY_PATH=${PREFIX}/lib
export C_INCLUDE_PATH=${PREFIX}/include
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

./bootstrap.sh
./configure --prefix=${PREFIX}
make
make install
