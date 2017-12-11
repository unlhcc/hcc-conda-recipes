#!/bin/bash

export LD_LIBRARY_PATH=${PREFIX}/lib

CFLAGS="-L${PREFIX}/lib" ./configure --prefix=$PREFIX
make install
