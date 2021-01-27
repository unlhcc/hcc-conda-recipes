#!/bin/bash

mkdir -p ${PREFIX}/bin
export HOME=`mktemp -d`

cargo build --release
cp target/release/jwt ${PREFIX}/bin
