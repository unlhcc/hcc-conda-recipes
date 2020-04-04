#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p ${outdir} ${PREFIX}/bin
cp -R * ${outdir}
cp ${RECIPE_DIR}/weka.py ${outdir}
ln -s ${outdir}/weka.py ${PREFIX}/bin/weka
