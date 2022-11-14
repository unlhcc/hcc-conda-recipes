#!/bin/sh

mkdir -p ${PREFIX}/bin ${PREFIX}/share/man/man1 ${PREFIX}/lib

pushd src
make BINDIR=${PREFIX}/bin MANDIR=${PREFIX}/share/man/man1 CC=${CC}
make BINDIR=${PREFIX}/bin MANDIR=${PREFIX}/share/man/man1 install
cp libqhull.a ${PREFIX}/lib
