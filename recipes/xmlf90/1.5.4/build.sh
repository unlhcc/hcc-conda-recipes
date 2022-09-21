#!/bin/bash

./configure --prefix=${PREFIX} --enable-shared=yes --enable-static=no
make
make install
