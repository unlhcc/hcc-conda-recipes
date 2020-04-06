#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p ${PREFIX}/bin $outdir
cp Scripts/*.py ${PREFIX}/bin
cp -R Scripts/MODEL_FILES $outdir
ln -s $outdir/MODEL_FILES ${PREFIX}/bin/MODEL_FILES
