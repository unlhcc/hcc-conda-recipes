#!/bin/bash

TGT="$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM"
[ -d "$TGT" ] || mkdir -p "$TGT"
[ -d "${PREFIX}/bin" ] || mkdir -p "${PREFIX}/bin"


# Install VIGOR4
mvn -DskipTests clean package
unzip target/vigor-4.*.zip -d $TGT
ln -s $TGT/vigor-4.*/bin/vigor4 $PREFIX/bin/vigor4


# Set correct path in config file
echo "reference_database_path=${VIGOR_DB}" >> $TGT/vigor-4.*/config/vigor.ini
echo "exonerate_path=${PREFIX}/bin/exonerate" >> $TGT/vigor-4.*/config/vigor.ini
echo "temporary_directory=/tmp" >> $TGT/vigor-4.*/config/vigor.ini


# copy script to download database
mkdir -p $TGT/db
touch $TGT/db/.tmp
chmod +x ${RECIPE_DIR}/download-db.sh
cp ${RECIPE_DIR}/download-db.sh ${PREFIX}/bin


# set VIGOR_DB variable on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/vigor.sh
export VIGOR_DB=${TGT}/db/
export DOWNLOAD_URL=https://github.com/JCVenterInstitute/VIGOR_DB/archive/8a2604201eed7681f54c09d7e2c5a3a0d55ad6b0.tar.gz
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/vigor.sh
unset VIGOR_DB
unset DOWNLOAD_URL
EOF
