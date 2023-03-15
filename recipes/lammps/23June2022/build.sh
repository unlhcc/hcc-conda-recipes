#!/bin/bash

args=""
args+=" -D DOWNLOAD_KIM=OFF"
args+=" -D PKG_ASPHERE=ON"
args+=" -D PKG_BODY=ON"
args+=" -D PKG_BROWNIAN=ON"
args+=" -D PKG_CLASS2=ON"
args+=" -D PKG_COLLOID=ON"
args+=" -D PKG_COLVARS=ON"
args+=" -D PKG_COMPRESS=OFF"
args+=" -D PKG_CORESHELL=ON"
args+=" -D PKG_DIPOLE=ON"
args+=" -D PKG_EXTRA-COMPUTE=ON"
args+=" -D PKG_EXTRA-DUMP=ON"
args+=" -D PKG_EXTRA-FIX=ON"
args+=" -D PKG_EXTRA-MOLECULE=ON"
args+=" -D PKG_EXTRA-PAIR=ON"
args+=" -D PKG_GPU=OFF"
args+=" -D PKG_GRANULAR=ON"
args+=" -D PKG_H5MD=ON"
args+=" -D PKG_KIM=ON"
args+=" -D PKG_KSPACE=ON"
args+=" -D PKG_MANYBODY=ON"
args+=" -D PKG_MC=ON"
args+=" -D PKG_MEAM=ON"
args+=" -D PKG_MISC=ON"
args+=" -D PKG_MISC=ON"
args+=" -D PKG_ML-IAP=ON"
args+=" -D PKG_ML-PACE=ON"
args+=" -D PKG_ML-SNAP=ON"
args+=" -D PKG_MOLECULE=ON"
args+=" -D PKG_MSCG=OFF"
args+=" -D PKG_NETCDF=ON"
args+=" -D PKG_OPT=ON"
args+=" -D PKG_PERI=ON"
args+=" -D PKG_PHONON=ON"
args+=" -D PKG_PLUGIN=ON"
args+=" -D PKG_REAXFF=ON"
args+=" -D PKG_REPLICA=ON"
args+=" -D PKG_RIGID=ON"
args+=" -D PKG_SHOCK=ON"
args+=" -D PKG_SRD=ON"
args+=" -D PKG_USER-VCSGC=ON"
args+=" -D PKG_VORONOI=ON"
args+=" -D WITH_GZIP=ON"
# plumed
args+=" -DPKG_PLUMED=ON"
args+=" -DPLUMED_MODE=shared"

args+=" -DPKG_DPD-SMOOTH=ON"
args+=" -DPKG_DRUDE=ON"
args+=" -DPKG_EFF=ON"
args+=" -DPKG_FEP=ON"
args+=" -DPKG_KOKKOS=ON"
args+=" -DPKG_INTERLAYER=ON"
args+=" -DPKG_LATBOLTZ=ON"
args+=" -DPKG_MANIFOLD=ON"
args+=" -DPKG_ORIENT=ON"
args+=" -DPKG_PTM=ON"
args+=" -DPKG_QEQ=ON"
args+=" -DPKG_QTB=ON"
args+=" -DPKG_REACTION=ON"
args+=" -DPKG_SMTBQ=ON"
args+=" -DPKG_SPH=ON"
args+=" -DPKG_SPIN=ON"
args+=" -DPKG_TALLY=ON"
args+=" -DPKG_UEF=ON"
args+=" -DPKG_YAFF=ON"
args+=" -DPKG_PYTHON=OFF"

# Plugins
cp -r lammps-plugins/USER-VCSGC src

# Mlip and n2p2
args=$args" -D PKG_USER-MLIP=ON -D PKG_ML-HDNNP=ON -D DOWNLOAD_N2P2=OFF -D N2P2_DIR=${PREFIX} -D PKG_ML-QUIP=ON -D PKG_LATTE=ON -D DOWNLOAD_QUIP=OFF"
export LDFLAGS="-L$PREFIX/lib -lcblas -lblas -llapack -fopenmp $LDFLAGS"
cp -r mlip/LAMMPS/USER-MLIP src/

# pypy does not support LAMMPS internal Python
#PYTHON_IMPL=$($PYTHON -c "import platform; print(platform.python_implementation())")
#if [ "$PYTHON_IMPL" != "PyPy" ]; then
#  args=$args" -D MLIAP_ENABLE_PYTHON=ON -D PKG_PYTHON=ON -D Python_ROOT_DIR=${PREFIX} -D Python_FIND_STRATEGY=LOCATION"
#fi

# Parallel and library
export LDFLAGS="-L$PREFIX/lib -lmpi $LDFLAGS"
mkdir build_mpi
cd build_mpi
cmake -DBUILD_LIB=ON -DBUILD_SHARED_LIBS=ON -DLAMMPS_INSTALL_RPATH=ON -DBUILD_MPI=ON -DPKG_MPIIO=ON -DLAMMPS_EXCEPTIONS=ON $args ${CMAKE_ARGS} ../cmake
make -j 4
make install
