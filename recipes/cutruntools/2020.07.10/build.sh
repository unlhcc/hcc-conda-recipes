#!/bin/bash

mkdir -p ${PREFIX}/bin

$CC $CFLAGS $LDFLAGS -O2 kseq_test.c -lz -o kseq_test
cp kseq_test ${PREFIX}/bin

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p $outdir
cp -R . $outdir

for f in `ls -1 $outdir/*.py $outdir/*.sh $outdir/*.R`
do
  ln -s $f ${PREFIX}/bin
done

chmod +x ${PREFIX}/bin/*.py ${PREFIX}/bin/*.sh
envsubst '${PREFIX}:${PKG_NAME}:${PKG_VERSION}:${PKG_BUILDNUM}:${SP_DIR}' < config.json > $outdir/config.json
