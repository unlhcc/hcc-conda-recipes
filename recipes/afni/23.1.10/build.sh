#!/bin/bash

# hush git
export EMAIL="hcc-support@unl.edu"
export GIT_AUTHOR_NAME="HCC CI"
export GIT_COMMITTER_NAME="HCC CI"

# workaround to set version for non-git build
export GIT_DESCRIBE_TAG="${PKG_VERSION}"

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
    ..

make -j4 # V=1
make install

# manually create 'AFNI_version.txt' since the cmake build doesn't seem to
SYSTEM_NAME="conda_centos7_64"
AFNI_WHOMADEIT="conda-build"
cp ${SRC_DIR}/src/AFNI_version_base.txt ${PREFIX}/bin/AFNI_version.txt
echo ${SYSTEM_NAME} >> ${PREFIX}/bin/AFNI_version.txt
date +'%b %d %Y' >> ${PREFIX}/bin/AFNI_version.txt
echo ${AFNI_WHOMADEIT} >> ${PREFIX}/bin/AFNI_version.txt

# activate/deactivate scripts
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cp ${RECIPE_DIR}/scripts/activate.sh ${PREFIX}/etc/conda/activate.d/${PKG_NAME}.sh
cp ${RECIPE_DIR}/scripts/deactivate.sh ${PREFIX}/etc/conda/deactivate.d/${PKG_NAME}.sh
