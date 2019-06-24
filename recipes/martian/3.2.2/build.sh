#!/bin/bash

make all
chmod +x bin/*
cp bin/* ${PREFIX}/bin/
cp adapters/python/*.py ${PREFIX}/bin/

# create folder for additional files
target=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}
mkdir -p ${target}/jobmanagers
mkdir -p ${target}/adapters

# copy additional folders
cp -r jobmanagers/* ${target}/jobmanagers/
cp -r adapters/* ${target}/adapters/
