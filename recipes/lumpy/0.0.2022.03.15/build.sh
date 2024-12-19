#!/bin/bash

mkdir -p ${PREFIX}/bin/

# copy python scripts
cp *.py ${PREFIX}/bin/
chmod +x ${PREFIX}/bin/*.py

