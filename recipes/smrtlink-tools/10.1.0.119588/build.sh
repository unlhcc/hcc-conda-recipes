#!/bin/bash

# The installer hard-codes only system locations in PATH.
sudo yum -y -q install rsync

mkdir -p ${PREFIX}/bin
outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}

bash *.run -i --rootdir $outdir --smrttools-only

for f in `ls -1 $outdir/smrtcmds/bin/*`
do
    ln -s $f ${PREFIX}/bin
done
