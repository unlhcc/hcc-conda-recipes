#!/bin/bash

./bootstrap.sh
./configure --prefix=$PREFIX --enable-cuckoo --enable-magic --enable-dotnet
make
make install
