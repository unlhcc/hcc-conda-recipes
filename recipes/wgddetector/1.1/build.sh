#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p ${outdir}

cp -R * ${outdir}
ln -s $outdir/src/calculate_ks.pl ${PREFIX}/bin
ln -s $outdir/src/calculate_ks.single.pl ${PREFIX}/bin
ln -s $outdir/src/collect_ks.pl ${PREFIX}/bin
ln -s $outdir/src/conver_dist.pl ${PREFIX}/bin
ln -s $outdir/src/Fasta2Phylip.pl ${PREFIX}/bin
ln -s $outdir/src/hclust_ks.pl ${PREFIX}/bin
ln -s $outdir/src/merge_final_ks.pl ${PREFIX}/bin
ln -s $outdir/src/phase.id.pl ${PREFIX}/bin
ln -s $outdir/src/phase.mcloutp2orthomcl.format.pl ${PREFIX}/bin
ln -s $outdir/src/phase.new_sub_GF_seq.pl ${PREFIX}/bin
ln -s $outdir/src/protein_blastp_cluster.pl ${PREFIX}/bin
ln -s $outdir/src/protein_mmseqs2_cluster.pl ${PREFIX}/bin
ln -s $outdir/src/split_large_gf.pl ${PREFIX}/bin
ln -s $outdir/src/split_seq.pl ${PREFIX}/bin
ln -s $outdir/src/sub_ks_family.pl ${PREFIX}/bin
ln -s $outdir/src/wgddetector.pl ${PREFIX}/bin

ln -s $outdir/config ${PREFIX}
