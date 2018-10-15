#!/usr/bin/env bash

mkdir -p build
cd build

if [[ `uname` == 'Darwin' ]]; then

    cmake .. \
        -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
        -DCMAKE_MACOSX_RPATH="ON" \
        -DCMAKE_INSTALL_RPATH="${PREFIX}/lib"

else

    cmake .. \
        -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
        -DCMAKE_INSTALL_LIBDIR="lib"
fi

make
make install
cd ${SRC_DIR}/tests && make && ./main
