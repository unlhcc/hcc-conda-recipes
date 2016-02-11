#!/bin/bash

./autogen.sh
export C_INCLUDE_PATH=${PREFIX}/include
export LDFLAGS="-L${PREFIX}/lib"
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

./configure --prefix=${PREFIX}
make
make install
