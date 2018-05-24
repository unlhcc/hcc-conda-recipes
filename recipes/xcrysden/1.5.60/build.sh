#!/bin/bash

sudo yum install -y mesa-libGLU-devel
export LD_LIBRARY_PATH=${PREFIX}/lib
export CPATH=${PREFIX}/include

cp ./system/Make.sys-shared Make.sys
make xcrysden
prefix=${PREFIX} make install
