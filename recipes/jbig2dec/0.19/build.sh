#!/bin/bash

./configure \
  --prefix="${PREFIX}" \
  --with-libpng="${PREFIX}"

make -j 4
make install
