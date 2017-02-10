#!/bin/bash
set -eu -o pipefail
target=$PREFIX/share/java/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM
mkdir -p $target
mkdir -p $PREFIX/bin
cp * $target/.
cp $RECIPE_DIR/gem.sh $target/gem
ln -s $target/gem $PREFIX/bin

mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/gem.sh
export GEM_HOME=/opt/anaconda1anaconda2anaconda3/share/java/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/gem.sh
unset GEM_HOME
EOF

