#!/bin/bash

export CPATH=${PREFIX}/include
export LD_LIBRARY_PATH=${PREFIX}/lib
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

if [ `uname` == Darwin ]; then
    ./configure --prefix=${PREFIX} --without-x --disable-amd64 --disable-mmx
else
    ./configure --prefix=${PREFIX} --without-x --enable-amd64 --disable-mmx
fi

make
make install
