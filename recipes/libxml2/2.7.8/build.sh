#!/bin/bash

./configure --prefix="${PREFIX}" \
            --build=$BUILD \
            --host=$HOST \
            --with-iconv="${PREFIX}" \
            --with-zlib="${PREFIX}" \
            --with-icu \
            --with-lzma="${PREFIX}" \
            --without-python

make -j${CPU_COUNT} ${VERBOSE_AT}
make install
