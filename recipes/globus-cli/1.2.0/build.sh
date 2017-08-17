#!/bin/bash

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
$PYTHON setup.py install 

# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
