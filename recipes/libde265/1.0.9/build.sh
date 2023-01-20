#!/bin/bash

mkdir build && pushd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
..

make -j 4
make install
