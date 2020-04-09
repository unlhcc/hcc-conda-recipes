#!/bin/bash

export CPPFLAGS="${CPPFLAGS} -I${PREFIX}/include/OpenEXR"
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

pushd unix
./prebuild.sh
popd
./configure --prefix=${PREFIX}  \
  COMPILED_BY="Holland Computing Center <hcc-support@unl.edu>" \
  --with-zlib=${PREFIX} \
  --with-libpng=${PREFIX} \
  --with-libjpeg=${PREFIX} \
  --with-libtiff=${PREFIX} \
  --with-libsdl=${PREFIX} \
  --with-openexr=${PREFIX} \
  --with-libmkl=${PREFIX} \
  --with-boost=${PREFIX} \
  --disable-optimiz-arch \
  --disable-optimiz \
  --with-x

make -j 2
make install
