#!/bin/bash

set -x
export CXXFLAGS="${CXXFLAGS} -fopenmp"

./configure --prefix=$PREFIX --with-boost=$PREFIX --enable-fortran
make -j8
make install -j8
