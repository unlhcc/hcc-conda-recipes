#!/bin/bash

cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} ../source
make
make install
