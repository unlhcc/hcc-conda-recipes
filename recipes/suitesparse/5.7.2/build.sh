#!/bin/bash


rm -rf metis-5.1.0

if [ "$(uname)" == "Darwin" ]
then
    export DYLD_FALLBACK_LIBRARY_PATH="${PREFIX}/lib"
    DYNAMIC_EXT=".dylib"
else
    export LD_LIBRARY_PATH="${PREFIX}/lib"
    DYNAMIC_EXT=".so"
fi

# conda compilers strip links that aren't used by default,
# even if explicitly given.
# This may result in undefined symbols
# when libraries are intended to bundle others they may
# not use themselves (e.g. umfpack bundling cholmod-Wl,-dead_strip_dylibs)
export LDFLAGS=${LDFLAGS/-Wl,--as-needed/}
export LDFLAGS=${LDFLAGS/-Wl,-dead_strip_dylibs/}

export INSTALL="${PREFIX}"
# continue to ignore docs
export INSTALL_DOC="${SRC_DIR}/doc"
# make sure CMake install goes in the right place
export CMAKE_OPTIONS="-DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_INSTALL_LIBDIR=lib"

export BLAS="-lblas -llapack"
export LAPACK="-lblas -llapack"

export CUDA="no"

# export environment variable so SuiteSparse will use the METIS built above
#export MY_METIS_LIB="-L${PREFIX}/lib -lmetis -Wl,-rpath,$PREFIX/lib"
#export MY_METIS_INC="-I${PREFIX}/include"

# (optional) write out various make variables for easier build debugging
make config 2>&1 | tee make_config.txt

# skip graphblas, mongoose by giving them a no-op makefile
cp -v ${RECIPE_DIR}/Makefile.empty GraphBLAS/Makefile
cp -v ${RECIPE_DIR}/Makefile.empty Mongoose/Makefile

# make SuiteSparse
make library static VERBOSE=1
make -i install

# manually install the static libraries
cp ${SRC_DIR}/AMD/Lib/libamd.a ${PREFIX}/lib
cp ${SRC_DIR}/BTF/Lib/libbtf.a ${PREFIX}/lib
cp ${SRC_DIR}/CAMD/Lib/libcamd.a ${PREFIX}/lib
cp ${SRC_DIR}/CCOLAMD/Lib/libccolamd.a ${PREFIX}/lib
cp ${SRC_DIR}/CHOLMOD/Lib/libcholmod.a ${PREFIX}/lib
cp ${SRC_DIR}/COLAMD/Lib/libcolamd.a ${PREFIX}/lib
cp ${SRC_DIR}/CSparse/Lib/libcsparse.a ${PREFIX}/lib
cp ${SRC_DIR}/CXSparse/Lib/libcxsparse.a ${PREFIX}/lib
cp ${SRC_DIR}/KLU/Lib/libklu.a ${PREFIX}/lib
cp ${SRC_DIR}/LDL/Lib/libldl.a ${PREFIX}/lib
cp ${SRC_DIR}/RBio/Lib/librbio.a ${PREFIX}/lib
cp ${SRC_DIR}/SPQR/Lib/libspqr.a ${PREFIX}/lib
cp ${SRC_DIR}/SuiteSparse_config/libsuitesparseconfig.a ${PREFIX}/lib
cp ${SRC_DIR}/UMFPACK/Lib/libumfpack.a ${PREFIX}/lib
