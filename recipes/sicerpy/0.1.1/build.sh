#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p ${outdir} ${PREFIX}/bin

pushd SICERpy
cp -R {ex,lib,src,utility,SICER.py} ${outdir}

envsubst '${PREFIX}:${PKG_NAME}:${PKG_VERSION}:${PKG_BUILDNUM}' < SICER.sh > ${PREFIX}/bin/SICER.sh
envsubst '${PREFIX}:${PKG_NAME}:${PKG_VERSION}:${PKG_BUILDNUM}' < SICER-df-rb.sh > ${PREFIX}/bin/SICER-df-rb.sh
envsubst '${PREFIX}:${PKG_NAME}:${PKG_VERSION}:${PKG_BUILDNUM}' < SICER-df.sh > ${PREFIX}/bin/SICER-df.sh
envsubst '${PREFIX}:${PKG_NAME}:${PKG_VERSION}:${PKG_BUILDNUM}' < SICER-rb.sh > ${PREFIX}/bin/SICER-rb.sh

ln -s $outdir/SICER.py ${PREFIX}/bin/SICER.py
