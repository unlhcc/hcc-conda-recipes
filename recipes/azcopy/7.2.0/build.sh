#!/bin/bash

mkdir -p ${PREFIX}/bin ${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}
cp -R azcopy/* ${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}
ln -s ${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}/azcopy ${PREFIX}/bin/azcopy
