#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p $outdir ${PREFIX}/bin

export LD_LIBRARY_PATH=$outdir/external/lib:${PREFIX}/lib
cp -R ${SRC_DIR}/* $outdir
envsubst '${PREFIX}:${PKG_NAME}:${PKG_VERSION}:${PKG_BUILDNUM}' < ${SRC_DIR}/xcrysden > $outdir/xcrysden
chmod +x $outdir/xcrysden
ln -s $outdir/xcrysden ${PREFIX}/bin
