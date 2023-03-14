#!/bin/bash

pushd shards
make lib
make release=1
make install PREFIX=${PREFIX}
