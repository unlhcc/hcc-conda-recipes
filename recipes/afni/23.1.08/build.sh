#!/bin/bash

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCOMP_GUI=ON -DCOMP_PLUGINS=ON -DSTANDARD_PYTHON_INSTALL=ON \
    -DPython_ROOT_DIR=${PREFIX} ..
make -j4 V=1
make install
