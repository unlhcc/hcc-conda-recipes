#!/bin/bash

./configure --prefix=${PREFIX} --enable-shared=yes --enable-static=no --with-xmlf90=${PREFIX}
make
make install
