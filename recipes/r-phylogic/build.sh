#!/bin/bash

cd scarter/Google\ Drive/Software/Phylogic.v0.67/

R CMD INSTALL library/

# create folder for additional scripts
target=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}
mkdir -p ${target}/scripts/

# copy R scripts
chmod +x *.R
cp *.R ${target}/scripts/
