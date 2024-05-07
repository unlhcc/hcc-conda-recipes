#!/bin/bash

# temporary create symlinks so configure can find the tk headers
# since they're in a non-standard layout
ln -v -s -r ${PREFIX}/include ${PREFIX}/include/generic
ln -v -s -r ${PREFIX}/include ${PREFIX}/include/unix

./configure --prefix=${PREFIX} --with-x  --enable-stub
make
make install

ln -v -s -r ${PREFIX}/lib/Togl2.0/libTogl2.0.so ${PREFIX}/lib/libTogl.so.2
ln -v -s -r ${PREFIX}/lib/Togl2.0/libTogl2.0.so ${PREFIX}/lib/libTogl2.0.so

# remove symlinks so they don't get included in the package
rm -f ${PREFIX}/include/generic ${PREFIX}/include/unix
