#!/bin/bash

if [[ "$(uname)" = Linux ]]; then
    export CFLAGS="$CFLAGS -fopenmp"
    export CXXFLAGS="$CXXFLAGS -fopenmp"
    yum install -q -y csh
    CONFIGURE='../configure'

else
    CONFIGURE='../configure-universalDarwin'
fi

mkdir -p autodock/build autogrid/build ${PREFIX}/bin
pushd ${SRC_DIR}/autodock/build
$CONFIGURE
make
cp autodock4 ${PREFIX}/bin
pushd ${SRC_DIR}/autogrid/build
$CONFIGURE
make
cp autogrid4  ${PREFIX}/bin
