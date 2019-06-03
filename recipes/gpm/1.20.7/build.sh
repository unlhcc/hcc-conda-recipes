#!/bin/bash

export CPPFLAGS="${CPPFLAGS} -I${PREFIX}/include -I${SRC_DIR}/src/headers"
./autogen.sh
./configure --prefix=${PREFIX} --sbindir=${PREFIX}/bin
make -j 2
make install
