#!/bin/bash

mkdir -p ${PREFIX}/bin

export GPU_INCLUDE_PATH=${PREFIX}/include
export GPU_LIBRARY_PATH=${PREFIX}/lib

make DEVICE=CUDA NUMWI=32 CPP=${CXX} CC=${CC}
make DEVICE=CUDA NUMWI=64 CPP=${CXX} CC=${CC}
make DEVICE=CUDA NUMWI=128 CPP=${CXX} CC=${CC}
make DEVICE=CUDA NUMWI=256 CPP=${CXX} CC=${CC}

cp bin/* ${PREFIX}/bin
