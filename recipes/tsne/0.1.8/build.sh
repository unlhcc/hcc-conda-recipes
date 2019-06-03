#!/bin/bash

export LDFLAGS="-L${PREFIX}/lib -lm ${PREFIX}/lib/libatlas.a -lm ${PREFIX}/lib/libcblas.a"

$PYTHON -m pip install . --no-deps --ignore-installed -vv
