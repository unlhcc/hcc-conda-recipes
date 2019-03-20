#!/bin/bash

mkdir -p ${PREFIX}/bin ${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}
cp -R bin/bssm bin/gthdata ${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}
cp bin/{gth,gthbssmbuild,gthbssmfileinfo,gthbssmrmsd,gthbssmtrain,gthcleanrec.sh,gthclean.sh,gthconsensus,gthfilestat,gthgetseq,gthsplit,gthsplit2dim.sh} ${PREFIX}/bin

mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/gth.sh
export BSSMDIR=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}/bssm
export GTHDATADIR=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}/gthdata
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/gth.sh
unset BSSMDIR GTHDATADIR
EOF
