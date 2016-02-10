#!/bin/bash
export LD_LIBRARY_PATH=${PREFIX}/lib
export C_INCLUDE_PATH=${PREFIX}/include
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_C_FLAGS="-I${PREFIX}/include -L${PREFIX}/lib" .
#cmake -DCMAKE_INSTALL_PREFIX=${PREFIX}  .
make
make install
