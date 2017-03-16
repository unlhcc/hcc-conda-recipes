#!/bin/bash

mkdir -p ${PREFIX}/bin
export CPATH=${PREFIX}/include
export LD_LIBRARY_PATH=${PREFIX}/lib

make
cp zerone ${PREFIX}/bin
