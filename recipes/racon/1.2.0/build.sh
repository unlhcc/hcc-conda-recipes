#!/bin/bash

mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-mno-avx" -Dracon_build_wrapper=ON ..
make -j 2
make install

cp bin/racon_wrapper ${PREFIX}/bin
