#!/bin/bash

export INCLUDE_DIRS=${PREFIX}/include
export LIBRARY_DIRS=${PREFIX}/lib

$PYTHON setup.py install

# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
