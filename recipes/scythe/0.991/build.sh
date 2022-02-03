#!/bin/bash

mkdir -p ${PREFIX}/bin


make CC=${CC}
cp scythe ${PREFIX}/bin

# Create directory for adapters and copy data
ADAPTERS="${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}/adapters"
mkdir -p "${ADAPTERS}"
cp illumina_adapters.fa ${ADAPTERS}/

mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/scythe.sh
export SCYTHE_ADAPTERS=${ADAPTERS}
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/scythe.sh
unset SCYTHE_ADAPTERS
EOF
