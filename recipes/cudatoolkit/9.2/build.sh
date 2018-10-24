#!/bin/bash

# System perl path is hardcoded in a script two extraction levels down. Grr.
sudo yum -y install perl

FN='cuda_9.2.148_396.37_linux'
chmod +x $FN
./$FN --toolkit --silent --no-opengl-libs --override --toolkitpath=${PREFIX}
rm -rf ${PREFIX}/samples
mv ${PREFIX}/lib64 ${PREFIX}/lib
sed -i s/lib64/lib/g ${PREFIX}/pkgconfig/*.pc
