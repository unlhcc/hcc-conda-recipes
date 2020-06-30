#!/bin/bash

export FLAGS="-w -std=gnu99 -Wall -O3 -mfpmath=sse -msse4 -funroll-loops -ftracer -fopenmp -pipe -march=nocona -mtune=haswell -ftree-vectorize -fPIC -fstack-protector-strong -fno-plt -O2 -ffunction-sections -pipe -isystem $PREFIX/include"
export RLIB_LIB="-L${PREFIX}/lib -L${PREFIX}/lib/R/lib -lRmath -lR"
export RLIB_INC="-DINLA_WITH_RMATH -DINLA_LIBR -I${PREFIX}/lib/R/include"
pushd inlaprog
make CC=${CC} CXX=${CXX} FC=${FC} PREFIX=${PREFIX} LEXTPREFIX=${PREFIX} FLAGS="${FLAGS}" RLIB_LIB="${RLIB_LIB}" RLIB_INC="${RLIB_INC}"
make install PREFIX=${PREFIX}
