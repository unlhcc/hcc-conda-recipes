#!/bin/bash

set -x -e

outdir=$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM
mkdir -p $outdir
mkdir -p $PREFIX/bin
cp *.jar $outdir
cp $RECIPE_DIR/{Count32,Count64,Dump64,Partition,Query64,Stat64} $outdir/
chmod +x $outdir/{Count32,Count64,Dump64,Partition,Query64,Stat64}
for f in Count32 Count64 Dump64 Partition Query64 Stat64
do
  ln -s $outdir/$f $PREFIX/bin
done
