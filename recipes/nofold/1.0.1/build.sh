#!/bin/bash

mkdir -p ${PREFIX}/bin

cp src/*.py ${PREFIX}/bin
cp src/*.r ${PREFIX}/bin
chmod +x ${PREFIX}/bin/*.py
chmod +x ${PREFIX}/bin/*.r

# create folder for database files download
target=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}
mkdir -p ${target}

# copy database files
cp -r demo/ ${target}
cp -r models/ ${target}
cp -r norm/ ${target}
cp -r thresh/ ${target}

# set NOFOLD_DATA variable on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/nofold.sh
export NOFOLD_DATA=${target}
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/nofold.sh
unset NOFOLD_DATA
EOF
