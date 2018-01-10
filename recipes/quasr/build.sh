#!/bin/bash

cp *.py ${PREFIX}/bin
cp extras/* ${PREFIX}/bin
cp -R modules/ ${SP_DIR}/quasr
touch ${SP_DIR}/quasr/__init__.py
echo ${SP_DIR}
ls ${SP_DIR}
ls ${SP_DIR}/quasr
