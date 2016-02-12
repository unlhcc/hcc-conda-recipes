#!/bin/bash

./configure --prefix=${PREFIX} --enable-shared --enable-static
make
make install
