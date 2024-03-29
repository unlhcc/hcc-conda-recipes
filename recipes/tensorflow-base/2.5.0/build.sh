#!/bin/bash

set -vex

# set home directory in the CI
export HOME=`mktemp -d`

# expand PREFIX in BUILD file
sed -i -e "s:\${PREFIX}:${PREFIX}:" tensorflow/core/platform/default/build_config/BUILD

mkdir -p ./bazel_output_base
export BAZEL_OPTS=""

# cp ${RECIPE_DIR}/lin_bazelrc .bazelrc
# Compile tensorflow from source
export PYTHON_BIN_PATH=${PYTHON}
export PYTHON_LIB_PATH=${SP_DIR}
export USE_DEFAULT_PYTHON_LIB_PATH=1

# additional settings
# variant specific settings
if [ ${tflow_variant} == "mkl" ]; then
    export TF_NEED_MKL=1
    export BAZEL_MKL_OPT="--config=mkl"
else
    # eigen variant, do not build with MKL support
    export TF_NEED_MKL=0
    export BAZEL_MKL_OPT=""
fi
export CC_OPT_FLAGS="-march=nocona -mtune=haswell"
export TF_ENABLE_XLA=0
export TF_NEED_OPENCL=0
export TF_NEED_OPENCL_SYCL=0
export TF_NEED_COMPUTECPP=0
export TF_NEED_ROCM=0
export TF_NEED_MPI=0
export TF_SET_ANDROID_WORKSPACE=0
export TF_CONFIGURE_IOS=0
# CUDA details
export TF_NEED_CUDA=1
export TF_CUDA_VERSION="11.2"
export TF_CUDNN_VERSION="8.2"
export TF_CUDA_CLANG=0
export TF_DOWNLOAD_CLANG=0
export TF_NEED_TENSORRT=0
# Additional compute capabilities can be added if desired but these increase
# the build time and size of the package.
export TF_CUDA_COMPUTE_CAPABILITIES="3.5,3.7,6.0,7.0,7.5"
export TF_NCCL_VERSION="2.10"
export GCC_HOST_COMPILER_PATH="${CC}"
export GCC_HOST_COMPILER_PREFIX="${BUILD_PREFIX}/bin"
export TF_CUDA_PATHS="${PREFIX}"
export TMP=/tmp

bazel clean --expunge
bazel shutdown

./configure

# build using bazel
# for debugging the following lines may be helpful
#   --logging=6 \
#   --subcommands \
# jobs can be used to limit parallel builds and reduce resource needs
#    --jobs=20             \
bazel ${BAZEL_OPTS} build --noshow_progress ${BAZEL_MKL_OPT} \
    --copt=-march=nocona \
    --copt=-mtune=haswell \
    --copt=-ftree-vectorize \
    --copt=-fPIC \
    --copt=-fstack-protector-strong \
    --copt=-O2 \
    --cxxopt=-fvisibility-inlines-hidden \
    --cxxopt=-fmessage-length=0 \
    --linkopt=-zrelro \
    --linkopt=-znow \
    --linkopt="-L${PREFIX}/lib" \
    --verbose_failures \
    --config=cuda \
    --config=opt \
    --config=noaws \
    --config=nogcp \
    --strip=always \
    --color=yes \
    --curses=no \
    --action_env="PYTHON_BIN_PATH=${PYTHON}" \
    --action_env="PYTHON_LIB_PATH=${SP_DIR}" \
    --python_path="${PYTHON}" \
    --define=PREFIX="$PREFIX" \
    --copt=-DNO_CONSTEXPR_FOR_YOU=1 \
    --host_copt=-DNO_CONSTEXPR_FOR_YOU=1 \
    --define=LIBDIR="$PREFIX/lib" \
    --define=INCLUDEDIR="$PREFIX/include" \
    //tensorflow/tools/pip_package:build_pip_package

# build a whl file
mkdir -p $SRC_DIR/tensorflow_pkg
bash -x bazel-bin/tensorflow/tools/pip_package/build_pip_package $SRC_DIR/tensorflow_pkg

# install using pip from the whl file
${PYTHON} -m pip install --no-deps --log ~/pip.log $SRC_DIR/tensorflow_pkg/*.whl

# The tensorboard package has the proper entrypoint
rm -f ${PREFIX}/bin/tensorboard
