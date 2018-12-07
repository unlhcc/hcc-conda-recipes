#!/bin/bash
set -euo pipefail

mkdir -p ${PREFIX}/bin
make
make singlecpu
cp IMa3 IMa3_singlecpu ${PREFIX}/bin
