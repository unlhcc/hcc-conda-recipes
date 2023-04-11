#!/bin/bash

mkdir -p ${PREFIX}/bin

$PYTHON -m pip install . -vv

# Copy scripts
outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p ${outdir}
cp -r ls_bsr.py igs_logging.py ls_bsr/ tools/ ${outdir}
chmod +x ${outdir}/*.py
chmod +x ${outdir}/tools/*.py
ln -s $outdir/ls_bsr.py ${PREFIX}/bin
ln -s $outdir/tools/annotate_matrix_by_locus_tags.py ${PREFIX}/bin
ln -s $outdir/tools/BSR_to_cluster_dendrogram.py ${PREFIX}/bin
ln -s $outdir/tools/BSR_to_gene_accumulation_scatter.py ${PREFIX}/bin
ln -s $outdir/tools/BSR_to_PANGP.py ${PREFIX}/bin
ln -s $outdir/tools/BSR_to_scoary.py ${PREFIX}/bin
ln -s $outdir/tools/compare_BSR.py ${PREFIX}/bin
ln -s $outdir/tools/extract_core_genome.py ${PREFIX}/bin
ln -s $outdir/tools/extract_locus_tags.py ${PREFIX}/bin
ln -s $outdir/tools/extract_tree_names.py ${PREFIX}/bin
ln -s $outdir/tools/filter_BSR_variome.py ${PREFIX}/bin
ln -s $outdir/tools/filter_column_BSR.py ${PREFIX}/bin
ln -s $outdir/tools/invert_select_group.py ${PREFIX}/bin
ln -s $outdir/tools/isolate_uniques_BSR.py ${PREFIX}/bin
ln -s $outdir/tools/pan_genome_stats.py ${PREFIX}/bin
ln -s $outdir/tools/quantify_BSR_uniques.py ${PREFIX}/bin
ln -s $outdir/tools/reorder_BSR_matrix_by_tree.py ${PREFIX}/bin
ln -s $outdir/tools/reorder_matrix_by_list.py ${PREFIX}/bin
ln -s $outdir/tools/select_seqs_by_IDs.py ${PREFIX}/bin
ln -s $outdir/tools/slice_ref_genome.py ${PREFIX}/bin
ln -s $outdir/tools/transfer_annotation.py ${PREFIX}/bin
chmod +x ${PREFIX}/bin/*.py
