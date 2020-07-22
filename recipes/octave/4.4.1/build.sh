#!/usr/bin/env bash

sudo yum install -y -q mesa-libGLU-devel mesa-libGL-devel

export CPPFLAGS="-I${PREFIX}/include ${CPPFLAGS}"
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

chmod +x configure
chmod +x build-aux/mk-opts.pl

./configure --help
./configure --prefix=$PREFIX \
    --disable-docs \
    --enable-readline \
    --enable-shared \
    --with-lapack="-lopenblas" \
    --enable-dl \
    --without-qrupdate \
    --with-qt=5 \
    --with-magick=GraphicsMagick \
    --without-framework-carbon \
    --with-hdf5-includedir=${PREFIX}/include \
    --with-hdf5-libdir=${PREFIX}/lib

make -j${CPU_COUNT}
make install

# Copy the [de]activate scripts to $PREFIX/etc/conda/[de]activate.d.
# This will allow them to be run on environment activation.
for CHANGE in "activate" "deactivate"
do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    cp "${RECIPE_DIR}/scripts/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
done

# Custom startup file for Octave to fix compilers
cp ${RECIPE_DIR}/octaverc ${PREFIX}/share/octave/site/m/startup
