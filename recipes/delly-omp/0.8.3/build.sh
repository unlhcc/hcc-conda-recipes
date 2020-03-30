#!/bin/sh

mkdir -p ${PREFIX}/bin

make PARALLEL=1 all CXX=$CXX

cp src/delly $PREFIX/bin
chmod +x ${PREFIX}/bin/delly
