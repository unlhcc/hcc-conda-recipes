#!/bin/bash

./configure --enable-python --enable-openmp --prefix=${PREFIX} --enable-kernel-compiler=${CC}
make clean
make
make install install-py install-lib
