set -evx

# for libtorch
if [[ ${cuda_compiler_version} == 12.* ]]; then
    export TORCH_CUDA_ARCH_LIST="5.0;6.0;6.1;7.0;7.5;8.0;8.6;8.9;9.0;10.0;12.0+PTX"
elif [[ ${cuda_compiler_version} != "None" ]]; then
    echo "unsupported cuda version."
    exit 1
fi

if [[ ${deepmd_variant} == "cuda" ]]; then
    DEEPMD_USE_CUDA_TOOLKIT=TRUE
    DP_VARIANT=cuda
else
    DEEPMD_USE_CUDA_TOOLKIT=FALSE
    DP_VARIANT=cpu
fi

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == "1" && "${mpi}" == "openmpi" ]]; then
  export OPAL_PREFIX="$PREFIX"
fi

# TF and PT find protobuf conflict
sed -i "4d" ${SP_DIR}/torch/share/cmake/Caffe2/public/protobuf.cmake
# -labsl_log_flags is the workaround for https://github.com/conda-forge/abseil-cpp-feedstock/issues/79
export LDFLAGS="-labsl_log_flags -labsl_status -labsl_log_internal_message -labsl_hash ${LDFLAGS}"
DP_VARIANT=${DP_VARIANT} \
    DP_ENABLE_PYTORCH=1 \
	SETUPTOOLS_SCM_PRETEND_VERSION=$PKG_VERSION python -m pip install . -vv

mkdir $SRC_DIR/source/build
cd $SRC_DIR/source/build

cmake -D USE_TF_PYTHON_LIBS=TRUE \
      -D ENABLE_TENSORFLOW=TRUE \
      -D ENABLE_PYTORCH=TRUE \
      -D CMAKE_INSTALL_PREFIX=${PREFIX} \
      -D USE_CUDA_TOOLKIT=${DEEPMD_USE_CUDA_TOOLKIT} \
      -D LAMMPS_SOURCE_ROOT=$SRC_DIR/lammps \
      -D CMAKE_PREFIX_PATH=${SP_DIR}/torch/ \
	  ${CMAKE_ARGS} \
	  $SRC_DIR/source
make VERBOSE=1 #-j${CPU_COUNT}
make install

# Copy the [de]activate scripts to $PREFIX/etc/conda/[de]activate.d.
# This will allow them to be run on environment activation.
for CHANGE in "activate" "deactivate"
do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
done
