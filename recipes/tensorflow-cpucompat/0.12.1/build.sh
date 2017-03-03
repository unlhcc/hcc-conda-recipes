#!/bin/bash

export LD_LIBRARY_PATH=${PREFIX}/lib
export CPATH=${PREFIX}/include

# Create a unique tmpdir for the .whl to avoid name collisions
TMPDIR=`mktemp -d`

# Make sure build env is clean when doing multiple Python versions
bazel clean

# set needed env vars so configure will run non-interactively
export PYTHON_BIN_PATH=${PYTHON}
export USE_DEFAULT_PYTHON_LIB_PATH=1
export TF_NEED_GCP=0
export TF_NEED_HDFS=0
export TF_NEED_OPENCL=0
export TF_NEED_CUDA=0

./configure

bazel build --local_resources 2048,4,1.0 -c opt --copt=-mfpmath=both //tensorflow/tools/pip_package:build_pip_package
bazel-bin/tensorflow/tools/pip_package/build_pip_package ${TMPDIR}
pip install ${TMPDIR}/tensorflow*.whl
