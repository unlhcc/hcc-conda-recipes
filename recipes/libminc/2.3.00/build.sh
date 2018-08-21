#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include:${SRC_DIR}/nifti:$C_INCLUDE_PATH
export LD_LIBRARY_PATH=${PREFIX}/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=${PREFIX}/lib:$LIBRARY_PATH

mkdir build && pushd build
cmake -DCMAKE_BUILD_TYPE:STRING=Release \
    -DLIBMINC_MINC1_SUPPORT:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DLIBMINC_BUILD_SHARED_LIBS:BOOL=ON ..
make
make install
