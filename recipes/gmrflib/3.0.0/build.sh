#!/bin/bash

export FLAGS="-std=gnu99 -Wall -O3 -mfpmath=sse -msse4 -funroll-loops -ftracer -fopenmp -pipe -march=nocona -mtune=haswell -ftree-vectorize -fPIC -fstack-protector-strong -fno-plt -O2 -ffunction-sections -pipe -isystem $PREFIX/include"
pushd gmrflib
make CC=${CC} FC=${FC} PREFIX=${PREFIX} LEXTPREFIX=${PREFIX} FLAGS="${FLAGS}"
make install PREFIX=${PREFIX}
