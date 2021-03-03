#!/bin/bash

mkdir -p ${PREFIX}/bin
make CC=${CXX}
cp metacv ${PREFIX}/bin
