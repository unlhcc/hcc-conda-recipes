#!/bin/bash
mkdir -pv $PREFIX/bin
sed "s/\.\/binReads.pl/binReads.pl/g" hiddenDomains
sed "s/\.\/domainsToBed.pl/domainsToBed.pl/g" hiddenDomains
sed "s/\.\/domainsMergeToBed.pl/domainsMergeToBed.pl/g" hiddenDomains
cp hiddenDomains peakCenters *.pl *.R $PREFIX/bin
