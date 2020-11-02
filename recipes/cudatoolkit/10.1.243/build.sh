#!/bin/bash

# System perl path is hardcoded in a script two extraction levels down. Grr.
sudo yum -y -q install perl

FN='wd504k333f5gg18gycrk7a9t9t8zv19o.run'
#FN='cuda_10.1.243_418.87.00_rhel6.run'
chmod +x $FN
./$FN -noprompt -nosymlink -prefix=${PREFIX}
rm -rf ${PREFIX}/samples
mv ${PREFIX}/lib64 ${PREFIX}/lib
mv ${PREFIX}/extras/Debugger/lib64/* ${PREFIX}/lib
mv ${PREFIX}/extras/Debugger/include/* ${PREFIX}/include
mv ${PREFIX}/extras/CUPTI/lib64/* ${PREFIX}/lib
mv ${PREFIX}/extras/CUPTI/include/* ${PREFIX}/include

# remove unneeded bits to get the size more manageable
rm -rf ${PREFIX}/{doc,extras,libnsight,nsight-compute-2019.4.0,nsightee_plugins,nsight-systems-2019.3.7.5}
