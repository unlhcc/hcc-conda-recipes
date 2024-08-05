#!/bin/bash

mkdir -p ${PREFIX}/bin

export CFLAGS="$CFLAGS -I$PREFIX/include"
export LDFLAGS="$LDFLAGS -L$PREFIX/lib"
export CPATH=${PREFIX}/include

make
chmod +x gsufsort*
cp gsufsort* ${PREFIX}/bin
