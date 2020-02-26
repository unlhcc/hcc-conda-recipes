#!/bin/bash

mkdir -p ${PREFIX}/bin

cd ${SRC_DIR}/hog_bottom_up

python -m pip install . --no-deps --ignore-installed -vv
cp bin/warthogs.py ${PREFIX}/bin
chmod +x ${PREFIX}/bin/warthogs.py
