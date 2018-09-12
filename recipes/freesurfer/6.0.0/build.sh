#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include:$C_INCLUDE_PATH
export LD_LIBRARY_PATH=${PREFIX}/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=${PREFIX}/lib:$LIBRARY_PATH
export LDFLAGS="-L${PREFIX}/lib $LDFLAGS"
export CFLAGS="-I${PREFIX}/include $CFLAGS"

# ugly, ugly hack for missing libjpeg.la file in newer jpeg packages
sed -i s/libjpeg.la/libjpeg.a/g ${PREFIX}/lib/libtiff.la

# needed OS packages.  yes, vim-common is needed for the xxd command
yum install -y -q tcsh mesa-libGLU-devel vim-common

./setup_configure
./configure --disable-Werror --disable-GUI-build \
    --prefix=${PREFIX} --with-pkgs-dir=${PREFIX} \
    --enable-openmp \
    --with-boost-dir=${PREFIX} \
    --with-mni-dir=${PREFIX} \
    --with-tiff-dir=${PREFIX} \
    --with-jpeg-dir=${PREFIX} \
    --with-petsc-libraries=${PREFIX}/arch-conda-c-opt \
    --with-petsc-include=${PREFIX}/include \
    --with-expat-dir=${PREFIX} \
    --with-vxl-dir=${PREFIX} \
    --with-cppunit-dir=${PREFIX} \
    --with-itk-dir=${PREFIX} \
    --disable-static \
    --enable-shared \
    --with-vtk-libraries=${PREFIX}/lib \
    --with-vtk-include=${PREFIX}/include/vtk-5.10 \
    --without-cuda

# configure tries to copy libtool to the build directory
# but fails as it's in a non-standard location for conda builds.
# Do it manually here so it works.
cp ${BUILD_PREFIX}/bin/libtool .

# The source package has a bunch of broken symlinks for
# files distributed via git annex. Remove all of them
# and replace them with dummy files so make install works.
for i in `cat ${RECIPE_DIR}/broken_links.txt`;
do
  rm -f $i
  touch $i
done
# This tarball contains tarballs necessary for make install to
# complete.
curl -L  https://unl.box.com/shared/static/aagdqgwuje1dyiohudiaaiecogjz0vtk.tgz | tar --overwrite --strip-components=1 -zx
make -j 4 > make.log
make install

# set FREESURFER_HOME var on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/freesurfer.sh
export FREESURFER_HOME=${PREFIX}
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/freesurfer.sh
unset FREESURFER_HOME
EOF
