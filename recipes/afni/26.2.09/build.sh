#!/bin/bash

sudo yum install -y -q tcsh

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
    -DCOMP_CORELIBS_ONLY=OFF \
    -DX11_X11_INCLUDE_PATH=${PREFIX}/include \
    -DREMOVE_BUILD_PARITY_CHECKS=ON \
    ..
make -j4
make install


# workaround to build R_io.so using cmake
LIBMRI_DIR=$(dirname "$(find "${SRC_DIR}/build" -name 'libmri.*' | head -n1)")
NIML_DIR=$(dirname "$(find "${SRC_DIR}/src" -maxdepth 2 -name 'niml.h' | head -n1)")
AFNI_VERSION_DIR=$(dirname "$(find "${SRC_DIR}/build" -name 'AFNI_version.h' | head -n1)")

cd ${SRC_DIR}/src

cat > Makevars <<EOF
PKG_CPPFLAGS = -I. -I${PREFIX}/include \
    -Inifti/nifti2 -Inifti/niftilib -Inifti/nifticdf -Inifti/znzlib \
    -I${NIML_DIR} -I${AFNI_VERSION_DIR} \
    -I3DEdge/src -Irickr -DHAVE_ZLIB -DHAVE_GIFTI -I${PREFIX}/include
PKG_LIBS = -L. -L${LIBMRI_DIR} -L${PREFIX}/lib \
    -lmri -lf2c -lXm -lXt -lXft -lXp -lXpm -lfontconfig -lXext -lXmu \
    -lSM -lICE -lX11 -lpng -ljpeg -lz -lexpat -lm -ldl -lc
EOF

${R} CMD SHLIB -o R_io.so R_io.c
cp R_io.so ${PREFIX}/bin/


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
