#!/bin/bash

export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

./configure --prefix=${PREFIX} \
    --with-readline=${PREFIX} \
    --with-zlib=${PREFIX} \
    --with-expat=${PREFIX} \
    --with-openssl=${PREFIX} \
    --enable-packager-mode \
    --disable-silent-rules \
    --enable-static=no

make
make install
