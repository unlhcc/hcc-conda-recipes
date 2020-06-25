#!/bin/bash

export C_INCLUDE_PATH="${PREFIX}/include:$C_INCLUDE_PATH"
export LD_LIBRARY_PATH="${PREFIX}/lib:$LD_LIBRARY_PATH"
export LIBRARY_PATH="${PREFIX}/lib:$LIBRARY_PATH"

mkdir -p ${PREFIX}/include ${PREFIX}/lib
cp ${RECIPE_DIR}/linux.mk ${SRC_DIR}/config
./configure
make
cp src/taucs.h ${PREFIX}/include
cp lib/linux/libtaucs.a ${PREFIX}/lib
