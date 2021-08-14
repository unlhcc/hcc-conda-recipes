#!/bin/bash

export HOME=`mktemp -d`
bazel build --copt=-O3 --copt=-march=nocona --copt=-mtune=haswell :pip_pkg
PKGDIR=$(mktemp -d)
./bazel-bin/pip_pkg $PKGDIR --release
pip install --no-deps -vv $PKGDIR/*.whl
