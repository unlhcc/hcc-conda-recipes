#!/usr/bin/env bash
# inspired by build script for Arch Linux fftw pacakge:
# https://projects.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/fftw

CONFIGURE="./configure --prefix=$PREFIX --enable-shared --enable-threads --disable-fortran --with-pic"

# Single precision (fftw libraries have "f" suffix)
$CONFIGURE --enable-float
make
make install

# Double precision (fftw libraries have no precision suffix)
$CONFIGURE
make
make install

# Delete fftw-creatd info dir otherwise conda build breaks
rm -rf ${PREFIX}/info

# Test suite
# tests are performed during building as they are not available in the
# installed package.
# Additional tests can be run with make smallcheck and make bigcheck
cd tests && make check
# Additional tests can be run using the next two lines
#make smallcheck
#make bigcheck
