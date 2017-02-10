#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include
export LDFLAGS="-L${PREFIX}/lib"
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_C_FLAGS="-I${PREFIX}/include -L${PREFIX}/lib" \
	-DCMAKE_CXX_FLAGS="-I${PREFIX}/include -L${PREFIX}/lib" .

make
make install
