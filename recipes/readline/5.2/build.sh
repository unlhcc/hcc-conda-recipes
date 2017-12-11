#!/bin/bash

export LD_LIBRARY_PATH="-L{$PREFIX}/lib"
export LDFLAGS="-L{$PREFIX}/lib"
export CPATH=${PREFIX}/include

./configure --prefix=${PREFIX} --infodir=${PREFIX}/share/info
make
make install
