#!/bin/bash

# Set the hostname env var to be constant as the install creates
# directory names based on it.
export HOSTNAME=bosco.local
# Directory name created by installer
BOSCO_DIR="local.bosco"
./bosco_install --prefix=${PREFIX} --local-dir=${PREFIX}/${BOSCO_DIR} --owner=nobody

# Condor divides things between bin/ and sbin/, but here we want
# everything available in bin/.
for f in `ls -1 ${PREFIX}/sbin`
    do ln -s ${PREFIX}/sbin/$f ${PREFIX}/bin
done

# These dirs are empty at install time, and conda removes empty dirs from the
# final package.  This breaks condor_master on startup, so force conda to keep
# them via a dummy file.
touch ${PREFIX}/${BOSCO_DIR}/execute/.condakeep \
      ${PREFIX}/${BOSCO_DIR}/log/.condakeep \
      ${PREFIX}/${BOSCO_DIR}/spool/.condakeep

mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/bosco.sh
export CONDOR_CONFIG="${PREFIX}/etc/condor_config"
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/bosco.sh
unset CONDOR_CONFIG
EOF
