#!/bin/bash

./install.sh -d ${PREFIX} << EOF
Y
\n
EOF

BINARY_HOME=${PREFIX}/bin
UTILITIES_HOME=${PREFIX}/CCSBpckgs/AutoDockTools/Utilities24
chmod +x ${UTILITIES_HOME}/*.py
ln -s ${UTILITIES_HOME}/prepare_ligand4.py ${BINARY_HOME}/prepare_ligand4.py
ln -s ${UTILITIES_HOME}/prepare_receptor4.py ${BINARY_HOME}/prepare_receptor4.py
