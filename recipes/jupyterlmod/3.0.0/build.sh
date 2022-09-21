#!/bin/bash
set -ex

export NODE_OPTIONS=--openssl-legacy-provider
$PYTHON -m pip install . -vv
jupyter labextension install --no-build --clean jupyterlab-lmod
