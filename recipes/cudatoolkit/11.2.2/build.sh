#!/bin/bash

# System perl path is hardcoded in a script two extraction levels down. Grr.
sudo yum -y -q install perl

# silent install, toolkit only
FN='cuda_11.2.2_460.32.03_linux.run'
chmod +x $FN
./$FN --override --no-opengl-libs --silent --no-man-page --toolkit --installpath=${PREFIX}

# standardize paths/install locations
mv ${PREFIX}/lib64 ${PREFIX}/lib
mv ${PREFIX}/extras/Debugger/lib64/* ${PREFIX}/lib
mv ${PREFIX}/extras/Debugger/include/* ${PREFIX}/include
mv ${PREFIX}/extras/CUPTI/lib64/* ${PREFIX}/lib
mv ${PREFIX}/extras/CUPTI/include/* ${PREFIX}/include
mv ${PREFIX}/pkgconfig ${PREFIX}/lib

# remove unneeded bits to get the size more manageable
rm -rf ${PREFIX}/{extras,libnsight,nsight-*,nsightee_plugins}
