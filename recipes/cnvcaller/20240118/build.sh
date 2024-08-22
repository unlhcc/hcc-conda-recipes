#!/bin/bash

# Copy main scripts
mkdir -p ${PREFIX}/bin/

chmod +x *.sh
cp *.sh ${PREFIX}/bin/
chmod +x *.py
cp *.py ${PREFIX}/bin/

chmod +x ./bin/*.py
chmod +x ./bin/*.pl
cp ./bin/* ${PREFIX}/bin/

# set CNVCALLER_ROOT variable on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/cnvcaller.sh
export CNVCALLER_ROOT=${PREFIX}
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/cnvcaller.sh
unset CNVCALLER_ROOT
EOF
