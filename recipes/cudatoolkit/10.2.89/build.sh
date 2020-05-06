#!/bin/bash

# System perl path is hardcoded in a script two extraction levels down. Grr.
sudo yum -y install perl

FN='la9zf9s9rygp5nyvj5enlpfyr1vpmqyr.run'
#FN='cuda_10.2.89_440.33.01_rhel6.run'
chmod +x $FN
./$FN --toolkit --silent --no-opengl-libs --override --toolkitpath=${PREFIX}
rm -rf ${PREFIX}/samples
mv ${PREFIX}/lib64 ${PREFIX}/lib
sed -i s/lib64/lib/g ${PREFIX}/pkgconfig/*.pc
