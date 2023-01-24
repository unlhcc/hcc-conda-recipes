#!/bin/bash

export CPATH=${PREFIX}/include
export LD_LIBRARY_PATH=${PREFIX}/lib
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

if [ `uname` == Darwin ]; then
    autoreconf -ivf
    ./configure --prefix=${PREFIX} --without-x --disable-amd64 --disable-mmx --disable-static
else
    ./configure --prefix=${PREFIX} --with-x --enable-amd64 --disable-mmx --disable-static
fi

make
make install
