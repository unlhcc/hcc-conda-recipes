#!/bin/bash

export LIBS="-lrt"
./autogen.sh
./configure --prefix=$PREFIX --with-boost=$PREFIX
make
make install
ln -sv ${PREFIX}/bin/mkdssp ${PREFIX}/bin/dssp
