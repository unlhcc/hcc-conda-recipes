#!/bin/bash

chmod +x configure

./configure --prefix=$PREFIX --enable-cxx

make -j 2
make install
