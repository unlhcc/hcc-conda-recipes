#!/bin/bash

mkdir -p ${PREFIX}/bin/

export C_INCLUDE_PATH=${PREFIX}/include
export LIBRARY_PATH=${PREFIX}/lib

make CC=${CC} CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"

# copy binary in bin
cp -f nQuire ${PREFIX}/bin/
chmod +x ${PREFIX}/bin/nQuire
