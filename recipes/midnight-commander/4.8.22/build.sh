#!/bin/bash

./configure --prefix=${PREFIX} --enable-mclib
make -j 2
make install
