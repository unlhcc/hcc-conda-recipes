#!/bin/bash
 

# copy extra scripts
chmod +x bin/*.pl
cp bin/*.pl ${PREFIX}/bin/
chmod +x tools/*.pl
cp tools/*pl ${PREFIX}/bin/


# Run Makefile.PL
if [ "$(uname)" == "Darwin" ]; then
    TMP_DIR=`mktemp -d -t 'tmpdir'`
else
    TMP_DIR=`mktemp -d`
fi

BUILD_DIR=${TMP_DIR}
mkdir -p ${BUILD_DIR}/lib/

cd ${BUILD_DIR}
cp -R ${SRC_DIR}/dotlib/DotLib.pm ${BUILD_DIR}/lib/
cp ${SRC_DIR}/SSPACE_Standard_v3.0.pl ${BUILD_DIR}
cp ${RECIPE_DIR}/Makefile.PL ${BUILD_DIR}

perl Makefile.PL INSTALLDIRS=site
make
make install


# Create symlink
ln -s ${PREFIX}/bin/SSPACE_Standard_v3.0.pl ${PREFIX}/bin/SSPACE_Standard.pl


