#!/bin/bash

./configure --enable-python --enable-openmp --disable-cuda --prefix=${PREFIX} --enable-kernel-compiler=${CC}
make clean
make
make install install-py install-lib
