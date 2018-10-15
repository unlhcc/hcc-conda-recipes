#!/bin/bash

mkdir build && cd build
export C_INCLUDE_PATH=${PREFIX}/include
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE='Release' -DHAVE_LIBSCOTCH:BOOL=ON ../src
make -j 2
make install
