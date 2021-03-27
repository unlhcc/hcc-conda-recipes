#!/bin/bash

mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d

./install -mode silent -agreeToLicense yes -destinationFolder $PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM

# fix missing symlink in package
ln -s ${PREFIX}/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/v83/bin/glnxa64/libpng12.so.0 \
 ${PREFIX}/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/v83/bin/libpng12.so

# set LD_LIBRARY_PATH on activation. not a great solution but the MCR puts libraries
# in non-standard locations and the usual binary relocation corrupts the .mex files somehow.
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/mcr.sh
export LD_LIBRARY_PATH_MCR=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=${PREFIX}/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/v83/runtime/glnxa64:${PREFIX}/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/v83/bin/glnxa64:${PREFIX}/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/v83/sys/os/glnxa64:$LD_LIBRARY_PATH
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/mcr.sh
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH_MCR
unset LD_LIBRARY_PATH_MCR
EOF
