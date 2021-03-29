#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p $outdir ${PREFIX}/bin

cp -R source $outdir
cp -R refgenefiles $outdir
cp -R examplefiles $outdir
cp gp_gistic2_from_seg $outdir
envsubst '${PREFIX}:${PKG_NAME}:${PKG_VERSION}:${PKG_BUILDNUM}' < gistic2 > ${PREFIX}/bin/gistic2
envsubst '${PREFIX}:${PKG_NAME}:${PKG_VERSION}:${PKG_BUILDNUM}' < run_gistic_example > ${PREFIX}/bin/run_gistic_example
