#!/bin/bash

./configure --prefix=$PREFIX --without-included-zlib --without-included-popt --disable-xxhash
make
make check
make install
