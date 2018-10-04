#!/bin/bash

./configure --enable-cplusplus --prefix=${PREFIX}
make
make install
