#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include
export LIBRARY_PATH=${PREFIX}/lib
export LD_LIBRARY_PATH=${PREFIX}/lib
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

./configure --prefix=${PREFIX} \
    --with-readline=${PREFIX} \
    --with-zlib=${PREFIX} \
    --with-expat=${PREFIX} \
    --with-openssl=${PREFIX} \
    --enable-packager-mode

make
make install
