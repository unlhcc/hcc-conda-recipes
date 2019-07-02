#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include:${C_INCLUDE_PATH}
export LD_LIBRARY_PATH=${PREFIX}/lib:${LD_LIBRARY_PATH}
export LIBRARY_PATH=${PREFIX}/lib:${LIBRARY_PATH}

export PEGASUS_PYTHON=${PYTHON}
ant dist
cp -R dist/pegasus-${PKG_VERSION}/{bin,etc,lib,share} ${PREFIX}
ln -s ${PREFIX}/share/pegasus/notification/email ${PREFIX}/bin/pegasus-email
