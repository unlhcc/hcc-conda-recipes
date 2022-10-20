#!/bin/bash
set -x

pushd tests
${FC} -v
${FC} ${FFLAGS} hello.f90
./a.out
