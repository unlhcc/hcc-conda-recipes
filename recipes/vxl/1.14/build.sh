#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include:${SRC_DIR}/nifti:$C_INCLUDE_PATH
export LD_LIBRARY_PATH=${PREFIX}/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=${PREFIX}/lib:$LIBRARY_PATH
export CXXFLAGS="-fpermissive $CXXFLAGS"

mkdir build && pushd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DBUILD_VGUI:BOOL=OFF \
    -DBUILD_CONTRIB:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILD_EXAMPLES:BOOL=OFF \
    -DWITH_FFMPEG:BOOL=OFF \
    -DCMAKE_BUILD_TYPE=Release ..
make -j ${CPU_COUNT}
make install
