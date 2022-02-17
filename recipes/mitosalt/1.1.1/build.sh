#!/bin/bash

TGT="$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM"
[ -d "$TGT" ] || mkdir -p "$TGT"
[ -d "${PREFIX}/bin" ] || mkdir -p "${PREFIX}/bin"


# Copy scripts
cp *.pl ${PREFIX}/bin/
cp *.R ${PREFIX}/bin/
ln -s ${PREFIX}/bin/MitoSAlt1.1.1.pl ${PREFIX}/bin/mitosalt.pl
ln -s ${PREFIX}/bin/MitoSAlt_SE1.1.1.pl ${PREFIX}/bin/mitosalt_se.pl
chmod +x ${PREFIX}/bin/*.pl
chmod +x ${PREFIX}/bin/*.R


# Copy config files
cp *.txt ${TGT}


# Copy script to download database
mkdir -p $TGT/db/genome
touch $TGT/db/genome/.tmp
cp ${RECIPE_DIR}/download-mitosalt-db.sh ${PREFIX}/bin
chmod +x ${PREFIX}/bin/download-mitosalt-db.sh



# set MITOSALT_DATA variable on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/mitosalt.sh
export MITOSALT_DATA=${TGT}/db/
export MITOSALT_CONFIG_FILE=${TGT}
export CONDA_ENV_BIN=${PREFIX}/bin/
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/mitosalt.sh
unset MITOSALT_DATA
unset MITOSALT_CONFIG_FILE
unset CONDA_ENV_BIN
EOF
