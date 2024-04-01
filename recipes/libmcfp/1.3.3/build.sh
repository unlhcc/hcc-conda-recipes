#!/bin/bash

mkdir build
cd build 

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_CXX_COMPILER=$CXX ..
cmake --build .
cmake --install . --prefix $PREFIX
