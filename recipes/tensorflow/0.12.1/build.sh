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

# including --copt=-mavx2 would be better for AVX2 support, but it throws an illegal op error on Anvil, even though the procs support it (Docker issue maybe??)
bazel build --local_resources 4096,4,1.0 -c opt --copt=-mavx --copt=-mfma --copt=-mfpmath=both --copt=-msse4.2  //tensorflow/tools/pip_package:build_pip_package
bazel-bin/tensorflow/tools/pip_package/build_pip_package ${TMPDIR}
pip install ${TMPDIR}/tensorflow*.whl
