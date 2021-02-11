#!/bin/bash

# needed to pass the test stage
yum -q -y install libudev

export CUDA_ARCH_OPTS="--generate-code arch=compute_35,code=sm_35 --generate-code arch=compute_37,code=sm_37 --generate-code arch=compute_60,code=sm_60 --generate-code arch=compute_70,code=sm_70 --generate-code arch=compute_72,code=sm_72 --generate-code arch=compute_75,code=sm_75 --allow-unsupported-compiler"

outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p $outdir ${PREFIX}/bin

# fix capitalization error
mv BorisCUDALib/BorisCUDALIB.cuh BorisCUDALib/BorisCUDALib.cuh

make configure arch=35 sprec=0 BORIS_DATA_DIR=$outdir BORIS_SIM_DIR=$outdir
make -j 8 compile arch=35 sprec=0 BORIS_DATA_DIR=$outdir BORIS_SIM_DIR=$outdir
make install arch=35 sprec=0 BORIS_DATA_DIR=$outdir BORIS_SIM_DIR=$outdir
cp BorisLin ${PREFIX}/bin
