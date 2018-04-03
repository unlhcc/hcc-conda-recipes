#!/bin/bash

mkdir build && cd build
cmake -D CMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-mno-avx" ..
make -j 2
