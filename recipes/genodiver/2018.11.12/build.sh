#!/bin/bash

mkdir -p ${PREFIX}/bin

export CFLAGS="$CFLAGS -I$PREFIX/include"
export LDFLAGS="$LDFLAGS -L$PREFIX/lib"
export CPATH=${PREFIX}/include

CXXFLAGS="-g -w -lz -O3 -DMKL_ILP64 -m64 -fopenmp -std=c++11 -I${PREFIX}/include/eigen3 -I${PREFIX}/include"

if [ `uname` == Darwin ]
then
  LDFLAGS+=" -Wl,${PREFIX}/lib/libmkl_intel_ilp64.so ${PREFIX}/lib/libmkl_sequential.so ${PREFIX}/lib/libmkl_core.so -lpthread -lm -ldl"
  system="mac"
else
  LDFLAGS+=" -Wl,--start-group ${PREFIX}/lib/libmkl_intel_ilp64.so ${PREFIX}/lib/libmkl_core.so ${PREFIX}/lib/libmkl_gnu_thread.so -Wl,--end-group -lpthread -lm -ldl"
  system="linux"
fi

make CXX="${CXX}" SYSTEM="${system}" LDFLAGS="${LDFLAGS}" CXXFLAGS="${CXXFLAGS}" -j "${CPU_COUNT}"

cp GenoDiver ${PREFIX}/bin
chmod +x ${PREFIX}/bin/GenoDiver
