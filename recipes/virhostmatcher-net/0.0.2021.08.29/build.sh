#!/bin/bash

mkdir -p ${PREFIX}/bin/

cp -r ./src ${PREFIX}/bin/
CC=$CXX python setup.py install --install-platlib=${PREFIX}/bin/src/

# copy python scripts
cp *.py ${PREFIX}/bin/
chmod +x ${PREFIX}/bin/*.py

# copy script to download database
DB="$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/data"
mkdir -p ${DB}
touch ${DB}/.tmp
chmod +x ${RECIPE_DIR}/download-vhmn-db.sh
cp ${RECIPE_DIR}/download-vhmn-db.sh ${PREFIX}/bin

# set VHMN_DATA variable on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/virhostmatcher-net.sh
export VHMN_DATA=${DB}
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/virhostmatcher-net.sh
unset VHMN_DATA
EOF
