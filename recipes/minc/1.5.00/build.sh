#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include:${SRC_DIR}/nifti:$C_INCLUDE_PATH
export LD_LIBRARY_PATH=${PREFIX}/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=${PREFIX}/lib:$LIBRARY_PATH
export LDFLAGS="-Wl,--unresolved-symbols=ignore-all $LDFLAGS"

./autogen.sh
./configure --prefix=${PREFIX} \
    --with-build-path=${PREFIX} \
    --enable-shared

make
make install
