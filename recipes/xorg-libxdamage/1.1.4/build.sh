#!/bin/bash

export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

./configure --prefix=${PREFIX} \
    --disable-dependency-tracking \
    --disable-selective-werror \
    --disable-silent-rules

make
make install
