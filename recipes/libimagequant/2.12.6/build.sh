#!/bin/bash

./configure --prefix=${PREFIX} --enable-sse --with-openmp
make
make install
