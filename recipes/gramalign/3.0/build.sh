#!/bin/bash

mkdir -p ${PREFIX}/bin

cd GramAlign3_00/src
make clean

make CC=${CC}

chmod +x GramAlign
cp GramAlign ${PREFIX}/bin/GramAlign
