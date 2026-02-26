#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p $outdir
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d ${PREFIX}/bin ${PREFIX}/lib

pushd linux64
cp -aR examples matlab R $outdir

# Install Python package
$PYTHON setup.py install
cp bin/{gurobi_cl,gurobi.sh} ${PREFIX}/bin
cp -a lib/{gurobi.py,libgurobi*} ${PREFIX}/lib

# Install R package
Rscript -e "install.packages('R/gurobi_9.1-2_R_4.0.2.tar.gz', repos=NULL)"

# Install binaries
pushd src/build
make C++=${CXX}
cp libgurobi_c++.a ${PREFIX}/lib

cat <<EOF >> ${PREFIX}/etc/conda/activate.d/gurobi.sh
export GUROBI_HOME=${PREFIX}
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/gurobi.sh
unset GUROBI_HOME
EOF
