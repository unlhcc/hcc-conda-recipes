#!/bin/bash
set -eu
export PETSC_DIR=$SRC_DIR
export PETSC_ARCH=arch-conda-c-opt

unset CC
unset CXX
if [[ $(uname) == Linux ]]; then
    export LDFLAGS="-pthread $LDFLAGS"
fi

if [[ $mpi == "openmpi" ]]; then
  export LIBS="-lmpi_mpifh -lgfortran"
elif [[ $mpi == "mpich" ]]; then
  export LIBS="-lmpifort -lgfortran"
fi

python config/configure.py \
  CC="mpicc" \
  CXX="mpicxx" \
  FC="mpifort" \
  CFLAGS="$CFLAGS" \
  CPPFLAGS="$CPPFLAGS" \
  CXXFLAGS="-fpermissive $CXXFLAGS" \
  LDFLAGS="$LDFLAGS" \
  LIBS="$LIBS" \
  --COPTFLAGS=-O3 \
  --CXXOPTFLAGS=-O3 \
  --FOPTFLAGS=-O3 \
  --with-clib-autodetect=0 \
  --with-cxxlib-autodetect=0 \
  --with-fortranlib-autodetect=0 \
  --with-debugging=0 \
  --with-blas-lapack-lib=libopenblas${SHLIB_EXT} \
  --with-hypre=1 \
  --with-hypre-dir=${PREFIX} \
  --with-mpi=1 \
  --with-mumps=1 \
  --download-mumps=yes \
  --with-parmetis=1 \
  --download-parmetis=yes \
  --with-scalapack=1 \
  --with-scalapack-dir=${PREFIX} \
  --with-x=0 \
  --with-x11=0 \
  --download-blacs=yes \
  --prefix=$PREFIX

sedinplace() {
  if [[ $(uname) == Darwin ]]; then
    sed -i "" "$@"
  else
    sed -i"" "$@"
  fi
}

for path in $PETSC_DIR $PREFIX; do
    sedinplace s%$path%\${PETSC_DIR}%g bmake/$PETSC_ARCH/petsc*.h
done

# remove abspath of build_env/bin/python
sedinplace "s%${BUILD_PREFIX}/bin/python%/usr/bin/env python2%g" bmake/$PETSC_ARCH/configure.py

make

for f in $(grep -l build_env -R "lib/${PETSC_ARCH}"); do
  echo "fixing build prefix in $f"
  sedinplace s%${BUILD_PREFIX}%${PREFIX}%g $f 
done

make install

rm -fr $PREFIX/share/petsc/examples
rm -fr $PREFIX/share/petsc/datafiles
