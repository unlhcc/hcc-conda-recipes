#!/bin/bash

export LD_LIBRARY_PATH=${PREFIX}/lib
export CPATH=${PREFIX}/include # :${PREFIX}/gcc/include/c++
export CFLAGS="-I${PREFIX}/include ${CFLAGS}" #    -I${PREFIX}/gcc/include/c++ ${CFLAGS}"

# Create a unique tmpdir for the .whl to avoid name collisions
TMPDIR=`mktemp -d`

# Make sure build env is clean when doing multiple Python versions
bazel clean

# set needed env vars so configure will run non-interactively
export PYTHON_BIN_PATH=${PYTHON}
export USE_DEFAULT_PYTHON_LIB_PATH=1
export CC_OPT_FLAGS="-march=corei7-avx"
export TF_NEED_JEMALLOC=0
export TF_ENABLE_XLA=0
export TF_NEED_GCP=0
export TF_NEED_HDFS=0
export TF_NEED_OPENCL=0
export TF_NEED_CUDA=0
export TF_NEED_MKL=0
export TF_NEED_VERBS=0
export TF_NEED_MPI=0
export TF_NEED_GDR=0
export TF_NEED_S3=0
export TF_NEED_OPENCL_SYCL=0
export TF_SET_ANDROID_WORKSPACE=0
export TF_NEED_TENSORRT=0
export TF_NEED_KAFKA=0
export TF_NEED_AWS=0
export TF_DOWNLOAD_CLANG=0

./configure

# including --copt=-mavx2 would be better for AVX2 support, but it throws an illegal op error on Anvil, even though the procs support it (Docker issue maybe??)
bazel build --verbose_failures \
  --define PREFIX=${PREFIX} --local_resources 2048,4,1.0 -c opt --copt=-mfpmath=both  \
  --copt=-mavx --copt=-msse4.2  //tensorflow/tools/pip_package:build_pip_package

bazel-bin/tensorflow/tools/pip_package/build_pip_package ${TMPDIR}
pip install ${TMPDIR}/tensorflow*.whl
