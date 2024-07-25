#!/bin/bash

autoreconf -ivf
./configure --prefix=${PREFIX}
make
make install
