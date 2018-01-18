#!/bin/bash
set -eu -o pipefail

export C_INCLUDE_PATH=${PREFIX}/include
export LIBRARY_PATH=${PREFIX}/lib
export LD_LIBRARY_PATH=${PREFIX}/lib

./configure --prefix=$PREFIX
make
make install
