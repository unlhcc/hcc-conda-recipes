#!/bin/bash

for f in `ls -1 rpm/rhel`
do
    rpm2cpio rpm/rhel/$f | cpio -idm
done

patch -p0 < ${RECIPE_DIR}/pkgconfig.patch
patch -p0 < ${RECIPE_DIR}/makeconf.patch
mkdir -p ${PREFIX}/bin ${PREFIX}/lib ${PREFIX}/lib/pkgconfig

cp -aR opt/microsoft/ropen/${PKG_VERSION}/share ${PREFIX}
cp -aR opt/microsoft/ropen/${PKG_VERSION}/lib64/pkgconfig/* ${PREFIX}/lib/pkgconfig
cp -aR  opt/microsoft/ropen/${PKG_VERSION}/lib64/R ${PREFIX}/lib
cp opt/microsoft/ropen/${PKG_VERSION}/stage/Linux/bin/x64/*.so ${PREFIX}/lib/R/lib

ln -s ${PREFIX}/lib/R/bin/R ${PREFIX}/bin/R
ln -s ${PREFIX}/lib/R/bin/Rscript ${PREFIX}/bin/Rscript
