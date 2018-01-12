#!/bin/bash

export LD_LIBRARY_PATH=${PREFIX}/lib

EXTRA_CONFIGURE_OPTS="--extra-include-dirs=${PREFIX}/include --extra-lib-dirs=${PREFIX}/lib" ./bootstrap.sh  --global
