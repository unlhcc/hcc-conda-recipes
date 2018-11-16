#!/bin/bash

mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d ${PREFIX}/bin ${PREFIX}/lib

pushd linux64
$PYTHON setup.py install
cp bin/{gurobi_cl,gurobi.sh} ${PREFIX}/bin
cp -a lib/{gurobi.py,libgurobi*} ${PREFIX}/lib

cat <<EOF >> ${PREFIX}/etc/conda/activate.d/gurobi.sh
export GUROBI_HOME=${PREFIX}
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/gurobi.sh
unset GUROBI_HOME
EOF
