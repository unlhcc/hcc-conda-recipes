#!/bin/bash

mkdir -p ${PREFIX}/bin

cp phanotate.py ${PREFIX}/bin
cp lib/*.py ${PREFIX}/bin

chmod +x ${PREFIX}/bin/*.py
