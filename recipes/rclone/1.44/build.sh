#!/bin/bash

mkdir -p ${PREFIX}/bin
go build github.com/ncw/rclone
export GOPATH=$PWD
cp rclone ${PREFIX}/bin
