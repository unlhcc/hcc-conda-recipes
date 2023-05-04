#!/bin/bash -eu

export BINDGEN_EXTRA_CLANG_ARGS="${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

# Install binary
C_INCLUDE_PATH=${PREFIX}/include OPENSSL_DIR=${PREFIX} LIBRARY_PATH=${PREFIX}/lib cargo install --path ./rust --root ${PREFIX}
