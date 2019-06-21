#!/bin/bash

export LIBRARY_PATH=${LIBRARY_PATH}:${PREFIX}/lib

mkdir build
cd build

../src/configure --prefix=${PREFIX} --with-boost=${PREFIX}

make -j4
make install
