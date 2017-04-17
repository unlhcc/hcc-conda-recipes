#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include
export LD_LIBRARY_PATH=${PREFIX}/lib
export LIBRARY_PATH=${PREFIX}/lib

ant dist
cp -R dist/pegasus-4.7.4/{bin,etc,lib,share} ${PREFIX}
