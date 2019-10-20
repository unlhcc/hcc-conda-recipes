#!/bin/bash

export LIBS="-lopenblas -lgfortran -lgomp"
export LDFLAGS="$LDFLAGS -L${PREFIX}/lib -lopenblas -lgfortran -lgomp"

python setup.py install --single-version-externally-managed --record=record.txt
