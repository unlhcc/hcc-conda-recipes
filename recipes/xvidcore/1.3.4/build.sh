#!/bin/bash

cd build/generic
./configure --prefix=${PREFIX}
make
make install
