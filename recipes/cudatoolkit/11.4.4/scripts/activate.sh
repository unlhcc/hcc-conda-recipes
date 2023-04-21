#!/bin/bash
# adapted from https://github.com/conda-forge/nvcc-feedstock/blob/main/recipe/install_nvcc.sh

# Backup environment variables (only if the variables are set)
if [[ ! -z "${CUDA_HOME+x}" ]]
then
  export CUDA_HOME_CONDA_NVCC_BACKUP="${CUDA_HOME:-}"
fi

if [[ ! -z "${CUDA_PATH+x}" ]]
then
  export CUDA_PATH_CONDA_NVCC_BACKUP="${CUDA_PATH:-}"
fi

if [[ ! -z "${CFLAGS+x}" ]]
then
  export CFLAGS_CONDA_NVCC_BACKUP="${CFLAGS:-}"
fi

if [[ ! -z "${CPPFLAGS+x}" ]]
then
  export CPPFLAGS_CONDA_NVCC_BACKUP="${CPPFLAGS:-}"
fi

if [[ ! -z "${CXXFLAGS+x}" ]]
then
  export CXXFLAGS_CONDA_NVCC_BACKUP="${CXXFLAGS:-}"
fi

if [[ ! -z "${CMAKE_ARGS+x}" ]]
then
  export CMAKE_ARGS_CONDA_NVCC_BACKUP="${CMAKE_ARGS:-}"
fi

if [[ ! -z "${XLA_FLAGS+x}" ]]
then
  export XLA_FLAGS_CONDA_NVCC_BACKUP="${XLA_FLAGS:-}"
fi

CUDA_HOME=/opt/anaconda1anaconda2anaconda3

if [[ ! -d "${CUDA_HOME}" ]]
then
    echo "Directory specified in CUDA_HOME(=${CUDA_HOME}) doesn't exist"
    return 1
fi

if [[ ! -f "${CUDA_HOME}/lib/stubs/libcuda.so" ]]
then
    echo "File ${CUDA_HOME}/lib/stubs/libcuda.so doesn't exist"
    return 1
fi

export CUDA_HOME="${CUDA_HOME}"
export CFLAGS="${CFLAGS} -isystem ${CUDA_HOME}/include"
export CPPFLAGS="${CPPFLAGS} -isystem ${CUDA_HOME}/include"
export CXXFLAGS="${CXXFLAGS} -isystem ${CUDA_HOME}/include"
export XLA_FLAGS="--xla_gpu_cuda_data_dir=/opt/anaconda1anaconda2anaconda3"

### CMake configurations

# CMake looks up components in CUDA_PATH, not CUDA_HOME
export CUDA_PATH="${CUDA_HOME}"
# New-style CUDA integrations in CMake
CMAKE_ARGS="${CMAKE_ARGS:-} -DCUDAToolkit_ROOT=${CUDA_HOME}"
# Old-style CUDA integrations in CMake
## See https://github.com/conda-forge/nvcc-feedstock/pull/58#issuecomment-752179349
CMAKE_ARGS+=" -DCUDA_TOOLKIT_ROOT_DIR=${CUDA_HOME}"
## Avoid https://github.com/conda-forge/openmm-feedstock/pull/44#issuecomment-753560234
## We need CUDA_HOME in _front_ of CMAKE_FIND_ROOT_PATH
CMAKE_ARGS="$(echo ${CMAKE_ARGS} | sed -E -e "s|(-DCMAKE_FIND_ROOT_PATH=)(\S+)|\1$CUDA_HOME;\2|")"
export CMAKE_ARGS="${CMAKE_ARGS}"

### /CMake configurations
