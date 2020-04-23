#!/bin/bash

# Run Makefile.PL
if [ "$(uname)" == "Darwin" ]; then
    TMP_DIR=`mktemp -d -t 'tmpdir'`
else
    TMP_DIR=`mktemp -d`
fi

BUILD_DIR=${TMP_DIR}
mkdir -p ${BUILD_DIR}/lib/

cd ${BUILD_DIR}
cp -r ${SRC_DIR}/RetroSeq/ ${BUILD_DIR}/lib/
cp ${SRC_DIR}/bin/*.pl ${BUILD_DIR}
cp ${RECIPE_DIR}/Makefile.PL ${BUILD_DIR}

perl Makefile.PL INSTALLDIRS=site
make
make install
