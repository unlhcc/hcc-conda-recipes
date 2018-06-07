#!/bin/bash

export LD_LIBRARY_PATH=${PREFIX}/lib
export CPATH=${PREFIX}/include

# Create a unique tmpdir for the .whl to avoid name collisions
TMPDIR=`mktemp -d`

# Make sure build env is clean when doing multiple Python versions
bazel clean

# Build and install
bazel build --local_resources 2048,4,1.0 :install
./bazel-bin/install ${TMPDIR}
pip install ${TMPDIR}/*.whl
