#!/bin/bash

mkdir -p ${PREFIX}/bin

cp *.sh ${PREFIX}/bin
cp scripts/* ${PREFIX}/bin

chmod +x ${PREFIX}/bin/*.sh
chmod +x ${PREFIX}/bin/*.pl


# Copy ViennaRNA util scripts to /bin/
cp ${PREFIX}/share/ViennaRNA/bin/*.pl ${PREFIX}/bin
chmod +x ${PREFIX}/bin/*.pl

# some perl scripts from the dependencies have "perl -w" that doesn't work with the newer Perl versions
for i in $PREFIX/bin/*.pl
do
sed -i 's/perl -w/perl/g' $i
done
