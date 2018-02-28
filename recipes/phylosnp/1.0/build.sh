#!/bin/bash

SITELIB=`perl '-V:installsitelib' | cut -f 2 -d "'"`
mkdir -p ${SITELIB} ${PREFIX}/bin

cp -R inc/PhyloSNP ${SITELIB}

cp {phylosnp.pl,shrunk-genomes.pl} ${PREFIX}/bin
