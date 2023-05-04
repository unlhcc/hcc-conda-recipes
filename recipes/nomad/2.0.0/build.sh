#!/bin/bash -e

make uninstall
make CC=$CXX CXX=$CXX all
make install
