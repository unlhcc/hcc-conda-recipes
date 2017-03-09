#!/bin/bash
mkdir -pv $PREFIX/bin
make clean
make
cp bin/* $PREFIX/bin
