#!/bin/bash

mkdir -pv ${PREFIX}/bin ${PREFIX}/share/man/man1 ${PREFIX}/share/man/man3 ${PREFIX}/share/man/man8
export C_INCLUDE_PATH=${PREFIX}/include
export LIBRARY_PATH=${PREFIX}/lib
make SYS=posix
make install
