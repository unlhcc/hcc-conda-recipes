#!/bin/bash

mkdir -p ${PREFIX}/bin

cp *.pl ${PREFIX}/bin/
chmod +x ${PREFIX}/bin/*.pl

ln -s ${PREFIX}/bin/scipio.1.4.1.pl ${PREFIX}/bin/scipio.pl
ln -s ${PREFIX}/bin/yaml2gff.1.4.pl ${PREFIX}/bin/yaml2gff.pl
ln -s ${PREFIX}/bin/yaml2log.1.4.pl ${PREFIX}/bin/yaml2log.pl
