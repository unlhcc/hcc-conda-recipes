#!/bin/bash

mkdir build && pushd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DWITH_EXAMPLES=OFF \
    -DENABLE_PLUGIN_LOADING=OFF \
..

make
make install
