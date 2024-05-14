#!/bin/bash

export LD_LIBRARY_PATH=${PREFIX}/lib
cp ./system/Make.sys-shared Make.sys
make xcrysden CC=${CC} FC=${FC}
prefix=${PREFIX} make install
