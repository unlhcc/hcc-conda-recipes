#!/bin/bash

chmod +x configure

if [ `uname` == Darwin ]; then
    ./configure --prefix=$PREFIX --disable-shared
else
    ./configure --prefix=$PREFIX
fi

make -j 4
make check
make install
rm -rf ${PREFIX}/info
