#!/bin/bash

./config/scripts/makemake
./configure --prefix=${PREFIX} \
            --with-mpi="yes" --enable-mpi-io="yes" \
            --with-libxc="${PREFIX}" \
            --with-hdf5="${PREFIX}" \
            --with-fftw3="${PREFIX}" \
            --with-netcdf="${PREFIX}" \
            --with-netcdf-fortran="${PREFIX}" \
            --with-fft-flavor="fftw3" \
            --with-libxml2="${PREFIX}" \
            --with-xmlf90="${PREFIX}" \
            --with-libpsml="${PREFIX}" \
            --enable-openmp=yes \
            --with-linalg-flavor="netlib" \
            --with-gpu=no \
            CC="mpicc" \
            FC="mpifort" \
            CXX="mpicxx" \
            CFLAGS="${CFLAGS}" \
            FFLAGS="${FFLAGS}" \
            FCFLAGS="${FCFLAGS}" \
            CPPFLAGS="${CPPFLAGS}" \
            LDFLAGS="${LDFLAGS} -lfftw3f" \
            WANNIER90_LIBS="-lwannier" \
            WANNIER90_CPPFLAGS="-I${PREFIX}" \
            WANNIER90_FCFLAGS="-I${PREFIX}"  \
            WANNIER90_LDFLAGS="-L${PREFIX}"

make -j 4
#make check
make install
