#!/bin/bash

mkdir -p ${PREFIX}/bin

cd GramDist/src
make clean

make CC=${CC}

chmod +x GramDist
cp GramDist ${PREFIX}/bin/GramDist
