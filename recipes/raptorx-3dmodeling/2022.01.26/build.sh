#!/bin/bash

TGT="$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM"
[ -d "$TGT" ] || mkdir -p "$TGT"
[ -d "${PREFIX}/bin" ] || mkdir -p "${PREFIX}/bin"


# Remove broken symlinks
find ./ -xtype l -exec rm -rf '{}' \;
# Copy scripts
cp -Ra * ${TGT}/


# Copy script for database files download
cp ${RECIPE_DIR}/download-raptorx-3dmodeling-db.sh ${PREFIX}/bin
chmod +x ${PREFIX}/bin/download-raptorx-3dmodeling-db.sh


# Remove links to databases, build fails otherwise
# rm -rf ./BuildFeatures/EVAlign/databases/*


# Create directory for database files download
mkdir -p $TGT/db/
touch $TGT/db/.tmp


# set RAPTORX_3DMODELING_DATA variable on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/raptorx-3dmodeling.sh
export RAPTORX_3DMODELING_DATA=${TGT}/db
export ModelingHome=${TGT}
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/raptorx-3dmodeling.sh
unset RAPTORX_3DMODELING_DATA
unset ModelingHome
EOF
