#!/bin/bash

mkdir -p ${PREFIX}/bin ${PREFIX}/share/psipred

rm -rf bin/*
pushd src
make CC=${CC} CFLAGS="${CFLAGS}"
make install
popd
cp bin/* runpsipred runpsipred_single ${PREFIX}/bin
cp -R data ${PREFIX}/share/psipred
