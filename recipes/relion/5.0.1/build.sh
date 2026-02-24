#!/bin/bash
set -xe

mkdir -p "${PREFIX}/share/.cache/torch"
OS=$(uname -s)
ARCH=$(uname -m)

export CXXFLAGS="${CXXFLAGS} -O3 -Wno-deprecated-declarations"
export CPPFLAGS="${CPPFLAGS} -I${PREFIX}/include"
export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"
export CXXFLAGS="${CXXFLAGS} -march=x86-64-v3"

if [[ ${relion_variant} == "cuda" ]]; then
    # cicc needs to be in the same directory as nvcc
    ln -s $CONDA_PREFIX/nvvm/bin/cicc $PREFIX/bin
    ADDITIONAL_FLAGS="-DCUDA=ON -DCUDA_ARCH=50 -DDoublePrec_ACC=OFF -DCUDAToolkit_ROOT=$CONDA_PREFIX/targets/x86_64-linux -DCUDAToolkit_LIBRARY_ROOT=$CONDA_PREFIX/targets/x86_64-linux -DCMAKE_CUDA_COMPILER=$CONDA_PREFIX/targets/x86_64-linux/bin/nvcc -DCUDA_NVCC_EXECUTABLE=$CONDA_PREFIX/targets/x86_64-linux/bin/nvcc"
else
    ADDITIONAL_FLAGS="-DALTCPU=ON"   
fi

export MKLROOT="${PREFIX}"
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release \
	-DGUI=ON -DMKLFFT=ON -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
	-DCMAKE_CXX_COMPILER="${CXX}" -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
	-DMPI_C_COMPILER=$PREFIX/bin/mpicc -DMPI_CXX_COMPILER=$PREFIX/bin/mpicxx \
	-DPYTHON_EXE_PATH="${PYTHON}" -DTORCH_HOME_PATH="${PREFIX}/share/.cache/torch" \
        -DTIFF_INCLUDE_DIR=$PREFIX/include -DTIFF_LIBRARY=$PREFIX/lib/libtiff.so \
        -DJPEG_INCLUDE_DIR=$PREFIX/include -DJPEG_LIBRARY=$PREFIX/lib/libjpeg.so \
        -DPNG_PNG_INCLUDE_DIR=$PREFIX/include -DPNG_LIBRARY=$PREFIX/lib/libpng.so \
        -DZLIB_INCLUDE_DIR=$PREFIX/include -DZLIB_LIBRARY=$PREFIX/lib/libz.so \
        -DBUILD_SHARED_LIBS=ON -DFETCH_WEIGHTS=OFF \
	${ADDITIONAL_FLAGS} \
	-Wno-dev -Wno-deprecated --no-warn-unused-cli
cmake --build build --target install -j "${CPU_COUNT}"

if [[ ${relion_variant} == "cuda" ]]; then
	unlink $PREFIX/bin/cicc
fi
