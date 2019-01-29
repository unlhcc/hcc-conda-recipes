#!/bin/bash

export CXXFLAGS="-fpermissive $CXXFLAGS"
./configure --prefix=${PREFIX} --enable-shared=yes
make
make install
