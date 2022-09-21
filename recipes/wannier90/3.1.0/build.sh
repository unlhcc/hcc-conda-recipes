#!/bin/bash

cp ${RECIPE_DIR}/make.inc ${SRC_DIR}/make.inc
make default -j$CPU_COUNT
make dynlib -j$CPU_COUNT
make w90chk2chk -j$CPU_COUNT
make w90vdw -j$CPU_COUNT
make w90pov -j$CPU_COUNT
make install PREFIX=${PREFIX}
cp -a libwannier${SHLIB_EXT} ${PREFIX}/lib
