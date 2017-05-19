#!/bin/bash
mkdir -pv $PREFIX/bin
mkdir -pv $PREFIX/lib
cp bin/* $PREFIX/bin
cp -R lib/* $PREFIX/lib
