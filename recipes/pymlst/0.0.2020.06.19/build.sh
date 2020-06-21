#!/bin/bash

# Copy main scripts
mkdir -p ${PREFIX}/bin/
cp *.py ${PREFIX}/bin/
chmod +x ${PREFIX}/bin/*.py

# Copy libraries
# Using PY_VER returns 3.7 although 3.8 is used
PYVER=`python -c 'import sys; print(str(sys.version_info[0])+"."+str(sys.version_info[1]))'`
mkdir -p ${PREFIX}/lib/python${PYVER}/site-packages/
cp -r lib/ ${PREFIX}/lib/python${PYVER}/site-packages/
