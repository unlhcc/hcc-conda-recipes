#!/bin/sh

export CXXFLAGS="$CXXFLAGS -std=c++11 -I${PREFIX}/include"

autoreconf -fi

./configure --prefix=$PREFIX --with-vrna=$PREFIX
make -j ${CPU_COUNT} CXXFLAGS+='-fpermissive'
make install
