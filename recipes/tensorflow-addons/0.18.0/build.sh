#!/bin/bash

export HOME=`mktemp -d`

# bazel is the devil
sed -i s#\$PREFIX#$PREFIX#g WORKSPACE
${PYTHON} ./configure.py

bazel build --copt=-O3  \
    --copt=-march=nocona \
    --copt=-mtune=haswell \
    --linkopt="-L${PREFIX}/lib" \
    --action_env="PYTHON_BIN_PATH=${PYTHON}" \
    --action_env="PYTHON_LIB_PATH=${SP_DIR}" \
    --python_path="${PYTHON}" \
    --define=PREFIX="$PREFIX" \
    --define=LIBDIR="$PREFIX/lib" \
    --define=INCLUDEDIR="$PREFIX/include" \
    --color=yes \
    --curses=no \
    --verbose_failures \
    build_pip_pkg

bazel-bin/build_pip_pkg artifacts
${PYTHON} -m pip install --no-deps -vv artifacts/tensorflow_addons-*.whl
