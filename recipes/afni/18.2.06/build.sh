#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include:$C_INCLUDE_PATH
export LD_LIBRARY_PATH=${PREFIX}/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=${PREFIX}/lib:$LIBRARY_PATH

sudo yum install -y -q tcsh

cd src
cp Makefile.linux_centos_7_64 Makefile
make all
make vastness

# set AFNI_PLUGINPATH variable on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/afni.sh
export AFNI_PLUGINPATH=${PREFIX}/bin
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/afni.sh
unset AFNI_PLUGINPATH
EOF
