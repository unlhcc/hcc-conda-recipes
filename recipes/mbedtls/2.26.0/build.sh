#!/bin/bash

export SHARED=1
make
make DESTDIR=${PREFIX} install
