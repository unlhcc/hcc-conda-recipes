#!/bin/bash

./configure --prefix=${PREFIX} --with-build-path=${PREFIX}
make
make install
