#!/bin/bash

# fix for pyscrap
find $SRC_DIR -type f -exec sed -i.bak 's/from pomoxis\.pyscrap import pyscrap/import pyscrap/g' {} +

$PYTHON setup.py install --single-version-externally-managed --record=record.txt
