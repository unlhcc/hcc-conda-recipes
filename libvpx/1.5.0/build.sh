#!/bin/bash

BUILD=`mktemp -d`
cd $BUILD
${SRC_DIR}/configure --enable-shared --prefix=${PREFIX}
make
make install
