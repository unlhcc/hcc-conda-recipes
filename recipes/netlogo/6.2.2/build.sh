#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p $outdir ${PREFIX}/bin

cp -R app runtime 'Mathematica Link' $outdir
cp Behaviorsearch HubNetClient libpackager.so NetLogo NetLogo3D $outdir
envsubst '${PREFIX}:${PKG_NAME}:${PKG_VERSION}:${PKG_BUILDNUM}' < netlogo-headless.sh > $outdir/netlogo-headless.sh
envsubst '${PREFIX}:${PKG_NAME}:${PKG_VERSION}:${PKG_BUILDNUM}' < netlogo-gui.sh > $outdir/netlogo-gui.sh
chmod +x $outdir/netlogo-headless.sh $outdir/netlogo-gui.sh

ln -s $outdir/NetLogo ${PREFIX}/bin/NetLogo
ln -s $outdir/NetLogo3D ${PREFIX}/bin/NetLogo3D
ln -s $outdir/netlogo-headless.sh ${PREFIX}/bin/netlogo-headless.sh
ln -s $outdir/netlogo-gui.sh ${PREFIX}/bin/netlogo-gui.sh
