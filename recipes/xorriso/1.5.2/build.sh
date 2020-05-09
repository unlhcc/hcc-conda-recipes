#!/bin/bash

export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

./configure --prefix=${PREFIX} --mandir=${PREFIX}/man
make
make install
