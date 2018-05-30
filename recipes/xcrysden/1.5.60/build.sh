#!/bin/bash

sudo yum install -y mesa-libGLU-devel
export LD_LIBRARY_PATH=${PREFIX}/lib
export CPATH=${PREFIX}/include
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
mkdir -p ${PREFIX}/lib
cp -a ${RECIPE_DIR}/libGL* ${PREFIX}/lib
cp ./system/Make.sys-shared Make.sys
make xcrysden
prefix=${PREFIX} make install
