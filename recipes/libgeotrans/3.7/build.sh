#!/bin/bash

mkdir -p ${PREFIX}/include/geotrans
cp -av -R include/geotrans/* ${PREFIX}/include/geotrans
mkdir build && pushd build
cmake .. -DCMAKE_CXX_FLAGS="-Wno-catch-value -Wno-stringop-truncation" -DBUILD_SHARED_LIBS=ON
make
cp -av libgeotrans* ${PREFIX}/lib
