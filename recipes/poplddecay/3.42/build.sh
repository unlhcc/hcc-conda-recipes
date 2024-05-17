#!/bin/sh

chmod +x configure
./configure --prefix=${PREFIX}
make
make install

# add aux Perl programs
chmod +x ./bin/*.pl
chmod +x ./bin/mis/*.pl

cp ./bin/Plot_MultiPop.pl ${PREFIX}/bin/
cp ./bin/Plot_OnePop.pl ${PREFIX}/bin/
cp ./bin/mis/plink2genotype.pl ${PREFIX}/bin/
