#!/bin/bash

mkdir -p $PREFIX/bin

# Copy scripts
cp shortbred*.py ${PREFIX}/bin/
cp utils/AdjustFastaHeadersForShortBRED.py ${PREFIX}/bin/
chmod +x ${PREFIX}/bin/*.py

# Copy libraries
mkdir -p ${PREFIX}/lib/python2.7/site-packages
cp -r shortbred_src/ ${PREFIX}/lib/python2.7/site-packages/
