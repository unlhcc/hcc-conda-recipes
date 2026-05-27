#!/bin/bash

export INCLUDES="-I${PREFIX}/include"
export LIBPATH="-L${PREFIX}/lib"
export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"
export CPPFLAGS="${CPPFLAGS} -I${PREFIX}/include"
export CXXFLAGS="${CXXFLAGS} -O3 -I${PREFIX}/include"

if [[ -d "${PREFIX}/lib/stubs" ]]; then
    export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib/stubs"
    export LIBRARY_PATH="${PREFIX}/lib/stubs:${LIBRARY_PATH}"
fi

export CONFIG_ARGS="-DBUILD_CUDA=ON -DBUILD_OPENCL=OFF"

sed -i.bak 's|-std=c++11|-std=c++14|' CMakeLists.txt
rm -rf *.bak

cmake -S . -B build -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX="${PREFIX}" \
	-DCMAKE_CXX_COMPILER="${CXX}" \
	-DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
	-Wno-dev -Wno-deprecated --no-warn-unused-cli \
	${CONFIG_ARGS}

cmake --build build --clean-first --target install -j "${CPU_COUNT}"
