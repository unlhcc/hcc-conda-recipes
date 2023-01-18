#!/bin/bash

# Force GS to use conda provided libs
# No way to do this via configure for some reason
rm -rf jpeg openjpeg libpng jbig2dec

if [ `uname` == Darwin ]; then
    export CFLAGS="${CFLAGS} -Wl,-rpath,${PREFIX}/lib"
else
    export LD_LIBRARY_PATH=${PREFIX}/lib:${LD_LIBRARY_PATH}
fi

./configure \
    --prefix=${PREFIX} \
    --disable-cups \
    --without-tesseract \
    --with-system-libtiff \
    --without-local-zlib

make -j 4
make so

make install
make soinstall
