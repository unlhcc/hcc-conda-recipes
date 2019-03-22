#!/bin/bash

# copy main script
chmod +x *.py
cp *.py ${PREFIX}/bin

# copy extra modules
chmod +x taxcuration/*.py
cp taxcuration/*.py ${PREFIX}/bin
