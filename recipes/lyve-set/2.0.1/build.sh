#!/bin/bash

# copy required scripts
cp scripts/*.pl ${PREFIX}/bin
cp scripts/*.sh ${PREFIX}/bin
cp scripts/cpanm ${PREFIX}/bin
cp scripts/getgbk ${PREFIX}/bin
cp ${PREFIX}/bin/snap-aligner ${PREFIX}/bin/snap
cp plugins/tinsel/set_plugin_tinsel.pl ${PREFIX}/bin

# create folder for config
# target=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}
mkdir -p ${PREFIX}/config/
cp config/original/* ${PREFIX}/config

# create folder for config
mkdir -p ${PREFIX}/lib/phast/
wget http://phast.wishartlab.com/phage_finder/DB/prophage_virus.db -O ${PREFIX}/lib/phast/phast.faa
makeblastdb -in ${PREFIX}/lib/phast/phast.faa -dbtype prot

# create folder for test data
cp -r testdata ${PREFIX}
