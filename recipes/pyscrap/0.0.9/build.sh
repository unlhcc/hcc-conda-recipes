#!/bin/bash

export LC_CTYPE=en_US.UTF-8

if [[ "${PY_VER}" =~ 3 ]]
then
    2to3 -w -n setup.py
    2to3 -w -n bin/*
    2to3 -w -n pyscrap
fi

$PYTHON setup.py install --single-version-externally-managed --record=record.txt
