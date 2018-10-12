#!/bin/bash

export CFLAGS="-fpermissive $CFLAGS"
./configure --prefix=${PREFIX}
make
make install
