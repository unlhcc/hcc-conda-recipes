#!/bin/bash
set -x

sudo yum install -y -q pciutils-libs

mkdir build && pushd build
export CMAKE_MESSAGE_LOG_LEVEL=ERROR

cmake .. -GNinja -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DSlicer_RELEASE_TYPE="Stable" \
    -DSlicer_ORGANIZATION_DOMAIN="hcc.unl.edu" \
    -DSlicer_ORGANIZATION_NAME="Holland Computing Center" \
    -DQt5_DIR=${PREFIX} \
    -DSlicer_USE_SYSTEM_python=1 \
    -DSlicer_USE_SYSTEM_python-numpy=1 \
    -DSlicer_USE_SYSTEM_python-scipy=1 \
    -DSlicer_USE_SYSTEM_python-pip=1 \
    -DSlicer_USE_SYSTEM_python-setuptools=1 \
    -DSlicer_USE_SYSTEM_python-ensurepip=1 \
    -DSlicer_USE_SYSTEM_python-wheel=1 \
    -DSlicer_USE_SYSTEM_LZMA=1 \
    -DSlicer_USE_SYSTEM_zlib=1 \
    -DSlicer_USE_SYSTEM_bzip2=1 \
    -DSlicer_USE_SYSTEM_curl=1 \
    -DSlicer_USE_SYSTEM_sqlite=1 \
    -DSlicer_USE_SYSTEM_RapidJSON=1 \
    -DSlicer_USE_SYSTEM_LibFFI=1 \
    -DSlicer_USE_SYSTEM_DCMTK=1 \
    -DSlicer_USE_SYSTEM_OpenSSL=1 \
    -DSlicer_USE_SYSTEM_LibArchive=1 \
    -DSlicer_USE_SimpleITK_SHARED="ON" \
    -DSlicer_VTK_SMP_IMPLEMENTATION_TYPE="TBB" \
    -DBUILD_TESTING="OFF" \
    -DCMAKE_MESSAGE_LOG_LEVEL=ERROR

cmake --build . --target Slicer -- -j 8 --quiet > build.log
pushd Slicer-build
cmake --build . --target package
tar -xf Slicer-${PKG_VERSION}-linux-amd64.tar.gz --strip-components=1 -C ${PREFIX}
ln -s ${PREFIX}/Slicer ${PREFIX}/bin/Slicer

#    -DSlicer_USE_SYSTEM_ITK=1 \
#    -DSlicer_USE_SYSTEM_VTK=1 \
#    -DSlicer_FORCED_WC_LAST_CHANGED_DATE="${last_revision_date}" \
#    -DSlicer_FORCED_REVISION="${last_revision_hash}"
