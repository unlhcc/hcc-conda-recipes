#!/bin/bash

export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export PANGO_CFLAGS=${PREFIX}/include
export PANGO_LIBS="-L${PREFIX}/lib -lpango"
./autogen.sh --prefix=${PREFIX}
make
make install
