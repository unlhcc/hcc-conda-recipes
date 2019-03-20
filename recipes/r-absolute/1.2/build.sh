#!/bin/bash

R CMD INSTALL library/

# create folder for additional scripts
target=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}
mkdir -p ${target}/scripts/

# copy R scripts
chmod +x *.R
cp *.R ${target}/scripts/

# set R SCRIPTS PATH variable on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/absolute.sh
export R_SCRIPTS_PATH=${target}/scripts/
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/absolute.sh
unset R_SCRIPTS_PATH
EOF
