#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p ${PREFIX}/bin $outdir

# the scripts expect the data folders to be in the same directory,
# so put them in the share location and symlink to bin/
chmod +x *.pl *.R
cp *.pl *.R $outdir
ln -s $outdir/create_excel_spreadsheet.R ${PREFIX}/bin
ln -s $outdir/draw_biogeochemical_cycles.R ${PREFIX}/bin
ln -s $outdir/draw_metabolic_energy_flow.R ${PREFIX}/bin
ln -s $outdir/draw_metabolic_network.R ${PREFIX}/bin
ln -s $outdir/draw_sequential_reaction.R ${PREFIX}/bin
ln -s $outdir/METABOLIC-C.pl ${PREFIX}/bin
ln -s $outdir/METABOLIC-G.pl ${PREFIX}/bin

tar -zxf Accessory_scripts.tgz
sed -i s#/usr/bin/perl#/opt/anaconda1anaconda2anaconda3/bin/perl#g Accessory_scripts/*.pl
sed -i s/hmmpress/hmmpress\ -f/g Accessory_scripts/batch_hmmpress.pl
cp -R Accessory_scripts $outdir
ln -s $outdir/Accessory_scripts/batch_hmmpress_for_dbCAN2_HMMdb.pl ${PREFIX}/bin
ln -s $outdir/Accessory_scripts/batch_hmmpress.pl ${PREFIX}/bin
ln -s $outdir/Accessory_scripts/gff2fasta_mdf.pl ${PREFIX}/bin
ln -s $outdir/Accessory_scripts/hmmscan-parser-dbCANmeta.py ${PREFIX}/bin
ln -s $outdir/Accessory_scripts/hmmscan-parser.sh ${PREFIX}/bin
ln -s $outdir/Accessory_scripts/make_pepunit_db.pl ${PREFIX}/bin

tar -zxf METABOLIC_hmm_db.tgz -C $outdir
tar -zxf METABOLIC_template_and_database.tgz -C $outdir

mkdir -p kofam_database/profiles
pushd kofam_database
curl -sSLf --retry 3 ftp://ftp.genome.jp/pub/db/kofam/ko_list.gz | gzip -d > ko_list
cp ../All_Module_KO_ids.txt profiles
popd
cp -R kofam_database $outdir

mkdir dbCAN2 && pushd dbCAN2
curl -sSLOf --retry 3 http://bcb.unl.edu/dbCAN2/download/Databases/dbCAN-old@UGA/dbCAN-fam-HMMs.txt
perl ../Accessory_scripts/batch_hmmpress_for_dbCAN2_HMMdb.pl
popd
cp -R dbCAN2 $outdir

mkdir MEROPS && pushd MEROPS
curl -sSLOf --retry 3 ftp://ftp.ebi.ac.uk/pub/databases/merops/current_release/pepunit.lib
perl ../Accessory_scripts/make_pepunit_db.pl
popd
cp -R MEROPS $outdir

# set data location
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/metabolic-activate.sh
export METABOLIC_DATA_DIR=${outdir}
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/metabolic-deactivate.sh
unset METABOLIC_DATA_DIR
EOF

# cp download scripts into package
cp ${RECIPE_DIR}/download-metabolic-profiles.sh ${RECIPE_DIR}/download-metabolic-testdata.sh ${PREFIX}/bin
chmod +x ${PREFIX}/bin/download-metabolic-profiles.sh ${PREFIX}/bin/download-metabolic-testdata.sh
