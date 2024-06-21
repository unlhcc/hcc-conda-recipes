#!/bin/bash

unset LD LINK ARCH
export LD=${CXX}
export EIGEN_CFLAGS="-isystem ${PREFIX}/include/eigen3"
export MOC=${PREFIX}/bin/moc
export QMAKE=${PREFIX}/bin/qmake
export RCC=${PREFIX}/bin/rcc

mkdir -p ${PREFIX}/bin
mkdir -p ${PREFIX}/lib
mkdir -p ${PREFIX}/share

# qmake needs g++ executable
# setting QMAKE_CXX doesn't work
ln -s ${CXX} ${BUILD_PREFIX}/bin/g++

./configure -openmp
./build

chmod +x ./bin/*
cp -r ./bin/* ${PREFIX}/bin/
cp -r ./lib/* ${PREFIX}/lib/
cp -r ./share/* ${PREFIX}/share/
