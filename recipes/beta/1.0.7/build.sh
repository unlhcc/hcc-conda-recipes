#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include
export LD_LIBRARY_PATH=${PREFIX}/lib
export LDFLAGS="-L${PREFIX}/lib"

cd BETA_1.0.7
$PYTHON setup.py install
