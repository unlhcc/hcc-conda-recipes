#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    TMP_DIR=`mktemp -d -t 'tmpdir'`
else
    TMP_DIR=`mktemp -d`
fi


BUILD_DIR=${TMP_DIR}/Schedule-SGELK
mkdir -p ${BUILD_DIR}/lib/Schedule

cd ${BUILD_DIR}
cp -R ${SRC_DIR}/SGELK.pm ${BUILD_DIR}/lib/Schedule
cp ${RECIPE_DIR}/Makefile.PL ${BUILD_DIR}

perl Makefile.PL INSTALLDIRS=site
make
make install
