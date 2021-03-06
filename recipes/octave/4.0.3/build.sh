#!/bin/bash

export CPPFLAGS="-I${PREFIX}/include ${CPPFLAGS}"
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export CXXFLAGS="${CXXFLAGS} --std=c++11 -fpermissive"

chmod +x configure
chmod +x build-aux/mk-opts.pl

./configure --help
./configure --prefix=$PREFIX \
    --enable-docs \
    --enable-readline \
    --enable-shared \
    --with-lapack="-lopenblas" \
    --enable-dl \
    --with-qrupdate-libdir=${PREFIX}/lib \
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

# Custom startup file for Octave to fix compilers and package handling
cp ${RECIPE_DIR}/octaverc ${PREFIX}/share/octave/site/m/startup

# Ensure package directories are kept even though empty
mkdir -p ${PREFIX}/share/octave/packages ${PREFIX}/lib/octave/packages
touch ${PREFIX}/share/octave/packages/.empty ${PREFIX}/lib/octave/packages/.empty
