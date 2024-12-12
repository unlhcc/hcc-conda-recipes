#!/bin/bash

mkdir -p ${PREFIX}/bin

# copy scripts
chmod +x ./bin/*
cp -R ./bin/* ${PREFIX}/bin
chmod +x ./dependencies/*
cp -R ./dependencies/{blosum62.csv,log_reg_prothints.pl,probuild,spaln_boundary_scorer} ${PREFIX}/bin
