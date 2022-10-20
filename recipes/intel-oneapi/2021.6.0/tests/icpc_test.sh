#!/bin/bash
set -x

pushd tests
${CXX} -v
${CXX} ${CXXFLAGS} hello.c
./a.out
