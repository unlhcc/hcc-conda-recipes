#!/bin/bash

export CPATH=${PREFIX}/include
export LD_LIBRARY_PATH=${PREFIX}/lib
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

./configure --prefix=${PREFIX} --without-ffmpeg --enable-static=no
make
make install
