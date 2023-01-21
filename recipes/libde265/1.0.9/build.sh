#!/bin/bash

mkdir build && pushd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} ..
make -j 4
make install
popd

# cmake install doesn't include pkgconfig data
./configure --prefix=${PREFIX} --disable-static --disable-sherlock265
make install-pkgconfigDATA
