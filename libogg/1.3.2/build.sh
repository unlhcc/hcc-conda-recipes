#!/bin/bash
./configure --enable-shared --prefix=$PREFIX
make
make check
make install
