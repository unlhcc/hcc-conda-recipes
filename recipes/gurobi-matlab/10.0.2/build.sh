#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p $outdir

pushd linux64
cp -aR matlab $outdir
