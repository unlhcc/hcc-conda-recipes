#!/bin/bash

set -x
export CXXFLAGS="${CXXFLAGS} -fopenmp"

./configure --prefix=$PREFIX --with-boost=$PREFIX
make -j4
make install -j4
