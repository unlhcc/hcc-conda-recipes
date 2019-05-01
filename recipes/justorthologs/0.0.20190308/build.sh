#!/bin/bash

mkdir -p ${PREFIX}/bin
chmod +x *.py *.sh
cp {*.py,*.sh} ${PREFIX}/bin
