#!/bin/bash

mkdir -p ${PREFIX}/lib/ncarg/database/rangs
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d

cp rangs* gshhs* ${PREFIX}/lib/ncarg/database/rangs

cat <<EOF >> ${PREFIX}/etc/conda/activate.d/ncarg-rangs.sh
export NCARG_RANGS=${PREFIX}/lib/ncarg/database/rangs
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/ncarg-rangs.sh
unset NCARG_RANGS
EOF
