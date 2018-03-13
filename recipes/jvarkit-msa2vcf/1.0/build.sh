#!/bin/bash

OUT="$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM"
mkdir -p $OUT
mkdir -p $PREFIX/bin

cp -rvp . $PREFIX
cd $PREFIX
make msa2vcf
cp dist/*jar $OUT
cp dist/msa2vcf $OUT

ls -l $OUT
ln -s $OUT/msa2vcf $PREFIX/bin

chmod 0755 "${PREFIX}/bin/msa2vcf"
