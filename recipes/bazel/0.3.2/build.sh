#!/bin/bash
set -v -x
export LD_LIBRARY_PATH=${PREFIX}/lib
export C_INCLUDE_PATH=${PREFIX}/include
sh compile.sh
mv output/bazel $PREFIX/bin
