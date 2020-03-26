#!/bin/bash

mkdir -p ${PREFIX}/bin

make CC=${CC}

cp fastpath ${PREFIX}/bin
cp fastpathz ${PREFIX}/bin

chmod +x ${PREFIX}/bin/fastpath
chmod +x ${PREFIX}/bin/fastpathz
