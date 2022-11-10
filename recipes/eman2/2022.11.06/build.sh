#!/bin/bash

mkdir build
cd build

cmake \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DENABLE_OPTIMIZE_MACHINE=ON \
    -DPython3_EXECUTABLE=${PREFIX}/bin/python \
     ..

make -j4
make install
