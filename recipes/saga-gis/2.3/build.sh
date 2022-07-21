#!/bin/bash

# workaround for older gtk3 packages not failing gracefully on activate
sudo yum install -y -q libXi libXcursor libXcomposite libXrandr libXinerama
# workaround for deprecated .la files in some packages breaking the build
find ${PREFIX} -name \*.la -exec rm -f '{}' \;

pushd saga-gis
autoreconf -ivf
export CXXFLAGS="$CXXFLAGS -std=c++11 -Wno-narrowing"
./configure --prefix=${PREFIX} --with-local=${PREFIX} --enable-python --enable-static=no  # --disable-triangle
make -j 4
make install
