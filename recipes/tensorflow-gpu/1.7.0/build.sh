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

export TF_NEED_CUDA=1
export TF_CUDA_VERSION=8.0
export TF_CUDNN_VERSION=7
export CUDA_TOOLKIT_PATH=${PREFIX}
export CUDNN_INSTALL_PATH=${PREFIX}
export TF_CUDA_COMPUTE_CAPABILITIES='3.5,5.2,6.0'
export TF_CUDA_CLANG=0
export GCC_HOST_COMPILER_PATH="${PREFIX}/bin/gcc"
export HOST_C_COMPILER="${PREFIX}/bin/gcc"
export HOST_CXX_COMPILER="${PREFIX}/bin/g++"

sed -i "s#\${PREFIX}#$PREFIX#g" third_party/gpus/crosstool/CROSSTOOL_nvcc.tpl third_party/toolchains/gpus/crosstool/CROSSTOOL
# Workaround for bug: https://github.com/tensorflow/tensorflow/issues/17801
cp ${PREFIX}/nvvm/libdevice/libdevice.compute_50.10.bc ${PREFIX}/nvvm/libdevice/libdevice.10.bc

./configure

# including --copt=-mavx2 would be better for AVX2 support, but it throws an illegal op error on Anvil, even though the procs support it (Docker issue maybe??)
bazel build --verbose_failures \
  --define PREFIX=${PREFIX} --local_resources 2048,4,1.0 -c opt --copt=-mfpmath=both  \
  --copt=-msse4.2 --config=cuda  //tensorflow/tools/pip_package:build_pip_package

bazel-bin/tensorflow/tools/pip_package/build_pip_package ${TMPDIR}
pip install ${TMPDIR}/tensorflow*.whl
