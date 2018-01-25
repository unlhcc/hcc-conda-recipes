#!/bin/bash

$PYTHON setup.py install --single-version-externally-managed --record=record.txt
cp ./src/magic/MAGIC.py $PREFIX/bin
