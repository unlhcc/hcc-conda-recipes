#!/bin/bash

mkdir -p ${PREFIX}/bin

make all CC="${CXX}" LIB="-I${PREFIX}/include"

cp macs ${PREFIX}/bin
cp msformatter ${PREFIX}/bin

chmod +x ${PREFIX}/bin/macs
chmod +x ${PREFIX}/bin/msformatter
