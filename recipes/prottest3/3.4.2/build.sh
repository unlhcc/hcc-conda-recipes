#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p ${outdir} ${PREFIX}/bin

ant jar
cp -a -R dist/* ${outdir}

ln -s ${outdir}/prottest3 ${PREFIX}/bin
ln -s ${outdir}/runProtTestHPC.sh ${PREFIX}/bin
ln -s ${outdir}/runXProtTestHPC.sh ${PREFIX}/bin

# set variable pointing to JAR on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/prottest3.sh
export PROTTEST3_JAR=${outdir}/prottest-${PKG_VERSION}.jar
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/prottest3.sh
unset PROTTEST3_JAR
EOF
