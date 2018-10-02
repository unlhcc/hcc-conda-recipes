#!/bin/bash

mkdir build && cd build

cmake -DCMAKE_INCLUDE_PATH=${PREFIX}/include -DCMAKE_LIBRARY_PATH=${PREFIX}/lib -DCMAKE_INSTALL_PREFIX=${PREFIX} ..

make VERBOSE=1
make install
