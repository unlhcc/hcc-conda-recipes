#!/bin/bash

mkdir -p ${PREFIX}/bin

export GPU_INCLUDE_PATH=${PREFIX}/include
export GPU_LIBRARY_PATH=${PREFIX}/lib

make DEVICE=GPU NUMWI=64 CPP=${CXX}
make DEVICE=GPU NUMWI=128 CPP=${CXX}
make DEVICE=GPU NUMWI=256 CPP=${CXX}

cp bin/* ${PREFIX}/bin