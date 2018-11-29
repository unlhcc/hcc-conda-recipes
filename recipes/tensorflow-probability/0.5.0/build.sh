#!/bin/bash

export LD_LIBRARY_PATH=${PREFIX}/lib
export CPATH=${PREFIX}/include # :${PREFIX}/gcc/include/c++
export CFLAGS="-I${PREFIX}/include ${CFLAGS}" #    -I${PREFIX}/gcc/include/c++ ${CFLAGS}"

# Create a unique tmpdir for the .whl to avoid name collisions
TMPDIR=`mktemp -d`

# Make sure build env is clean when doing multiple Python versions
bazel clean

bazel build --copt=-O3 --copt=-march=corei7-avx :pip_pkg
./bazel-bin/pip_pkg ${TMPDIR} --release
rm -rf ~/.cache
