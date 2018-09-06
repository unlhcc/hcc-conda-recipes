#!/bin/bash

set -e

export CXXFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export CPATH="${PREFIX}/include"

make
chmod +x rarefaction
cp rarefaction ${PREFIX}/bin

