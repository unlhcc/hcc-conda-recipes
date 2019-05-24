#!/bin/bash

mkdir -p ${PREFIX}/bin
outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p $outdir
cp -R * $outdir
ln -s $outdir/globusconnect ${PREFIX}/bin/globusconnect
ln -s $outdir/globusconnectpersonal ${PREFIX}/bin/globusconnectpersonal
