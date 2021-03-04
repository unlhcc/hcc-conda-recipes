#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p ${PREFIX}/bin ${PREFIX}/lib ${PREFIX}/share/man/man1 $outdir

cp -a bin/* ${PREFIX}/bin
cp -a lib/* ${PREFIX}/lib
cp -aR test $outdir
cp signalp.1 ${PREFIX}/share/man/man1
