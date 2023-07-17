#!/bin/bash

mkdir -p ${PREFIX}

if [ "$(uname)" == "Darwin" ]; then
    os="Darwin"
    cp -r * ${PREFIX}/
    chmod +x ${PREFIX}/bin/*
    chmod +x ${PREFIX}/ext/${os}/bin/*
else
    os="Linux"
    cp -r * ${PREFIX}/
    chmod +x ${PREFIX}/bin/*
    chmod +x ${PREFIX}/ext/${os}/bin/*
    chmod +x ${PREFIX}/ext/${os}/bin/fsl/*
    chmod +x ${PREFIX}/ext/${os}/bin/ants_1042/*
fi

# set ASHS_ROOT variable on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/ashs.sh
export ASHS_ROOT=${PREFIX}
export ASHS_BIN=${PREFIX}/ext/${os}/bin
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/ashs.sh
unset ASHS_ROOT
unset ASHS_BIN
EOF
