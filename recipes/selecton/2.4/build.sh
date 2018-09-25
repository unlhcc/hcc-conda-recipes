#!/bin/bash

mkdir -p ${PREFIX}/bin
pushd ${SRC_DIR}/libs/phylogeny
make -j 2
pushd ${SRC_DIR}/programs/selecton
make -j 2
cp selecton ${PREFIX}/bin
pushd ${SRC_DIR}/programs/mec
make -j 2
cp mec ${PREFIX}/bin

pushd ${SRC_DIR}/libs/phylogeny
make clean && make -j 2 doubleRep
pushd ${SRC_DIR}/programs/selecton
make clean && make -j 2 doubleRep
cp selecton.doubleRep ${PREFIX}/bin
