#!/bin/bash

# hush git
export EMAIL="hcc-support@unl.edu"
export GIT_AUTHOR_NAME="HCC CI"
export GIT_AUTHOR_EMAIL="hcc-support@unl.edu"
export GIT_COMMITTER_NAME="HCC CI"
export GIT_COMMITTER_EMAIL="hcc-support@unl.edu"

# workaround to set version for non-git build
export GIT_DESCRIBE_TAG="${PKG_VERSION}"

export CFLAGS="${CFLAGS} -O3 -D_GNU_SOURCE -std=c11"

mkdir -p build/afni_data
cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DCOMP_GUI=ON -DCOMP_PLUGINS=ON \
    -DCOMP_COREBINARIES=ON -DCOMP_RSTATS=ON \
    -DCOMP_ATLASES=ON -DCOMP_SUMA=ON \
    -DCOMP_TCSH=ON -DCOMP_PYTHON=ON \
    -DSTANDARD_PYTHON_INSTALL=ON \
    -DPython_ROOT_DIR=${PREFIX} \
    -DDOWNLOAD_TEST_DATA=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DX11_X11_INCLUDE_PATH=${PREFIX}/include \
    ..

make -j4
make install

# manually create 'AFNI_version.txt' since the cmake build doesn't seem to
SYSTEM_NAME="linux_rocky_8"
AFNI_WHOMADEIT="conda-build"
cp ${SRC_DIR}/src/AFNI_version_base.txt ${PREFIX}/bin/AFNI_version.txt
chmod +x ${PREFIX}/bin/AFNI_version.txt
echo ${SYSTEM_NAME} >> ${PREFIX}/bin/AFNI_version.txt
date +'%b %d %Y' >> ${PREFIX}/bin/AFNI_version.txt
echo ${AFNI_WHOMADEIT} >> ${PREFIX}/bin/AFNI_version.txt

# activate/deactivate scripts
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cp ${RECIPE_DIR}/scripts/activate.sh ${PREFIX}/etc/conda/activate.d/${PKG_NAME}.sh
cp ${RECIPE_DIR}/scripts/deactivate.sh ${PREFIX}/etc/conda/deactivate.d/${PKG_NAME}.sh
