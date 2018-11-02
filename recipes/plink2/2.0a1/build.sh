#!/bin/bash

export CPATH=${PREFIX}/include
export CMAKE_LDFLAGS="-L${PREFIX}/lib"
export LIBRARY_PATH=${PREFIX}/lib
export LD_LIBRARY_PATH=${PREFIX}/lib

cd 2.0/build_dynamic
make
cp plink2 pgen_compress $PREFIX/bin/
