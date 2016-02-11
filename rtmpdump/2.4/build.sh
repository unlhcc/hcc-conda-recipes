#!/bin/bash

mkdir -pv ${PREFIX}/bin ${PREFIX}/share/man/man1 ${PREFIX}/share/man/man3 ${PREFIX}/share/man/man8
export C_INCLUDE_PATH=${PREFIX}/include
export LIBRARY_PATH=${PREFIX}/lib
make SYS=posix
cp {rtmpdump,rtmpgw,rtmpsrv,rtmpsuck} ${PREFIX}/bin
cp librtmp/{librtmp.so.1,librtmp.so} ${PREFIX}/lib
cp rtmpdump.1 ${PREFIX}/share/man/man1
cp rtmpgw.8 ${PREFIX}/share/man/man8
cp librtmp/librtmp.3 ${PREFIX}/share/man/man3
