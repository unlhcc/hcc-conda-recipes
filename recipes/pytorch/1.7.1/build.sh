#!/bin/bash

sudo yum install -y -q mesa-libGL

export C_INCLUDE_PATH="${PREFIX}/include:$C_INCLUDE_PATH"
export CXX_INCLUDE_PATH="${PREFIX}/include:$CXX_INCLUDE_PATH"
export LD_LIBRARY_PATH="${PREFIX}/lib:$LD_LIBRARY_PATH"
export LIBRARY_PATH="${PREFIX}/lib:$LIBRARY_PATH"

unset CXXFLAGS
export CXXFLAGS="-L${PREFIX}/lib -fpermissive -march=nocona -mtune=haswell -fPIC -isystem $PREFIX/include -O2 -D__STDC_FORMAT_MACROS -Wno-deprecated-declarations"
export CUDA_NVCC_FLAGS="--allow-unsupported-compiler"

export CMAKE_PREFIX_PATH=${PREFIX}
export USE_CUDA=1
export TORCH_CUDA_ARCH_LIST="3.5;3.7;6.0;7.0;7.2;7.5"
export USE_SYSTEM_NCCL=1
export BLAS=OpenBLAS
export OpenBLAS_HOME=${PREFIX}
export CUDA_HOME=${PREFIX}
export USE_NINJA=OFF
export USE_LEVELDB=ON
export USE_LMDB=ON
export USE_FFMPEG=ON
export USE_OPENCV=ON
export USE_MPI=OFF
export USE_NUMA=OFF
export USE_GFLAGS=ON
export USE_GLOG=ON
export MAX_JOBS=8
export BUILD_TEST=0
#export VERBOSE=1

#python setup.py build --cmake-only
python setup.py install
