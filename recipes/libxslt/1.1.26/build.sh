#!/bin/bash

./configure --prefix=$PREFIX --with-libxml-prefix=$PREFIX

make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install
