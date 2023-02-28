#!/bin/bash

set -ex

export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

# remove test failing in non interactive shell
rm ext/standard/tests/file/lstat_stat_variation10.phpt
rm ext/standard/tests/network/bug73594.phpt

./configure --prefix=$PREFIX \
            --with-iconv=$PREFIX \
            --with-openssl=$PREFIX \
            --with-libxml=$PREFIX \
            --with-external-pcre \
            --with-zlib \
            --with-zip \
            --with-bz2=$PREFIX\
            --with-curl \
            --enable-gd \
            --with-external-gd \
            --enable-exif \
            --with-ldap=$PREFIX \
            --with-gmp=$PREFIX \
            --with-ffi \
            --with-xsl \
            --with-readline=$PREFIX \
            --with-pdo-mysql
            
            

make -j 4

make install
