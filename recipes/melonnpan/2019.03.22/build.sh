#!/bin/bash

# install package
$R CMD INSTALL --build .

# copy extra script
chmod +x run_melonnpan_train.R
cp run_melonnpan_train.R ${PREFIX}/bin
