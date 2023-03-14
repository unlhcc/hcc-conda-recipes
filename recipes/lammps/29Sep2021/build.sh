#!/bin/bash

args="-D PKG_ASPHERE=ON -DPKG_BODY=ON -D PKG_CLASS2=ON -D PKG_ML-IAP=ON -D PKG_COLLOID=ON -D PKG_COMPRESS=ON -D PKG_CORESHELL=ON -D PKG_DIPOLE=ON -D PKG_H5MD=ON -D PKG_GRANULAR=ON -D PKG_KSPACE=ON -D PKG_MANYBODY=ON -D PKG_ML-PACE=ON -D PKG_MC=ON -D PKG_MISC=ON -D PKG_MOLECULE=ON -D PKG_PERI=ON -D PKG_REPLICA=ON -D PKG_RIGID=ON -D PKG_SHOCK=ON -D PKG_ML-SNAP=ON -D PKG_SRD=ON -D PKG_OPT=ON -D PKG_KIM=ON -D PKG_GPU=OFF -D PKG_KOKKOS=ON -D PKG_MSCG=OFF -D PKG_MEAM=ON -D PKG_PHONON=ON -D PKG_REAXFF=ON -D WITH_GZIP=ON -D PKG_USER-VCSGC=ON -D PKG_COLVARS=ON -D PKG_EXTRA-COMPUTE=ON -D PKG_EXTRA-DUMP=ON -D PKG_EXTRA-FIX=ON -D PKG_EXTRA-MOLECULE=ON -D PKG_EXTRA-PAIR=ON -D DOWNLOAD_KIM=OFF -D PKG_PLUGIN=ON -D PKG_USER-MLIP=ON -D PKG_ML-HDNNP=ON -D DOWNLOAD_N2P2=OFF -D N2P2_DIR=${PREFIX} -D PKG_ML-QUIP=ON -D PKG_LATTE=ON -D DOWNLOAD_QUIP=OFF -D BUILD_MPI=ON -D PKG_OPENMP=yes -D PKG_MPIIO=ON -D BUILD_LIB=ON -D BUILD_SHARED_LIBS=ON -D LAMMPS_EXCEPTIONS=yes -DPKG_BODY=yes -DPKG_BROWNIAN=yes -DPKG_CG-DNA=yes -DPKG_CG-SDK=yes -DPKG_DIELECTRIC=yes -DPKG_DIFFRACTION=yes -DPKG_DIPOLE=yes -DPKG_DPD-BASIC=yes -DPKG_DPD-MESO=yes -DPKG_DPD-REACT=yes -DPKG_DPD-SMOOTH=yes -DPKG_DRUDE=yes -DPKG_EFF=yes -DPKG_FEP=yes -DPKG_INTERLAYER=yes -DPKG_LATBOLTZ=yes -DPKG_MANIFOLD=yes -DPKG_ORIENT=yes -DPKG_PTM=yes -DPKG_PLUMED=yes -DDOWNLOAD_PLUMED=no -DPLUMED_MODE=shared -DPKG_QEQ=yes -DPKG_QTB=yes -DPKG_REACTION=yes -DPKG_SMTBQ=yes -DPKG_SPH=yes -DPKG_SPIN=yes -DPKG_TALLY=yes -DPKG_UEF=yes -DPKG_YAFF=yes"

# Plugins 
mkdir src/USER-VCSGC
cp vcsgc-lammps/fix_semigrandcanonical_mc.* src/USER-VCSGC
cp -r mlip/src/external/MLIP4LAMMPS/USER-MLIP src/

# pypy does not support LAMMPS internal Python 
PYTHON_IMPL=$($PYTHON -c "import platform; print(platform.python_implementation())")
if [ "$PYTHON_IMPL" != "PyPy" ]; then
  args=$args" -D MLIAP_ENABLE_PYTHON=ON -D PKG_PYTHON=ON -D Python_ROOT_DIR=${PREFIX} -D Python_FIND_STRATEGY=LOCATION"
fi

# Parallel
export LDFLAGS="-L$PREFIX/lib -lcblas -lblas -llapack -fopenmp -lmpi $LDFLAGS"
mkdir build_mpi
cd build_mpi
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_PREFIX_PATH=${PREFIX} $args ../cmake 
make -j 4 # -j${NUM_CPUS}
make install
#cp lmp $PREFIX/bin/lmp_mpi
#cd ..

# Library
#mkdir build_lib
#cd build_lib
#cmake -D BUILD_LIB=ON -D BUILD_SHARED_LIBS=ON -D BUILD_MPI=ON -D PKG_MPIIO=ON -D LAMMPS_EXCEPTIONS=yes $args ../cmake
#make # -j${NUM_CPUS}
#cp liblammps${SHLIB_EXT}* ../src  # For compatibility with the original make system.
#cd ../src
#make install-python 
#mkdir -p $PREFIX/include/lammps
#cp library.h $PREFIX/include/lammps
#cp liblammps${SHLIB_EXT}* "${PREFIX}"/lib/
#cd ..
