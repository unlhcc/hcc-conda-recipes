#!/bin/bash
set -v -x
export LD_LIBRARY_PATH=${PREFIX}/lib
export C_INCLUDE_PATH=${PREFIX}/include

# Fix exec permissions on all scripts
find ./ -name \*.sh -exec chmod +x '{}' \;

sh compile.sh
mv output/bazel $PREFIX/bin

cat <<EOF >> ${PREFIX}/etc/conda/activate.d/bazel.sh
export LD_LIBRARY_PATH=${PREFIX}/lib
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/bazel.sh
unset LD_LIBRARY_PATH
EOF
