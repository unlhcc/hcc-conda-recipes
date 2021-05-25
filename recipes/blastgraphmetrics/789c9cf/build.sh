#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p ${outdir}

cp -R * ${outdir}
ln -s $outdir/barcharts.R ${PREFIX}/bin
ln -s $outdir/blast2graphs.py ${PREFIX}/bin
ln -s $outdir/downloadEckDatabase.py ${PREFIX}/bin
ln -s $outdir/eckTestData.py ${PREFIX}/bin
ln -s $outdir/fasta2phylip.py ${PREFIX}/bin
ln -s $outdir/graphs2gml.py ${PREFIX}/bin
ln -s $outdir/mcl2rtab.py ${PREFIX}/bin
ln -s $outdir/eckPipeline.sh ${PREFIX}/bin
