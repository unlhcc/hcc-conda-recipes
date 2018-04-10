#!/bin/bash

unset SSL_CERT_FILE

export C_INCLUDE_PATH=${PREFIX}/include
export CXXFLAGS="-I${PREFIX}/include $CXXFLAGS"
export LIBRARY_PATH=${PREFIX}/lib
export LD_LIBRARY_PATH=${PREFIX}/lib
export LDFLAGS="$LDFLAGS -Wl,-rpath -Wl,${PREFIX}/lib -L${PREFIX}/lib"
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

./configure --prefix=${PREFIX} \
    --with-readline=${PREFIX} \
    --with-zlib=${PREFIX} \
    --with-expat=${PREFIX} \
    --with-openssl=${PREFIX} \
    --enable-packager-mode

make
make install
