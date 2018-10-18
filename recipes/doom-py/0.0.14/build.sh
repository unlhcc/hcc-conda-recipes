#!/bin/bash

export BOOST_ROOT=${PREFIX}
export CMAKE_PREFIX_PATH=${PREFIX}
${PYTHON} setup.py build
pip install -e .
${PYTHON} setup.py install
