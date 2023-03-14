#!/bin/bash

pushd crystal
make release=1
make install PREFIX=${PREFIX}
