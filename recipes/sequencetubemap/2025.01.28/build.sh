#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}/
mkdir -p ${outdir} ${PREFIX}/bin

# copy repo content
mkdir -p ${outdir}/${PKG_NAME}
cp -R * ${outdir}/${PKG_NAME}/

# compile sequenceTubeMap
npm install
npx browserslist@latest --update-db
npm rebuild node-sass
npm run build
