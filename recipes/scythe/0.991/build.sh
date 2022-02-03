#!/bin/bash

mkdir -p ${PREFIX}/bin

make CC=${CC}
cp scythe ${PREFIX}/bin
