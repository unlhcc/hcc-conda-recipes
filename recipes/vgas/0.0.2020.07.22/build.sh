#!/bin/bash

mkdir -p ${PREFIX}/bin
cp vgas ${PREFIX}/bin/
cp handle.py ${PREFIX}/bin/
chmod +x ${PREFIX}/bin/vgas
chmod +x ${PREFIX}/bin/handle.py

# Create directory for db files
TGT="$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM"
mkdir -p ${TGT}
cp virus* ${TGT}/
