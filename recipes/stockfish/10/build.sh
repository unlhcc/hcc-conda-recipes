#!/bin/bash

mkdir -p ${PREFIX}/bin
pushd src

if [ "$(uname)" == "Darwin" ]; then
    make build ARCH=x86-64-modern COMP=clang COMPCXX=${CXX}
else
    make build ARCH=x86-64-modern COMP=gcc COMPCXX=${CXX}
fi

make install
