#!/bin/bash

outdir=$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM
mkdir -p $outdir

mkdir -p $PREFIX/bin

./configure.sh
cp -R ./* $outdir/
