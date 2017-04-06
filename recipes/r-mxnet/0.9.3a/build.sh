#!/bin/bash

export LD_LIBRARY_PATH=${PREFIX}/lib
export CFLAGS=${PREFIX}/include
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

wget https://raw.githubusercontent.com/Itseez/opencv_3rdparty/81a676001ca8075ada498583e4166079e5744668/ippicv/ippicv_linux_20151201.tgz -P /tmp && tar -zxvf /tmp/ippicv_linux_20151201.tgz -C /tmp && cp /tmp/ippicv_lnx/include/* ${PREFIX}/include && cp  /tmp/ippicv_lnx/lib/intel64/* ${PREFIX}/lib

make -j 4
make rpkg
R CMD INSTALL mxnet_current_r.tar.gz
