#!/bin/bash

mkdir -p ${PREFIX}/bin/

# copy scripts
cp Scripts/*.py ${PREFIX}/bin/
cp Scripts/*.R ${PREFIX}/bin/
cp Scripts/*.sh ${PREFIX}/bin/

chmod +x ${PREFIX}/bin/*.py
chmod +x ${PREFIX}/bin/*.R
chmod +x ${PREFIX}/bin/*.sh

