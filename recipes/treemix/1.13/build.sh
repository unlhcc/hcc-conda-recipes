#!/bin/bash

export LD_LIBRARY_PATH=${PREFIX}/lib
./configure --prefix=$PREFIX CPPFLAGS="-I${PREFIX}/include" LDFLAGS="-L${PREFIX}/lib"
make -j 2
make install
cp src/plotting_funcs.R ${PREFIX}/bin
