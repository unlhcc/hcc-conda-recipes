#!/bin/bash

mkdir -p ${PREFIX}/bin

# create directory for OMA directories
TGT="$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM"
mkdir -p ${TGT}
# create data directory
mkdir -p ${TGT}/data
touch ${TGT}/data/.empty

./install.sh ${PREFIX} ${TGT}/data no ${TGT}

# copy download script
cp ${RECIPE_DIR}/download-db.sh ${PREFIX}/bin
chmod +x ${PREFIX}/bin/download-db.sh

# set OMADATA variable on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/oma.sh
export OMADATA=${TGT}/data/
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/oma.sh
unset OMADATA
EOF
