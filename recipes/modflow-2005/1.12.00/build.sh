#!/bin/bash

mkdir -p ${PREFIX}/bin

cd make
make
chmod +x mf2005
cp mf2005 ${PREFIX}/bin
