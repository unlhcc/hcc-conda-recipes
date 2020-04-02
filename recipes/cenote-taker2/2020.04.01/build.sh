#!/bin/bash

mkdir -p ${PREFIX}/bin

cp *.pl ${PREFIX}/bin
cp *.py ${PREFIX}/bin
cp *.sh ${PREFIX}/bin
cp irf307.linux.exe  ${PREFIX}/bin
chmod +x ${PREFIX}/bin/*.pl
chmod +x ${PREFIX}/bin/*.py
chmod +x ${PREFIX}/bin/*.sh
chmod +x ${PREFIX}/bin/irf307.linux.exe 


# create folder for database download
target=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}
mkdir -p ${target}/db/
cp viral_cdds_and_pfams_191028.txt ${target}/db/


# Krona database files needs to be in CT2
# rm -rf ${PREFIX}/opt/krona/taxonomy/
# ln -s ${CT2}/taxonomy/ ${PREFIX}/opt/krona/


# copy script to download database
chmod +x ${RECIPE_DIR}/download-db.sh
cp ${RECIPE_DIR}/download-db.sh ${PREFIX}/bin


# set CT2 variable on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/ct2.sh
export CT2_DIR=${target}/db/
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/ct2.sh
unset CT2_DIR
EOF
