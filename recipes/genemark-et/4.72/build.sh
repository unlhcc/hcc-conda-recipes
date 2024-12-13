#!/bin/bash

mkdir -p ${PREFIX}/bin
cp -R * ${PREFIX}/bin

# copy license key
gunzip gm_key.gz
chmod +x gm_key
cp gm_key ${PREFIX}/bin
