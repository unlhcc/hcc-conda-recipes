#!/bin/bash

export CPATH=${PREFIX}/include
export LD_LIBRARY_PATH=${PREFIX}/lib
export LIBRARY_PATH=${PREFIX}/lib

make exif=1 curl=1
make install exif=1 curl=1
