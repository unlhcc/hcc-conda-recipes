#!/bin/bash

mkdir -p ${PREFIX}/bin

cd GramCluster1_3/src
make clean

make CC=${CC}

chmod +x GramCluster
cp GramCluster ${PREFIX}/bin/GramCluster
