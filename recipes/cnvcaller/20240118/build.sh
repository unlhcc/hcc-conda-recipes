#!/bin/bash

# Copy main scripts
mkdir -p ${PREFIX}/bin/
chmod +x *.sh
cp *.sh ${PREFIX}/bin/
chmod +x ./bin/*.py
chmod +x ./bin/*.pl
cp ./bin/* ${PREFIX}/bin/
