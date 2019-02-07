#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include:$C_INCLUDE_PATH
export LD_LIBRARY_PATH=${PREFIX}/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=${PREFIX}/lib:$LIBRARY_PATH
export CC=${GCC}

yum install -y tcsh

cd src
cp Makefile.linux_centos_7_64 Makefile
make all
make install
