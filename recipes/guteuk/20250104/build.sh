#!/bin/bash

INSTALL_DIR=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}

mkdir -p ${INSTALL_DIR}
mkdir -p ${PREFIX}/bin

cp -r GutEuk/GutEuk.py \
      GutEuk/utils.py \
      GutEuk/model \
      GutEuk/test \
      ${INSTALL_DIR}

chmod +x ${INSTALL_DIR}/GutEuk.py

ln -s ${INSTALL_DIR}/GutEuk.py ${PREFIX}/bin/GutEuk.py
ln -s ${INSTALL_DIR}/GutEuk.py ${PREFIX}/bin/GutEuk
