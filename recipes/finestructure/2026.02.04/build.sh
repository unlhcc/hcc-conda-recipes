#!/bin/bash

mkdir -p $PREFIX/bin

./autogen.sh
./configure --prefix=$PREFIX
make
make install

# support scripts
chmod +x FinestructureLibrary.R scripts/*
cp FinestructureLibrary.R scripts/* $PREFIX/bin/
