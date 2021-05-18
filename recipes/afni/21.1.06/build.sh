#!/bin/bash

#export C_INCLUDE_PATH=${PREFIX}/include:$C_INCLUDE_PATH
#export LD_LIBRARY_PATH=${PREFIX}/lib:$LD_LIBRARY_PATH
#export LIBRARY_PATH=${PREFIX}/lib:$LIBRARY_PATH

export GIT_DESCRIBE_TAG=${PKG_VERSION}
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} ..
make -j4 V=1
make install
