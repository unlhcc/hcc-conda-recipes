#!/bin/bash

export GOPATH=`mktemp -d`
export GOBIN=${PREFIX}/bin
mkdir -p ${PREFIX}/bin

# Build executable
pushd unikmer
go install -v
