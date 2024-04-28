#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p ${outdir}
mkdir -p ${PREFIX}/bin

cp -R * ${outdir}
chmod +x ${outdir}/src/*/*
chmod +x ${outdir}/scripts/*

cd ${PREFIX}/bin
for scripts in ${outdir}/scripts/*.py
do
	ln -s "$scripts"
done
for scripts in ${outdir}/tools/*.py
do
        ln -s "$scripts"
done
for helpers in ${outdir}/src/genome/*.py
do
        ln -s "$helpers"
done
for helpers in ${outdir}/src/annotation/*.py
do
        ln -s "$helpers"
done

# Some helpers are imports
cd ${PREFIX}/lib/python2.7/site-packages/
for imports in ${outdir}/src/*/*.py
do
	ln -s "$imports"
done

mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/boa.sh
export BACFINDER_HOME=${outdir}
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/boa.sh
unset BACFINDER_HOME
EOF
