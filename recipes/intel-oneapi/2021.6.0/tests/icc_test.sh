#!/bin/bash
set -x

pushd tests
${CC} -v
${CC} ${CFLAGS} hello.c
./a.out
