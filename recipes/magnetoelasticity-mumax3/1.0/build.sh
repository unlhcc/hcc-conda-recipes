#!/bin/bash

export CPATH=${PREFIX}/include
export CGO_LDFLAGS="-L${PREFIX}/lib -L${BUILD_PREFIX}/lib"
export CGO_CFLAGS="-I${PREFIX}/include -I${BUILD_PREFIX}/include -g -O2"
export GOPATH=${PWD}
export GOBIN=${PREFIX}/bin

mkdir -p ${PREFIX}/bin

# Build executables
pushd src/github.com/mumax/3/cmd/mumax3
go install -x -v
cd ../mumax3-convert  
go install -x -v
cd ../mumax3-httpfsd  
go install -x -v
cd ../mumax3-plot
go install -x -v
cd ../mumax3-script
go install -x -v
cd ../mumax3-server
go install -x -v
