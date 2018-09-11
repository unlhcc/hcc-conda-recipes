#!/bin/bash

# Install script for Anaconda environments with CUDA on linux
# This script is not supposed to be called directly, but should be run by:
#
# $ cd <path to caffe2, e.g. ~/caffe2>
# $ conda build conda/build
#
# If you're debugging this, it may be useful to use the env that conda build is
# using:
# $ cd <anaconda_root>/conda-bld/caffe2_<timestamp>
# $ source activate _h_env_... # some long path with lots of placeholders
#
# Also, failed builds will accumulate those caffe2_<timestamp> directories. You
# can remove them after a succesfull build with
# $ conda build purge
#

set -ex

export C_INCLUDE_PATH="${PREFIX}/include:$C_INCLUDE_PATH"
export CXX_INCLUDE_PATH="${PREFIX}/include:$CXX_INCLUDE_PATH"
export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"
export LIBRARY_PATH="$LIBRARY_PATH:$LIBRARY_PATH"

echo "Installing caffe2 to ${PREFIX}"

CMAKE_ARGS=()

# Build with minimal required libraries
# Add CMAKE flags here
CMAKE_ARGS+=("-DUSE_MPI=OFF")
CMAKE_ARGS+=("-DUSE_ROCKSDB=OFF")
CMAKE_ARGS+=("-DBLAS:STR="OpenBLAS"")
CMAKE_ARGS+=("-DUSE_NNPACK=OFF")
CMAKE_ARGS+=("-DUSE_OPENMP=ON")
CMAKE_ARGS+=("-DBUILD_CUSTOM_PROTOBUF=OFF")
CMAKE_ARGS+=("-DUSE_NUMA=OFF")
CMAKE_ARGS+=("-DUSE_GLOO=OFF")
CMAKE_ARGS+=("-DUSE_OPENCV=ON")

# Build with CUDA
CMAKE_ARGS+=("-DUSE_CUDA=ON")
CMAKE_ARGS+=("-DUSE_NCCL=OFF")
CMAKE_ARGS+=("-DCUB_INCLUDE_DIR=${PREFIX}/include")

# Install under specified prefix
CMAKE_ARGS+=("-DCMAKE_INSTALL_PREFIX=$PREFIX")
CMAKE_ARGS+=("-DCMAKE_PREFIX_PATH=$PREFIX")

# Disable C++11 for GCC 4.8
CMAKE_ARGS+=("-DCMAKE_CXX_FLAGS=-D_GLIBCXX_USE_CXX11_ABI=0")

# Python
CMAKE_ARGS+=("-DPYTHON_EXECUTABLE=${PREFIX}/bin/python")
CMAKE_ARGS+=("-DPYTHON_LIBRARY=${PREFIX}/lib")
CMAKE_ARGS+=("-Dpybind11_INCLUDE_DIR=$(python ${RECIPE_DIR}/get_python_include.py)/pybind11")
PYTHON_ARGS="$(python ${RECIPE_DIR}/get_python_cmake_flags.py)"

BUILDTMP=`mktemp -d`
pushd $BUILDTMP
cmake "${CMAKE_ARGS[@]}"  $CONDA_CMAKE_BUILD_ARGS $PYTHON_ARGS ${SRC_DIR} 
make -j ${CPU_COUNT}

make install/fast

# Remove temporary directory
cd ~
rm -rf $BUILDTMP