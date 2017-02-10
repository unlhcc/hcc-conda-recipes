#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include
export LIBRARY_PATH=${PREFIX}/lib

./autogen.sh
./configure --prefix=${PREFIX} --with-pkgconfigdir=${PREFIX}/lib/pkgconfig
make
make install
