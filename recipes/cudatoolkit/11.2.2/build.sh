#!/bin/bash

# System perl path is hardcoded in a script two extraction levels down. Grr.
sudo yum -y -q install perl

# silent install, toolkit only
FN='cuda_11.2.2_460.32.03_linux.run'
chmod +x $FN
./$FN --override --no-opengl-libs --silent --no-man-page --toolkit --installpath=${PREFIX}

# Remove symlinks and restore real paths
rm -f ${PREFIX}/lib ${PREFIX}/include ${PREFIX}/lib64
mv ${PREFIX}/targets/x86_64-linux/include ${PREFIX}/include
mv ${PREFIX}/targets/x86_64-linux/lib ${PREFIX}/lib

# standardize paths/install locations
mv ${PREFIX}/extras/Debugger/lib64/* ${PREFIX}/lib
mv ${PREFIX}/extras/Debugger/include/* ${PREFIX}/include
mv ${PREFIX}/extras/CUPTI/lib64/* ${PREFIX}/lib
mv ${PREFIX}/extras/CUPTI/include/* ${PREFIX}/include
mv ${PREFIX}/compute-sanitizer/{compute-sanitizer,TreeLauncherSubreaper,TreeLauncherTargetLdPreloadHelper} ${PREFIX}/bin
mv ${PREFIX}/compute-sanitizer/lib*.so ${PREFIX}/lib
mv ${PREFIX}/compute-sanitizer/include/* ${PREFIX}/include
mv ${PREFIX}/pkgconfig ${PREFIX}/lib

# remove unneeded bits to get the size more manageable
rm -rf ${PREFIX}/{extras,libnsight,nsight-*,nsightee_plugins,DOCS,README,EULA.txt,compute-sanitizer,nvml,version.json,tools}

# some things still look for lib64
ln -rsv ${PREFIX}/lib ${PREFIX}/lib64

# activate/deactivate scripts
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cp ${RECIPE_DIR}/scripts/activate.sh ${PREFIX}/etc/conda/activate.d/${PKG_NAME}.sh
cp ${RECIPE_DIR}/scripts/deactivate.sh ${PREFIX}/etc/conda/deactivate.d/${PKG_NAME}.sh
