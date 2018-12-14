#!/bin/bash

export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
mkdir build && pushd build

cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DCMAKE_PREFIX_PATH=${PREFIX} \
    -DCMAKE_CXX_FLAGS=-I${PREFIX}/include \
    -DCMAKE_C_FLAGS=-I${PREFIX}/include ..

make -j 4
make install
