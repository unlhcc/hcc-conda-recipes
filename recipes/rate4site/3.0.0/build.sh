#!/bin/bash

export CXXFLAGS="$CXXFLAGS -fpermissive -std=c++03"
./configure --prefix=$PREFIX
make -j 4
make install
