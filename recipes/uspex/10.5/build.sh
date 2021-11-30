#!/bin/bash

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p ${outdir}
installationPATH=${outdir}
mkdir -p ${PREFIX}/bin

cd uspex
./USPEX_MATLABruntime.install -mode silent -agreeToLicense yes  -destinationFolder $installationPATH
chmod +rw -R $installationPATH/application/archive/
ln -s $installationPATH/application/archive/* ${PREFIX}/bin/

# set necessary variables on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/uspex.sh
export MCRROOT=$installationPATH
export USPEXPATH=$installationPATH/application/archive/src
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/uspex.sh
unset MCRROOT
unset USPEXPATH
EOF
