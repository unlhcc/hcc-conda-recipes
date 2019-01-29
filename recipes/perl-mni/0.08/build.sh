#!/bin/bash

TARGET="${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}"
mkdir -p ${TARGET}
sed -i -e s#TARGET#$TARGET#g Makefile.PL

# Make sure this goes in site
perl Makefile.PL INSTALLDIRS=site
make
make install
