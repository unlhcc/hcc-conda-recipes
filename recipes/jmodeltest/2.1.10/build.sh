#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p ${outdir} ${PREFIX}/bin

ant jar
cp -a -R dist/* ${outdir}

cp ${RECIPE_DIR}/jmodeltest.py ${outdir}
ln -s ${outdir}/jmodeltest.py ${PREFIX}/bin/jmodeltest
chmod 0755 ${PREFIX}/bin/jmodeltest

# set variable pointing to JAR on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/jmodeltest.sh
export JMODELTEST_JAR=${outdir}/jModelTest.jar
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/prottest3.sh
unset JMODELTEST_JAR
EOF
