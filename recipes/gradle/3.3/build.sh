#!/bin/bash

mkdir -p ${PREFIX}/bin
outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p $outdir/lib
envsubst '${PREFIX}:${PKG_NAME}:${PKG_VERSION}:${PKG_BUILDNUM}' < bin/gradle > ${PREFIX}/bin/gradle
cp -R lib/* $outdir/lib
