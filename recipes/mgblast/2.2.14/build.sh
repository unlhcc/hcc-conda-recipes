#!/bin/bash

mkdir -p ${PREFIX}/bin
mkdir build lib
./build_mgblast.sh
cp build/{mgblast,asntool,formatdb} ${PREFIX}/bin
