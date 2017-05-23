#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include
export LD_LIBRARY_PATH=${PREFIX}/lib
export LIBRARY_PATH=${PREFIX}/lib

ant dist
cp -R dist/pegasus-4.7.5dev/{bin,etc,lib,share} ${PREFIX}
ln -s ${PREFIX}/share/pegasus/notification/email ${PREFIX}/bin/pegasus-email
