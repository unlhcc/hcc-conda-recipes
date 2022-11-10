#!/bin/bash

./configure --prefix=$PREFIX --enable-static=no
make
make install
