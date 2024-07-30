#!/bin/bash

mkdir build && pushd build

# do *not* set CMAKE_INSTALL_PATH here
# as it's constructed from CODON_PATH
cmake .. -DCMAKE_BUILD_TYPE=Release \
 -DLLVM_DIR=$(llvm-config --cmakedir) \
 -DCMAKE_C_COMPILER=clang \
 -DCMAKE_CXX_COMPILER=clang++ \
 -DCMAKE_POLICY_DEFAULT_CMP0169=OLD \
 -DCODON_PATH=${PREFIX}

make
make install
