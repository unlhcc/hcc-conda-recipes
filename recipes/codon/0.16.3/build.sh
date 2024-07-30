#!/bin/bash

mkdir build && pushd build

cmake .. -DCMAKE_BUILD_TYPE=Release \
 -DLLVM_DIR=$(llvm-config --cmakedir) \
 -DCMAKE_C_COMPILER=clang \
 -DCMAKE_CXX_COMPILER=clang++ \
 -DCMAKE_POLICY_DEFAULT_CMP0169=OLD \
 -DCMAKE_INSTALL_PREFIX=${PREFIX}

make -j 4
make install
