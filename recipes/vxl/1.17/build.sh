#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include:${SRC_DIR}/nifti:$C_INCLUDE_PATH
export LD_LIBRARY_PATH=${PREFIX}/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=${PREFIX}/lib:$LIBRARY_PATH

mkdir build && pushd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DBUILD_VGUI:BOOL=OFF \
    -DBUILD_CONTRIB:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILD_EXAMPLES:BOOL=OFF \
    -DWITH_FFMPEG=False \
    -DCMAKE_BUILD_TYPE=Release ..
make -j 2
make install
