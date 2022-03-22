#!/bin/bash

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCOMP_GUI=ON -DCOMP_PLUGINS=ON ..
make -j4 V=1
make install
