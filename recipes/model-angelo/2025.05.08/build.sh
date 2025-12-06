#!/bin/bash

$PYTHON -m pip install --no-deps --ignore-installed --no-cache-dir -vvv .

# create folder for models download
target=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}
mkdir -p ${target}/db/

# copy script to download models
touch ${target}/db/.tmp
chmod +x ${RECIPE_DIR}/download-db.sh
cp ${RECIPE_DIR}/download-db.sh ${PREFIX}/bin

# set TORCH_HOME variable on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/modelangelo.sh
export TORCH_HOME=${target}/db/
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/modelangelo.sh
unset TORCH_HOME
EOF
