#!/bin/bash

mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-mno-avx" ..
make -j 2
make install
