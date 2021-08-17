#!/bin/bash

export HOME=`mktemp -d`

${PYTHON} ./configure.py
bazel build --copt=-O3 --copt=-march=nocona --copt=-mtune=haswell build_pip_pkg
bazel-bin/build_pip_pkg artifacts
${PYTHON} -m pip install --no-deps -vv artifacts/tensorflow_addons-*.whl
