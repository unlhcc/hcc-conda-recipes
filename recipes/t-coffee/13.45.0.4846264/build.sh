#!/bin/bash

mkdir -p ${PREFIX}/bin
perl install all -exec=${PREFIX}/bin/ -tcdir=${PREFIX}/bin/ CC="$CXX" CFLAGS="$CFLAGS"

