#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include:$C_INCLUDE_PATH
export LD_LIBRARY_PATH=${PREFIX}/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=${PREFIX}/lib:$LIBRARY_PATH
export LDFLAGS="-L${PREFIX}/lib $LDFLAGS"
export CFLAGS="-fpermissive -I${PREFIX}/include -Wl,--allow-multiple-definition $CFLAGS"
export CXXFLAGS="-fpermissive -I${PREFIX}/include -Wl,--allow-multiple-definition $CXXFLAGS"

# ugly, ugly hack for missing libjpeg.la file in newer jpeg packages
sed -i s/libjpeg.la/libjpeg.a/g ${PREFIX}/lib/libtiff.la

# needed OS packages.  yes, vim-common is needed for the xxd command
yum install -y -q tcsh mesa-libGLU-devel vim-common

mkdir -p ${SRC_DIR}/build-aux ${SRC_DIR}/m4
cp ${RECIPE_DIR}/autotroll.mk ${SRC_DIR}/build-aux
cp ${RECIPE_DIR}/autotroll.mk ${SRC_DIR}/m4

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

# A bunch of Makefiles that needed tweaked and other missing files
# from the source tarball.
cp ${RECIPE_DIR}/include/* ${SRC_DIR}/include
cp ${RECIPE_DIR}/utils/* ${SRC_DIR}/utils
cp ${RECIPE_DIR}/scripts/* ${SRC_DIR}/scripts
cp ${RECIPE_DIR}/distribution/average/surf/* ${SRC_DIR}/distribution/average/surf
cp ${RECIPE_DIR}/mri_aparc2aseg/* ${SRC_DIR}/mri_aparc2aseg
cp ${RECIPE_DIR}/mri_ca_label/* ${SRC_DIR}/mri_ca_label
cp ${RECIPE_DIR}/mri_ca_normalize/* ${SRC_DIR}/mri_ca_normalize
cp ${RECIPE_DIR}/mri_ca_register/* ${SRC_DIR}/mri_ca_register
cp ${RECIPE_DIR}/mri_convert/* ${SRC_DIR}/mri_convert
cp ${RECIPE_DIR}/mri_em_register/* ${SRC_DIR}/mri_em_register
cp ${RECIPE_DIR}/mri_mask/* ${SRC_DIR}/mri_mask
cp ${RECIPE_DIR}/mri_normalize/* ${SRC_DIR}/mri_normalize
cp ${RECIPE_DIR}/mri_watershed/* ${SRC_DIR}/mri_watershed
cp ${RECIPE_DIR}/mri_edit_wm_with_aseg/* ${SRC_DIR}/mri_edit_wm_with_aseg
cp ${RECIPE_DIR}/mri_compute_seg_overlap/* ${SRC_DIR}/mri_compute_seg_overlap
cp ${RECIPE_DIR}/talairach_avi/* ${SRC_DIR}/talairach_avi
cp ${RECIPE_DIR}/mris_calc/* ${SRC_DIR}/mris_calc
cp ${RECIPE_DIR}/mris_euler_number/* ${SRC_DIR}/mris_euler_number
cp ${RECIPE_DIR}/mris_fix_topology/* ${SRC_DIR}/mris_fix_topology
cp ${RECIPE_DIR}/mris_inflate/* ${SRC_DIR}/mris_inflate
cp ${RECIPE_DIR}/mris_make_surfaces/* ${SRC_DIR}/mris_make_surfaces
cp ${RECIPE_DIR}/mris_sphere/* ${SRC_DIR}/mris_sphere
cp ${RECIPE_DIR}/mris_volmask/* ${SRC_DIR}/mris_volmask
cp ${RECIPE_DIR}/fsfast/bin/* ${SRC_DIR}/fsfast/bin
cp ${RECIPE_DIR}/LICENSE ${RECIPE_DIR}/NOTICE ${SRC_DIR}

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
make -j 4
make install

# set FREESURFER_HOME var on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/freesurfer.sh
export FREESURFER_HOME=${PREFIX}
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/freesurfer.sh
unset FREESURFER_HOME
EOF
