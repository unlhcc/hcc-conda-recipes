#!/bin/bash

export PYTORCH_VERSION=1.9.0
export BUILD_VERSION=0.10.0
export CUDA_HOME=${PREFIX}
export FORCE_CUDA=1
export CPATH=${PREFIX}/include
export LD_LIBRARY_PATH=${PREFIX}/lib
export LIBRARY_PATH=${PREFIX}/lib
export NVCC_FLAGS="-gencode=arch=compute_35,code=sm_35 -gencode=arch=compute_50,code=sm_50 -gencode=arch=compute_60,code=sm_60 -gencode=arch=compute_70,code=sm_70 -gencode=arch=compute_75,code=sm_75 -gencode=arch=compute_50,code=compute_50"

python -m pip install . --no-deps -vv

mkdir build_cxx
pushd build_cxx
cmake -DWITH_CUDA=ON -DCMAKE_CUDA_FLAGS="-ccbin $CC -L${PREFIX}/lib"  \
 -DCMAKE_PREFIX_PATH=${PREFIX} -DCMAKE_INSTALL_PREFIX=${PREFIX} \
 -DTorch_DIR="$SP_DIR/torch/share/cmake/Torch" ..
make -j 4
make install
mv ${PREFIX}/lib64/libtorchvision.so ${PREFIX}/lib
