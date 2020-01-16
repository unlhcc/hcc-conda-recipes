#!/bin/bash

# System perl path is hardcoded in a script two extraction levels down. Grr.
sudo yum -y install perl

FN='73xbfrgg4mhl3wdqiv99il7klnt8654i.48_linux'
#FN='cuda_10.0.130_410.48_linux'
chmod +x $FN
./$FN --toolkit --silent --no-opengl-libs --override --toolkitpath=${PREFIX}
rm -rf ${PREFIX}/samples
mv ${PREFIX}/lib64 ${PREFIX}/lib
sed -i s/lib64/lib/g ${PREFIX}/pkgconfig/*.pc

FN='cuda_10.0.130.1_linux.run'
chmod +x $FN
./$FN --silent --accept-eula --installdir=${PREFIX}
