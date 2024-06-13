#!/bin/bash

mkdir -p ${PREFIX}/bin
outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p $outdir

chmod +x bin/vaspkit
cp bin/vaspkit ${PREFIX}/bin/
cp how_to_set_environment_variables $outdir/vaspkit_config
cp -r utilities $outdir
cp -r crystals $outdir
cp -r examples $outdir

# modify config file
VASPKIT_UTILITIES_PATH_VARIABLE="VASPKIT_UTILITIES_PATH    ${outdir}/utilities"
n=`grep -rin "VASPKIT_UTILITIES_PATH" $outdir/vaspkit_config | awk -F ':'  '{print $1}'`
sed -i ""${n}"c  ${VASPKIT_UTILITIES_PATH_VARIABLE}" $outdir/vaspkit_config
PYTHON_BIN_VARIABLE="PYTHON_BIN    ${PREFIX}/bin/python"
n=`grep -rin "PYTHON_BIN" $outdir/vaspkit_config | awk -F ':'  '{print $1}'`
sed -i ""${n}"c  ${PYTHON_BIN_VARIABLE}" $outdir/vaspkit_config

# set vaspkit variables
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/vaspkit.sh
export VASPKIT_UTILITIES_PATH=$outdir/utilities
export PYTHON_BIN=${PREFIX}/bin/python
export VASPKIT_CONFIG=$outdir/vaspkit_config
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/vaspkit.sh
unset VASPKIT_UTILITIES_PATH
unset PYTHON_BIN
unset VASPKIT_CONFIG
EOF
