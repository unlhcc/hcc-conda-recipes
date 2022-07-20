#!/bin/bash

mkdir build && pushd build

cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DCMAKE_PREFIX_PATH=${PREFIX} \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DWITH_SYSTEM_SVM=ON  \
    -DWITH_SYSTEM_GEOTRANS=ON \
    -DWITH_DEV_TOOLS=OFF \
    -DWITH_TRIANGLE=OFF \
../saga-gis

make -j 4
make install
