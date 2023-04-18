#!/bin/bash


cd ${SRC_DIR}
mkdir build
cd build
cmake -LH -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=${PREFIX} -DSPARTA_MACHINE=mpi \
    -DPKG_KOKKOS=ON -DKokkos_ENABLE_OPENMP=ON -DKokkos_ARCH_SNB=ON -DKokkos_ARCH_HSW=ON \
    -DFFT=MKL -DBUILD_JPEG=ON -DBUILD_PNG=ON  \
    ${SRC_DIR}/cmake
make
make install
cp -r ${SRC_DIR}/examples ${PREFIX}/.

