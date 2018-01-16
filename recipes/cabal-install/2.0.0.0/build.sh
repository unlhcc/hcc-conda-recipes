#!/bin/bash

export LD_LIBRARY_PATH=${PREFIX}/lib

EXTRA_CONFIGURE_OPTS="--extra-include-dirs=${PREFIX}/include --extra-lib-dirs=${PREFIX}/lib" ./bootstrap.sh  --global

mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d

echo "export CABAL_CONFIG=${PREFIX}/etc/cabal.config" > ${PREFIX}/etc/conda/activate.d/cabal-config.sh
echo "unset CABAL_CONFIG" > ${PREFIX}/etc/conda/deactivate.d/cabal-config.sh

cp ${RECIPE_DIR}/cabal.config ${PREFIX}/etc
