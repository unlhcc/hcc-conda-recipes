#!/bin/bash

echo "hello world"
cd ${PREFIX}/examples/spiky
mpirun spa_mpi < in.spiky

